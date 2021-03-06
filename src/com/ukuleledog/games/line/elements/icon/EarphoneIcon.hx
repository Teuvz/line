package com.ukuleledog.games.line.elements.icon;

import com.ukuleledog.games.core.GameObject;
import flash.events.Event;

/**
 * ...
 * @author Matt
 */
class EarphoneIcon extends Icon
{

	public function new() 
	{
		super();
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		this.graphics.beginFill( 0xFFFF00 );
		this.graphics.drawRect( 0, 0, 100, 100 );
		this.graphics.endFill();
		
		label.text = 'Earphones';
	}
	
}