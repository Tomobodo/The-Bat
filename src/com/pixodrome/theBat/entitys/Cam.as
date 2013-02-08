package com.pixodrome.theBat.entitys {
	import com.pixodrome.pdk.component.display.d2.Camera;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.entity.Entity;
	/**
	 * @author Thomas
	 */
	public class Cam extends Entity{
		
		function Cam(){
			super();
			
			add(new Transform2D());
			add(new Camera());
		}
		
	}
}
