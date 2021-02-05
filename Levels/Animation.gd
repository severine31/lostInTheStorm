extends Node2D


var lostIn: AnimatedSprite 
var boat: AnimatedSprite
var text_play: Label

func _ready():
	lostIn = $LostIn
	boat = $Boat
	text_play = $Label
	
	lostIn.visible = true
	lostIn.play("default")
	lostIn.connect("animation_finished", self, "play_next_anim")

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://Levels/Pitch.tscn")
	
func play_next_anim():
	lostIn.visible = false
	boat.visible = true
	text_play.visible = true
	boat.play("default")
