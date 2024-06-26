module ParkingManagement(
    input wire clk,
    input wire reset,
    input wire car_entered,
    input wire is_uni_car_entered,
    input wire car_exited,
    input wire is_uni_car_exited,
    output reg [9:0] uni_parked_car, 
    output reg [9:0] total_parked_car, 
    output reg [9:0] uni_vacated_space, 
    output reg [9:0] total_vacated_space 
);

parameter TOTAL_CAPACITY = 700;
parameter UNI_CAPACITY_LIMIT = 200;
parameter INCREMENT_CAPACITY_PER_HOUR = 50;
parameter TIME_LIMIT = 13;
parameter TIME_INCREMENT_START = 13;
parameter TIME_INCREMENT_END = 16;

reg [9:0] current_capacity;
reg [4:0] current_hour;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        uni_parked_car <= 0;
        total_parked_car <= 0;
        uni_vacated_space <= UNI_CAPACITY_LIMIT;
        total_vacated_space <= TOTAL_CAPACITY;
        current_hour <= 0;
        current_capacity <= UNI_CAPACITY_LIMIT;
    end else begin
        if (car_entered) begin
            if (is_uni_car_entered && (uni_parked_car < UNI_CAPACITY_LIMIT)) begin
                uni_parked_car <= uni_parked_car + 1;
            end
            total_parked_car <= total_parked_car + 1;
            total_vacated_space <= total_vacated_space - 1;
            if (is_uni_car_entered) begin
                uni_vacated_space <= uni_vacated_space - 1;
            end
        end
        
        if (car_exited) begin
            if (is_uni_car_exited && (uni_parked_car > 0)) begin
                uni_parked_car <= uni_parked_car - 1;
            end
            total_parked_car <= total_parked_car - 1;
            total_vacated_space <= total_vacated_space + 1;
            if (is_uni_car_exited) begin
                uni_vacated_space <= uni_vacated_space + 1;
            end
        end
        
        if (current_hour >= TIME_INCREMENT_START && current_hour < TIME_INCREMENT_END) begin
            current_capacity <= current_capacity + INCREMENT_CAPACITY_PER_HOUR;
            total_vacated_space <= total_vacated_space + INCREMENT_CAPACITY_PER_HOUR;
        end
        
        if (current_hour < 23) begin
            current_hour <= current_hour + 1;
        end else begin
            current_hour <= 0;
        end
    end
end

endmodule
