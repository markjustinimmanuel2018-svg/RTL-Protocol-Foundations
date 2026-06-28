**# Week 4 Mini Project - SPI Slave \& Full-Duplex Communication**



This project extends the SPI Master developed in Week-3 by implementing an SPI Slave operating in Mode-0 (CPOL = 0, CPHA = 0) and integrating both modules to achieve complete full-duplex SPI communication.



\----------------------------------------------------------------------------


**## Files**



* spi\_slave.v  : SPI Slave RTL design
* spi\_top.v    : Top module integrating SPI Master and SPI Slave
* tb\_spi\_top.v : Self-checking testbench for SPI communication verification



Continued from Week-3

* spi\_master.v : SPI Master RTL design



\----------------------------------------------------------------------------



**## Objective**



* Design an SPI Slave capable of receiving and transmitting serial data.
* Implement Mode-0 communication using external SCLK and CS signals.
* Perform serial-to-parallel reconstruction of received MOSI data.
* Transmit parallel data serially through MISO using MSB-first shifting.
* Integrate SPI Master and SPI Slave into a complete communication system.
* Verify full-duplex data exchange using a self-checking testbench.



\-----------------------------------------------------------------------------



**## SPI Slave Overview**



The SPI Slave consists of:

* TX Shift Register : Converts parallel transmit data into serial MISO data
* RX Shift Register : Reconstructs received MOSI data into parallel form
* Bit Counter : Tracks transferred bits
* MISO Logic : Serially transmits slave data
* MOSI Logic : Receives master data
* CS Control : Detects start of SPI transaction



Slave Operation:

* CS = HIGH : Slave remains inactive
* CS = LOW  : Slave participates in communication



Mode-0 Timing:

* Rising Edge : Samples MOSI
* Falling Edge : Shifts MISO



\-----------------------------------------------------------------------------



**## SPI Master-Slave Architecture**



The complete SPI system consists of:

* SPI Master : Generates SCLK, MOSI and CS
* SPI Slave : Receives MOSI and drives MISO
* Communication Bus : SCLK, MOSI, MISO and CS lines
* Self-Checking Testbench : Verifies bidirectional communication



Communication Flow: 

* Master TX Data -> MOSI -> Slave RX Data
* Slave TX Data -> MISO -> Master RX Data



This enables simultaneous transmission and reception between master and slave, demonstrating full-duplex SPI communication.



\------------------------------------------------------------------------------



**## Learning Outcomes**



* Understood SPI Slave architecture and operation
* Learned SPI Mode-0 timing requirements
* Implemented MISO transmission and MOSI reception logic
* Integrated SPI Master and SPI Slave into a complete SPI system
* Debugged timing-related issues involving first-bit transmission alignment
* Strengthened RTL design, protocol understanding, simulation, and debugging skills



\-------------------------------------------------------------------------------



**# Author:** MARK JUSTIN

