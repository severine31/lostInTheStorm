extends RigidBody2D

var ray_one : RayCast2D
var ray_two : RayCast2D

func _ready():
	ray_one = $Chandelier/RayUn
	ray_two = $Chandelier/RayDeux
	gravity_scale = 0

func _physics_process(delta):
	if ray_one.collide_with_bodies:
		if ray_one.get_collider() != null:
			var body = ray_one.get_collider()
			if body.name == "Player":
				go_down()
	if ray_two.collide_with_bodies:
		if ray_two.get_collider() != null:
			var body = ray_two.get_collider()
			if body.name == "Player":
				go_down()
				
func go_down():
	gravity_scale = 15
	add_force(Vector2(0,2), Vector2(0,2))
