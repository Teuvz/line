package com.ukuleledog.games.line.elements.objects;
import com.ukuleledog.games.line.elements.icon.PhoneIcon;
import src.com.ukuleledog.games.line.elements.ui.PhoneUI;

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