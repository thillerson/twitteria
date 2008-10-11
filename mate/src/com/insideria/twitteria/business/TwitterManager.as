package com.insideria.twitteria.business {
	
	import mx.collections.ArrayCollection;
	
	public class TwitterManager {
		
		[Bindable]
		public var currentTweets:ArrayCollection;
		
		public function setCurrentTweets(tweets:Array):void {
			currentTweets = new ArrayCollection(tweets);
		}
		

	}
}