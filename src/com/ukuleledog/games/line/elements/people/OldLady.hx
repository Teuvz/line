package com.ukuleledog.games.line.elements.people;
import com.ukuleledog.games.line.elements.objects.BookObject;
import com.ukuleledog.games.line.elements.objects.ComicBookObject;
import com.ukuleledog.games.line.elements.objects.InventoryObject;
import com.ukuleledog.games.line.Inventory;
import haxe.Timer;

/**
 * ...
 * @author Matt
 */
class OldLady extends Person
{

	private var dialogCount:UInt = 0;
	
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
		dialogAnswers.push( "You're just like my son, that idiot." );
		dialogAnswers.push( "My husband died in the War, you should respect me!" );
		dialogAnswers.push( "I've had enough! I'm leaving!" );
	}
	
	override public function interactWithObject( o:InventoryObject ) : Bool
	{
		
		switch( Type.getClass( o ) )
		{
			case ComicBookObject:
				showDialog("Filth.");
				Timer.delay( function() {
					hideDialog();
				}, 3000 );
				return true;
		}
		
		return false;	
	}
	
	override public function showDialogAnswer( id:Int )
	{
			
		showDialog( dialogAnswers[dialogCount] );
		
		dialogCount++;
		
		dialogOptions.splice( id, 1 );
		
		if ( dialogCount == 3 )
		{
			dialogOptions.splice( 0, dialogOptions.length );
			dialogOptions.push( "Your hair looks like a dead cabbage." );
			dialogOptions.push( "Do you know why you're here?" );
		}
		
		if ( dialogCount == 5 )
		{
			dialogOptions.splice( 0, dialogOptions.length );
			dialogOptions.push( "Jesus phoned, he's still got your scrabble board." );		
		}
		
		if ( dialogCount == 6 )
		{
			Timer.delay( function() {
				leave();
			}, 2000 );
		}

	}
	
}