package com.ukuleledog.games.line.elements.ui.phone;

import flash.display.Sprite;
import flash.text.TextField;

/**
 * ...
 * @author 
 */
class PhoneUiIcon extends Sprite
{

	private var textField:TextField;
	
	public function new() 
	{
		super();
		buttonMode = true;
		mouseChildren = false;
	}
	
	public function setText( str:String )
	{
		textField = new TextField();
		//textField.selectable = false;
		textField.text = str;
		textField.width = textField.textWidth + 5;
		textField.height = textField.textHeight + 5;
		textField.textColor = 0xFFFFFF;
		
		addChild( textField );
		
		textField.y = this.height;
		textField.x = (this.width - textField.width) / 2;
	}
	
}