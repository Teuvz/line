package com.ukuleledog.games.line.elements.ui.phone.object;

import com.ukuleledog.games.line.elements.ui.phone.icon.IconCamera;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconContacts;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiObject;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenCamera;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenContacts;

/**
 * ...
 * @author 
 */
class ObjectCamera extends PhoneUiObject
{

	public function new() 
	{
		super();
		
		name = 'camera';
		screen = new ScreenCamera();
		icon = new IconCamera();
	}
	
}