package com.ukuleledog.games.elements.people;
import com.ukuleledog.games.elements.objects.BookObject;
import com.ukuleledog.games.elements.objects.ComicBookObject;
import com.ukuleledog.games.elements.objects.InventoryObject;
import com.ukuleledog.games.line.Inventory;

/**
 * ...
 * @author Matt
 */
class FatGuy extends Person
{

	public function new() 
	{
		super();
		this.label.text = 'FatGuy';
		
		dialogOptions.push( "You're fat!" );
		dialogOptions.push( "You smell funny..." );
		dialogOptions.push( "What are you reading?" );
		
		dialogAnswers.push( "It's the weight of my personality." );
		dialogAnswers.push( "Must be because I work out too much." );
		dialogAnswers.push( "The latest LeatherGirl! Damn I like this comic. She's so... sexy. I'd kill to have a gal like that!" );
	}
	
	override public function interactWithObject( o:InventoryObject ) : Bool
	{
		
		switch( Type.getClass( o ) )
		{
			case BookObject:
				trace("I don't like that book.");
				return true;
		}
		
		return false;	
	}
	
}