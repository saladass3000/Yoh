Shader "Universal Render Pipeline/NiloToon/NiloToon_Character Sticker(Multiply)" {
	Properties {
		_BaseMap ("_BaseMap (Albedo) (Default White)", 2D) = "white" {}
		[HDR] _BaseColor ("_BaseColor (Default White)", Vector) = (1,1,1,1)
		[Toggle(OVERRIDE_ALPHA)] _OverrideAlpha ("_OverrideAlpha (Default Off)", Float) = 0
		_OverrideAlphaMap ("_OverrideAlphaMap (Default White)", 2D) = "white" {}
		[Header(Polygon Face Culling)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("_Cull (Default Off)", Float) = 0
		[Header(ZOffset)] _ZOffset ("_ZOffset (Default 0)", Range(-1, 1)) = -0.1
		[HideInInspector] _CharacterBoundCenterPosWS ("_CharacterBoundCenterPosWS", Vector) = (0,0,0,1)
		[HideInInspector] _DitherFadeoutAmount ("_DitherFadeoutAmount", Range(0, 1)) = 0
		[HideInInspector] _PerspectiveRemovalAmount ("_PerspectiveRemovalAmount", Range(0, 1)) = 0
		[HideInInspector] _PerspectiveRemovalRadius ("_PerspectiveRemovalRadius", Float) = 1
		[HideInInspector] _HeadBonePositionWS ("_HeadBonePositionWS", Vector) = (0,0,0,1)
		[HideInInspector] _PerspectiveRemovalStartHeight ("_PerspectiveRemovalStartHeight", Float) = 0
		[HideInInspector] _PerspectiveRemovalEndHeight ("_PerspectiveRemovalEndHeight", Float) = 1
		[HideInInspector] _MainTex ("BaseMap", 2D) = "white" {}
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