package com.insideria.twitteria.view {
	
	import com.insideria.twitteria.ApplicationFacade;
	import com.insideria.twitteria.view.components.LoginView;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
    public class LoginViewMediator extends Mediator implements IMediator {

        public static const NAME:String = "LoginViewMediator";
        
        public function LoginViewMediator(viewComponent:LoginView) {
            super(NAME, viewComponent);
			
			view.addEventListener(LoginView.LOGIN, login);
        }

        protected function get view():LoginView {
            return viewComponent as LoginView;
        }
		
		/**
		 * When the view dispatches the login event, send the LOG_IN note
		 */		
		private function login(event:Event):void {
			var credentials:Object = {username:view.usernameText.text, password:view.passwordText.text};
			sendNotification(ApplicationFacade.LOG_IN, credentials);
		}
		
    }
}
