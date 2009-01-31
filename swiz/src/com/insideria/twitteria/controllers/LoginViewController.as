package com.insideria.twitteria.controllers {
	
	import com.insideria.twitteria.model.TwitteRIAModel;
	
	import flash.events.Event;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	public class LoginViewController extends AbstractController {
		
		public static const LOG_IN:String = "login";
		public static const LOGIN_COMPLETE:String = "loginComplete";
		
		[Autowire(bean="model")]
		public var model:TwitteRIAModel;
		
		/**
		 * The Mediate metadata tells Swiz to automatically listen for 
		 * events with this string. The properties are expected to be 
		 * on the event, and need to match the arity and order of the method
		 */		
		[Mediate(event="login", properties="username,password")]
		public function login(username:String, password:String):void {
			model.username = username;
			model.password = password;
			
			var e:Event = new Event(LOGIN_COMPLETE);
			Swiz.dispatchEvent(e);
		}
		
	}
}