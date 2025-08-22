extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -400.0

var has_enemy_been_removed = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "win" and not has_enemy_been_removed:
			has_enemy_been_removed = true
			get_parent().remove_child(get_parent().get_node("Enemy"))
