package com.pixodrome.theBat {
	import com.pixodrome.pdk.component.Transform2D;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.pdk.Scene;
	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene{
		
		function GameScene() : void {
			
			super();
			
			var test : Entity = new Entity().add(new Transform2D());
			
			add(test);			
				
		}
		
	}
}
