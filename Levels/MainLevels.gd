extends Node2D

var player : KinematicBody2D
var left_pos : Position2D
var midle_pos : Position2D
var right_pos : Position2D
var life_bar : Node2D
var life_state = 0

func _ready():
	player = $Player
	left_pos = $player_pos/left
	right_pos = $player_pos/right
	midle_pos = $player_pos/midle
	life_bar = $Life

func _on_RoomGen_on_change_level(player_pos):
	if player_pos == "left":
		player.position = left_pos.position
	if player_pos == "midle":
		player.position = midle_pos.position
	if player_pos == "right":
		player.position = right_pos.position

func _on_Player_lost_life():
	if life_state == 2:
		get_tree().change_scene("res://Levels/GameOver.tscn")
	var life_ui = life_bar.get_children()
	life_ui[life_state].visible = false
	life_state = life_state + 1
	print(life_state)

func _on_Player_up_life():
	if life_state != 0:
		life_state = life_state - 1
		var life_ui = life_bar.get_children()
		life_ui[life_state].visible = true
