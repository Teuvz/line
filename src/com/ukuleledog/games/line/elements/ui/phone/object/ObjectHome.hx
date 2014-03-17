package com.ukuleledog.games.line.elements.ui.phone.object;

import com.ukuleledog.games.line.elements.ui.phone.icon.IconPhone;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiObject;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenHome;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenPhone;

/**
 * ...
 * @author 
 */
class ObjectHome extends PhoneUiObject
{

	public function new() 
	{
		super();
		
		name = 'home';
		screen = new ScreenHome();
		
	}
	
}