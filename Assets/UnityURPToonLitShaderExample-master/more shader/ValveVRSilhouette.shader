Shader "Valve/VR/Silhouette" {
	Properties {
		g_vOutlineColor ("Outline Color", Vector) = (0.5,0.5,0.5,1)
		g_flOutlineWidth ("Outline width", Range(0.001, 0.03)) = 0.005
		g_flCornerAdjust ("Corner Adjustment", Range(0, 2)) = 0.5
	}
	
	//DummyShaderTextExporter - One Sided
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard fullforwardshadows
#pragma target 3.0
		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};
		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
		}
		ENDCG
	}
}