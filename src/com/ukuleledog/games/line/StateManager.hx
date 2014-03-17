package com.ukuleledog.games.line;

import com.ukuleledog.games.core.State;
import com.ukuleledog.games.core.StateManagerCore;
import com.ukuleledog.games.line.states.GameState;
import com.ukuleledog.games.line.states.SplashState;
import flash.events.Event;
import flash.Vector.Vector;

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
		//setState( new SplashState() );
		setState( new GameState() );
		currentState.addEventListener( Event.COMPLETE, handleGame );
	}
	
	private function handleGame( e:Event )
	{
		currentState.removeEventListener( Event.COMPLETE, handleGame );
		replaceState( new GameState() );
	}
	
}