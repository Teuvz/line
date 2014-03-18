package com.ukuleledog.games.line.elements.ui.phone.icon;

import com.ukuleledog.games.core.TextManager;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiIcon;
import flash.events.Event;

/**
 * ...
 * @author 
 */
class IconGallery extends PhoneUiIcon
{

	public function new() 
	{
		super();
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		graphics.beginFill( 0x000000 );
		graphics.drawRoundRect( 0, 0, 50, 50, 5 );
		graphics.endFill();
		
		setText( TextManager.getInstance().getText('gallery', TextManager.TEXT_OBJECT) );
	}
	
}