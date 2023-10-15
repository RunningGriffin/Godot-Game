extends XROrigin3D

const SPEED = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var camera_pos = $RightHand/RightHandCon

	if camera_pos.right > 0:
		position.x += (camera_pos.right * SPEED)
	elif camera_pos.left < 0:
		position.x += (camera_pos.left * SPEED)
	else:
		position.x = get_parent().char_pos.x

	if camera_pos.up > 0:
		position.z += (camera_pos.up * SPEED) * -1
	elif camera_pos.down < 0:
		position.z += (camera_pos.down * SPEED) * -1
	else:
		position.z = (get_parent().char_pos.z) + 10
	

	
