package com.ukuleledog.games.line.elements.ui.phone.object;

import com.ukuleledog.games.line.elements.ui.phone.icon.IconPhone;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiObject;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenPhone;

/**
 * ...
 * @author 
 */
class ObjectPhone extends PhoneUiObject
{

	public function new() 
	{
		super();
		
		name = 'phone';
		screen = new ScreenPhone();
		icon = new IconPhone();
		
	}
	
}