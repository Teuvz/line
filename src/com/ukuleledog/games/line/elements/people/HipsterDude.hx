package com.ukuleledog.games.line.elements.people;
import com.ukuleledog.games.line.elements.objects.BookObject;
import com.ukuleledog.games.line.elements.objects.ComicBookObject;
import com.ukuleledog.games.line.elements.objects.InventoryObject;
import com.ukuleledog.games.line.Inventory;
import com.ukuleledog.games.line.states.GameState;
import haxe.Timer;

/**
 * ...
 * @author Matt
 */
class HipsterDude extends Person
{

	
	
	public function new() 
	{
		super();
		this.label.text = 'HipsterDude';
		
		dialogOptions.push( "Nice hat." );
		dialogOptions.push( "Nice glasses." );
		dialogOptions.push( "Nice shirt." );
		
		dialogAnswers.push( "Thanks, it was my great-grandads." );
		dialogAnswers.push( "Thanks, they help me ignore you." );
		dialogAnswers.push( "I hope that was ironic? I only wear it when I come here. It shows I disaprove." );
	}
	
	override public function interactWithObject( o:InventoryObject ) : Bool
	{
		
		switch( Type.getClass( o ) )
		{
			case BookObject:				
				showDialog( "I don't like that book." );
				Timer.delay( function() {
					hideDialog();
				}, 3000 );
				return true;
		}
		
		return false;	
	}
	
}