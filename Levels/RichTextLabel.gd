extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var boat: AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	boat = $Boat
	boat.connect("")

func add_start_text():
	lostIn.visible = false
	boat.visible = true
	boat.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
