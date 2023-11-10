extends Node3D

#character postion
var char_pos : Vector3 
var char_direction = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var xr_interface : XRInterface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		var vp : Viewport = get_viewport()
		vp.use_xr = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_var()
	
func update_var():
	char_pos = $CharacterBody.position

func _on_character_body_left_attack():
	char_direction = $CharacterBody.direction
	if ! $Floor/RockLar:
		pass
	else:
		if char_direction == 0:
			if char_pos.z + 2 >= $Floor/RockLar.position.z and char_pos.x + 2 >= $Floor/RockLar.position.x and char_pos.x - 2 <= $Floor/RockLar.position.x:
				print('rock is dead')
				$Floor/RockLar.queue_free()
		if char_direction == 1:
			if char_pos.z + 2 >= $Floor/RockLar.position.z and char_pos.z - 2 <= $Floor/RockLar.position.z and char_pos.x + 2 >= $Floor/RockLar.position.x:
				print('rock is dead')
				$Floor/RockLar.queue_free()
		if char_direction == 2:
			if char_pos.z - 2 <= $Floor/RockLar.position.z and char_pos.x + 2 >= $Floor/RockLar.position.x and char_pos.x - 2 <= $Floor/RockLar.position.x:
				print('rock is dead')
				$Floor/RockLar.queue_free()
		if char_direction == 3:
			if char_pos.z + 2 >= $Floor/RockLar.position.z and char_pos.z - 2 <= $Floor/RockLar.position.z and char_pos.x - 2 <= $Floor/RockLar.position.x:
				print('rock is dead')
				$Floor/RockLar.queue_free()
#		if char_pos.z + 50 >= $Floor/RockLar.position.z and char_pos.z - 50 <= $Floor/RockLar.position.z and char_pos.x + 50 >= $Floor/RockLar.position.x and char_pos.x - 50 <= $Floor/RockLar.position.x:
