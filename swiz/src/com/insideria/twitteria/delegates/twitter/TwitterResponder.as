package com.insideria.twitteria.delegates.twitter {
	
	public interface TwitterResponder {
		
		function get username():String;
		function get password():String;
		function friendsTimelineResult(tweets:Array):void;
		function setStatusResult():void;
		
	}
}