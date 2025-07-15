# Pattern-Detector-moore-nonover-
This Verilog module implements a Moore FSM to detect the non-overlapping pattern BCCBC from serial input. The output goes high only when the complete pattern is recognized, based solely on the current state.

This Verilog module detects the non-overlapping sequence BCCBC using a Moore finite state machine. It transitions through six defined states (S_R to S_BCCBC) based on the serial input (data_i), with the output pattern_detector_o asserted high only in the final state, ensuring pattern recognition is state-driven and not input-dependent.
