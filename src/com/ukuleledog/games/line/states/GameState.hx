package com.ukuleledog.games.line.states;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.core.Layer;
import com.ukuleledog.games.core.State;
import com.ukuleledog.games.line.elements.layers.IconLayer;
import com.ukuleledog.games.line.elements.icon.BackpackIcon;
import com.ukuleledog.games.line.elements.icon.TalkIcon;
import com.ukuleledog.games.line.elements.icon.Icon;
import com.ukuleledog.games.line.elements.layers.RoomLayer;
import com.ukuleledog.games.line.elements.objects.BookObject;
import com.ukuleledog.games.line.elements.objects.EarphoneObject;
import com.ukuleledog.games.line.elements.objects.InventoryObject;
import com.ukuleledog.games.line.elements.objects.PhoneObject;
import com.ukuleledog.games.line.elements.people.Avatar;
import com.ukuleledog.games.line.elements.people.FatGuy;
import com.ukuleledog.games.line.elements.people.HipsterDude;
import com.ukuleledog.games.line.elements.people.OldLady;
import com.ukuleledog.games.line.elements.people.Person;
import com.ukuleledog.games.line.elements.ui.BackpackUI;
import com.ukuleledog.games.line.elements.ui.DialogBubble;
import com.ukuleledog.games.line.elements.ui.UI;
import com.ukuleledog.games.line.events.PhoneUiEvent;
import com.ukuleledog.games.line.Inventory;
import com.ukuleledog.games.core.TextManager;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.ui.Mouse;
import flash.Vector.Vector;
import haxe.Timer;
import motion.Actuate;
import motion.easing.Bounce;
import src.com.ukuleledog.games.line.elements.ui.BookUI;

/**
 * ...
 * @author Matt
 */
class GameState extends State
{

	static inline var DIALOG_DURATION = 3000;
	
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
	private var oldLady:OldLady;
	private var hipsterDude:HipsterDude;
	
	// ui
	private var backpackUI:BackpackUI;
	private var dialogBubbles:Vector<DialogBubble>;
	
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
		
		graphics.beginFill( 0x000000 );
		graphics.drawRect( 0, 0, 1024, 768 );
		graphics.endFill();
		
		initRoom();		
		initIcons();
		initUI();
		
