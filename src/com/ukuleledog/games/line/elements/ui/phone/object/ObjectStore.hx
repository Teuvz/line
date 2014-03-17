package com.ukuleledog.games.line.elements.ui.phone.object;

import com.ukuleledog.games.line.elements.ui.phone.icon.IconContacts;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconStore;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiObject;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenContacts;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenStore;

/**
 * ...
 * @author 
 */
class ObjectStore extends PhoneUiObject
{

	public function new() 
	{
		super();
		
		name = 'store';
		screen = new ScreenStore();
		icon = new IconStore();
	}
	
}