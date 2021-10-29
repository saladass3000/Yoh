Shader "Universal Render Pipeline/NiloCat Extension/BillBoard LensFlare" {
	Properties {
		_BaseColor ("BaseColor (can use alpha to do fadeout)", Vector) = (1,1,1,1)
		_BaseColorRGBIntensity ("BaseColorRGBIntensity", Float) = 1
		_BaseMap ("BaseMap (regular LDR texture)", 2D) = "white" {}
		_RemoveTextureArtifact ("RemoveTextureArtifact", Range(0, 0.5)) = 0
		[Header(PreMultiply Alpha. Turn it ON only if your texture has correct alpha)] [Toggle] _UsePreMultiplyAlpha ("UsePreMultiplyAlpha (recommend _BaseMap's alpha = 'From Gray Scale')", Float) = 0
		[Header(Depth Occlusion)] _LightSourceViewSpaceRadius ("LightSourceViewSpaceRadius", Range(0, 1)) = 0.05
		_DepthOcclusionTestZBias ("DepthOcclusionTestZBias", Range(-1, 1)) = -0.001
		[Header(If camera too close Auto fadeout)] _StartFadeinDistanceWorldUnit ("StartFadeinDistanceWorldUnit", Float) = 0.05
		_EndFadeinDistanceWorldUnit ("EndFadeinDistanceWorldUnit", Float) = 0.5
		[Header(Optional Flicker animation)] [Toggle] _ShouldDoFlicker ("ShouldDoFlicker", Float) = 1
		_FlickerAnimSpeed ("FlickerAnimSpeed", Float) = 5
		_FlickResultIntensityLowestPoint ("FlickResultIntensityLowestPoint", Range(0, 1)) = 0.5
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