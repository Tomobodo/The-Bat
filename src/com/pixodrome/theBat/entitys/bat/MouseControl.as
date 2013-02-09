package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.input.Inputs;
	import com.pixodrome.pdk.component.Component;

	/**
	 * @author Thomas
	 */
	public class MouseControl extends Component {
		
		override public function onCreate() : void {
			
			Inputs.mouseClicked.add(onMouseClicked);
			
		}

		private function onMouseClicked() : void {
			emit("Fly", null);
		}
		
	}
}
