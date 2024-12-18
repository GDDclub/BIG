extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	print(velocity.y)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if not velocity.y:
			_switch_anim("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not velocity.y:
			_switch_anim("stop")
			
	## Animations for jumping based on velocity
	if velocity.y < 0:
		_switch_anim("jump_up")
	elif velocity.y > 0:
		_switch_anim("jump_down")
	move_and_slide()
	
	#sprite direction
	if direction > 0:
		$Sprite.flip_h = false
	elif direction < 0:
		$Sprite.flip_h = true

#handling animation switching.
#it is easier to handle some condition checks this way.
#we want to stop through the stop animation if the character was running, 
#but without it if it wasn't running.
func _switch_anim(anim):
	#match case statement: does the part that anim is equal to.
	match anim:
		"stop":
			#only if it is running, we want it to stop through "stop".
			if $AnimationPlayer.current_animation == "run":
				$AnimationPlayer.play("stop")
				
			#this condition lets it play through all of "stop"
			#before switching to "RESET",
			#but only if it was already playing "stop".
			#if it wasnt, it goes straight to "RESET".
			elif $AnimationPlayer.current_animation != "stop": 
				$AnimationPlayer.play("RESET")
		"run": $AnimationPlayer.play("run")
		"jump_up": $AnimationPlayer.play("jump_up")
		"jump_down": $AnimationPlayer.play("jump_down")
		
