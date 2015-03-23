Shader "Ready/Minimal" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 vert(float4 v: POSITION): POSITION {
                return mul(UNITY_MATRIX_MVP, v);
            }

            fixed4 frag(): COLOR {
                return fixed4(1.0, 0.0, 0.0, 1.0);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
