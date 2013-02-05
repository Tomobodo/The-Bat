package com.pixodrome.theBat {
	import com.pixodrome.pdk.Application;

	public class TheBat extends Application {
		
		override protected function onCreate():void{
			gotoScene(new GameScene());
		}
		
	}
}
