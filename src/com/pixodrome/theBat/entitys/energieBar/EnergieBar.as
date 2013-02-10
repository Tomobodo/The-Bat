package com.pixodrome.theBat.entitys.energieBar {
	import com.pixodrome.pdk.component.display.gui.Gui;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.entity.Entity;
	/**
	 * @author Thomas
	 */
	public class EnergieBar extends Entity{

		public function EnergieBar() {
			super();
			
			add(new Transform2D());
			
			var gui : Gui = new Gui();
			gui.view = new EnergieBarView();
			add(gui);
		}

	}
}
