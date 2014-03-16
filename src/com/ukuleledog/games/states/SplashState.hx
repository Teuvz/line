package com.ukuleledog.games.states;

import com.ukuleledog.games.core.State;
import com.ukuleledog.games.elements.ui.UI;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;
import motion.Actuate;
import openfl.Assets;

/**
 * ...
 * @author 
 */
class SplashState extends State
{

	private static inline var SPLASH_TIME:UInt = 4000;
	private var logoTimer:Timer;
	private var currentLogo:Bitmap;
	private var logoCount:UInt = 0;
	private var haxeLogoBmd:BitmapData;
	private var openflLogoBmd:BitmapData;
	
	public function new() 
	{
		super();
		
		logoTimer = new Timer( SPLASH_TIME );
		logoTimer.addEventListener( TimerEvent.TIMER, logoTimerHandle );
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		haxeLogoBmd = Assets.getBitmapData( 'img/haxe.png' );
		openflLogoBmd = Assets.getBitmapData( 'img/openfl.png' );
		
		currentLogo = new Bitmap( haxeLogoBmd );
		currentLogo.alpha = 0;
		addChild( currentLogo );
		//currentLogo.height = stage.stageHeight - 100;
		//currentLogo.scaleX = currentLogo.scaleY;
		currentLogo.scaleX = 2;
		currentLogo.scaleY = 2;
		currentLogo.x = (stage.stageWidth / 2) - (currentLogo.width / 2);
		currentLogo.y = (stage.stageHeight / 2) - (currentLogo.height / 2);
		Actuate.tween( currentLogo, 1, { alpha:1 } );
		
		logoTimer.start();
		
		stage.addEventListener( MouseEvent.CLICK, handleClick );
	}
	
	private function logoTimerHandle( e:TimerEvent )
	{
		
		if (logoCount == 0 || logoCount == 2)
		{
			Actuate.tween( currentLogo, 2, { alpha:0 } );
		} 
		else if (logoCount == 1 )
		{
			removeChild( currentLogo );
			currentLogo = new Bitmap( openflLogoBmd );
			currentLogo.alpha = 0;
			addChild( currentLogo );
			//currentLogo.height = stage.stageHeight - 100;
			//currentLogo.scaleX = currentLogo.scaleY;
			currentLogo.scaleX = 2;
			currentLogo.scaleY = 2;
			currentLogo.x = (stage.stageWidth / 2) - (currentLogo.width / 2);
			currentLogo.y = (stage.stageHeight / 2) - (currentLogo.height / 2);
			Actuate.tween( currentLogo, 12, { alpha:2 } );
		}
		else if (logoCount == 3)
		{
			logoTimer.stop();
			logoTimer.removeEventListener( TimerEvent.TIMER, logoTimerHandle );
			stage.removeEventListener( MouseEvent.CLICK, handleClick );
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		logoCount++;
	}
	
	private function handleClick( e:MouseEvent )
	{
		logoTimer.stop();
		logoTimer.removeEventListener( TimerEvent.TIMER, logoTimerHandle );
		stage.removeEventListener( MouseEvent.CLICK, handleClick );
		dispatchEvent( new Event( Event.COMPLETE ) );
	}
	
}