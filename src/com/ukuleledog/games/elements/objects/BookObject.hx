package com.ukuleledog.games.elements.objects;
import com.ukuleledog.games.elements.icon.BookIcon;
import src.com.ukuleledog.games.elements.ui.BookUI;

/**
 * ...
 * @author Matt
 */
class BookObject extends InventoryObject
{

	public function new() 
	{
		super();
		
		icon = new BookIcon();
		ui = new BookUI();
		
	}
	
}