extends CharacterBody3D

var health = 100


func _process(delta: float) -> void:
	if health <= 0 :
		$"../ahphu3d/Bossdie".play()
		$"../tim2".start()
		queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("ahphu"):
		$"../ahphu3d/head/Camera3D/SubViewport/Losesc".show()
		$Timer.start(3)
		$"../ahphu3d/Bossdie".play()



	


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	
	


	
