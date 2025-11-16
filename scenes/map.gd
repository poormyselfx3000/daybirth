extends Node2D


@onready var ef: AnimatedSprite2D = $ahphu/ef


func _ready() -> void:
	ef.play()
	$chuyen.play("chuyen")


func _process(delta: float) -> void:
	if $chuyen.is_playing() :

		$ahphu/PointLight2D.hide()
	else :

		$ahphu/PointLight2D.show()

	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ahphu"):
		get_tree().change_scene_to_file("res://scenes/3d.tscn")
