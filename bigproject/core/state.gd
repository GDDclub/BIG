extends Node
class_name State

var object #the object that will use the state machine
var fsm #finite state machine

func enter():
	pass

func update(_delta):
	pass
	
func physics_update(_delta):
	pass

func exit():
	pass

func change_state(next_state): #helper function, ilerde direkt sadece bunu cagircaz state degistirmek icin 
	fsm.change_state(next_state)
