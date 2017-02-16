# UnityProjects(Japanese Style Room GI)

日本家屋のサンプルです。
Unity 5.5.1f1でリビルドしました。  
建物はstaticでlightmapベイク(AOもベイク)、地面もｓｔａｔｉｃ、  
それ以外はすべてdynamicで、机や椅子などの小物類・野外の井戸や社はStandard lighting modelのShaderとして
2つめのUVに対してAO Mapを割り当てるようにしました。  

ダウンロード後、「JapaneseStyleRoomGI」をUnityで開くようにしてください。  

<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI.jpg"/>  
<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI2.jpg"/>  
<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI3.jpg"/>  
<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI4.jpg"/>  

## 目的

VRでリアルなシーンがどこまでいけるか、パフォーマンスを維持できるかの検証用。

## 必要な処理

Image Effectとして、「PostProcessing」を使用しています。  
https://github.com/Unity-Technologies/PostProcessing より、Release Beta 4をダウンロードして
JapaneseStyleRoomGIプロジェクトにインポートするようにしてください。

## Custom/DiffuseSpecularAOMap

2つめのUVを使ってAO Mapを割り当てるShaderです。  
Standard lighting modelのShaderを使用しているため、LightProbeなどの影響を受け止めているはず。  
実体は、Assets/Shader内に置いてます。

## PostProcessingでやってること
PostProcessingファイルは、Assets/JapaneseStyleRoom_Post-Processing Profileに置いてます。

* 「Ambient Occlusion」をOnにして、SSAO加えてます。LowだとVRでもパフォーマンス確保できてそうです。
* 「Eye Adaptation」をOnにして、自動露出させてます。室内と室外を行ったり来たりも違和感なくできそうです。
* 「Color Grading」をOnにして、全体の色バランスを調整。TonemapperをNeutralにしただけ。

## VRで使う場合、新しいCameraを使用する場合のメモ

* CameraのHDRをOnにする。
* Rendering　Pathを「Deferred」にする。
* Add Componentで「Post Processing Behaviour」を追加して、「Assets/JapaneseStyleRoom_Post-Processing Profile」を割りあてる。

## メモ

* 3D形状データはShade3Dで作成し、fbxに出力してUnityに持ってきました。UV展開はUVUtilプラグインを使用、AOMapの作成はAOUtilプラグインを使用してます。
* 木材などのテクスチャは、iPhoneで撮影したものをBitmap2Materialで加工して使ってます。
* 木はSpeedTreeで作成してます。

形状データについては完全オリジナルですので、自由に使っていただいて構いません。  

## 更新履歴

[2017/02/16]
* 建物の"Generate Lightmap UVs"をOn (念のため。なくてもlightmapには反映されている模様)
* PostProcessingのAmbient Occlusion をOn。Lowにすると、VRでもそんなに重くない模様
* groundのテクスチャの繰り返し数を増やした
* 建物の廊下の机に壺と盆栽鉢を置いた
* 野外のReflection Probeを配置

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
