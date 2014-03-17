package com.ukuleledog.games.line;
import com.ukuleledog.games.line.elements.ui.UI;

/**
 * ...
 * @author 
 */
class Configuration
{

	private static var instance:Configuration;
	
	public static var LANGUAGE_ENGLISH:String = 'en';
	public static var LANGUAGE_FRENCH:String = 'fr';
	private var currentLanguage:String;
	
	public static var DISPLAY_WINDOW:UInt = 0;
	public static var DISPLAY_FULLSCREEN:UInt = 1;
	private var currentDisplay:UInt;
	
	public function new() 
	{
		currentLanguage = LANGUAGE_ENGLISH;
		currentDisplay = DISPLAY_WINDOW;
	}
	
	public static function getInstance() : Configuration
	{
		if ( instance == null )
			instance = new Configuration();
			
		return instance;
	}
	
	public function getLanguage() : String
	{
		return currentLanguage;
	}
	
	public function isFullscreen() : Bool
	{
		return ( currentDisplay == DISPLAY_FULLSCREEN );
	}
	
}