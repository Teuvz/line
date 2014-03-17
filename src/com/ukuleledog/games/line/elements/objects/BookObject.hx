package com.ukuleledog.games.line.elements.objects;
import com.ukuleledog.games.line.elements.icon.BookIcon;
import src.com.ukuleledog.games.line.elements.ui.BookUI;

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