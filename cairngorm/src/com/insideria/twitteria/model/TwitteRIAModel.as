package com.insideria.twitteria.model {
	
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;
	
	import mx.collections.ArrayCollection;

	public class TwitteRIAModel {
		
		private static var instance:TwitteRIAModel;
		
		/**
		 * These constants and the variable mainView
		 * let the main view which view should be shown.
		 */		
		public static const LOGIN_VIEW:int	= 0;
		public static const MAIN_VIEW:int	= 1;
		
		[Bindable]
		public var mainViewIndex:int		= LOGIN_VIEW;
		
		public var username:String;
		public var password:String;
		
		// In this case, although not a best-practice, we store the 
		// domain data and view state data in the same model.
		[Bindable]
		public var currentTweets:ArrayCollection; // <TwitterStatus>

		// Since we can't have private constructors in AS3, we hack together a solution
		public function TwitteRIAModel(access:Private) {
			if (access == null) {
				throw new CairngormError(CairngormMessageCodes.SINGLETON_EXCEPTION, "XCLModelLocator");
			}
		}
		
		// The model needs to be accessed through a static accessor method
		// following the singleton pattern
		public static function getInstance():TwitteRIAModel {
			if (instance == null) {
				instance = new TwitteRIAModel(new Private());
			}
			return instance;
		}
	}
}

/**
 * "Inner" class which restricts contructor access to Private
 */
class Private {}