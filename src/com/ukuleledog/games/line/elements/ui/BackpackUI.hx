package com.ukuleledog.games.line.elements.ui;
import com.ukuleledog.games.line.elements.icon.BookIcon;
import com.ukuleledog.games.line.elements.icon.ComicBookIcon;
import com.ukuleledog.games.line.elements.icon.EarphoneIcon;
import com.ukuleledog.games.line.elements.icon.PhoneIcon;
import com.ukuleledog.games.line.elements.objects.BookObject;
import com.ukuleledog.games.line.elements.objects.ComicBookObject;
import com.ukuleledog.games.line.elements.objects.EarphoneObject;
import com.ukuleledog.games.line.elements.objects.InventoryObject;
import com.ukuleledog.games.line.elements.objects.PhoneObject;
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
	private var comicbookIcon:ComicBookIcon;
	
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
		//removeEventListener( Event.ADDED_TO_STAGE, init );
		//setUiPosition();
		displayIcons();
	}
	
	private function createIcons()
	{
		phoneIcon = new PhoneIcon();		
		earphoneIcon = new EarphoneIcon();
		bookIcon = new BookIcon();
		comicbookIcon = new ComicBookIcon();
	}
	
	private function hideIcons()
	{
		if ( Inventory.SMARTPHONE )
		{
			phoneIcon.removeEventListener( MouseEvent.CLICK, phoneHandle );
			removeChild( phoneIcon );
		}
		
		if ( Inventory.EARPHONES )
		{
			earphoneIcon.removeEventListener( MouseEvent.CLICK, earphoneHandle );
			removeChild( earphoneIcon );
		}
		
		if ( Inventory.BOOK )
		{
			bookIcon.removeEventListener( MouseEvent.CLICK, bookHandle );
			removeChild( bookIcon );
		}
		
		if ( Inventory.COMICBOOK )
		{
			comicbookIcon.removeEventListener( MouseEvent.CLICK, comicbookHandle );
			removeChild( comicbookIcon );
		}

	}
	
	private function displayIcons()
	{
		
		displayedIcons = 0;
		
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
		
		if ( Inventory.COMICBOOK )
		{
			comicbookIcon.x = (ICON_FIRST_X * (displayedIcons+1)) + (100 * displayedIcons);
			comicbookIcon.y = ICON_FIRST_Y;
			comicbookIcon.addEventListener( MouseEvent.CLICK, comicbookHandle );
			addChild( comicbookIcon );
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
	
	private function comicbookHandle( e:Event )
	{
		hideIcons();
		Inventory.selectedObject = new ComicBookObject();
		dispatchEvent( new Event( Event.COMPLETE ) );
	}
	
}