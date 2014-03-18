package com.ukuleledog.games.line.elements.ui.phone.screen;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiIcon;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiScreen;
import com.ukuleledog.games.line.events.PhoneUiEvent;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.Vector.Vector;

/**
 * ...
 * @author 
 */
class ScreenContacts extends PhoneUiScreen
{

	private var contacts:Vector<Sprite>;
	
	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
		
		contacts = new Vector<Sprite>();
		contacts.push( createContact('911', '911') );
		contacts.push( createContact('Brian', '4657411') );
		contacts.push( createContact('Home', '613531') );
		contacts.push( createContact('Kevin', '2354583') );
		contacts.push( createContact('Mum', '713708') );
		contacts.push( createContact('Pizza', '646861') );
		contacts.push( createContact('Sexy Girlfriend', '5318008') );
		contacts.push( createContact('Toki', '314159265359') );
		contacts.push( createContact('Work', '5684566') );
	}
	
	private function init( e:Event )
	{
		//removeEventListener( Event.ADDED_TO_STAGE, init );
		
		graphics.beginFill( 0x000000 );
		graphics.drawRect( 0, 0, 380, 600 );
		graphics.endFill();
	
		var i:UInt = 0;
		var j:UInt = contacts.length;
		
		while ( i < j )
		{
			contacts[i].y = i * contacts[i].height;
			contacts[i].addEventListener( MouseEvent.CLICK, handleClick );
			addChild( contacts[i] );
			i++;
		}
		
	}
	
	private function handleClick( e:MouseEvent )
	{
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.CALL, e.target.name ) );
	}
	
	private function createContact( name:String, id:String ) : Sprite
	{
		var btn:Sprite = new Sprite();
		btn.graphics.lineStyle( 1, 0xFFFFFF );
		btn.graphics.beginFill( 0x000000 );
		btn.graphics.drawRect( 0, 0, 380, 50 );
		btn.buttonMode = true;
		btn.mouseChildren = false;
		btn.name = id;
		
		var textField:TextField = new TextField();
		textField.selectable = false;
		textField.textColor = 0xFFFFFF;
		textField.text = name;
		textField.width = textField.textWidth + 5;
		textField.height = textField.textHeight +5;
		textField.x = 5;
		textField.y = 5;
		btn.addChild( textField );
		
		return btn;
	}
	
}