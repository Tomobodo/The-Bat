package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.theBat.components.Flying;
	/**
	 * @author Thomas
	 */
	public class BatControl extends Component{
		
		override public function onMessage(message : String, params : Object) : void {
			switch(message){
				case Energie.MESSAGE_DEAD : 
					entity.remove(YControl);
					entity.remove(Flying);
			}
		}
		
	}
}
