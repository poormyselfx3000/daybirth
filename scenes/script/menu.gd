extends Node2D

@onready var banh: AnimatedSprite2D = $banh
@onready var boomsound: AudioStreamPlayer = $boom/boomsound
@onready var boom: Sprite2D = $boom
func _ready() -> void:
	boom.hide()
	banh.play()
	

func _on_button_pressed() -> void:
	boom.show()
	boomsound.play()
	$dem.start(1)
	


func _on_dem_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/map.tscn")
