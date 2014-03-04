package src.com.ukuleledog.games.elements.ui;

import com.ukuleledog.games.elements.ui.UI;
import flash.events.Event;

/**
 * ...
 * @author 
 */
class BookUI extends UI
{

	public function new() 
	{
		super();
		
		graphics.beginFill( 0xFFFFFF );
		graphics.drawRect( 0, 0, 300, 500 );
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