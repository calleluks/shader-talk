Shader "Custom/Circles" {
	Properties {
		_PrimaryColor ("Primary Color", Color) = (1, 0, 0, 1)
		_SecondaryColor ("Secondary Color", Color) = (0, 0, 1, 1)
		_BackgroundColor ("Background Color", Color) = (0.2, 0, 0, 1)
		_Steps("Steps", int) = 5
		_Speed("Speed", float) = 1.0
		_Radius("Radius", float) = 1.0
	}

    SubShader {
        Pass {
            CGPROGRAM
            #include "UnityCG.cginc"

            #pragma vertex vert_img
            #pragma fragment frag
            #pragma target 3.0

            float4 _PrimaryColor;
            float4 _SecondaryColor;
            float4 _BackgroundColor;
            int _Steps;
            float _Speed;
            float _Radius;

            float4 color(float2 uv, float2 center, float radius,
                    float4 color) {
                float distance = saturate(length(uv - center) / (radius * _Radius));
                float step = ceil(distance * _Steps) / _Steps;
                return lerp(color, _BackgroundColor, step);
            }

            float4 frag(v2f_img i): COLOR {
                float2 center;
                float radius;
                float4 baseColor;
                float4 topColor;
                float t = _Time[0] * _Speed;

                center = (0.5 + 0.5 * cos(t) * cos(4 * t),
                          0.5 + 0.5 * sin(t) * sin(4 * t));
                radius = 0.5 + 0.10 * sin(2 * t) * -sin(7 * t);
                baseColor = color(i.uv, center, radius, _PrimaryColor);

                center = (0.5 + 0.5 * -cos(t) * cos(5 * t),
                          0.5 + 0.5 * sin(t) * sin(3 * t));
                radius = 0.5 + 0.10 * cos(2 * t) * -sin(5 * t);
                topColor = color(i.uv, center, radius, _SecondaryColor);
                return (baseColor + topColor) * 0.5;
            }
            ENDCG
        }
    }
}
