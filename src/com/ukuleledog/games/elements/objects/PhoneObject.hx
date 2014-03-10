package com.ukuleledog.games.elements.objects;
import com.ukuleledog.games.elements.icon.PhoneIcon;
import src.com.ukuleledog.games.elements.ui.PhoneUI;

/**
 * ...
 * @author Matt
 */
class PhoneObject extends InventoryObject
{

	public function new() 
	{
		super();
		
		icon = new PhoneIcon();
		ui = new PhoneUI();	
	}
	
}