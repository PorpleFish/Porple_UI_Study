@icon("res://Addons/at-icons/node/speaker.svg")
class_name List_Item_Sound_Effect
extends Node

# Effect for reactive sounds on button interactions
# 
# 

signal sound_finished(sound : Enums.SOUND_TYPE)

@export var hover : AudioStream
@export var button_down : AudioStream

@export var bus_name : String = "User_Interface"

func _ready() -> void:
	var current_audio_stream : AudioStreamPlayer
	var parent_control := get_parent() as Control
	
	if not parent_control:
		print("<BUTTON_SOUND_EFFECT> Error- Parent isn't a Button!")
	
	if hover:
		current_audio_stream = AudioStreamPlayer.new()
		add_child(current_audio_stream)
		current_audio_stream.stream = hover
		current_audio_stream.bus = bus_name
		current_audio_stream.name = "Hover"
		parent_control.focus_entered.connect(current_audio_stream.play)
		current_audio_stream.finished.connect(_handle_sound_finish.bind(Enums.SOUND_TYPE.HOVER))
	
	#if button_down:
		#current_audio_stream = AudioStreamPlayer.new()
		#add_child(current_audio_stream)
		#current_audio_stream.stream = button_down
		#current_audio_stream.bus = bus_name
		#current_audio_stream.name = "button_down"
		#parent_control.button_down.connect(current_audio_stream.play)
		#current_audio_stream.finished.connect(_handle_sound_finish.bind(Enums.SOUND_TYPE.BUTTON_DOWN))

func _handle_sound_finish(sound_type : Enums.SOUND_TYPE) -> void:
	sound_finished.emit(sound_type)
