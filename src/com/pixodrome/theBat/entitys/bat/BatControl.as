package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.theBat.scenes.game.GameScene;
	import com.pixodrome.pdk.core.Scene;
	import com.greensock.TweenLite;
	import com.pixodrome.pdk.display.StarlingRender;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.theBat.components.Flying;
	/**
	 * @author Thomas
	 */
	public class BatControl extends Component {
		private var gameOverSended : Boolean;
		
		override public function onMessage(message : String, params : Object) : void {
			
			switch(message){
				case Energie.MESSAGE_DEAD : 
					entity.remove(YControl);
					entity.remove(Flying);
					entity.remove(Eat);
					entity.remove(MouseControl);
					gameOver();
					break;
			}
		}

		private function gameOver() : void {
			var gameScene : GameScene = Scene.current as GameScene;
			if(!gameOverSended){
				gameOverSended = true;
				gameScene.gameOver();
			}
		}
		
		
	}
}
