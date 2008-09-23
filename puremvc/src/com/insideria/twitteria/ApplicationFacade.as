package com.insideria.twitteria {
	
    import com.insideria.twitteria.controller.*;
    import com.insideria.twitteria.model.*;
    
    import org.puremvc.as3.interfaces.*;
    import org.puremvc.as3.patterns.facade.*;
    import org.puremvc.as3.patterns.proxy.*;

	public class ApplicationFacade extends Facade {
		
        public static const STARTUP:String 			= "startup";
        
		// command
        public static const LOG_IN:String			= "LoginCommand";
		
		// view
		public static const VIEW_TIMELINE:String	= "viewTimeline";
		
        public static function getInstance():ApplicationFacade {
            if (instance == null) instance = new ApplicationFacade();
            return instance as ApplicationFacade;
        }

        override protected function initializeController():void {
            super.initializeController(); 
            registerCommand(STARTUP, StartupCommand);
        }
		
		/**
         * Retrieve the config proxy 
         */
//		public static function getConfigProxy():ConfigProxy {
//			return ConfigProxy(ApplicationFacade.getInstance().retrieveProxy(ConfigProxy.NAME));
//		}
//    
		public function startup(app:twitteria_puremvc):void {
			sendNotification(STARTUP, app);
		}
		
	}

}
