package com.ukuleledog.games.line.elements.ui.phone.screen;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconCamera;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconContacts;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconGallery;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconMusic;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconPhone;
import com.ukuleledog.games.line.elements.ui.phone.icon.IconStore;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiIcon;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiScreen;
import com.ukuleledog.games.line.events.PhoneUiEvent;
import flash.events.Event;
import flash.events.MouseEvent;

/**
 * ...
 * @author 
 */
class ScreenHome extends PhoneUiScreen
{

	public var btnPhone:IconPhone;
	public var btnContacts:PhoneUiIcon;
	public var btnMusic:PhoneUiIcon;
	public var btnStore:PhoneUiIcon;
	public var btnCamera:PhoneUiIcon;
	public var btnGallery:PhoneUiIcon;
	
	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	private function init( e:Event )
	{
		//removeEventListener( Event.ADDED_TO_STAGE, init );
		
		graphics.beginFill( 0x00FF00 );
		graphics.drawRect( 0, 0, 380, 600 );
		graphics.endFill();
		
		btnPhone = new IconPhone();
		btnPhone.x = 20;
		btnPhone.y = 20;
		addChild( btnPhone );
		btnPhone.addEventListener( MouseEvent.CLICK, handlePhone );
		
		btnContacts = new IconContacts();
		btnContacts.x = btnPhone.x + btnPhone.width + 20;
		btnContacts.y = 20;
		addChild( btnContacts );
		btnContacts.addEventListener( MouseEvent.CLICK, handleContacts );
		
		btnMusic = new IconMusic();
		btnMusic.x = btnContacts.x + btnContacts.width + 20;
		btnMusic.y = 20;
		addChild( btnMusic );
		btnMusic.addEventListener( MouseEvent.CLICK, handleMusic );
		
		btnStore = new IconStore();
		btnStore.x = 20;
		btnStore.y = btnPhone.y + btnPhone.height + 20;
		addChild( btnStore );
		btnStore.addEventListener( MouseEvent.CLICK, handleStore );
		
		btnCamera = new IconCamera();
		btnCamera.x = btnStore.x + btnStore.width + 20;
		btnCamera.y = btnStore.y;
		addChild( btnCamera );
		btnCamera.addEventListener( MouseEvent.CLICK, handleCamera );
		
		btnGallery = new IconGallery();
		btnGallery.x = btnCamera.x + btnCamera.width + 20;
		btnGallery.y = btnCamera.y;
		addChild( btnGallery );
		btnGallery.addEventListener( MouseEvent.CLICK, handleGallery );
		
	}
	
	private function handlePhone( e:MouseEvent )
	{
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.SCREEN, 'phone' ) );
	}
	
	private function handleContacts( e:MouseEvent )
	{
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.SCREEN, 'contacts' ) );
	}
	
	private function handleMusic( e:MouseEvent )
	{
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.SCREEN, 'music' ) );
	}
	
	private function handleStore( e:MouseEvent )
	{
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.SCREEN, 'store' ) );
	}
	
	private function handleCamera( e:MouseEvent )
	{
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.SCREEN, 'camera' ) );
	}
	
	private function handleGallery( e:MouseEvent )
	{
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.SCREEN, 'gallery' ) );
	}
	
}