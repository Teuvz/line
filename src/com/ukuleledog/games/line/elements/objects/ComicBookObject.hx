package com.ukuleledog.games.line.elements.objects;
import com.ukuleledog.games.line.elements.icon.ComicBookIcon;
import src.com.ukuleledog.games.line.elements.ui.BookUI;

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