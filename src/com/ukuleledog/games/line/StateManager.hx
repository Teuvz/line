package com.ukuleledog.games.line;

import com.ukuleledog.games.core.State;
import com.ukuleledog.games.core.StateManagerCore;
import com.ukuleledog.games.states.GameState;
import flash.events.Event;

/**
 * ...
 * @author Matt
 */
class StateManager extends StateManagerCore
{

	private static var instance:StateManager;
	
	private function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	public static function getInstance() : StateManager
	{
		if ( instance == null )
			instance = new StateManager();
			
		return instance;
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		setState( new GameState() );
	}
	
}