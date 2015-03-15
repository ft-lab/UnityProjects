Shader "Custom/Diffuse (AO)" {
	Properties {
		_Color ("Main Color", Color) = (1,1,1,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_AOTex ("Ambient Occlusion (RGB)", 2D) = "white" {}
		_AOValue ("AO", Range(0, 1)) = 1.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		sampler2D _AOTex;
		float4 _Color;
		float _AOValue;

		struct Input {
			float2 uv_MainTex;		// uv1で_MainTexを使用.
			float2 uv2_AOTex;		// uv2で_AOTexを使用.
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c   = tex2D (_MainTex, IN.uv_MainTex);
			half4 aoC = tex2D (_AOTex, IN.uv2_AOTex);
			float aoVal = lerp(1.0, aoC.r, _AOValue);

			o.Albedo = c.rgb * _Color.rgb * aoVal;
			o.Alpha  = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
