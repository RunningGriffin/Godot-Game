extends Node3D

## XR Tools Hand Script
##
## This script manages a godot-xr-tools hand.
##S

## Name of the Primary Action in the OpenXR Action Map.
@export var joystick_action : String = "primary"

## Controller used for input/tracking
var _controller : XRController3D


## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Find our controller
	_controller = XRTools.find_xr_ancestor(self, "*", "XRController3D")


## This method is called on every frame. It checks for world-scale changes and
## scales itself causing the hand mesh and skeleton to scale appropriately.
## It then reads the grip and trigger action values to animate the hand.
func _process(_delta: float) -> void:
	# Do not run physics if in the editor
	if Engine.is_editor_hint():
		return

	# Animate the hand mesh with the controller inputs
	if _controller:
		var primary : Vector2 = _controller.get_vector2(joystick_action)
		
		if primary.x != 0:
			print('partner')
