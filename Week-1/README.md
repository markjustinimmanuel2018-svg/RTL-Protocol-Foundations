**# Week 1 Mini Project - UART Transmitter**

This project implements a UART transmitter architecture using FSM-controlled serial communication with baud-rate-based timing generation.



\-------------------------------------------------------------------------------



**## Files**



* baud\_gen.v      : Baud rate generator module
* uart\_tx.v       : UART transmitter FSM and datapath
* uart\_transmit.v : Top module integrating baud generator and UART TX
* tb\_uart\_tx.v    : Testbench for UART transmission verification



\--------------------------------------------------------------------------------



**## Objective**



* Design a UART transmitter using FSM-based control architecture.
* Implement serial transmission using shift-register-based datapath.
* Generate baud-rate timing pulses from high-frequency system clock.
* Transmit UART frame with start bit, data bits, and stop bit.
* Understand modular RTL integration and simulation-based verification.



\--------------------------------------------------------------------------------



**## UART Transmission Overview**



The UART transmitter consists of:

* Baud Generator : Generates baud\_tick timing pulse
* FSM Controller : Controls UART transmission sequence
* Shift Register : Converts parallel data into serial data
* Bit counter : Tracks transmitted data bits
* TX logic : Drives serial output line



Transmission Flow :  IDLE -> START -> DATA -> STOP

* IDLE : Waits for transmission request
* START : Sends start bit
* DATA : Serially transmits 8-bit data
* STOP : Sends stop bit and returns to IDLE



UART Structure : Idle(1) -> Start Bit(0) -> 8-bit Data -> Stop Bit(1)



\--------------------------------------------------------------------------------



**## Baud Generator Architecture**



The baud generator converts a high-frequency system clock into a slower UART timing pulse.

* System Clock = 50MHz
* Baud Rate = 9600
* Divider Calculation : 
DIV = clk\_freq/baud\_rate



Uses:

* Counter-based clock division
* Single-cycle baud\_tick pulse generation
* Parameterized clock and baud configuration



\----------------------------------------------------------------------------------



**## Learning Outcomes**



* Understood UART asynchronous serial communication
* Learned baud-rate-based timing generation
* Implemented FSM-controlled serial transmitter architecture
* Applied shift-register-based parallel-to-serial conversion
* Strengthened RTL architecture and verification reasoning



\----------------------------------------------------------------------------------



**# Author:** MARK JUSTIN

