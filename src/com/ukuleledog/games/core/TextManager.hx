package com.ukuleledog.games.core;
import com.ukuleledog.games.line.Configuration;
import haxe.xml.Fast;
import openfl.Assets;

/**
 * ...
 * @author 
 */
class TextManager
{

	public static var TEXT_DIALOG:String = 'dialog';
	public static var TEXT_OTHER:String = 'other';
	public static var TEXT_OBJECT:String = 'object';
	
	private static var instance:TextManager;
	private var xml:Fast;
	
	public function new() 
	{
		var temp:Xml = Xml.parse( Assets.getText( 'xml/texts.xml' ) );
		xml = new Fast( temp );
	}
	
	public static function getInstance() : TextManager
	{
		if ( instance == null )
			instance = new TextManager();
			
		return instance;
	}
	
	public function getText( str:String, type:String ) : String
	{
		return xml.node.data.node.texts.node.resolve(type).node.resolve(str).node.resolve( Configuration.getInstance().getLanguage() ).innerData;
	}
	
}