package src.com.ukuleledog.games.elements.ui;

import com.ukuleledog.games.elements.ui.UI;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

/**
 * ...
 * @author 
 */
class PhoneUI extends UI
{

	private var screen:Sprite;
	
	private var screenHome:Sprite;
	private var screenPhone:Sprite;
	private var screenContacts:Sprite;
	private var screenMusic:Sprite;
	private var screenStore:Sprite;
	private var screenCamera:Sprite;
	
	private var btnHome:Sprite;
	private var btnPhone:Sprite;
	private var btnContacts:Sprite;
	private var btnMusic:Sprite;
	private var btnStore:Sprite;
	private var btnCamera:Sprite;
	
	public function new() 
	{
		super();
		
		graphics.beginFill( 0xFFFFFF );
		graphics.drawRoundRect( 0, 0, 400, 700, 20 );
		graphics.endFill();
		
		screen = new Sprite();
		screen.graphics.beginFill( 0x00000 );
		screen.graphics.drawRect( 0, 0, 380, 600 );
		screen.graphics.endFill();
		screen.x = 10;
		screen.y = 10;
		addChild( screen );
		
		btnHome = new Sprite();
		btnHome.buttonMode = true;
		btnHome.mouseChildren = false;
		btnHome.graphics.beginFill( 0x000000 );
		btnHome.graphics.drawCircle( 0, 0, 25);
		btnHome.graphics.endFill();
		btnHome.x = 200;
		btnHome.y = 650;
		addChild( btnHome );
		
		addEventListener( Event.ADDED_TO_STAGE, init );
		btnHome.addEventListener( MouseEvent.CLICK, handleHome );
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		setUiPosition();
		addCloseButton();
	}
	
	private function handleHome( e:MouseEvent )
	{
		trace('go home');
	}
	
	private function handlePhone( e:MouseEvent )
	{
		trace('show phone');
	}
	
	private function handleContacts( e:MouseEvent )
	{
		trace('show contacts');
	}
	
	private function handleMusic( e:MouseEvent )
	{
		trace('show music');
	}
	
	private function handleStore( e:MouseEvent )
	{
		trace('show store');
	}
	
	private function handleCamera( e:MouseEvent )
	{
		trace('show camera');
	}
	
}