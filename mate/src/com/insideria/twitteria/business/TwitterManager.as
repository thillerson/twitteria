package com.insideria.twitteria.business {
	
	import mx.collections.ArrayCollection;
	
	public class TwitterManager {
		
		private var _username:String;
		private var _password:String;
		
		[Bindable]
		public var currentTweets:ArrayCollection;
		
		public function get username():String {
			return _username;
		}
		
		public function get password():String {
			return _password;
		}
		
		public function setCredentials(username:String, password:String):void {
			_username = username;
			_password = password;
		}
		
		public function setCurrentTweets(tweets:Array):void {
			currentTweets = new ArrayCollection(tweets);
		}
		

	}
}