extends Node2D

var player : KinematicBody2D
var left_pos : Position2D
var midle_pos : Position2D
var right_pos : Position2D

func _ready():
	player = $Player
	left_pos = $player_pos/left
	right_pos = $player_pos/right
	midle_pos = $player_pos/midle

func _on_RoomGen_on_change_level(player_pos):
	if player_pos == "left":
		player.position = left_pos.position
	if player_pos == "midle":
		player.position = midle_pos.position
	if player_pos == "right":
		player.position = right_pos.position
