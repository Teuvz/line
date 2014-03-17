package com.ukuleledog.games.core;

import flash.display.Sprite;
import flash.events.Event;
import motion.Actuate;

/**
 * ...
 * @author Matt
 */
class StateManagerCore extends Sprite
{

	public var currentState:State;
	
	public function new() 
	{
		super();
	}
	
	public function setState( state:State )
	{
		currentState = state;
		currentState.alpha = 0;
		addChild( currentState );
		Actuate.tween( currentState, 1, { alpha:1 } );
		
		positionState();
		stage.addEventListener( Event.RESIZE, positionState );
	}
	
	public function removeState()
	{
		Actuate.tween( currentState, 1, { alpha:1 } ).onComplete(function() {
			removeChild( currentState );
			currentState = null;
		});
	}
	
	public function replaceState( state:State )
	{
		Actuate.tween( currentState, 1, { alpha:1 } ).onComplete(function() {
			removeChild( currentState );
			currentState = null;
			setState( state );
		});
	}
	
	private function positionState( e:Event = null )
	{
		currentState.x = (stage.stageWidth - currentState.width) / 2;
		currentState.y = (stage.stageHeight - currentState.height) / 2;
		trace('window resized');
	}
	
}