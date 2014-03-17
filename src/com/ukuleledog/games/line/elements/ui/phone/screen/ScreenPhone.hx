package com.ukuleledog.games.line.elements.ui.phone.screen;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiIcon;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiScreen;
import com.ukuleledog.games.line.events.PhoneUiEvent;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

/**
 * ...
 * @author 
 */
class ScreenPhone extends PhoneUiScreen
{

	private var number:TextField;
	
	private var button1:Sprite;
	private var button2:Sprite;
	private var button3:Sprite;
	private var button4:Sprite;
	private var button5:Sprite;
	private var button6:Sprite;
	private var button7:Sprite;
	private var button8:Sprite;
	private var button9:Sprite;
	private var button0:Sprite;
	private var buttonClear:Sprite;
	private var buttonCall:Sprite;
	
	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	private function init( e:Event )
	{
		//removeEventListener( Event.ADDED_TO_STAGE, init );
		
		graphics.beginFill( 0x0000FF );
		graphics.drawRect( 0, 0, 380, 600 );
		graphics.endFill();
			
		number = new TextField();
		number.selectable = false;
		number.border = true;
		number.backgroundColor = 0xFFFFFF;
		number.background = true;
		number.x = 20;
		number.y = 10;
		number.height = 50;
		number.width = 190;
		addChild( number );
		
		button1 = createButton('1');
		button1.x = 20;
		button1.y = 70;
		addChild(button1);
		button1.addEventListener( MouseEvent.CLICK, handle1 );
		
		button2 = createButton('2');
		button2.x = 90;
		button2.y = 70;
		addChild(button2);
		button2.addEventListener( MouseEvent.CLICK, handle2 );
		
		button3 = createButton('3');
		button3.x = 160;
		button3.y = 70;
		addChild(button3);
		button3.addEventListener( MouseEvent.CLICK, handle3 );
		
		button4 = createButton('4');
		button4.x = 20;
		button4.y = 140;
		addChild(button4);
		button4.addEventListener( MouseEvent.CLICK, handle4 );
		
		button5 = createButton('5');
		button5.x = 90;
		button5.y = 140;
		addChild(button5);
		button5.addEventListener( MouseEvent.CLICK, handle5 );
		
		button6 = createButton('6');
		button6.x = 160;
		button6.y = 140;
		addChild(button6);
		button6.addEventListener( MouseEvent.CLICK, handle6 );
		
		button7 = createButton('7');
		button7.x = 20;
		button7.y = 210;
		addChild(button7);
		button7.addEventListener( MouseEvent.CLICK, handle7 );
		
		button8 = createButton('8');
		button8.x = 90;
		button8.y = 210;
		addChild(button8);
		button8.addEventListener( MouseEvent.CLICK, handle8 );
		
		button9 = createButton('9');
		button9.x = 160;
		button9.y = 210;
		addChild(button9);
		button9.addEventListener( MouseEvent.CLICK, handle9 );
		
		button0 = createButton('0');
		button0.x = 90;
		button0.y = 280;
		addChild(button0);
		button0.addEventListener( MouseEvent.CLICK, handle0 );
		
		buttonClear = createButton('clear');
		buttonClear.x = 20;
		buttonClear.y = 280;
		addChild( buttonClear );
		buttonClear.addEventListener( MouseEvent.CLICK, handleClear );
		
		buttonCall = createButton('call');
		buttonCall.x = 160;
		buttonCall.y = 280;
		addChild( buttonCall );
		buttonCall.addEventListener( MouseEvent.CLICK, handleCall );
	}
	
	private function handleCall( e:MouseEvent )
	{
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.CALL, number.text ) );
	}
	
	private function handle1( e:MouseEvent )
	{
		number.appendText( '1' );
	}
	
	private function handle2( e:MouseEvent )
	{
		number.appendText( '2' );
	}
	
	private function handle3( e:MouseEvent )
	{
		number.appendText( '3' );
	}
	
	private function handle4( e:MouseEvent )
	{
		number.appendText( '4' );
	}
	
	private function handle5( e:MouseEvent )
	{
		number.appendText( '5' );
	}
	
	private function handle6( e:MouseEvent )
	{
		number.appendText( '6' );
	}
	
	private function handle7( e:MouseEvent )
	{
		number.appendText( '7' );
	}
	
	private function handle8( e:MouseEvent )
	{
		number.appendText( '8' );
	}
	
	private function handle9( e:MouseEvent )
	{
		number.appendText( '9' );
	}
	
	private function handle0( e:MouseEvent )
	{
		number.appendText( '0' );
	}
	
	private function handleClear( e:MouseEvent )
	{
		number.text = '';
	}
	
	private function createButton( txt:String ) : Sprite
	{
		var img:Sprite = new Sprite();
		img.graphics.beginFill( Math.ceil(Math.random() * 0xFFFFFF) );
		img.graphics.drawRect( 0, 0, 50, 50);
		img.graphics.endFill();
		img.buttonMode = true;
		img.mouseChildren = false;
		
		var textField:TextField = new TextField();
		textField.text = txt;
		textField.selectable = false;
		textField.width = textField.textWidth + 5;
		textField.height = textField.textHeight + 5;
		textField.x = (img.width - textField.width ) / 2;
		textField.y = (img.height - textField.height ) / 2;
		img.addChild( textField );
		
		return img;
	}
	
}