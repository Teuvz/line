package com.ukuleledog.games.line.elements.layers;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.core.Layer;
import com.ukuleledog.games.line.elements.people.Avatar;
import com.ukuleledog.games.line.elements.people.FatGuy;
import com.ukuleledog.games.line.elements.people.HipsterDude;
import com.ukuleledog.games.line.elements.people.OldLady;

/**
 * ...
 * @author Matt
 */
class RoomLayer extends Layer
{

	static inline var POSITION_AVATAR_X_ORIGIN:UInt = 250;
	static inline var POSITION_AVATAR_Y_ORIGIN:UInt = 300;
	
	static inline var POSITION_FATGUY_X_ORIGIN:UInt = 400;
	static inline var POSITION_FATGUY_Y_ORIGIN:UInt = 300;
	
	static inline var POSITION_OLDLADY_X_ORIGIN:UInt = 430;
	static inline var POSITION_OLDLADY_Y_ORIGIN:UInt = 300;
	
	static inline var POSITION_HIPSTERDUDE_X_ORIGIN:UInt = 460;
	static inline var POSITION_HIPSTERDUDE_Y_ORIGIN:UInt = 300;
		
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
			case OldLady:
				e.x = POSITION_OLDLADY_X_ORIGIN;
				e.y = POSITION_OLDLADY_Y_ORIGIN;
			case HipsterDude:
				e.x = POSITION_HIPSTERDUDE_X_ORIGIN;
				e.y = POSITION_HIPSTERDUDE_Y_ORIGIN;
		}
		
		addChild( e );
	}
	
	override public function remove( e:GameObject )
	{
		removeChild( e );
	}
	
}