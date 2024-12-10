extends CharacterBody2D


 

# References to the FSM, sprite, and input manager, assigned when the node is ready
@onready var fsm = $FSM  
#@onready var sprite = $AnimatedSprite2D 
@onready var input = InputManager.new()  

# Facing direction of the character, initially set to the right
const GRAVITY = 200.0
const WALK_SPEED = 200

func _ready():
	fsm.change_state("idle")

func _process(delta):
	fsm.update(delta)


func _physics_process(delta):
	input.update_input()  
	fsm.physics_update(delta)
