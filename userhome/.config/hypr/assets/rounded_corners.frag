#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);

    vec2 radius = vec2(0.01, 0.016);

    vec2 d = abs(v_texcoord - 0.5) - (0.5 - radius);

    if (d.x > 0.0 && d.y > 0.0) {
        vec2 normalized_dist = d / radius;
        float dist_from_center = length(normalized_dist);

        float edge_smoothing = 0.05; 
        float t = smoothstep(1.0 - edge_smoothing, 1.0 + edge_smoothing, dist_from_center);

        fragColor = mix(color, vec4(0.0, 0.0, 0.0, 1.0), t);
    } else {
        fragColor = color;
    }
}