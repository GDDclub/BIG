extends Node

# Dictionary to hold all possible states
var states = {}

# Variables to track the current state node, current state name, and previous state name
var current_state_node
var current_state
var previous_state

func _ready():
	# Get a reference to the parent object of this FSM (finite state machine)
	var object = get_parent()
	
	# Loop through each child node and check if it is a 'State' node
	for child in get_children():
		if child is State:
			# Store each child node that is a state in the 'states' dictionary
			# Convert the name to lowercase to simplify state lookups
			states[child.name.to_lower()] = child
			
			# Assign the parent object and this FSM instance to each state
			child.object = object
			child.fsm = self

func update(delta):
	if not current_state_node: return # Exit if there's no current state
	current_state_node.update(delta)

# Physics update function for the current state node
func physics_update(delta):
	if not current_state_node: return # Exit if there's no current state
	current_state_node.physics_update(delta)

# Changes the state of the FSM to a new state
func change_state(next_state):
	# If there's a current state, call its 'exit' function
	if current_state_node:
		current_state_node.exit()
	
	# Store the previous state, update the current state name, and get the corresponding state node
	previous_state = current_state
	current_state = next_state
	current_state_node = states[current_state]
	
	# Call the 'enter' function of the new state node
	current_state_node.enter()

func add_state(state_name: String, state_script_path: String):
	var state_instance = load(state_script_path).instantiate()
	add_child(state_instance)
	states[state_name.to_lower()] = state_instance  
	state_instance.fsm = self
	state_instance.object = get_parent()  # Reference to the turret
