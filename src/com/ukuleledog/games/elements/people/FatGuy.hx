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
	}
	
	override public function interactWithObject( o:InventoryObject ) : Bool
	{
		
		switch( Type.getClass( o ) )
		{
			case BookObject:
				trace("I don't like that book.");
			case ComicBookObject:
				trace("Oh, thanks dude!");
				Inventory.COMICBOOK = false;
				return true;
		}
		
		return false;	
	}
	
}