package com.ukuleledog.games.elements.people;

import com.ukuleledog.games.core.AnimatedObject;
import com.ukuleledog.games.core.GameObject;

/**
 * ...
 * @author Matt
 */
class Person extends AnimatedObject
{

	public function new() 
	{
		super();
				
		graphics.beginFill( Math.ceil(Math.random() * 0xFFFFFF) );
		graphics.drawRect( 0, 0, 100, 200 );
		graphics.endFill();
	}
	
}