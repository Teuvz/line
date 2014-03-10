package src.com.ukuleledog.games.elements.ui;

import com.ukuleledog.games.elements.ui.UI;
import flash.events.Event;

/**
 * ...
 * @author 
 */
class PhoneUI extends UI
{

	public function new() 
	{
		super();
		
		graphics.beginFill( 0xFFFFFF );
		graphics.drawRoundRect( 0, 0, 400, 700, 20 );
		graphics.endFill();
		
		graphics.beginFill( 0x000000 );
		graphics.drawRoundRect( 10, 10, 380, 680, 20 );
		graphics.endFill();
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		setUiPosition();
		addCloseButton();
	}
	
}