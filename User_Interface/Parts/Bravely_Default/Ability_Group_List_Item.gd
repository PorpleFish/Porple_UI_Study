@icon("res://Addons/at-icons/control/list_unordered.svg")
class_name BD_Ability_Group_List_Item
extends Button

#
#
#

var slide_tween : Tween
var start_horizonal_offset : int = 0

func _ready() -> void:
	start_horizonal_offset = offset_transform_position.x

func _focus() -> void:
	_slide(true)


func _unfocus() -> void:
	_slide(false)

func _slide(into_highlight : bool) -> void:
	if slide_tween:
		slide_tween.kill()
	slide_tween = create_tween()
	slide_tween.set_trans(Tween.TRANS_CIRC)
	var target_offset = start_horizonal_offset
	if into_highlight:
		target_offset -= 50
	slide_tween.tween_property(
		self, 
		"offset_transform_position:x", 
		target_offset, 
		0.2
	)
