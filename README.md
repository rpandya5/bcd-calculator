# BCD-Calculator

## Overview
A sophisticated digital arithmetic processing unit implemented in Verilog, focusing on Binary-Coded Decimal operations with real-time display capabilities.

## Core Components
- Binary-to-Decimal Converter
  - 4-bit binary input handling
  - Dual-digit decimal output
  - Automatic decimal point placement
  - Invalid input detection
- Full Adder System
  - 4-bit ripple-carry architecture
  - Cascaded full adder modules
  - Carry propagation optimization
  - Real-time overflow detection
- BCD Arithmetic Unit
  - Decimal addition with automatic correction
  - Carry handling for decimal operations
  - Error checking and validation
  - Multi-digit operation support

## Technical Implementation
- Input Processing:
  - Dual 4-bit BCD input channels
  - Carry-in support for cascaded operations
  - Real-time input validation
- Display System:
  - Multi-display output (6 seven-segment displays)
  - Real-time result visualization
  - Error indication system
  - Hexadecimal/Decimal mode switching
 
  This was done as part of Lab 2 for ECE241 at the University of Toronto.
