extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var left_hand_con = $"../XROrigin3D/LeftHand/LeftHandCon"

var direction = 0
var trig_pressed = 0

signal left_attack

func _ready():
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor(): 
		velocity.y -= gravity * delta

	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
	
	if left_hand_con.trigger > .9:
		if trig_pressed == 0:
			left_attack.emit()
			trig_pressed = 1
		else:
			pass
			
	if left_hand_con.trigger == 0:
		trig_pressed = 0
	
	#Handle Velocity Based on Left Joystick
	if left_hand_con.right > 0:
		velocity.x = left_hand_con.right
		#Track direction of player for interactions
		if left_hand_con.right > .35:
			direction = 1
	elif left_hand_con.left < 0:
		velocity.x = left_hand_con.left
		if left_hand_con.left < -.35:
			direction = 3
	else:
		velocity.x = 0

	if left_hand_con.up > 0:
		velocity.z = left_hand_con.up
		if left_hand_con.up > .35:
			direction = 0
	elif left_hand_con.down < 0:
		velocity.z = left_hand_con.down
		if left_hand_con.down < -.35:
			direction = 2
	else:
		velocity.z = 0
	
	#Reverse velocity z
	velocity.z = velocity.z * -1
	
	#Make diagonial speed normalized (prevents faster diagonal movement)
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	
	position += velocity * delta
		
	move_and_slide()
	
func get_pos():
	return position

