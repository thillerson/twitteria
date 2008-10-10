package com.insideria.twitteria.model {
	
	import mx.collections.ArrayCollection;
	
	public class TwitteRIAModel {
		
		// view states
		public static const LOGIN_VIEW:int	= 0;
		public static const MAIN_VIEW:int	= 1;

		[Bindable]
		public var mainViewIndex:int		= LOGIN_VIEW;
		
		public var username:String;
		public var password:String;
	
		[Bindable] public var currentTweets:ArrayCollection;

	}
}