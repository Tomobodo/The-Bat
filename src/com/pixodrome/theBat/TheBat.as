package com.pixodrome.theBat {
	import starling.core.Starling;

	import com.pixodrome.pdk.core.Application;
	import com.pixodrome.theBat.scenes.game.GameScene;

	import flash.events.MouseEvent;

	[SWF(backgroundColor="#000000", frameRate="61", width="800", height="480")]
	public class TheBat extends Application {
		
		override protected function onCreate():void{
			Starling.current.showStats = true;			
			gotoScene(new GameScene());
		}
	
	}
}
