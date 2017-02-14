# UnityProjects(Japanese Style Room GI)

日本家屋のサンプルです。
建物（の暗い箇所）を表現するために、Standard lighting modelのShaderとして
2つめのUVに対してAO Mapを割り当てることができるようにしてます。  
Unity 5.5.1f1でリビルドしました。  

ダウンロード後、「JapaneseStyleRoomGI」をUnityで開くようにしてください。  

<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI.jpg"/>  
<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI2.jpg"/>  
<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI3.jpg"/>  

## 必要な処理

Image Effectとして、「Post Processing」を使用しています。
https://github.com/Unity-Technologies/PostProcessing より、Release Beta 4をダウンロードして
JapaneseStyleRoomGIプロジェクトにインポートするようにしてください。

## Custom/DiffuseSpecularAOMap

2つめのUVを使ってAO Mapを割り当てるShaderです。
Standard lighting modelのShaderを使用しているため、LightProbeなどの影響を受け止めているはず。
実体は、Assets/Shader内に置いてます。

## メモ

* 3D形状データはShade3Dで作成し、fbxに出力してUnityに持ってきました。UV展開はUVUtilプラグインを使用、AOMapの作成はAOUtilプラグインを使用してます。
* 木材などのテクスチャは、iPhoneで撮影したものをBitmap2Materialで加工して使ってます。
* 木はSpeedTreeで作成してます。

形状データについては完全オリジナルですので、自由に使っていただいて構いません。  

## 更新履歴

[2017/02/15]
* Unity 5.5.1で動作するようにプロジェクトを一新。
* 木、社、灯篭、井戸のオブジェクトを追加
* 建物はstaticにし、AOマップは使用しない普通のStandard Shaderを使うようにした。
* 建物以外はすべてdynamicに変更。
* AOを扱うマテリアルは、Standard Shaderを派生したAOマップ対応Shaderに入れ替え。
* 露出調整などのPostEffectは、「PostProcessing」を使用するように変更。

[2016/05/08]
* publishに失敗していた問題を修正
* Unity 5.3.4p1でビルド
