package com.ukuleledog.games.line.elements.people;

import com.ukuleledog.games.core.AnimatedObject;
import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.line.elements.objects.InventoryObject;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.Vector.Vector;
import haxe.Timer;
import motion.Actuate;
import openfl.Assets;

/**
 * ...
 * @author Matt
 */
class Person extends AnimatedObject
{

	public var label:TextField;
	
	public var dialogOptions:Vector<String>;
	public var dialogAnswers:Vector<String>;
	public var dialogBox:TextField;
	public var dialogFormat:TextFormat;
	
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
		
		dialogFormat = new TextFormat();
		dialogFormat.align = TextFormatAlign.CENTER;
		dialogFormat.font = "assets/font/dialog";
		
		dialogBox = new TextField();
		dialogBox.width = 300;
		dialogBox.multiline = true;
		dialogBox.wordWrap = true;
		dialogBox.selectable = false;
		dialogBox.textColor = 0xFFFFFF;
		dialogBox.x = -100;
		dialogBox.embedFonts = true;
	}
	
	public function interactWithObject( o:InventoryObject ) : Bool
	{
		return false;	
	}
	
	public function getDialogOptions() : Vector<String>
	{
		return dialogOptions;
	}
	
	public function getDialogText( id:Int ) : String
	{
		return dialogOptions[id];
	}
	
	public function getDialogAnswer( id:Int ) : String
	{
		return dialogAnswers[id];
	}
	
	public function showDialogAnswer( id:Int )
	{
		showDialog( dialogAnswers[id] );
	}
	
	public function showDialog( str:String )
	{
		dialogBox.text = str;
		dialogBox.setTextFormat( dialogFormat );
		
		dialogBox.height = dialogBox.textHeight + 5;
		dialogBox.y = - dialogBox.height - 5;
		
		addChild( dialogBox );
	}
	
	public function hideDialog()
	{
		removeChild( dialogBox );
	}
	
	public function interactWithPhone( number:String ) : Bool
	{
		return false;
	}
	
	public function interactWithMusic() : Bool
	{
		trace('interaction');
		return false;
	}
	
	public function leave()
	{
		Actuate.tween( this, 2, {alpha:0} );
		Timer.delay( function() {
			dispatchEvent( new Event( Event.COMPLETE ) );
		}, 3000 );
	}
	
}