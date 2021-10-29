Shader "Custom/Light Beam" {
	Properties {
		_Color ("Base Color", Vector) = (1,1,1,1)
		_MainTex ("Gradient Texture", 2D) = "" {}
		_NoiseTex1 ("Noise Texture 1", 2D) = "" {}
		_NoiseTex2 ("Noise Texture 2", 2D) = "" {}
		_NoiseScale ("Noise Scale", Vector) = (1,1,1,1)
		_NoiseSpeed ("Noise Speed", Vector) = (0.1,0.1,0.1,0.1)
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
	Fallback "Diffuse"
}