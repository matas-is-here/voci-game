extends CharacterBody2D


const SPEED = 600.0
const SLOW_DOWN = 200.0

func _physics_process(delta: float) -> void:

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SLOW_DOWN)

	move_and_slide()
	
	
func is_pad_fully_inside_hitbox() -> bool:

	var pad_rect = $Pad.get_global_rect()
	var hitbox_rect = $Hitbox.get_global_rect()
	return hitbox_rect.encloses(pad_rect)
