package com.ukuleledog.games.line.elements.ui.phone.screen;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiIcon;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiScreen;
import flash.events.Event;

/**
 * ...
 * @author 
 */
class ScreenMusic extends PhoneUiScreen
{

	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	private function init( e:Event )
	{
		//removeEventListener( Event.ADDED_TO_STAGE, init );
		
		graphics.beginFill( 0x00FFFF );
		graphics.drawRect( 0, 0, 380, 600 );
		graphics.endFill();
		
	}
	
}