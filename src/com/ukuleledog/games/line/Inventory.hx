package com.ukuleledog.games.line;
import com.ukuleledog.games.line.elements.objects.InventoryObject;
import flash.media.SoundChannel;

/**
 * ...
 * @author Matt
 */
class Inventory
{	
	public static var SMARTPHONE:Bool = true;
	public static var EARPHONES:Bool = false;
	public static var BOOK:Bool = true;
	
	public static var COMICBOOK:Bool = false;
	public static var PURSE:Bool = false;
	public static var BROKENPURSE:Bool = false;
	public static var COINS:Bool = false;
	public static var GLASSES:Bool = false;
	public static var HAT:Bool = false;
	public static var TIE:Bool = false;
	public static var RAGDOLL:Bool = false;
	public static var LIPSTICK:Bool = false;
	public static var GUM:Bool = false;
	public static var EMPTYGUM:Bool = false;
	public static var CINEMA:Bool = false;
	public static var WIG:Bool = false;
	
	public static var selectedObject:InventoryObject;
	public static var musicPlaying:Bool = false;
	public static var musicId:Int;
	public static var musicChannel:SoundChannel;
	
	public function new() 
	{
		
	}
	
}