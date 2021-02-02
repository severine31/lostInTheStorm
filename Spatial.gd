extends Spatial

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_key_pressed(KEY_W):
		rotate_x(0.05)
	if Input.is_key_pressed(KEY_X):
		rotate_x(-0.05)
