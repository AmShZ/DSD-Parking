# Parking Management System

This repository contains the Verilog code for a Parking Management System designed as a course project for the Digital Systems course. The system manages the parking space of a university, tracking the number of parked cars and available spaces, with specific focus on university-affiliated vehicles.

## Features

- **Capacity Management**: The system dynamically adjusts the parking capacity during specific hours of the day.
- **University Vehicle Tracking**: It keeps separate counts for university-affiliated vehicles and other vehicles.
- **Space Availability**: Monitors and updates the availability of parking spaces in real-time based on car entry and exit events.

## Design Specifications

- **Total Capacity**: 700 parking spaces.
- **University Capacity Limit**: 200 spaces reserved for university vehicles.
- **Incremental Capacity**: Increases by 50 spaces per hour between 1 PM and 4 PM.
- **Time Limit for Increments**: Starts at 1 PM and ends at 4 PM.

## Inputs

- `clk`: Clock signal.
- `reset`: Reset signal.
- `car_entered`: Signal indicating a car has entered the parking.
- `is_uni_car_entered`: Signal indicating the entered car is university-affiliated.
- `car_exited`: Signal indicating a car has exited the parking.
- `is_uni_car_exited`: Signal indicating the exited car is university-affiliated.

## Outputs

- `uni_parked_car`: Number of university-affiliated cars currently parked.
- `total_parked_car`: Total number of cars currently parked.
- `uni_vacated_space`: Number of vacated spaces reserved for university vehicles.
- `total_vacated_space`: Total number of vacated spaces.

## How It Works

1. **Initialization**: Upon reset, all counters and capacities are set to their initial values.
2. **Car Entry**: When a car enters, it updates the total parked cars and decreases the available spaces. If the car is university-affiliated, it also updates the university-specific counters.
3. **Car Exit**: When a car exits, it updates the total parked cars and increases the available spaces. If the car is university-affiliated, it also updates the university-specific counters.
4. **Capacity Increment**: Between 1 PM and 4 PM, the parking capacity is incrementally increased by 50 spaces per hour.
5. **Hour Tracking**: The system tracks the current hour and resets it at the end of the day.

## Usage

To simulate and verify the Parking Management System, use any Verilog simulator. The provided module can be instantiated and tested within a testbench.

```verilog
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

// Module implementation

endmodule
