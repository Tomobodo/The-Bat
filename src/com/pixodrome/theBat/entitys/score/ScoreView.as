package com.pixodrome.theBat.entitys.score {
	import starling.text.TextField;
	import com.pixodrome.pdk.entity.Entity;

	import starling.display.DisplayObject;
	import com.pixodrome.pdk.display.IRenderable;
	/**
	 * @author Thomas
	 */
	public class ScoreView implements IRenderable{
		
		private var mTextfield : TextField;
		private var mScore : ScoreControl;
		
		function ScoreView(){
			mTextfield = new TextField(200, 50, "Score : ", "oogieBoogie");
			mTextfield.fontSize = 24;
			mTextfield.hAlign = "right";
			mTextfield.color = 0xffffff;
			mTextfield.pivotX = mTextfield.width / 2;
			mTextfield.pivotY = mTextfield.height / 2;
		}

		public function setEntity(entity : Entity) : void {
			mScore = entity.getComponent(ScoreControl);
		}

		public function onMessage(message : String, params : Object) : void {
		}

		public function onUpdate(deltaTime : Number) : void {
			mTextfield.text = "Score : " + mScore.score;
		}

		public function getView() : DisplayObject {
			return mTextfield;
		}
	}
}
