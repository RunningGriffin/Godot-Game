extends Node3D

#left controller vars
var left_right = 0
var left_left = 0
var left_up = 0
var left_down = 0
var left_trigger = 0.0

#character postion
var char_pos : Vector3 

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
	var left_controller = $XROrigin3D/LeftHand/LeftHandCon
	left_right = left_controller.right
	left_left = left_controller.left
	left_up = left_controller.up
	left_down = left_controller.down
	left_trigger = left_controller.trigger
