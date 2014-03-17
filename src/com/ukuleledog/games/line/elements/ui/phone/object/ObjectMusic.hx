package com.ukuleledog.games.line.elements.ui.phone.object;

import com.ukuleledog.games.line.elements.ui.phone.icon.IconContacts;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconMusic;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiObject;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenContacts;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenMusic;

/**
 * ...
 * @author 
 */
class ObjectMusic extends PhoneUiObject
{

	public function new() 
	{
		super();
		
		name = 'music';
		screen = new ScreenMusic();
		icon = new IconMusic();
	}
	
}