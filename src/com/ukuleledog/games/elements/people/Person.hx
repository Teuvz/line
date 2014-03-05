package com.ukuleledog.games.elements.people;

import com.ukuleledog.games.core.AnimatedObject;
import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.elements.objects.InventoryObject;
import flash.text.TextField;
import flash.Vector.Vector;

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
	
	public function interactWithObject( o:InventoryObject ) : Bool
	{
		return false;	
	}
	
}