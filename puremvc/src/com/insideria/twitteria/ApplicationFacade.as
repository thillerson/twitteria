package com.insideria.twitteria {
	
    import com.insideria.twitteria.controller.*;
    import com.insideria.twitteria.model.*;
    
    import org.puremvc.as3.interfaces.*;
    import org.puremvc.as3.patterns.facade.*;
    import org.puremvc.as3.patterns.proxy.*;

	public class ApplicationFacade extends Facade {
		
        public static const STARTUP:String 			= "startup";
		public static const VIEW_TIMELINE:String	= "viewTimeline";
        public static const TIMELINE_LOADED:String	= "timelineLoaded";
        public static const LOG_IN:String			= "login";
        public static const LOAD_TIMELINE:String	= "loadTimeline";
        public static const SET_STATUS:String		= "setStatus";
        public static const STATUS_SET:String		= "statusSet";
		
        public static function getInstance():ApplicationFacade {
            if (instance == null) instance = new ApplicationFacade();
            return instance as ApplicationFacade;
        }

        override protected function initializeController():void {
            super.initializeController(); 
            registerCommand(STARTUP,		StartupCommand);
            registerCommand(LOG_IN,			LogInCommand);
            registerCommand(SET_STATUS,		SetStatusCommand);
            registerCommand(LOAD_TIMELINE,	LoadTimelineCommand);
        }
		
		public function startup(app:twitteria_puremvc):void {
			sendNotification(STARTUP, app);
		}
		
	}

}
