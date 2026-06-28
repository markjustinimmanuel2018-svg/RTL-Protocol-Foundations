**# Week 3 Mini Project - SPI Master**



This project implements an SPI Master operating in Mode-0 (CPOL = 0, CPHA = 0) with clock generation, serial data transmission, serial data reception, and loopback verification.



\-------------------------------------------------------------------------------



**## Files**



* spi\_master.v    : SPI Master RTL design
* tb\_spi\_master.v : Self-checking testbench for SPI loopback verification



\-------------------------------------------------------------------------------



**## Objective**



* Design an SPI Master using FSM-based control architecture.
* Generate SPI clock from a high-frequency system clock.
* Transmit data serially through MOSI using MSB-first shifting.
* Receive serial data through MISO and reconstruct the received byte.
* Control communication using Chip Select (CS).
* Verify SPI functionality using loopback-based simulation.



\-------------------------------------------------------------------------------



**## SPI Master Overview**



The SPI Master consists of:

* Clock Divider : Generates SPI clock (SCLK) from system clock
* FSM Controller : Controls SPI transaction sequence
* TX Shift Register : Converts parallel data into serial MOSI data
* RX Shift Register : Reconstructs received serial MISO data
* Bit Counter : Tracks transmitted and received bits
* CS Logic : Selects and controls slave communication



Transaction Flow : IDLE -> LOAD -> TRANSFER -> DONE

* IDLE : Waits for transfer request
* LOAD : Loads transmit data and selects slave
* TRANSFER : Sends and receives 8-bit serial data
* DONE : Completes transaction and returns to IDLE



\------------------------------------------------------------------------



**## SPI Mode-0 Operation** 



Mode Configuration :

* CPOL (Clock Polarity) = 0
* CPHA (Clock Phase) = 0



Clock Behavior:

* Idle Clock = LOW
* Rising Edge : Samples MISO
* Falling Edge : Shifts MOSI



Data Transfer : 

* MSB transmitted first
* 8 SCLK cycles required for 8-bit transfer
* Full-duplex communication supported



\---------------------------------------------------------------------------



**## SPI Loopback Architecture**



The verification environment consists of:

* SPI Master : Generates SCLK, MOSI and CS
* Loopback Connection : MOSI connected directly to MISO
* Self-Checking Testbench : Compares transmitted and received data



Loopback Flow : TX Data -> MOSI -> MISO -> RX Data



Verification Result :

* PASS : Transmitted data matches received data
* FAIL : Transmitted data differs from received data



\---------------------------------------------------------------------------



**## Learning Outcomes**



* Understood SPI protocol fundamentals and Mode-0 timing.
* Learned SPI clock generation using clock division.
* Implemented FSM-controlled SPI Master architecture.
* Applied MSB-first serial transmission and reception.
* Developed loopback-based self-checking testbench verification.
* Strengthened RTL design, simulation, and debugging skills.



\-----------------------------------------------------------------------------



**# Author:** MARK JUSTIN

