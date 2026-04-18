@abstract
extends State

class_name PlayerState

const IDLE = "Idle"
const WALKING = "Walking"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"

var player: Nameless


func _ready() -> void:
	await owner.ready
	print("owner.name: %s" % owner.name)
	print("owner: %s" % owner)
	print("owner path: %s" % owner.get_path())
	player = owner as Nameless
	print("player: %s" % player)


func exit() -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


func handle_input(_event: InputEvent) -> void:
	pass
