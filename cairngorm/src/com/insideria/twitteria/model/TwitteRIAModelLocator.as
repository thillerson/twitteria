package com.franklincovey.xcl.model {
	
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;

	public class TwitteRIAModelLocator {
		
		private static var instance:TwitteRIAModelLocator;
		
		public function TwitteRIAModelLocator(access:Private) {
			if (access == null) {
				throw new CairngormError(CairngormMessageCodes.SINGLETON_EXCEPTION, "XCLModelLocator");
			}
		}
		
		public static function getInstance():TwitteRIAModelLocator {
			if (instance == null) {
				instance = new TwitteRIAModelLocator(new Private());
			}
			return instance;
		}
		
}

/**
 * "Inner" class which restricts contructor access to Private
 */
class Private {}

