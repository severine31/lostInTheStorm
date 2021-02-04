extends KinematicBody2D

var velocity: Vector2 = Vector2()
var sprite: AnimatedSprite
var SPEED = 200

func _ready():
	sprite = $AnimatedSprite

func _physics_process(delta):
	get_input(delta)
	velocity = velocity.normalized() * SPEED
	move_and_slide(velocity)

func get_input(delate):
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		sprite.set_animation("walk")
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		sprite.set_animation("walk")
		sprite.flip_h = false
	else:
		sprite.set_animation("idle")
