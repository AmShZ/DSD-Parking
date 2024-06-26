module ParkingManagement_tb;

  reg clk;
  reg reset;
  reg car_entered;
  reg is_uni_car_entered;
  reg car_exited;
  reg is_uni_car_exited;
  wire [9:0] uni_parked_car;
  wire [9:0] total_parked_car;
  wire [9:0] uni_vacated_space;
  wire [9:0] total_vacated_space;

  ParkingManagement uut (
    .clk(clk),
    .reset(reset),
    .car_entered(car_entered),
    .is_uni_car_entered(is_uni_car_entered),
    .car_exited(car_exited),
    .is_uni_car_exited(is_uni_car_exited),
    .uni_parked_car(uni_parked_car),
    .total_parked_car(total_parked_car),
    .uni_vacated_space(uni_vacated_space),
    .total_vacated_space(total_vacated_space)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    reset = 1;
    car_entered = 0;
    is_uni_car_entered = 0;
    car_exited = 0;
    is_uni_car_exited = 0;
    
    $monitor("Time: %0t | uni_parked_car: %d | total_parked_car: %d | uni_vacated_space: %d | total_vacated_space: %d", 
             $time, uni_parked_car, total_parked_car, uni_vacated_space, total_vacated_space);

    #10 reset = 0;

    #10 car_entered = 1; is_uni_car_entered = 1;
    #10 car_entered = 0; is_uni_car_entered = 0;

    #10 car_entered = 1; is_uni_car_entered = 0;
    #10 car_entered = 0; is_uni_car_entered = 0;

    #10 car_exited = 1; is_uni_car_exited = 1;
    #10 car_exited = 0; is_uni_car_exited = 0;

    #10 car_exited = 1; is_uni_car_exited = 0;
    #10 car_exited = 0; is_uni_car_exited = 0;

    #10 car_entered = 1; is_uni_car_entered = 1;
    #10 car_entered = 1; is_uni_car_entered = 1;
    #10 car_entered = 1; is_uni_car_entered = 1;
    #10 car_entered = 1; is_uni_car_entered = 1;
    #10 car_entered = 0; is_uni_car_entered = 0;

    #10 car_exited = 1; is_uni_car_exited = 1;
    #10 car_exited = 1; is_uni_car_exited = 1;
    #10 car_exited = 1; is_uni_car_exited = 1;
    #10 car_exited = 0; is_uni_car_exited = 0;

    #10 car_entered = 1; is_uni_car_entered = 0;
    #10 car_entered = 1; is_uni_car_entered = 0;
    #10 car_exited = 1; is_uni_car_exited = 0;
    #10 car_exited = 1; is_uni_car_exited = 0;
    #10 car_exited = 0; is_uni_car_exited = 0;

    #100 $stop;
  end

endmodule
