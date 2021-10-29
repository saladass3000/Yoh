Shader "DemoNiloToon/ProcedualColorUnlitSkybox" {
	Properties {
		_ColorTop ("_ColorTop", Vector) = (1,1,1,1)
		_ColorMiddle ("_ColorMiddle", Vector) = (0,0,0,1)
		_FogHeight ("_FogHeight", Range(0, 1)) = 0.1
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