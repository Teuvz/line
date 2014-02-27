package com.ukuleledog.games.elements.layers;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.core.Layer;
import com.ukuleledog.games.elements.people.Avatar;
import com.ukuleledog.games.elements.people.FatGuy;

/**
 * ...
 * @author Matt
 */
class RoomLayer extends Layer
{

	public var POSITION_AVATAR_X_ORIGIN:UInt = 250;
	public var POSITION_AVATAR_Y_ORIGIN:UInt = 300;
	
	public var POSITION_FATGUY_X_ORIGIN:UInt = 400;
	public var POSITION_FATGUY_Y_ORIGIN:UInt = 300;
		
	public function new() 
	{
		super();
		
	}
	
	override public function add( e:GameObject )
	{
		
		switch ( Type.getClass(e) )
		{
			case Avatar:
				e.x = POSITION_AVATAR_X_ORIGIN;
				e.y = POSITION_AVATAR_Y_ORIGIN;
			case FatGuy:
				e.x = POSITION_FATGUY_X_ORIGIN;
				e.y = POSITION_FATGUY_Y_ORIGIN;
		}
		
		addChild( e );
	}
	
	override public function remove( e:GameObject )
	{
		removeChild( e );
	}
	
}