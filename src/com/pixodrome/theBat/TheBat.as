package com.pixodrome.theBat {
	import com.pixodrome.pdk.application.Application;
	import com.pixodrome.theBat.scene.GameScene;

	[SWF(backgroundColor="#222233", frameRate="61", width="800", height="480")]
	public class TheBat extends Application {
		
		override protected function onCreate():void{
			gotoScene(new GameScene());
		}
		
	}
}
