package com.ukuleledog.games.line.elements.ui.phone;

/**
 * ...
 * @author 
 */
class PhoneUiObject
{

	public var screen:PhoneUiScreen;
	public var icon:PhoneUiIcon;
	public var name:String;
	
	public function new() 
	{
		
	}
	
	public function getScreen() : PhoneUiScreen
	{
		return screen;
	}
	
	public function getIcon() : PhoneUiIcon
	{
		return icon;
	}
	
	public function getName() : String
	{
		return name;
	}
	
}