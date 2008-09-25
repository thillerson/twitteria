package com.insideria.twitteria.controllers {
	
	import mx.events.DynamicEvent;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	public class LoginViewController extends AbstractController {
		
		public static const LOG_IN:String = "login";
		public static const LOGIN_COMPLETE:String = "loginComplete";
		
		[Mediate(event="login", properties="username,password")]
		public function login(username:String, password:String):void {
			loginComplete(username, password);
		}
		
		private function loginComplete(username:String, password:String):void {
			var de:DynamicEvent = new DynamicEvent(LOGIN_COMPLETE);
			de.username = username;
			de.password = password;
			Swiz.dispatchEvent(de);
		}
		
	}
}