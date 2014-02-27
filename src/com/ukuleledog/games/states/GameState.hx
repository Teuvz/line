package com.ukuleledog.games.states;

import com.ukuleledog.games.core.Layer;
import com.ukuleledog.games.core.State;
import com.ukuleledog.games.elements.icon.PhoneIcon;
import com.ukuleledog.games.elements.layers.IconLayer;
import com.ukuleledog.games.elements.icon.BackpackIcon;
import com.ukuleledog.games.elements.icon.TalkIcon;
import com.ukuleledog.games.elements.icon.Icon;
import com.ukuleledog.games.elements.layers.RoomLayer;
import com.ukuleledog.games.elements.objects.InventoryObject;
import com.ukuleledog.games.elements.people.Avatar;
import com.ukuleledog.games.elements.people.Person;
import flash.events.Event;
import haxe.Timer;

/**
 * ...
 * @author Matt
 */
class GameState extends State
{

	private var roomLayer:Layer;
	private var iconLayer:Layer;
	private var uiLayer:Layer;
	
	// icons
	private var backpackIcon:BackpackIcon;
	private var talkIcon:TalkIcon;
	
	// people
	private var avatar:Person;
	private var fatGuy:Person;
	
	// ui
	
	// current game
	private var currentObject:InventoryObject;
	private var currentObjectIcon:Icon;
	private var currentPerson:Person;
	
	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
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
		
		avatar = new Avatar();
		roomLayer.add( avatar );
		
		fatGuy = new Person();
		roomLayer.add( fatGuy );
	}
	
	private function initIcons()
	{
		iconLayer = new IconLayer();
		addChild( iconLayer );
		
		backpackIcon = new BackpackIcon();
		iconLayer.add( backpackIcon );
		
		talkIcon = new TalkIcon();
		iconLayer.add( talkIcon );
		
		Timer.delay( function() {
			
			currentObjectIcon = new PhoneIcon();
			iconLayer.add( currentObjectIcon );
			
			Timer.delay( function() {
				iconLayer.remove( currentObjectIcon );
			}, 5000 );
			
		}, 1000 );
		
	}
	
	private function initUI()
	{
		uiLayer = new Layer();
		addChild( uiLayer );		
	}
	
}