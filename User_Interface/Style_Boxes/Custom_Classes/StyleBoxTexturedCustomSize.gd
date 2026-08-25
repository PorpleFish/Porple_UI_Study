@tool
class_name StyleBoxTexturedCustomSize
extends StyleBoxTexture

#
# Credit to Biluo
# https://github.com/billuo
#

@export_range(-128.0, 128.0, 1.0) var hacked_border_margin_top: float = 0.0:
	set(value):
		self.expand_margin_top = value
	get():
		return expand_margin_top
@export_range(-128.0, 128.0, 1.0) var hacked_border_margin_bottom: float = 0.0:
	set(value):
		self.expand_margin_bottom = value
	get():
		return expand_margin_bottom
@export_range(-128.0, 128.0, 1.0) var hacked_border_margin_left: float = 0.0:
	set(value):
		self.expand_margin_left = value
	get():
		return expand_margin_left
@export_range(-128.0, 128.0, 1.0) var hacked_border_margin_right: float = 0.0:
	set(value):
		self.expand_margin_right = value
	get():
		return expand_margin_right
