@icon("res://Addons/at-icons/control/list_unordered.svg")
class_name BD_Ability_Group_List_Item
extends Control

#
#
#

@export var hovered_color : Color = Color(1.0, 1.0, 1.0, 1.0)
@export var unhovered_color : Color = Color(0.693, 0.693, 0.693, 1.0)

var slide_tween : Tween
var start_horizonal_offset

@onready var cursor_location: Control = %Cursor_Location

func _ready() -> void:
	var bg : Panel = $Background
	bg.material = bg.material.duplicate()
	bg.material.set_shader_parameter("modulate", unhovered_color)
	start_horizonal_offset = offset_transform_position.x

func _focus() -> void:
	var bg : Panel = $Background
	bg.material.set_shader_parameter("modulate", hovered_color)
	if slide_tween:
		slide_tween.kill()
	if start_horizonal_offset:
		slide_tween = create_tween()
		slide_tween.set_trans(Tween.TRANS_CIRC)
		slide_tween.tween_property(self, "offset_transform_position:x", start_horizonal_offset - 50, 0.15)


func _unfocus() -> void:
	var bg : Panel = $Background
	bg.material.set_shader_parameter("modulate", unhovered_color)
	if slide_tween:
		slide_tween.kill()
	slide_tween = create_tween()
	slide_tween.set_trans(Tween.TRANS_CIRC)
	slide_tween.tween_property(self, "offset_transform_position:x", start_horizonal_offset, 0.2)
