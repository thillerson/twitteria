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
		
		[Bindable]
		public var currentTweets:ArrayCollection; // <TwitterStatus>

		public function TwitteRIAModel(access:Private) {
			if (access == null) {
				throw new CairngormError(CairngormMessageCodes.SINGLETON_EXCEPTION, "XCLModelLocator");
			}
		}
		
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