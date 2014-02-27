package com.ukuleledog.games.states;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.core.Layer;
import com.ukuleledog.games.core.State;
import com.ukuleledog.games.elements.icon.PhoneIcon;
import com.ukuleledog.games.elements.layers.IconLayer;
import com.ukuleledog.games.elements.icon.BackpackIcon;
import com.ukuleledog.games.elements.icon.TalkIcon;
import com.ukuleledog.games.elements.icon.Icon;
import com.ukuleledog.games.elements.layers.RoomLayer;
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
	private var backpackIcon:BackpackIcon;
	private var talkIcon:TalkIcon;
	private var phoneIcon:PhoneIcon;
	
	// people
	private var avatar:Avatar;
	private var fatGuy:FatGuy;
	
	// ui
	private var backpackUI:BackpackUI;
	
	// current game
	private var currentObject:InventoryObject;
	private var currentObjectIcon:Icon;
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
		currentObjectIcon = new Icon();
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
		
		iconsActivate();
	}
	
	private function initUI()
	{
		uiLayer = new Layer();
		addChild( uiLayer );
		
		backpackUI = new BackpackUI();
		backpackUI.x = 162;
		backpackUI.y = 34;
	}
	
	private function iconsActivate()
	{
		backpackIcon.addEventListener( MouseEvent.CLICK, displayInventory );
		iconLayer.show();
	}
	
	private function iconsDeactivate()
	{
		backpackIcon.removeEventListener( MouseEvent.CLICK, displayInventory );
		iconLayer.hide();
	}
	
	private function displayInventory( e:MouseEvent )
	{
		iconsDeactivate();
		
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
	
	private function setSelectedObject()
	{
		currentObject = Inventory.selectedObject;
		
		switch( Type.getClass( currentObject ) )
		{
			case PhoneObject:
				iconLayer.add( phoneIcon );
		}
	}
	
}