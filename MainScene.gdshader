shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float blur_strength : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec2 size = 1.0 / SCREEN_PIXEL_SIZE;
    float offset = blur_strength * 4.0;

    vec4 col = texture(SCREEN_TEXTURE, SCREEN_UV) * 0.4;
    col += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(offset, 0.0) / size) * 0.15;
    col += texture(SCREEN_TEXTURE, SCREEN_UV - vec2(offset, 0.0) / size) * 0.15;
    col += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, offset) / size) * 0.15;
    col += texture(SCREEN_TEXTURE, SCREEN_UV - vec2(0.0, offset) / size) * 0.15;

    COLOR = col;
}
