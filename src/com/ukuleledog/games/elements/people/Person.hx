package com.ukuleledog.games.elements.people;

import com.ukuleledog.games.core.AnimatedObject;
import com.ukuleledog.games.core.GameObject;
import flash.text.TextField;

/**
 * ...
 * @author Matt
 */
class Person extends AnimatedObject
{

	public var label:TextField;
	
	public function new() 
	{
		super();
				
		graphics.beginFill( Math.ceil(Math.random() * 0xFFFFFF) );
		graphics.drawRect( 0, 0, 100, 200 );
		graphics.endFill();
		
		label = new TextField();
		label.selectable = false;
		addChild( label );
	}
	
}