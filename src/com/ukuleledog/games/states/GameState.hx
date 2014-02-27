package com.ukuleledog.games.states;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.core.Layer;
import com.ukuleledog.games.core.State;
import com.ukuleledog.games.elements.icon.BookIcon;
import com.ukuleledog.games.elements.icon.EarphoneIcon;
import com.ukuleledog.games.elements.icon.PhoneIcon;
import com.ukuleledog.games.elements.layers.IconLayer;
import com.ukuleledog.games.elements.icon.BackpackIcon;
import com.ukuleledog.games.elements.icon.TalkIcon;
import com.ukuleledog.games.elements.icon.Icon;
import com.ukuleledog.games.elements.layers.RoomLayer;
import com.ukuleledog.games.elements.objects.BookObject;
import com.ukuleledog.games.elements.objects.EarphoneObject;
import com.ukuleledog.games.elements.objects.InventoryObject;
import com.ukuleledog.games.elements.objects.PhoneObject;
import com.ukuleledog.games.elements.people.Avatar;
import com.ukuleledog.games.elements.people.FatGuy;
import com.ukuleledog.games.elements.people.Person;
import com.ukuleledog.games.elements.ui.BackpackUI;
import com.ukuleledog.games.line.Inventory;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.ui.Mouse;
import haxe.Timer;
import motion.Actuate;
import motion.easing.Bounce;
import src.com.ukuleledog.games.elements.ui.BookUI;

/**
 * ...
 * @author Matt
 */
class GameState extends State
{

	private var roomLayer:Layer;
	private var iconLayer:IconLayer;
	private var uiLayer:Layer;
	
	// icons
	private var stopButton:Sprite;
	private var backpackIcon:BackpackIcon;
	private var talkIcon:TalkIcon;
	private var phoneIcon:PhoneIcon;
	private var earphoneIcon:EarphoneIcon;
	private var bookIcon:BookIcon;
	
	// people
	private var avatar:Avatar;
	private var fatGuy:FatGuy;
	
	// ui
	private var backpackUI:BackpackUI;
	private var bookUI:BookUI;
	
	// current game
	private var currentObject:InventoryObject;
	private var currentPerson:Person;
	
	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	// INIT
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
			
		initRoom();		
		initIcons();
		initUI();
		
		currentPerson = fatGuy;
	}
	
	private function initRoom()
	{
		roomLayer = new RoomLayer();
		addChild( roomLayer );
		
		fatGuy = new FatGuy();
		roomLayer.add( fatGuy );
		
		avatar = new Avatar();
		roomLayer.add( avatar );
	}
	
	private function initIcons()
	{
		iconLayer = new IconLayer();
		addChild( iconLayer );
		
		backpackIcon = new BackpackIcon();
		iconLayer.add( backpackIcon );
		
		talkIcon = new TalkIcon();
		iconLayer.add( talkIcon );
		
		phoneIcon = new PhoneIcon();
		earphoneIcon = new EarphoneIcon();
		bookIcon = new BookIcon();
		
		iconsActivate();
		
		stopButton = new Sprite();
		stopButton.graphics.beginFill( 0xFF0000 );
		stopButton.graphics.drawRect( 0, 0, 20, 20 );
		stopButton.graphics.endFill();
		stopButton.x = 555;
		stopButton.y = 650;
		stopButton.buttonMode = true;
	}
	
	private function initUI()
	{
		uiLayer = new Layer();
		addChild( uiLayer );
		
		backpackUI = new BackpackUI();
		backpackUI.x = 162;
		backpackUI.y = 34;
		
		bookUI = new BookUI();
		bookUI.x = 362;
		bookUI.y = 134;
	}
	
	// ICONS
	
	private function iconsActivate()
	{
		backpackIcon.addEventListener( MouseEvent.CLICK, displayInventory );
		iconLayer.show();
		
		if ( Inventory.selectedObject != null )
			addChild( stopButton );
	}
	
	private function iconsDeactivate()
	{
		backpackIcon.removeEventListener( MouseEvent.CLICK, displayInventory );
		iconLayer.hide();
		
		if ( Inventory.selectedObject != null )
			removeChild( stopButton );
	}
	
	private function stopSelectedObject( e:Event = null )
	{
			
		stopButton.removeEventListener( MouseEvent.CLICK, stopSelectedObject );
		
		if ( e != null )
			removeChild( stopButton );
		
		switch( Type.getClass( currentObject ) )
		{
			case PhoneObject:
				iconLayer.remove( phoneIcon );
			case EarphoneObject:
				iconLayer.remove( earphoneIcon );
			case BookObject:
				iconLayer.remove( bookIcon );
		}
		
		Inventory.selectedObject = null;
		currentObject = null;
		
	}
	
	private function setSelectedObject()
	{
		currentObject = Inventory.selectedObject;
		
		switch( Type.getClass( currentObject ) )
		{
			case PhoneObject:
				iconLayer.add( phoneIcon );
			case EarphoneObject:
				iconLayer.add( earphoneIcon );
			case BookObject:
				iconLayer.add( bookIcon );
				bookIcon.addEventListener( MouseEvent.CLICK, displayBook );
		}
		
		addChild( stopButton );
		stopButton.addEventListener( MouseEvent.CLICK, stopSelectedObject );
	}
	
	private function displayInventory( e:MouseEvent )
	{
		iconsDeactivate();
			
		if ( currentObject != null )
			stopSelectedObject();
		
		backpackUI.addEventListener( Event.COMPLETE, closeInventory );
		uiLayer.add( backpackUI );
		backpackUI.closeButton.addEventListener( MouseEvent.CLICK, closeInventory );
	}
	
	private function closeInventory( e:Event )
	{
		backpackUI.closeButton.removeEventListener( MouseEvent.CLICK, closeInventory );
		uiLayer.remove( backpackUI );
		iconsActivate();
		
		if ( Inventory.selectedObject != null )
			setSelectedObject();
	}
	
	private function displayBook( e:MouseEvent )
	{
		bookIcon.removeEventListener( MouseEvent.CLICK, displayBook );
		iconsDeactivate();
		
		uiLayer.add( bookUI );
		bookUI.closeButton.addEventListener( MouseEvent.CLICK, hideBook );
	}
	
	private function hideBook( e:MouseEvent )
	{
		bookIcon.addEventListener( MouseEvent.CLICK, displayBook );
		uiLayer.remove( bookUI );
		iconsActivate();
		bookUI.closeButton.removeEventListener( MouseEvent.CLICK, hideBook );
	}
	
	
		
}