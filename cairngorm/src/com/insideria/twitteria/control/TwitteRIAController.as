package com.franklincovey.xcl.control {
	
	import com.adobe.cairngorm.control.FrontController;
	import com.insideria.twitteria.command.*;
	import com.insideria.twitteria.event.*;
    
	public class TwitteRIAController extends FrontController {
		
		public function TwitteRIAController() {
			initialize();
		}
		
		private function initialize():void {
//			addCommand(CreateCompanyNodesForSelectedTreeItemEvent.CreateCompanyNodesForSelectedTreeItem_Event, CreateCompanyNodesForSelectedTreeItemCommand);
		}
	}
}