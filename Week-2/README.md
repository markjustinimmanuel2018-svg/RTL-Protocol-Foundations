**# Week 2 Mini Project - UART Receiver \& Loopback Verification**



This project extends the UART Transmitter developed in Week-1 by implementing a UART Receiver with start-bit validation, data reconstruction, stop-bit verification, and complete TX-RX loopback communication.



\-------------------------------------------------------------------------------



**## Files**



* uart\_rx.v : UART receiver FSM and datapath
* uart.v    : Top module integrating UART transmitter and receiver
* tb\_uart.v : Self-checking testbench for UART loopback verification



Continued from Week-1

* baud\_gen.v : Baud rate generator module
* uart\_tx.v  : UART transmitter FSM and datapath



\--------------------------------------------------------------------------------



**## Objective**



* Design a UART receiver using FSM-based control architecture.
* Implement start-bit detection and validation.
* Perform serial-to-parallel reconstruction.
* Verify stop-bit integrity before accepting received data.
* Integrate UART transmitter and receiver into a complete loopback system.
* Develop a self-checking testbench for end-to-end verification.



\---------------------------------------------------------------------------------



**## UART Receiver Overview**



The UART receiver consists of:

* Start Bit Detection : Detects beginning of UART frame
* Sampling Logic : Controls bit-sampling timing
* FSM Controller : Controls reception sequence
* Shift Register : Reconstructs serial data into parallel format
* Bit Counter : Tracks received data bits
* RX Logic : Generates received byte and completion indication



Reception Flow : IDLE -> START -> ALIGN -> DATA -> STOP

* IDLE : Waits for start-bit detection
* START : Validates received start bit
* ALIGN : Aligns sampling point to center of first data bit
* DATA : Receives and stores 8 serial data bits
* STOP : Verifies stop bit and completes reception



\----------------------------------------------------------------------------------



**## UART Loopback Architecture**



The UART system consists of:

* Baud Generator : Generates baud timing pulse
* UART Transmitter : Serializes parallel data
* Communication Line : Connects TX output to RX input
* UART Receiver : Reconstructs transmitted data



Loopback Flow : TX Data -> UART TX -> TX Line -> UART RX -> RX Data



This architecture enables complete end-to-end UART communication within a single design and allows functional verification through self-checking simulation.

\---------------------------------------------------------------------------------



**## Learning Outcomes**



* Understood UART receiver architecture and operation.
* Learned start-bit detection, validation and sampling techniques.
* Implemented serial-to-parallel data reconstruction.
* Applied timing-aware sampling and alignment concepts.
* Integrated transmitter and receiver into a complete UART system.
* Strengthened FSM design, RTL integration, and simulation debugging skills.



\----------------------------------------------------------------------------------



**# Author:** MARK JUSTIN

