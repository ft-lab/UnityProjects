Shader "Custom/Bumped Specular (AO)" {
	Properties {
		_Color ("Main Color", Color) = (1,1,1,1)
		_SpecColor ("Specular Color", Color) = (0.5, 0.5, 0.5, 1)
		_Shininess ("Shininess", Range (0.03, 1)) = 0.078125

		_MainTex ("Base (RGB)", 2D) = "white" {}
		_BumpMap ("Normalmap", 2D) = "bump" {}

		_AOTex ("Ambient Occlusion (RGB)", 2D) = "white" {}
		_AOValue ("AO", Range(0, 1)) = 1.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf BlinnPhong

		sampler2D _MainTex;
		sampler2D _BumpMap;
		sampler2D _AOTex;
		float4 _Color;
		float _AOValue;
		half _Shininess;

		struct Input {
			float2 uv_MainTex;		// uv1で_MainTexを使用.
			float2 uv_BumpMap;		// uv1で_BumpMapを使用.
			float2 uv2_AOTex;		// uv2で_AOTexを使用.
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c   = tex2D (_MainTex, IN.uv_MainTex);
			half4 aoC = tex2D (_AOTex, IN.uv2_AOTex);
			float aoVal = lerp(1.0, aoC.r, _AOValue);

			o.Albedo   = c.rgb * _Color.rgb * aoVal;
			o.Gloss    = c.a;
			o.Alpha    = c.a;
			o.Specular = _Shininess;
			o.Normal   = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
		}
		ENDCG
	}
	FallBack "Specular"
}
