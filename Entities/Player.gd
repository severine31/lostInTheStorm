extends KinematicBody2D

var velocity: Vector2 = Vector2()
var sprite: AnimatedSprite
var JUMP = -7000
var SPEED = 400
var GRAVITY = 350
var coll : CollisionShape2D
var life_bar : Node2D

signal lost_life()
signal up_life()

func _ready():
	sprite = $AnimatedSprite
	coll = $MainColl

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
	if body.name == "Chandelier":
		body.queue_free()
		emit_signal("lost_life")
		print("loose life chandle")
	if body.name == "Hole":
		coll.set_disabled(true)
		emit_signal("lost_life")
		print("loose life Hole "+str(coll.disabled))
	if body.name == "Bonus":
		print("loose life Hole")
		body.queue_free()
		emit_signal("up_life")
	if body.name == "Baby":
		get_tree().change_scene("res://Levels/YouWin.tscn")
