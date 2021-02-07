extends Node2D

var arr = [
	"Hey mate,",
	"the situation is critical...",
	"We are in the middle of storm",
	"We've to leave the boat.",
	"But a baby is lost...",
	"We've to find him",
	"Please,",
	"find the baby !",
	"Be carefull,",
	"boat is damaged...",
	"If you're tired,",
	"drink something",
	"Good luck!"
]
var text: RichTextLabel
var captain: AnimatedSprite
var baby: AnimatedSprite
var timer: Timer
var iteration = 0

func _ready():
	captain = $Capitaine
	text = $TextCapitaine
	baby = $Baby
	timer = $Timer
	
	captain.visible = true
	captain.play("default")
	text.visible = true 
	text.text = arr[0]
	iteration = 1
	timer.start()
	
func _process(delta):
	if iteration <= arr.size():
		if arr[iteration-1] == "But a baby is lost...":
			baby.visible = true
			baby.play("default")
	else: 
		get_tree().change_scene("res://Levels/MainLevels.tscn")

	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://Levels/MainLevels.tscn")

func _on_Timer_timeout():
	if iteration < arr.size():
		text.text = arr[iteration]
	iteration = iteration + 1
	timer.start()
