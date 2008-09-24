package com.insideria.twitteria.controllers {
	
	import com.insideria.twitteria.delegates.TwitterDelegate;
	import com.insideria.twitteria.model.TwitteRIAModel;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	public class LoginViewController extends AbstractController {
		
		public static const LOG_IN:String = "login";
		
		[Autowire(bean="twitterDelegate")]
		public var twitterDelegate:TwitterDelegate;
		
		[Mediate(event="login", properties="username,password")]
		public function login(username:String, password:String) : void {
			twitterDelegate.authenticate(username, password);
			loginComplete();
		}
		
		private function loginComplete() : void {
			Swiz.dispatch("loginComplete");
		}
		
	}
}