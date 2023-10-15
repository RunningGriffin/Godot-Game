extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	$Marker3D2/Sprite3D.hide()

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
	
	if get_parent().left_trigger > .5:
		$Marker3D2/Sprite3D.show()
	else:
		$Marker3D2/Sprite3D.hide()
		
	if get_parent().left_right > 0:
		velocity.x = get_parent().left_right
	elif get_parent().left_left < 0:
		velocity.x = get_parent().left_left
	else:
		velocity.x = 0

	if get_parent().left_up > 0:
		velocity.z = get_parent().left_up
	elif get_parent().left_down < 0:
		velocity.z = get_parent().left_down
	else:
		velocity.z = 0
	
	velocity.z = velocity.z * -1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	
	position += velocity * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector(get_parent().left, get_parent().right, get_parent().up, get_parent().down)
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
	#	velocity.x = direction.x * SPEED
	#	velocity.z = direction.z * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	#	velocity.z = move_toward(velocity.z, 0, SPEED)
		
	move_and_slide()
	
func get_pos():
	return position

