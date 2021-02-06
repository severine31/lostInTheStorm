extends Node2D

var rng = RandomNumberGenerator.new()
var WORLD_SIZE_MIN = 5
var WORLD_SIZE_MAX = 10
var WORLD_MAP = []
var MAP_SPRITE: AnimatedSprite
var CHANDELIER_NUMBER = 5
var ROOM_SPRITES = ["left_door","right_door","two_door"]
var HUBLO_POSITIONS : Node2D
var CHANDLE_POSITIONS : Node2D
var HOLE_POSITIONS : Node2D
var BONUS_POSITION : Node2D
var DOOR_POSITION : Node2D

func _ready():
	HUBLO_POSITIONS = $HubloPositions
	CHANDLE_POSITIONS = $ChandelPositions
	HOLE_POSITIONS = $HolePositions
	BONUS_POSITION = $BonusPositions
	DOOR_POSITION = $DoorsPositions
	MAP_SPRITE = $RoomSprite
	generate_world()
	render_word()
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_page_down"):
		render_word()
		
func render_word():
	reset_room()
	if WORLD_MAP.size() > 0:
		var room = WORLD_MAP[0]
		# Room sprite
		MAP_SPRITE.set_animation(room["map_sprite"])
		# Hublo
		for hub in range(0, room["hublo_number"]):
			for pos in HUBLO_POSITIONS.get_children():
				if pos.get_child_count() == 0:
					var entity = preload("res://Entities/Hublo.tscn").instance()
					pos.add_child(entity)
					break
		for chand in range(0, room["chandelier_number"]):
			for pos in CHANDLE_POSITIONS.get_children():
				if pos.get_child_count() == 0:
					var entity = preload("res://Entities/Chandelier.tscn").instance()
					pos.add_child(entity)
					break
		WORLD_MAP.remove(0)
	else:
		print("You Win")

func reset_room():
	for child in HUBLO_POSITIONS.get_children():
		for hub in child.get_children():
			hub.queue_free()
	for child in CHANDLE_POSITIONS.get_children():
		for hub in child.get_children():
			hub.queue_free()
	for child in HOLE_POSITIONS.get_children():
		for hub in child.get_children():
			hub.queue_free()
	for child in BONUS_POSITION.get_children():
		for hub in child.get_children():
			hub.queue_free()
	for child in DOOR_POSITION.get_children():
		for hub in child.get_children():
			hub.queue_free()

func generate_world():
	for i in range(1, rng.randi_range(WORLD_SIZE_MIN, WORLD_SIZE_MAX)):
		var type_room = ROOM_SPRITES[rng.randi_range(0,2)]
		WORLD_MAP.append(
			{
				"map_sprite": type_room,
				"chandelier_number": rng.randi_range(1,2),
				"hublo_number": rng.randi_range(1,4),
				"hole_number": rng.randi_range(1,2),
				"doors": doors_enable(type_room)
			}
		)

func doors_enable(type_room):
	var doors = []
	if type_room == "left_door":
		doors.append("left")
	elif type_room == "right_door":
		doors.append("right")
	else:
		doors.append("left")
		doors.append("right")
	return doors
