package com.ukuleledog.games.line.elements.ui.phone.object;

import com.ukuleledog.games.line.elements.ui.phone.icon.IconContacts;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiObject;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenContacts;

/**
 * ...
 * @author 
 */
class ObjectContacts extends PhoneUiObject
{

	public function new() 
	{
		super();
		
		name = 'contacts';
		screen = new ScreenContacts();
		icon = new IconContacts();
	}
	
}