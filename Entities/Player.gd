extends KinematicBody2D

var velocity: Vector2 = Vector2()
var sprite: AnimatedSprite
var JUMP = 6000
var SPEED = 400
var GRAVITY = 0.01

func _ready():
	sprite = $AnimatedSprite

func _physics_process(delta):
	get_input(delta)
	velocity = velocity.normalized() * SPEED
	if !is_on_floor():
		sprite.set_animation("jump")
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y += -JUMP
	else:
		velocity.y += SPEED
	move_and_slide(velocity, Vector2(0,-1))

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
