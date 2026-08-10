@tool
extends VBoxContainer

@export var offset_scale : float = 50:
	set(value):
		if Engine.is_editor_hint():
			apply_offset()
			print("<ABILITY_LIST> Applying offset!")
		offset_scale = value


func apply_offset() -> void:
	var amount = get_child_count() + 1 as float
	var mid_point : float = amount / 2 
	for i in range(1, amount):
		var offset: float
		
		if float(i) < mid_point:
			offset = lerp(0, 1, float(i) / mid_point)
		else:
			offset = lerp(1, 0, (float(i) - mid_point) / mid_point)
		
		var item = get_child(i - 1) as Control
		if item:
			#item.render_offset.x = offset * offset_scale
			#item.set("offset_transform_position:x", offset * offset_scale)
			item.offset_transform_position.x = offset * offset_scale
		else:
			print("<ABILITY_LIST> Child of list doesn't inherit from control!")