		currentPerson = fatGuy;
		currentPerson.addEventListener( Event.COMPLETE, changePerson );
	}
	
	private function initRoom()
	{
		roomLayer = new RoomLayer();
		addChild( roomLayer );

		hipsterDude = new HipsterDude();
		roomLayer.add( hipsterDude );
		
		oldLady = new OldLady();
		roomLayer.add( oldLady );
		
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
		backpackUI.y = 70;
		
		dialogBubbles = new Vector<DialogBubble>();
	}
	
	// ICONS
	
	private function iconsActivate()
	{
		backpackIcon.addEventListener( MouseEvent.CLICK, displayInventory );
		talkIcon.addEventListener( MouseEvent.CLICK, talkStart );
		iconLayer.show();
		
		if ( Inventory.selectedObject != null )
			addChild( stopButton );
	}
	
	private function iconsDeactivate()
	{
		backpackIcon.removeEventListener( MouseEvent.CLICK, displayInventory );
		iconLayer.hide();
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
		currentIcon.addEventListener( MouseEvent.MOUSE_DOWN, moveObjectStart );
		
		addChild( stopButton );
		stopButton.addEventListener( MouseEvent.CLICK, stopSelectedObject );
	}
	
	private function displayInventory( e:MouseEvent )
	{
		iconsDeactivate();
		talkStop();
			
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
		iconsDeactivate();
		
		currentUI = currentObject.getUI();
		
		if ( Type.getClass( currentObject ) == PhoneObject )
		{
			currentUI.addEventListener( PhoneUiEvent.CALL, phoneCallHandle );
			currentUI.addEventListener( PhoneUiEvent.MUSIC, phoneMusicHandle );
		}
		
		uiLayer.add( currentUI );
		currentUI.closeButton.addEventListener( MouseEvent.CLICK, hideObjectUI );
	}
	
	private function hideObjectUI( e:MouseEvent = null )
	{
		if ( Type.getClass( currentObject ) == PhoneObject )
		{
			currentUI.removeEventListener( PhoneUiEvent.CALL, phoneCallHandle );
			currentUI.removeEventListener( PhoneUiEvent.MUSIC, phoneMusicHandle );
		}
		
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
					stopSelectedObject();
				}
				else
				{
					
					avatar.showDialog( TextManager.getInstance().getText( "unwantedObject"+Math.floor(Math.random()*4), TextManager.TEXT_OTHER) );
					
					//iconLayer.hide();
					
					Timer.delay( function() {
						avatar.hideDialog();
						//iconLayer.show();
						addChild( stopButton );
					}, 3000 );
					
					Actuate.tween( currentIcon, 0.5, { x:465, y:660 } ).ease( Bounce.easeOut );
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
	
	private function talkStart( e:MouseEvent )
	{
		talkIcon.removeEventListener( MouseEvent.CLICK, talkStart );
		talkIcon.addEventListener( MouseEvent.CLICK, talkStop );
		
		talkIcon.alpha = 0.5;
				
		var dialogs:Vector<String> = currentPerson.getDialogOptions();
		var i:Int = 0;
		var dialogWidth:Float = 0;
		
		while ( i < dialogs.length )
		{
			var bubble:DialogBubble = new DialogBubble( dialogs[i] );
			dialogBubbles.push( bubble );
			addChild( bubble );
			bubble.y = (talkIcon.y + (talkIcon.height - bubble.height) / 2 ) - 50;
			
			if ( i == 0 )
				bubble.x = talkIcon.x;
			else
				bubble.x = dialogBubbles[i - 1].x + dialogBubbles[i - 1].width;
			
			dialogWidth += bubble.width;
			
			bubble.addEventListener( MouseEvent.CLICK, talkAction );
			bubble.name = Std.string(i);
			
			i++;
		}
		
		var dialogPadding:Float = dialogWidth / 3;
		
		while ( i-- > 0 )
		{
			dialogBubbles[i].x -= dialogPadding;
		}
		
	}
	
	private function talkStop( e:MouseEvent = null )
	{
		talkIcon.removeEventListener( MouseEvent.CLICK, talkStop );
		talkIcon.addEventListener( MouseEvent.CLICK, talkStart );
		
		talkIcon.alpha = 1;
		
		var i:Int = dialogBubbles.length;
		
		while ( --i >= 0 )
		{
			var tempBubble:DialogBubble = dialogBubbles[i];
			var newY:Float = talkIcon.y + (talkIcon.height - tempBubble.height) / 2;
			var newX:Float = talkIcon.x + (talkIcon.width - tempBubble.width) / 2;
			Actuate.tween( tempBubble, 0.5, { y:newY, x:newX, alpha:0 } ).ease(Bounce.easeOut).onComplete(function() {
				removeChild(tempBubble);
			});
			tempBubble.removeEventListener( MouseEvent.CLICK, talkAction );
		}
		
		dialogBubbles = new Vector<DialogBubble>();
		
	}
	
	private function talkAction( e:MouseEvent )
	{
		
		iconLayer.hide();
		
		if ( currentObject != null )
			removeChild( stopButton );
		
		var id:Int = Std.parseInt(e.currentTarget.name);
		
		talkStop();		
		avatar.showDialog( currentPerson.getDialogText( id ) );
		
		Timer.delay( function() {
			avatar.hideDialog();
			currentPerson.showDialogAnswer( id );
			
			Timer.delay(function() {
				currentPerson.hideDialog();
				iconLayer.show();
				
				if ( currentObject != null )
					addChild( stopButton );
				
			}, DIALOG_DURATION);
			
		}, DIALOG_DURATION );
		
	}
	
	private function phoneCallHandle( e:PhoneUiEvent )
	{
		hideObjectUI();
		
		if ( !currentPerson.interactWithPhone( e.getData() ) )
		{
			avatar.showDialog("Wrong number.");
			
			Timer.delay( function() {
				avatar.hideDialog();
			}, 3000 );
		}
	}
	
	private function phoneMusicHandle( e:PhoneUiEvent )
	{
		
		trace('music');
		
		if ( currentPerson.interactWithMusic() )
		{
			hideObjectUI();
		}
	}
	
	private function changePerson( e:Event )
	{		
		currentPerson.removeEventListener( Event.COMPLETE, changePerson );
		roomLayer.remove( currentPerson );
		
		iconLayer.hide();
		
		if ( currentObject != null )
		{
			stopSelectedObject();
			removeChild( stopButton );
		}
		
		switch( Type.getClass(currentPerson) )
		{
			case FatGuy:
				fatGuy = null;
				currentPerson = oldLady;
				Inventory.COMICBOOK = true;
			case OldLady:
				oldLady = null;
				currentPerson = hipsterDude;
				Inventory.PURSE = true;
			case HipsterDude:
				hipsterDude = null;
				//currentPerson = hipsterDude;
				Inventory.HAT = true;
				Inventory.GLASSES = true;
		}
		
		currentPerson.addEventListener( Event.COMPLETE, changePerson );
		
		Timer.delay( function() {
			iconLayer.show();
		}, 1000 );
		
	}
		
}