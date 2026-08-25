@icon("res://Addons/at-icons/node/arrow_uturn_right_down.svg")
class_name Level_Opener_Effect
extends Node

# 
# Effect for opening a scene when the button is pressed
# 

@export_file_path("*tscn") var level : String = "res://User_Interface/Screens/System/Main_Menu/Main Menu.tscn"

func _ready() -> void:
	var parent_button : Button = get_parent() as Button
	parent_button.pressed.connect(get_tree().change_scene_to_file.bind(level))
