extends CharacterBody3D

var was_on_floor = false

var gravity = Vector3(0, 9.8, 0)
var SPEED = 4.0
var JUMP_VELOCITY = 7

@onready var picaPau: Node3D = $PicaMolde
@onready var animation_player: AnimationPlayer = $PicaMolde/pica_pau/AnimationPlayer

func _ready() -> void:
	animation_player.play("idle", 0)
func _physics_process(delta: float) -> void:
	var is_on_floor_now = is_on_floor()
	if is_on_floor_now and not was_on_floor:
		on_land()
	
	was_on_floor = is_on_floor_now
# Gravedad
	if not is_on_floor():
		velocity += -gravity * delta
# Saltar
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump2", 0.05)


	if(velocity.y != 0):
		gravity.y = move_toward(9.8, 39.2, 4)
	if(velocity.y == 0):
		gravity.y = 9.8

# Movimiento
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if(velocity.y == 0):
			animation_player.play("running", 1)
		
		if direction.x * direction.z == 0:
			velocity.x = direction.x * SPEED * 1.21
			velocity.z = direction.z * SPEED * 1.21
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
# Rotaciones
		var angle = atan2(direction.x, direction.z)
		picaPau.rotation.y = lerp_angle(picaPau.rotation.y, angle, 0.15)
	else:
		if(velocity.y == 0):
			animation_player.play("idle", 1)

		
		velocity.x = move_toward(velocity.x, 0, SPEED / 4)
		velocity.z = move_toward(velocity.z, 0, SPEED / 4)
		
	move_and_slide()
func on_land():
	animation_player.play("idle",0.25)
