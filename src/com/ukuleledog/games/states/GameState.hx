package com.ukuleledog.games.states;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.core.Layer;
import com.ukuleledog.games.core.State;
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
import com.ukuleledog.games.elements.ui.UI;
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
	
	// people
	private var avatar:Avatar;
	private var fatGuy:FatGuy;
	
	// ui
	private var backpackUI:BackpackUI;
	
	// current game
	private var currentObject:InventoryObject;
	private var currentPerson:Person;
	private var currentIcon:Icon;
	private var currentUI:UI;
	private var mouseDrag:Bool = false;
	
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
		
		/*if ( Inventory.selectedObject != null )
			removeChild( stopButton );*/
	}
	
	private function stopSelectedObject( e:Event = null )
	{
			
		stopButton.removeEventListener( MouseEvent.CLICK, stopSelectedObject );
		
		if ( e != null )
			removeChild( stopButton );
		
		iconLayer.remove( currentIcon );
			
		Inventory.selectedObject = null;
		currentObject = null;
		
	}
	
	private function setSelectedObject()
	{
		currentObject = Inventory.selectedObject;
			
		currentIcon = currentObject.getIcon();
		iconLayer.add( currentIcon );
		//currentIcon.addEventListener( MouseEvent.CLICK, displayObjectUI );
		currentIcon.addEventListener( MouseEvent.MOUSE_DOWN, moveObjectStart );
		
		addChild( stopButton );
		stopButton.addEventListener( MouseEvent.CLICK, stopSelectedObject );
	}
	
	private function displayInventory( e:MouseEvent )
	{
		iconsDeactivate();
			
		if ( currentObject != null )
			stopSelectedObject(e);
		
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
	
	private function displayObjectUI( e:MouseEvent = null )
	{
		//currentIcon.removeEventListener( MouseEvent.CLICK, displayObjectUI );
		iconsDeactivate();
		
		currentUI = currentObject.getUI();
		
		uiLayer.add( currentUI );
		currentUI.closeButton.addEventListener( MouseEvent.CLICK, hideObjectUI );
	}
	
	private function hideObjectUI( e:MouseEvent )
	{
		uiLayer.remove( currentUI );
		iconsActivate();
		currentUI.closeButton.removeEventListener( MouseEvent.CLICK, hideObjectUI );
	}
	
	private function moveObjectListener( e:MouseEvent )
	{
		removeEventListener( MouseEvent.MOUSE_MOVE, moveObjectListener );
		mouseDrag = true;
	}
	
	private function moveObjectStart( e:MouseEvent )
	{
		mouseDrag = false;
		
		addEventListener( MouseEvent.MOUSE_MOVE, moveObjectListener );
		currentIcon.removeEventListener( MouseEvent.MOUSE_DOWN, moveObjectStart );
		currentIcon.addEventListener( MouseEvent.MOUSE_UP, moveObjectStop );
		
		currentIcon.startDrag();
		removeChild( stopButton );
	}
	
	private function moveObjectStop( e:MouseEvent )
	{
		
		currentIcon.stopDrag();
		currentIcon.addEventListener( MouseEvent.MOUSE_DOWN, moveObjectStart );
		currentIcon.removeEventListener( MouseEvent.MOUSE_UP, moveObjectStop );
		
		if ( mouseDrag )
		{
			
			if ( currentIcon.hitTestObject( currentPerson ) )
			{
				if ( currentPerson.interactWithObject( currentObject ) )
				{
					trace( 'give ' + Type.getClass(currentObject) + ' to ' + Type.getClass( currentPerson ) );
					stopSelectedObject();
				}
				else
				{
					trace( Type.getClass(currentPerson) + " doesn't want " + Type.getClass(currentObject) );
					Actuate.tween( currentIcon, 0.5, { x:465, y:660 } ).ease( Bounce.easeOut );
					addChild( stopButton );
				}
			}
			else
			{
				Actuate.tween( currentIcon, 0.5, { x:465, y:660 } ).ease( Bounce.easeOut );
				addChild( stopButton );
			}
		} else {
			displayObjectUI();
		}
	}
		
}