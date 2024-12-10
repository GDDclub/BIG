extends State

func enter():
	# Idle animasyonu başlatabilirsiniz
	#object.sprite.play("idle_anim")
	print("Player idle")  # Debug için
	
func physics_update(delta):
	# Karakterin hareketini sıfırla
	object.velocity = Vector2.ZERO
	object.move_and_slide()

	# Hareket algılanırsa koşma durumuna geç
	if object.input_manager.raw != Vector2.ZERO:  # `raw` hareket girdisini temsil eder
		change_state("run")
