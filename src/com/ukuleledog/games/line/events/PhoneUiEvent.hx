package com.ukuleledog.games.line.events;
import flash.events.Event;

/**
 * ...
 * @author 
 */
class PhoneUiEvent extends Event
{

	private var data:String;
	
	public static var HOME:String = 'home';
	public static var COMPLETE:String = 'complete';
	public static var SCREEN:String = 'screen';
	public static var CALL:String = 'call';
	
	public function new( type:String, data:String = null ) 
	{
		super( type, false, true );
		this.data = data;
	}
	
	public function getData():String
	{
		return data;
	}
	
}