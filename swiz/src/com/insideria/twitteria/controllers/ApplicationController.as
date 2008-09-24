package com.insideria.twitteria.controllers {
	
	import flash.events.Event;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	public class ApplicationController extends AbstractController {
		
		// view states
		public static const LOGIN_VIEW:int	= 0;
		public static const MAIN_VIEW:int	= 1;

		[Bindable]
		public var mainViewIndex:int		= LOGIN_VIEW;
		
		public function ApplicationController() {
			Swiz.addEventListener("loginComplete", showMainView);
		}
				
		public function showMainView(e:Event):void {
			mainViewIndex = MAIN_VIEW;
		}
		
	}
}