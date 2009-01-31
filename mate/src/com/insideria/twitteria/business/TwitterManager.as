package com.insideria.twitteria.business {
	
	import mx.collections.ArrayCollection;
	
	/**
	 * A Manager is something like a model,
	 * and this one holds onto anything that comes back from 
	 * Twitter for us
	 */	
	public class TwitterManager {
		
		[Bindable]
		public var currentTweets:ArrayCollection;
		
		public function setCurrentTweets(tweets:Array):void {
			currentTweets = new ArrayCollection(tweets);
		}
		

	}
}