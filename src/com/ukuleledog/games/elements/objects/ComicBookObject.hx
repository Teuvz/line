package com.ukuleledog.games.elements.objects;
import com.ukuleledog.games.elements.icon.ComicBookIcon;
import src.com.ukuleledog.games.elements.ui.BookUI;

/**
 * ...
 * @author Matt
 */
class ComicBookObject extends InventoryObject
{

	public function new() 
	{
		super();
		
		icon = new ComicBookIcon();
		ui = new BookUI();
		
	}
	
}