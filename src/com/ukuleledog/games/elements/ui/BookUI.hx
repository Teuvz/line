package src.com.ukuleledog.games.elements.ui;

import com.ukuleledog.games.elements.ui.UI;

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
		
		addCloseButton();
		
	}
	
}