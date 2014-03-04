package com.ukuleledog.games.elements.ui;

import com.ukuleledog.games.core.GameObject;
import flash.display.Sprite;
import flash.events.Event;

/**
 * ...
 * @author Matt
 */
class UI extends GameObject
{

	public var closeButton:Sprite;
	
	public function new() 
	{
		super();
	}
	
	public function setUiPosition()
	{		
		this.x = (stage.stageWidth / 2) - (this.width / 2);
		this.y = (stage.stageHeight / 2) - (this.height / 2);
	}
	
	public function addCloseButton()
	{
		closeButton = new Sprite();
		closeButton.graphics.beginFill( 0xFF0000 );
		closeButton.graphics.drawRect( 0, 0, 20, 20 );
		closeButton.graphics.endFill();
		
		closeButton.x = this.width - closeButton.width - 10;
		closeButton.y = 10;
		closeButton.buttonMode = true;
		addChild( closeButton );
	}
	
}