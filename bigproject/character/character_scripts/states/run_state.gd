extends State


func enter():
	#object.sprite.play("run_anim")
	print("Player run") #debug
	
	
func physics_update(delta):
	object.velocity = object.velocity.move_toward(object.TOP_SPEED * object.input.normalized * 3, object.ACCEL * delta)
	object.move_and_slide()
	if object.input.raw == Vector2.ZERO:
		change_state("idle")
