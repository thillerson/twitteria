package com.insideria.twitteria.model {
	
	import mx.collections.ArrayCollection;
	
	public class TwitteRIAModel {
		
		public var username:String;
		public var password:String;
	
		[Bindable] public var currentTweets:ArrayCollection

	}
}