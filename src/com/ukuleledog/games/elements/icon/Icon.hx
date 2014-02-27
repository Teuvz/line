package com.ukuleledog.games.elements.icon;

import com.ukuleledog.games.core.GameObject;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;

/**
 * ...
 * @author Matt
 */
class Icon extends GameObject
{

	public function new() 
	{
		super();
	
		buttonMode = true;
		
		addEventListener( MouseEvent.MOUSE_OVER, highlightStart );
		addEventListener( MouseEvent.MOUSE_OUT, highlightStop );
		
	}
		
	private function highlightStart( e:MouseEvent )
	{
		filters = [ new GlowFilter(0xFFFFFF,1,10,10,3,3) ];
	}
	
	private function highlightStop( e:MouseEvent )
	{
		filters = [];
	}
	
}