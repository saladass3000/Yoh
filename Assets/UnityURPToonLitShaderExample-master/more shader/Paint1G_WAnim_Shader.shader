Shader "Paint1G_WAnim_Shader" {
	Properties {
		Vector1_2EE2CB80 ("Speed", Float) = 0.1
		Vector2_C848BFFB ("Center", Vector) = (0.25,0.25,0,0)
		Color_A2AAE5B5 ("PaintColor_01", Vector) = (0.1137255,0.627451,0.8352941,0)
		Color_23C9B10D ("PaintColor_02", Vector) = (0.04561231,0.144953,0.3867925,0)
		[NoScaleOffset] Texture2D_C69EB180 ("Label", 2D) = "white" {}
		[NoScaleOffset] _SampleTexture2D_3ec74a86d8c1488d8ce597f8156fb7ab_Texture_1 ("Texture2D", 2D) = "white" {}
		[NoScaleOffset] _SampleTexture2D_e60950bba990008885c246fd6823bc78_Texture_1 ("Texture2D", 2D) = "white" {}
		[NoScaleOffset] _SampleTexture2D_aef34a082e463b8992e5f66de0345979_Texture_1 ("Texture2D", 2D) = "bump" {}
		[NoScaleOffset] _SampleTexture2D_ae061cbc8301d686a4cbfc6826975296_Texture_1 ("Texture2D", 2D) = "white" {}
		[HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
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
	Fallback "Hidden/Shader Graph/FallbackError"
	//CustomEditor "ShaderGraph.PBRMasterGUI"
}