package com.ukuleledog.games.line.elements.objects;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.line.elements.icon.Icon;
import com.ukuleledog.games.line.elements.ui.UI;

/**
 * ...
 * @author Matt
 */
class InventoryObject extends GameObject
{

	public var icon:Icon;
	public var ui:UI;
	
	public function new() 
	{
		super();	
	}
	
	public function getIcon() : Icon
	{
		return icon;
	}
	
	public function getUI() : UI
	{
		return ui;
	}
	
	
}