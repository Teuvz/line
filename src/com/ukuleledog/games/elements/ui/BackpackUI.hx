package com.ukuleledog.games.elements.ui;
import com.ukuleledog.games.elements.icon.BookIcon;
import com.ukuleledog.games.elements.icon.EarphoneIcon;
import com.ukuleledog.games.elements.icon.PhoneIcon;
import com.ukuleledog.games.elements.objects.BookObject;
import com.ukuleledog.games.elements.objects.EarphoneObject;
import com.ukuleledog.games.elements.objects.InventoryObject;
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
	private var earphoneIcon:EarphoneIcon;
	private var bookIcon:BookIcon;
	
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
		earphoneIcon = new EarphoneIcon();
		bookIcon = new BookIcon();
	}
	
	private function hideIcons()
	{
		
	}
	
	private function displayIcons()
	{
		if ( Inventory.SMARTPHONE )
		{
			phoneIcon.x = ICON_FIRST_X;
			phoneIcon.y = ICON_FIRST_Y;
			phoneIcon.addEventListener( MouseEvent.CLICK, phoneHandle );
			addChild( phoneIcon );
			displayedIcons++;
		}
		
		if ( Inventory.EARPHONES )
		{
			earphoneIcon.x = (ICON_FIRST_X * (displayedIcons+1)) + (100 * displayedIcons);
			earphoneIcon.y = ICON_FIRST_Y;
			earphoneIcon.addEventListener( MouseEvent.CLICK, earphoneHandle );
			addChild( earphoneIcon );
			displayedIcons++;
		}
		
		if ( Inventory.BOOK )
		{
			bookIcon.x = (ICON_FIRST_X * (displayedIcons+1)) + (100 * displayedIcons);
			bookIcon.y = ICON_FIRST_Y;
			bookIcon.addEventListener( MouseEvent.CLICK, bookHandle );
			addChild( bookIcon );
			displayedIcons++;
		}
		
	}
	
	private function phoneHandle( e:Event )
	{
		hideIcons();
		Inventory.selectedObject = new PhoneObject();
		dispatchEvent( new Event( Event.COMPLETE ) );
	}
	
	private function earphoneHandle( e:Event )
	{
		hideIcons();
		Inventory.selectedObject = new EarphoneObject();
		dispatchEvent( new Event( Event.COMPLETE ) );
	}
	
	private function bookHandle( e:Event )
	{
		hideIcons();
		Inventory.selectedObject = new BookObject();
		dispatchEvent( new Event( Event.COMPLETE ) );
	}
	
}