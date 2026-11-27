#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

const float BLUE_REDUCTION = 0.6;

const float GREEN_REDUCTION = 0.1;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    float luma = dot(pixColor.rgb, vec3(0.299, 0.587, 0.114));

    vec3 gray = vec3(
        luma,
        luma * (1.0 - GREEN_REDUCTION * BLUE_REDUCTION),
        luma * (1.0 - BLUE_REDUCTION)
    );

    fragColor = vec4(gray, pixColor.a);
}
