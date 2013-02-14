package com.pixodrome.pdk.entity {
	import flash.trace.Trace;
	import flash.utils.Dictionary;

	/**
	 * @author Thomas
	 */
	public class EntityList {
		
		private var mHead : Entity;
		private var mQueue : Entity;
		private var mTagDictionary : Dictionary;
		private var mNbEntity : uint;

		function EntityList() : void {
			mHead = null;
			mQueue = null;

			mTagDictionary = new Dictionary();
		}

		private function addToEnd(entity : Entity) : void {
			mQueue.next = entity;
			entity.previous = mQueue;
			entity.next = null;
			mQueue = entity;
		}

		private function addAfter(previous : Entity, entity : Entity) : void {
			if (previous == mQueue)
				mQueue = entity;

			entity.previous = previous;
			entity.next = previous.next;

			if (previous.next)
				previous.next.previous = entity;
			previous.next = entity;
		}

		public function getHead() : Entity {
			return mHead;
		}

		public function getQueue() : Entity {
			return mQueue;
		}

		public function add(entity : Entity) : void {
			++mNbEntity;
			
			var tag : String = entity.tag;
			var previousTagged : Entity = mTagDictionary[tag];

			if (!mHead) {
				mHead = mQueue = entity;
				entity.next = entity.previous = null;
				if (entity.tag)
					mTagDictionary[tag] = entity;
			} else {
				if (!entity.tag)
					addToEnd(entity);
				else {
					if (previousTagged)
						addAfter(previousTagged, entity);
					else
						addToEnd(entity);

					mTagDictionary[tag] = entity;
				}
			}
		}

		public function showTag() : void {
			for (var a : Entity = mHead; a; a = a.next)
				trace(a);
		}
		
		public function getNbEntity():uint{
			return mNbEntity;
		}
		
		public function getTag(tag:String):Entity{
			return mTagDictionary[tag];
		}

		public function remove(entity : Entity) : void {
			--mNbEntity;
			
			var tag : String = entity.tag;

			if (tag)
				if (entity == mTagDictionary[tag] && entity.previous && entity.previous.tag == tag)
					mTagDictionary[tag] = entity.previous;
				else
					delete mTagDictionary[tag];

			if (entity == mHead)
				mHead = mHead.next;
			if (mQueue == entity)
				mQueue = mQueue.previous;
			if (entity.previous)
				entity.previous.next = entity.next;
			if (entity.next)
				entity.next.previous = entity.previous;
		}

		public function removeAll() : void {
			while (mHead) {
				var entity : Entity = mHead;
				mHead = mHead.next;
				entity.previous = null;
				entity.next = null;
			}
			mQueue = null;
		}
	}
}
