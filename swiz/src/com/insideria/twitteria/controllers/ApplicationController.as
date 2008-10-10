package com.insideria.twitteria.controllers {
	
	import com.insideria.twitteria.model.TwitteRIAModel;
	
	import flash.events.Event;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	public class ApplicationController extends AbstractController {
		
		[Autowire(bean="model")]
		public var model:TwitteRIAModel;
		
		public function ApplicationController() {
			Swiz.addEventListener("loginComplete", showMainView);
		}
				
		public function showMainView(e:Event):void {
			model.mainViewIndex = TwitteRIAModel.MAIN_VIEW;
		}
		
	}
}