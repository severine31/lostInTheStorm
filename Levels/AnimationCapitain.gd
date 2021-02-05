extends Node2D

var arr = [
	"Hey mate, the situation is critical...",
	"We are in the middle of storm and we have to evacuate the boat.",
	"But a baby is lost in the boat...",
	"We have to find him before leaving !",
	"Help us, find the baby !",
	"Be carefull, the storm has damaged the boat..."
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
	if iteration == 3:
		baby.visible = true
		baby.play("default")
	
	if iteration == 6:
		get_tree().change_scene("res://Levels/MainLevels.tscn")

func _on_Timer_timeout():
	text.text = arr[iteration]
	iteration = iteration + 1
	timer.start()
