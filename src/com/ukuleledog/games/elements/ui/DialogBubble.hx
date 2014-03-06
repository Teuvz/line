package com.ukuleledog.games.elements.ui;
import flash.text.TextField;

/**
 * ...
 * @author Matt
 */
class DialogBubble extends UI
{

	private var textField:TextField;
	
	public function new( s:String ) 
	{
		super();
		
		textField = new TextField();
		addChild( textField );
		textField.text = s;
		
		textField.width = textField.textWidth + 5;
		textField.height = textField.textHeight + 5;
		
		textField.selectable = false;
		
		buttonMode = true;
		mouseChildren = false;
		
		graphics.lineStyle( 3 );
		graphics.beginFill( 0xFFFFFF );
		graphics.drawEllipse( 0, 0, width + 20, height + 20 );
		graphics.endFill();
		
		textField.x = ( this.width - textField.width ) / 2;
		textField.y = ( this.height - textField.height - 5 ) / 2;
		
	}
	
}