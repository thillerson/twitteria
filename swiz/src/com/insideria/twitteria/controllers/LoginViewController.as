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
		
		[Mediate(event="login", properties="username,password")]
		public function login(username:String, password:String):void {
			model.username = username;
			model.password = password;
			
			var e:Event = new Event(LOGIN_COMPLETE);
			Swiz.dispatchEvent(e);
		}
		
	}
}