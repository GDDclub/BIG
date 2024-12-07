extends CharacterBody2D

const PLACE_OFFSET = 100  # Offset distance for placing turrets in the direction the character is facing
const ACCEL = 1000.0  
const TOP_SPEED = Vector2(150, 150)  
 

# References to the FSM, sprite, and input manager, assigned when the node is ready
@onready var fsm = $FSM  
#@onready var sprite = $AnimatedSprite2D 
@onready var input = InputManager.new()  

# Facing direction of the character, initially set to the right


func _ready():
	fsm.change_state("idle")

func _process(delta):
	fsm.update(delta)


func _physics_process(delta):
	input.update(delta)  
	fsm.physics_update(delta)
