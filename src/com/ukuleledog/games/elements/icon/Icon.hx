package com.ukuleledog.games.elements.icon;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.elements.ui.UI;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;
import flash.text.TextField;

/**
 * ...
 * @author Matt
 */
class Icon extends UI
{

	public var label:TextField;
	
	public function new() 
	{
		super();
	
		buttonMode = true;
		
		label = new TextField();
		label.selectable = false;
		addChild( label );
		
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