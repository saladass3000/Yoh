Shader "Custom/Confetti" {
	Properties {
		[HideInInspector] _AlphaCutoff ("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector] _EmissionColor ("Emission Color", Vector) = (1,1,1,1)
		_Color ("Color", Vector) = (0.5,0.5,0.5,0.5019608)
		[HideInInspector] _TransmissionShadow ("Transmission Shadow", Range(0, 1)) = 0.5
		[HideInInspector] _TransStrength ("Trans Strength", Range(0, 50)) = 1
		[HideInInspector] _TransNormal ("Trans Normal Distortion", Range(0, 1)) = 0.5
		[HideInInspector] _TransScattering ("Trans Scattering", Range(1, 50)) = 2
		[HideInInspector] _TransDirect ("Trans Direct", Range(0, 1)) = 0.9
		[HideInInspector] _TransAmbient ("Trans Ambient", Range(0, 1)) = 0.1
		[HideInInspector] _TransShadow ("Trans Shadow", Range(0, 1)) = 0.5
		[HideInInspector] _TessPhongStrength ("Tess Phong Strength", Range(0, 1)) = 0.5
		[HideInInspector] _TessValue ("Tess Max Tessellation", Range(1, 32)) = 16
		[HideInInspector] _TessMin ("Tess Min Distance", Float) = 10
		[HideInInspector] _TessMax ("Tess Max Distance", Float) = 25
		[HideInInspector] _TessEdgeLength ("Tess Edge length", Range(2, 50)) = 16
		[HideInInspector] _TessMaxDisp ("Tess Max Displacement", Float) = 25
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
	Fallback "Hidden/InternalErrorShader"
	//CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
}