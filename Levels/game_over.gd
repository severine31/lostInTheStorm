extends Node2D


var main: AnimatedSprite 
var text_retry: Label

func _ready():
	main = $Main
	text_retry = $Label
	
	main.visible = true
	main.play("default")
	main.connect("animation_finished", self, "show_text_retry")

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://Levels/MainLevels.tscn")
		
func show_text_retry():
	text_retry.visible = true
	
