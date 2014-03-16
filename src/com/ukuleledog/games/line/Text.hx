package com.ukuleledog.games.line;
import haxe.xml.Fast;
import openfl.Assets;

/**
 * ...
 * @author 
 */
class Text
{

	public static var TEXT_DIALOG:String = 'dialog';
	public static var TEXT_OTHER:String = 'other';
	
	private static var instance:Text;
	private var xml:Fast;
	
	public function new() 
	{
		var temp:Xml = Xml.parse( Assets.getText( 'xml/texts.xml' ) );
		xml = new Fast( temp );
	}
	
	public static function getInstance() : Text
	{
		if ( instance == null )
			instance = new Text();
			
		return instance;
	}
	
	public function getText( str:String, type:String ) : String
	{
		return xml.node.data.node.texts.node.resolve(type).node.resolve(str).node.resolve( Configuration.getInstance().getLanguage() ).innerData;
	}
	
}