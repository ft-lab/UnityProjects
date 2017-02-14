Shader "Custom/DiffuseSpecularAOMap" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
		_NormalIntensity ("Normal", Range(0.01,1)) = 1.0
		_NormalMap ("Normal Map", 2D) = "bump" {}
		_AOIntensity ("AO", Range(0,1)) = 0.8
		_AOMap ("AO Map(UV2)", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _NormalMap;
		sampler2D _AOMap;

		struct Input {
			float2 uv_MainTex;
			float2 uv_NormalMap;
			float2 uv2_AOMap;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;
		half _NormalIntensity;
		half _AOIntensity;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 aoVal = lerp(float4(1, 1, 1, 1), tex2D(_AOMap, IN.uv2_AOMap) , _AOIntensity);
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color * aoVal;
			o.Albedo = c.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = lerp(0.0, _Glossiness, aoVal.r);	// AOの影響で暗くなる場合、光沢も抑える.

			float3 normal  = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
			float3 normal2 = normalize(float3(normal.x, normal.y, normal.z / _NormalIntensity));
			o.Normal = normal2;

			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
