Shader "Custom/Back Screen" {
	Properties {
		_MainTex ("Base", 2D) = "" {}
		_StripeTex ("Stripe", 2D) = "" {}
		_BaseLevel ("Base Level", Float) = 1
		_StripeLevel ("Stripe Level", Float) = 1
		_FlickerLevel ("Flicker Level", Float) = 1
		_FlickerFreq ("Flicker Freq", Float) = 1
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