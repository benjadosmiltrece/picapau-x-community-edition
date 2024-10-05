shader_type canvas_item;

uniform float smoothness : hint_range(0.0, 1.0); // Adjust smoothness of the vignette
uniform float scale : hint_range(0.1, 5.0); // Adjust scale of the vignette

uniform vec2 screen_size; // Add this uniform to receive screen size

void fragment() {
    vec2 uv = FRAGCOORD.xy / screen_size;  // Use the screen_size uniform
    float dist = distance(uv, vec2(0.5, 0.5)) * scale; // Scale the distance calculation
    float vignette = smoothstep(0.4 - smoothness, 0.5 - smoothness, dist); // Use smoothness for effect
    vec4 tex_color = texture(TEXTURE, UV);

    // Set the color to black (0.0) based on the vignette effect
    COLOR = tex_color * vignette * vec4(0.0, 0.0, 0.0, 1.0); // Multiply by black
}
