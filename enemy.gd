extends CharacterBody2D

@export var speed = 200

var target = position

func _ready() -> void:
	pass

func _physics_process(delta):
	target = get_parent().get_node("Player").global_position
	velocity = position.direction_to(target) * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		get_tree().reload_current_scene()
