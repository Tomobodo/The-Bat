package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.constraint.XDistanceConstraint;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.theBat.components.Flying;
	/**
	 * @author Thomas
	 */
	public class BatControl extends Component{
		
		override public function onMessage(message : String, params : Object) : void {
			
			var camera : Entity = Scene.current.getTag("Camera");
			
			switch(message){
				case Energie.MESSAGE_DEAD : 
					entity.remove(YControl);
					entity.remove(Flying);
					entity.remove(Eat);
					break;
			}
		}
		
	}
}
