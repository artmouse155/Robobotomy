@abstract
extends Node

## Base Class for all states.
class_name State

## Signal emitted to transition to another state.
@warning_ignore("unused_signal")
signal finished(next_state_path: String, data: Dictionary)


## Called to enter a state.
@abstract
func enter(previous_state_path: String, data := { }) -> void


@abstract
func exit() -> void


@abstract
func physics_process(_delta: float) -> void


@abstract
func handle_input(_event: InputEvent) -> void
