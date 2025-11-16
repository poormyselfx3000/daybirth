extends Node3D
var i = 0

@onready var anim: AnimationPlayer = $anim


	
	

	
	


func _on_timer_timeout() -> void:
	$anim.play("rush")
	$enemy/rushing.play(2.4)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("ahphu") and i == 0:
		i+=1
		anim.play("intro")
		$Pew.play()
		$Timer.start(9)



	


func _on_tim_2_timeout() -> void:
	$Pew.play()
	$AnimatedSprite3D/AudioStreamPlayer3D.play()
