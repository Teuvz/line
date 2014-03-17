package com.ukuleledog.games.line.elements.icon;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.line.elements.icon.Icon;
import flash.events.Event;

/**
 * ...
 * @author Matt
 */
class TalkIcon extends Icon
{

	public function new() 
	{
		super();
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		this.graphics.beginFill( 0x00FF00 );
		this.graphics.drawRect( 0, 0, 100, 100 );
		this.graphics.endFill();
		
		label.text = 'Talk';
	}
	
}