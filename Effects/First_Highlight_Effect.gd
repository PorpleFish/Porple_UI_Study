@icon("res://Addons/at-icons/node/flag_triangular.svg")
class_name First_Highlight_Effect
extends Node

# Effect for setting the first highlighted control
#
# Highlight_this_first can toggle whether or not to use this control

@export var highlight_this_first : bool = true

func _ready() -> void:
	var parent_control := get_parent() as Control
	if parent_control:
		parent_control.grab_focus()
	else:
		print("<FIRST_HIGHLIGHT_EFFECT> Error- Parent isn't a control!")
