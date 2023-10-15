extends Node3D

var right = 0
var left = 0
var up = 0
var down = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var xr_interface : XRInterface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		var vp : Viewport = get_viewport()
		vp.use_xr = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_var()
	
func update_var():
	var controller = $XROrigin3D/LeftHand/LeftHandCon
	right = controller.right
	left = controller.left
	up = controller.up
	down = controller.down
