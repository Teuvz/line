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
				showDialog( "I don't like that book." );
				Timer.delay( function() {
					hideDialog();
				}, 3000 );
				return true;
		}
		
		return false;	
	}
	
	override public function interactWithPhone( number:String ) : Bool
	{
		if ( number == '5318008' )
		{
			showDialog( "Yuk, get a room you weirdo! I'm leaving!" );
			Timer.delay( function() {
				hideDialog();
				leave();
			}, 3000 );
			return true;
		}
			
		return false;
	}
	
}