shader_type spatial;
render_mode blend_add, cull_disabled, unshaded;

void vertex() {
        MODELVIEW_MATRIX = VIEW_MATRIX * mat4(INV_VIEW_MATRIX[0], INV_VIEW_MATRIX[1], INV_VIEW_MATRIX[2], MODEL_MATRIX[3]);
}

uniform sampler2D albedo_texture : source_color;

void fragment() {
	ALBEDO = texture(albedo_texture, UV).rgb;
}