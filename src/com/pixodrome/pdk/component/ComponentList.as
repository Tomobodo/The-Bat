package com.pixodrome.pdk.component {
	import com.pixodrome.pdk.entity.Entity;

	import avmplus.getQualifiedClassName;

	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;

	/**
	 * @author Thomas
	 */
	public class ComponentList {
		private var mHead : Component;
		private var mQueue : Component;
		private var mComponentMap : Dictionary;

		function ComponentList() {
			mHead = null;
			mQueue = null;

			mComponentMap = new Dictionary();
		}

		private function addToEnd(comp : Component) : void {
			mQueue.next = comp;
			comp.previous = mQueue;
			comp.next = null;
			mQueue = comp;
		}

		public function getHead() : Component {
			return mHead;
		}

		public function getQueue() : Component {
			return mQueue;
		}

		public function add(comp : Component) : void {
			var componentClassString : String = getQualifiedClassName(comp);
			var componentClass : Class = getDefinitionByName(componentClassString) as Class;

			if (!mHead) {
				mHead = mQueue = comp;
				comp.next = comp.previous = null;
			} else
				addToEnd(comp);

			mComponentMap[componentClass] = comp;
		}

		public function removeByClass(compClass : Class) : void {
			if (mComponentMap[compClass]) {
				var comp : Component = mComponentMap[compClass];
				delete mComponentMap[compClass];

				if (comp == mHead)
					mHead = mHead.next;
				if (comp == mQueue)
					mQueue = mQueue.previous;
				if (comp.previous)
					comp.previous.next = comp.next;
				if (comp.next)
					comp.next.previous = comp.previous;
			}
		}

		public function remove(comp : Component) : void {
			if (comp == mHead)
				mHead = mHead.next;
			if (comp == mQueue)
				mQueue = mQueue.previous;
			if (comp.previous)
				comp.previous.next = comp.next;
			if (comp.next)
				comp.next.previous = comp.previous;
		}

		public function getComponent(compClass : Class) : Component {
			return mComponentMap[compClass];
		}
	}
}
