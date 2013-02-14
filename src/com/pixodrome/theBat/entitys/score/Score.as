package com.pixodrome.theBat.entitys.score {
	import com.pixodrome.pdk.component.display.gui.Gui;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.entity.Entity;
	/**
	 * @author Thomas
	 */
	public class Score extends Entity {
		public function Score() {
			super();
			
			tag = "Score";
			
			var transform : Transform2D = new Transform2D();
			transform.x = 700;
			transform.y = 40;
			add(transform);
			
			var gui : Gui = new Gui();
			gui.view = new ScoreView();
			add(gui);
			
			add(new ScoreControl());
		}

	}
}
