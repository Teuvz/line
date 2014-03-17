package com.ukuleledog.games.line.elements.layers;

import com.ukuleledog.games.core.GameObject;
import com.ukuleledog.games.core.Layer;
import com.ukuleledog.games.line.elements.icon.BackpackIcon;
import com.ukuleledog.games.line.elements.icon.TalkIcon;
import com.ukuleledog.games.line.elements.icon.Icon;
import motion.Actuate;
import motion.easing.Bounce;

/**
 * ...
 * @author Matt
 */
class IconLayer extends Layer
{

	private var ICON_Y:UInt = 660;
	
	private var ICON_X_DOUBLE_BACKPACK = 400;
	private var ICON_X_DOUBLE_TALK = 520;
	
	private var ICON_X_TRIPLE_BACKPACK = 340;
	private var ICON_X_TRIPLE_TALK = 590;
	private var ICON_X_TRIPLE_OBJECT = 465;
		
	private var backpack:GameObject;
	private var talk:GameObject;
	
	public function new() 
	{
		super();
		
	}
	
	override public function add( e:GameObject )
	{				
		switch( Type.getClass(e) )
		{
			case BackpackIcon:
				e.x = ICON_X_DOUBLE_BACKPACK;
				backpack = e;
			case TalkIcon:
				e.x = ICON_X_DOUBLE_TALK;
				talk = e;
			default:
				Actuate.tween( backpack, 0.5, { x:ICON_X_TRIPLE_BACKPACK } ).ease( Bounce.easeOut );
				Actuate.tween( talk, 0.5, { x:ICON_X_TRIPLE_TALK } ).ease( Bounce.easeOut );
				e.x = ICON_X_TRIPLE_OBJECT;
		}
		
		e.y = 768;
		Actuate.tween( e, 0.5, {y: ICON_Y} ).ease( Bounce.easeOut );
		
		addChild( e );
	}
	
	override public function remove( e:GameObject )
	{		
		removeChild( e );
		
		Actuate.tween( backpack, 0.5, { x:ICON_X_DOUBLE_BACKPACK } ).ease( Bounce.easeOut );
		Actuate.tween( talk, 0.5, { x:ICON_X_DOUBLE_TALK } ).ease( Bounce.easeOut );
	}
	
	public function show()
	{
		Actuate.tween( this, 0.5, {y:0} ).ease( Bounce.easeOut );
	}
	
	public function hide()
	{
		Actuate.tween( this, 0.5, {y:200} );
	}
	
}