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
			
			loginView.addEventListener(LoginView.LOGIN, login);
        }

        override public function listNotificationInterests():Array {
            return [];
        }

        protected function get loginView():LoginView {
            return viewComponent as LoginView;
        }
		
		private function login(event:Event):void {
			sendNotification(ApplicationFacade.LOG_IN);
			sendNotification(ApplicationFacade.VIEW_TIMELINE);
		}
		
    }
}
