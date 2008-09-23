package com.insideria.twitteria.model {
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class UserProxy extends Proxy implements IProxy {
		
		public static const NAME:String = "UserProxy";
		
		private var _username:String;
		private var _password:String;
		
		public function UserProxy(data:Object = null) {
			super(NAME, data)
		}
		
		public function set username(s:String):void {
			_username = s;
		}

		public function get username():String {
			return _username;
		}

		public function set password(s:String):void {
			_password = s;
		}

		public function get password():String {
			return _password;
		}

	}
}