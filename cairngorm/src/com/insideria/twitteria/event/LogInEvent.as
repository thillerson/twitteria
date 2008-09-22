package com.insideria.twitteria.event {
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LogInEvent extends CairngormEvent {
		
		public static const LogIn_Event:String = "<LogInEvent>";
		
		public var username:String;
		public var password:String;
		
		public function LogInEvent(username:String, password:String)  {
			super(LogIn_Event);
			this.username = username;
			this.password = password;
		}
	}
}