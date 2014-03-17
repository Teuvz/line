package com.ukuleledog.games.line.elements.people;
import com.ukuleledog.games.line.elements.objects.BookObject;
import com.ukuleledog.games.line.elements.objects.ComicBookObject;
import com.ukuleledog.games.line.elements.objects.InventoryObject;
import com.ukuleledog.games.line.Inventory;

/**
 * ...
 * @author Matt
 */
class OldLady extends Person
{

	public function new() 
	{
		super();
		this.label.text = 'Old Lady';
		
		dialogOptions.push( "Nice day, isn't it?" );
		dialogOptions.push( "You been here long?" );
		dialogOptions.push( "Are your teeth real?" );
		
		dialogAnswers.push( "What? Stop mumbling!" );
		dialogAnswers.push( "I can't hear you, speak louder!" );
		dialogAnswers.push( "You punk! Stop messing around with me!" );
	}
	
	override public function interactWithObject( o:InventoryObject ) : Bool
	{
		
		switch( Type.getClass( o ) )
		{
			case ComicBookObject:
				trace("Filth.");
		}
		
		return false;	
	}
	
}