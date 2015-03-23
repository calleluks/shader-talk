Shader "Ready/Surface" {
    Properties {
        _Color("Color", Color) = (1.0, 0.0, 0.0, 1.0)
    }

    SubShader {
        CGPROGRAM

        float4 _Color;

        #pragma surface surf Lambert

        struct Input {
            float4 color: COLOR;
        };

        void surf(Input i, inout SurfaceOutput o) {
            o.Albedo = _Color;
        }
        ENDCG
    }
    Fallback "Diffuse"
}
