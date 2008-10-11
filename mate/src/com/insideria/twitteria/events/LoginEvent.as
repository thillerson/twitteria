package com.insideria.twitteria.events {
	
	import flash.events.Event;

	public class LoginEvent extends Event {
		
		public static const LOG_IN:String = "login";
		
		public var username:String;
		public var password:String;
		
		public function LoginEvent(username:String, password:String) {
			super(LOG_IN, true, false);
			this.username = username;
			this.password = password;
		}
		
	}
}