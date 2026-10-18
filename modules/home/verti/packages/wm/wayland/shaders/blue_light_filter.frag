#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    vec3 warmTint = vec3(1.0, 0.85, 0.55);
    vec3 tintedColor = pixColor.rgb * warmTint;
    fragColor = vec4(tintedColor, pixColor.a);
}