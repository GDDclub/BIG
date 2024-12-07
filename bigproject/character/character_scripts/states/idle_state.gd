extends State

func enter():
	#object.sprite.play("idle_anim")
	print("Player idle") #debug

func physics_update(delta):
	object.velocity = object.velocity.move_toward(Vector2.ZERO, object.ACCEL * delta)
	object.move_and_slide()
	#if object.input.attack:
	#	change_state("attack")
	if object.input.normalized != Vector2.ZERO:
		change_state("run")
