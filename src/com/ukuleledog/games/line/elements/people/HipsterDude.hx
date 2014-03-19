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

	private var seenBook:Bool = false;
	private var heardMusic:Bool = false;
	
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
				seenBook = true;
				showDialog( "How dare you show me that book with that cover? You should have bought it BEFORE the movie came out!" );
				Timer.delay( function() {
					hideDialog();
					checkLeave();
				}, 3000 );
				return true;
		}
		
		return false;	
	}
	
	override public function interactWithMusic() : Bool
	{
		
		heardMusic = true;
		showDialog( "How can you POSSIBLY listen to music on a phone? It's a PHONE!! Go get yourself a walkman for christ's sake." );
		Timer.delay( function() {
			hideDialog();
			checkLeave();
		}, 3000 );
		
		return true;
	}
	
	private function checkLeave()
	{		
		if ( seenBook && heardMusic )
		{
			showDialog( "You fool !" );
			Timer.delay( function() {
				leave();
			}, 3000 );
		}
	}
	
}