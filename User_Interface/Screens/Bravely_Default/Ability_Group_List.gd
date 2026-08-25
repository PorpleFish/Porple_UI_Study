@tool
extends VBoxContainer

@export var offset_scale : float = 50:
	set(value):
		if Engine.is_editor_hint():
			apply_offset()
		offset_scale = value

@export var offset_curve : Curve:
	set(value):
		if Engine.is_editor_hint():
			apply_offset()
		offset_curve = value


func apply_offset() -> void:
	var mid_point : float = float(get_child_count() + 1) / 2 
	
	for i : float in range(1.0, get_child_count() + 1):
		var curve_sample_point : float
		
		if float(i) < mid_point:
			curve_sample_point = i / mid_point
		else:
			curve_sample_point = 1 - ((i - mid_point) / mid_point)
		
		get_child(int(i) - 1).offset_transform_position.x =  offset_curve.sample(curve_sample_point) * offset_scale
