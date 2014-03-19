package src.com.ukuleledog.games.line.elements.ui;

import com.ukuleledog.games.line.elements.ui.phone.object.ObjectCamera;
import com.ukuleledog.games.line.elements.ui.phone.object.ObjectContacts;
import com.ukuleledog.games.line.elements.ui.phone.object.ObjectGallery;
import com.ukuleledog.games.line.elements.ui.phone.object.ObjectHome;
import com.ukuleledog.games.line.elements.ui.phone.object.ObjectMusic;
import com.ukuleledog.games.line.elements.ui.phone.object.ObjectPhone;
import com.ukuleledog.games.line.elements.ui.phone.object.ObjectStore;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiObject;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiScreen;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenContacts;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenHome;
import com.ukuleledog.games.line.elements.ui.phone.screen.ScreenPhone;
import com.ukuleledog.games.line.elements.ui.UI;
import com.ukuleledog.games.line.events.PhoneUiEvent;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import motion.Actuate;

/**
 * ...
 * @author 
 */
class PhoneUI extends UI
{

	private var screen:Sprite;
	private var currentScreenObject:PhoneUiObject;
	private var currentScreen:PhoneUiScreen;
	
	private var btnHome:Sprite;
	
	
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
		//removeEventListener( Event.ADDED_TO_STAGE, init );
		
		setUiPosition();
		
		y += 50;
		
		if ( screen != null )
		{
			removeChild( screen );
			screen = new Sprite();
			screen.graphics.beginFill( 0x00000 );
			screen.graphics.drawRect( 0, 0, 380, 600 );
			screen.graphics.endFill();
			screen.x = 10;
			screen.y = 10;
			addChild( screen );
		}
		
		currentScreenObject = new ObjectHome();
		currentScreen = currentScreenObject.getScreen();
		
		screen.addChild( currentScreen );
		currentScreen.addEventListener( PhoneUiEvent.SCREEN, handleScreenChange );
		
		addCloseButton();
	
	}
	
	private function handleScreenChange( e:PhoneUiEvent )
	{
		
		switch( e.getData() )
		{
			case 'phone':
				currentScreenObject = new ObjectPhone();
				currentScreen = currentScreenObject.getScreen();
				currentScreen.addEventListener( PhoneUiEvent.CALL, handlePhoneCall );
			case 'contacts':
				currentScreenObject = new ObjectContacts();
				currentScreen = currentScreenObject.getScreen();
				currentScreen.addEventListener( PhoneUiEvent.CALL, handlePhoneCall );
			case 'music':
				currentScreenObject = new ObjectMusic();
				currentScreen = currentScreenObject.getScreen();
				currentScreen.addEventListener( PhoneUiEvent.MUSIC, handlePhoneMusic );
			case 'store':
				currentScreenObject = new ObjectStore();
				currentScreen = currentScreenObject.getScreen();
			case 'camera':
				currentScreenObject = new ObjectCamera();
				currentScreen = currentScreenObject.getScreen();
			case 'gallery':
				currentScreenObject = new ObjectGallery();
				currentScreen = currentScreenObject.getScreen();
		}
		
		
		screen.addChild( currentScreen );
		
	}
	
	private function handleHome( e:MouseEvent = null )
	{		
		switch( currentScreenObject.name )
		{
			case 'home':
			case 'phone':
				currentScreen.removeEventListener( PhoneUiEvent.CALL, handlePhoneCall );
				currentScreen.removeEventListener( PhoneUiEvent.MUSIC, handlePhoneMusic );
				screen.removeChild( currentScreen );
			case 'contacts':
				currentScreen.removeEventListener( PhoneUiEvent.CALL, handlePhoneCall );
				screen.removeChild( currentScreen );
			default:
				screen.removeChild( currentScreen );
				trace( 'disable ' + currentScreenObject.name );
		}
		
	}
	
	private function handlePhoneCall( e:PhoneUiEvent )
	{
		dispatchEvent( new PhoneUiEvent( e.type, e.getData() ) );
	}
	
	private function handlePhoneMusic( e:PhoneUiEvent )
	{
		dispatchEvent( new PhoneUiEvent( e.type, e.getData() ) );
	}
		
}