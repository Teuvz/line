package com.ukuleledog.games.elements.objects;
import com.ukuleledog.games.elements.icon.EarphoneIcon;
import src.com.ukuleledog.games.elements.ui.BookUI;

/**
 * ...
 * @author Matt
 */
class EarphoneObject extends InventoryObject
{

	public function new() 
	{
		super();
	
		icon = new EarphoneIcon();
		ui = new BookUI();
		
	}
	
}