package com.ukuleledog.games.elements.ui;
import com.ukuleledog.games.elements.icon.PhoneIcon;
import com.ukuleledog.games.elements.objects.PhoneObject;
import com.ukuleledog.games.line.Inventory;
import flash.events.Event;
import flash.events.MouseEvent;

/**
 * ...
 * @author Matt
 */
class BackpackUI extends UI
{

	private var ICON_FIRST_X:UInt = 10;
	private var ICON_FIRST_Y:UInt = 10;
	
	private var displayedIcons:UInt = 0;
	private var phoneIcon:PhoneIcon;
	
	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
		
		graphics.beginFill( 0x0000FF );
		graphics.drawRoundRect( 0, 0, 700, 700, 5 );
		graphics.endFill();
		
		addCloseButton();
		
		createIcons();
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		displayIcons();
	}
	
	private function createIcons()
	{
		phoneIcon = new PhoneIcon();
		phoneIcon.buttonMode = true;
		phoneIcon.y = 10;
	}
	
	private function hideIcons()
	{
		
	}
	
	private function displayIcons()
	{
		if ( Inventory.SMARTPHONE )
		{
			displayedIcons++;
			phoneIcon.x = ICON_FIRST_X * displayedIcons;
			phoneIcon.y = ICON_FIRST_Y;
			phoneIcon.addEventListener( MouseEvent.CLICK, phoneHandle );
			addChild( phoneIcon );
		}
	}
	
	private function phoneHandle( e:Event )
	{
		hideIcons();
		Inventory.selectedObject = new PhoneObject();
		dispatchEvent( new Event( Event.COMPLETE ) );
	}
	
}