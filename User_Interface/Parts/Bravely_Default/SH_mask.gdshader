shader_type canvas_item;

uniform sampler2D mask : filter_nearest;

void fragment() {
	COLOR.a *= texture(mask, UV).r;
}
