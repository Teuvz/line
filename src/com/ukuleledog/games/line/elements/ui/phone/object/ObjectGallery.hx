package com.ukuleledog.games.line.elements.ui.phone.object;

import com.ukuleledog.games.line.elements.ui.phone.icon.IconGallery;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiObject;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenGallery;

/**
 * ...
 * @author 
 */
class ObjectGallery extends PhoneUiObject
{

	public function new() 
	{
		super();
		
		name = 'gallery';
		screen = new ScreenGallery();
		icon = new IconGallery();
	}
	
}