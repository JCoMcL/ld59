shader_type canvas_item;

uniform float factor: hint_range(0,1) = 1;
uniform float wave_size = 30.0;

float wave(float x) {
	return abs(mod(x, 2.0 * wave_size) - wave_size);
}

float wave_curtain(vec2 pos, float curtain_height) {
	float y_limit = pos.y - wave(pos.x);
	return smoothstep(y_limit, y_limit+2.0, curtain_height);
}

void fragment() {
	vec2 RESOLUTION = vec2(1.0 / SCREEN_PIXEL_SIZE.x, 1.0/ SCREEN_PIXEL_SIZE.y);
	vec2 pixel_coord = RESOLUTION * UV;
	float fudge_factor = (wave_size * 3.0) / RESOLUTION.y;
	float curtain_height = (factor - fudge_factor) * (1.0 + fudge_factor*2.0)  * RESOLUTION.y;
	
	COLOR.a = 
		0.4 * wave_curtain(pixel_coord, curtain_height) +
		0.3 * wave_curtain(pixel_coord, curtain_height + wave_size) +
		0.3 * wave_curtain(pixel_coord, curtain_height + wave_size * 2.0);
}
