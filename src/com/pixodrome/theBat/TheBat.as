package com.pixodrome.theBat {
	import flash.events.MouseEvent;
	import starling.core.Starling;

	import com.pixodrome.pdk.core.Application;
	import com.pixodrome.theBat.scene.GameScene;

	[SWF(backgroundColor="#000000", frameRate="61", width="800", height="480")]
	public class TheBat extends Application {
		
		override protected function onCreate():void{
			Starling.current.showStats = true;			
			gotoScene(new GameScene());
		}
	
	}
}
