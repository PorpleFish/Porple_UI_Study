shader_type canvas_item;

uniform sampler2D mask_01;
uniform sampler2D mask_02;

uniform sampler2D color;

uniform vec4 modulate : source_color;

void fragment() {
	COLOR.a *= texture(mask_01, UV).r * texture(mask_02, UV).r;
	COLOR.rgb = texture(color, UV).rgb;
	COLOR *= modulate;
}
