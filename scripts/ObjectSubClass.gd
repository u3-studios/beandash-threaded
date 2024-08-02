extends Node3D
class_name object

@export var speed = 7
@export var area : Area3D
@export var ray : RayCast3D

var spedUp : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	area.body_entered.connect(Callable(self, "_on_area_3d_body_entered"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.z += speed * delta
		
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider.is_in_group("player"):
			Verdier.points += 1
			ray.enabled = false


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		body.die()


func _on_timer_timeout():
	get_parent().remove_child(self)
