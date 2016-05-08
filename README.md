# UnityProjects(Japanese Style Room GI)

日本家屋のサンプルです。
建物（の暗い箇所）を表現するために、Standard ShaderのBuildin Shadersを改造して、
2つめのUVに対してAO Mapを割り当てることができるようにしてます。  
Unity 5.3.4f1でリビルドしました。  

ダウンロード後、「JapaneseStyleRoomGI」をUnityで開くようにしてください。  

<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI.jpg"/>  
<img src="https://github.com/ft-lab/UnityProjects/blob/master/wiki_images/Jpanese_style_room_GI2.jpg"/>  

VR時の速度低下を防ぐため、Image Effectsは未使用です。

## Custom/Standard_AO_UV2

2つめのUVを使ってAO Mapを割り当てるShaderです。Standard Shaderを拡張しています。  
実体は、Assets/Shader内に置いてます。   
Main MapsはStandard Shaderと同じ指定、AO Map(UV1)でAO Mapを表現しています(Secondary MapsはUIから消してます)。  

## メモ

* 追加したShader(Standard_AO_UV2)についてはUnityのBuildin Shaderを書き換えて利用しました。  
* 3D形状データはShade 3Dで作成し、fbxに出力してUnityに持ってきました。UV展開はUVUtilプラグインを使用、AOMapの作成はAOUtilプラグインを使用してます。
* 木材などのテクスチャは、iPhoneで撮影したものをBitmap2Materialで加工して使ってます。

形状データについては完全オリジナルですので、自由に使っていただいて構いません。  

## 更新履歴

[2016/05/08]
* publishに失敗していた問題を修正
* Unity 5.3.4p1でビルド
