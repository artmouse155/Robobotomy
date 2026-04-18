extends Node

class_name PlayerStateMachine

@export var initial_state: PlayerState

@onready var state: PlayerState = (func get_initial_state() -> PlayerState:
	return initial_state if initial_state != null else get_child(0)
).call()

var active_state: PlayerState
var previous_state: PlayerState


func _ready():
	for s in find_children("*", "PlayerState"):
		s.finished.connect(_transition_to_next_state)
	await owner.ready
	state.enter("")


func _transition_to_next_state(path: String, data := { }):
	if not has_node(path):
		printerr(owner.name + ": Trying to transition to state " + path + " but it does not exist.")
		return

	var previous_state_path := state.name
	state.exit()
	state = get_node(path)
	state.enter(previous_state_path, data)


# Function Deferrals
func _physics_process(delta: float) -> void:
	state.physics_process(delta)


func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)
