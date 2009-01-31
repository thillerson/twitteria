package com.insideria.twitteria {
	
    import com.insideria.twitteria.controller.*;
    
    import org.puremvc.as3.interfaces.*;
    import org.puremvc.as3.patterns.facade.*;

	/**
	 * A Facade is the class that deals with any access to the deeper
	 * parts of the framework
	 */	
	public class ApplicationFacade extends Facade {
		
		// Here is a list of constants that represent notifications
		// we'll be using elsewhere in the application
        public static const STARTUP:String 			= "startup";
        public static const LOG_IN:String			= "login";
		public static const VIEW_TIMELINE:String	= "viewTimeline";
        public static const LOAD_TIMELINE:String	= "loadTimeline";
        public static const TIMELINE_LOADED:String	= "timelineLoaded";
        public static const SET_STATUS:String		= "setStatus";
        public static const STATUS_SET:String		= "statusSet";
		
        public static function getInstance():ApplicationFacade {
            if (instance == null) instance = new ApplicationFacade();
            return instance as ApplicationFacade;
        }

		// this is a framework method
        override protected function initializeController():void {
            super.initializeController();
            // here we register notification constants to commands 
            registerCommand(STARTUP,		StartupCommand);
            registerCommand(LOG_IN,			LogInCommand);
            registerCommand(SET_STATUS,		SetStatusCommand);
            registerCommand(LOAD_TIMELINE,	LoadTimelineCommand);
        }
		
		/**
		 * here we pass in the application instance so we can pass the reference
		 * around with the startup note
		 */		
		public function startup(app:twitteria_puremvc):void {
			sendNotification(STARTUP, app);
		}
		
	}

}
