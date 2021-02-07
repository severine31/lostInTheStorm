extends KinematicBody2D

var velocity: Vector2 = Vector2()
var sprite: AnimatedSprite
var JUMP = -7000
var SPEED = 400
var GRAVITY = 350

func _ready():
	sprite = $AnimatedSprite

func _physics_process(delta):
	get_input(delta)
	velocity = velocity.normalized() * SPEED
	if !is_on_floor():
		sprite.set_animation("jump")
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y += JUMP*1.5
	else:
		velocity.y += GRAVITY
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

func _on_HintArea_body_entered(body):
	print(body)
	if body.name == "Chandelier":
		print("loose life chandle")
	if body.name == "Hole":
		print("loose life Hole")
