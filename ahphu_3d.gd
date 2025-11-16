extends CharacterBody3D


const SPEED = 2
const JUMP_VELOCITY = 4.5
const mouse_sens = 0.2

@onready var rayc: RayCast3D = $head/RayCast3D

@onready var head: Node3D = $head


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$head/Camera3D/SubViewport/Losesc.hide()
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		head.rotation.x = clamp(head.rotation.x,deg_to_rad(-89),deg_to_rad(89))
		
	if Input.is_action_just_pressed("use"):
		$head/AnimatedSprite3D.play("shot")
		$head/Pew.play()
		if rayc.is_colliding():
			var target = rayc.get_collider()
			if target.is_in_group("enemy"):
				$"../enemy/gethit".play(0.25)
				target.health -= 5
				
		print($head/RayCast3D.get_collider())
		
		
		$Timer.start(0.2)

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_timer_timeout() -> void:
	$head/AnimatedSprite3D.play("default")
	
