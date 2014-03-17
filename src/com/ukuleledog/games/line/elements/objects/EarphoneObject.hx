package com.ukuleledog.games.line.elements.objects;
import com.ukuleledog.games.line.elements.icon.EarphoneIcon;
import src.com.ukuleledog.games.line.elements.ui.BookUI;

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