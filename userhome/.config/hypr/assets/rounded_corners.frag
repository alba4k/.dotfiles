#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);
    
    // Corner radius in texture space (0.0 to 1.0)
    float radius_x = 0.01; 
    float radius_y = 0.016; // radius_x * 1.778 for 16:9, * 1.6 for 16:10

    vec2 uv = v_texcoord;
    bool is_corner = false;
    
    // Check top-left
    if (uv.x < radius_x && uv.y < radius_y) {
        vec2 dist = vec2(radius_x, radius_y) - uv;
        if (dot(dist / vec2(radius_x, radius_y), dist / vec2(radius_x, radius_y)) > 1.0) {
            is_corner = true;
        }
    }
    // Check top-right
    else if (uv.x > 1.0 - radius_x && uv.y < radius_y) {
        vec2 dist = uv - vec2(1.0 - radius_x, radius_y);
        if (dot(dist / vec2(radius_x, radius_y), dist / vec2(radius_x, radius_y)) > 1.0) {
            is_corner = true;
        }
    }
    // Check bottom-lehft
    else if (uv.x < radius_x && uv.y > 1.0 - radius_y) {
        vec2 dist = vec2(radius_x, 1.0 - radius_y) - uv;
        if (dot(dist / vec2(radius_x, radius_y), dist / vec2(radius_x, radius_y)) > 1.0) {
            is_corner = true;
        }
    }
    // Check bottom-right
    else if (uv.x > 1.0 - radius_x && uv.y > 1.0 - radius_y) {
        vec2 dist = uv - vec2(1.0 - radius_x, 1.0 - radius_y);
        if (dot(dist / vec2(radius_x, radius_y), dist / vec2(radius_x, radius_y)) > 1.0) {
            is_corner = true;
        }
    }

    if (is_corner) {
        // Overwrite with solid black (RGB: 0.0, Alpha: 1.0)
        fragColor = vec4(0.0, 0.0, 0.0, 1.0);
    } else {
        fragColor = color;
    }
}