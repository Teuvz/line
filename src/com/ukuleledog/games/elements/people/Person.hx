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
	
	public var dialogOptions:Vector<String>;
	public var dialogAnswers:Vector<String>;
	
	public function new() 
	{
		super();
				
		graphics.beginFill( Math.ceil(Math.random() * 0xFFFFFF) );
		graphics.drawRect( 0, 0, 100, 200 );
		graphics.endFill();
		
		label = new TextField();
		label.selectable = false;
		addChild( label );
		
		dialogOptions = new Vector<String>();
		dialogAnswers = new Vector<String>();
	}
	
	public function interactWithObject( o:InventoryObject ) : Bool
	{
		return false;	
	}
	
	public function getDialogOptions() : Vector<String>
	{
		return dialogOptions;
	}
	
	public function getDialogAnswer( id:Int ) : String
	{
		return dialogAnswers[id];
	}
	
}