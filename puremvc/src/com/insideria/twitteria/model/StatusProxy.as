package com.insideria.twitteria.model {
	
	import com.insideria.twitteria.ApplicationFacade;
	import com.insideria.twitteria.controller.business.TwitterDelegate;
	
	import mx.rpc.IResponder;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class StatusProxy extends Proxy implements IProxy, IResponder {
		
		public static const NAME:String = "StatusProxy";
		
		public function StatusProxy(data:Object = null) {
			super(NAME, data)
		}
		
		public function setStatus(statusText:String):void {
			var delegate:TwitterDelegate = new TwitterDelegate(this);
			delegate.setStatus(statusText);
		}
		
		public function result(result:Object):void {
			sendNotification(ApplicationFacade.LOAD_TIMELINE);
		}
		
		public function fault(fault:Object):void {
			
		}

	}
}