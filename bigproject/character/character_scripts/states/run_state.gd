extends State

func enter():
	# Nesne animasyonunu oynatabilir
	#object.sprite.play("run_anim")
	print("Player run")  # Debug mesajı
	
func physics_update(delta):
	# Hız hesaplama
	object.velocity.x = object.WALK_SPEED * object.input_manager.x
	object.move_and_slide()

	# Hareket durursa durum değiştirme
	if object.input_manager.x == Vector2.ZERO:
		change_state("idle")
