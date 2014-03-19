package com.ukuleledog.games.line.elements.ui.phone.screen;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiIcon;
import com.ukuleledog.games.line.elements.ui.phone.PhoneUiScreen;
import com.ukuleledog.games.line.events.PhoneUiEvent;
import com.ukuleledog.games.line.Inventory;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.Sound;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.ui.Mouse;
import flash.Vector.Vector;
import openfl.Assets;

/**
 * ...
 * @author 
 */
class ScreenMusic extends PhoneUiScreen
{

	private var playButton:Sprite;
	private var stopButton:Sprite;
	private var pauseButton:Sprite;
	private var previousButton:Sprite;
	private var nextButton:Sprite;
	private var dataDisplay:TextField;
	private var dataFormat:TextFormat;
	private var currentSong:Sound;
	private var pausePosition:Float;
	private var currentSongIsPlaying:Bool = false;
	private var currentSongId:Int = 0;
	private var songs:Vector<String>;
	private var songInfo:Vector<String>;
	
	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
		
		graphics.beginFill( 0x00FFFF );
		graphics.drawRect( 0, 0, 380, 600 );
		graphics.endFill();
		
		dataFormat = new TextFormat();
		dataFormat.align = TextFormatAlign.CENTER;
		dataFormat.font = "assets/font/music";
		dataFormat.size = 32;
		
		dataDisplay = new TextField();
		dataDisplay.height = 300;
		dataDisplay.width = 350;
		dataDisplay.x = 15;
		dataDisplay.y = 15;
		dataDisplay.background = true;
		dataDisplay.backgroundColor = 0xFFFFFF;
		dataDisplay.border = true;
		dataDisplay.borderColor = 0x000000;
		dataDisplay.multiline = true;
		dataDisplay.wordWrap = false;
		dataDisplay.selectable = false;
		dataDisplay.embedFonts = true;
		dataDisplay.defaultTextFormat = dataFormat;
		addChild( dataDisplay );
		
		playButton = new Sprite();
		playButton.graphics.lineStyle( 2, 0x000000 );
		playButton.graphics.beginFill( 0x00FF00 );
		playButton.graphics.drawRect( 0, 0, 30, 30 );
		playButton.buttonMode = true;
		playButton.x = 125;
		playButton.y = 330;
		playButton.addEventListener( MouseEvent.CLICK, handlePlay );
		addChild( playButton );
		
		pauseButton = new Sprite();
		pauseButton.graphics.lineStyle( 2, 0x000000 );
		pauseButton.graphics.beginFill( 0x0000FF );
		pauseButton.graphics.drawRect( 0, 0, 30, 30 );
		//pausePosition.buttonMode = true;
		pauseButton.x = 175;
		pauseButton.y = 330;
		//pausePosition.addEventListener( MouseEvent.CLICK, handlePause );
		pauseButton.alpha = 0.4;
		addChild( pauseButton );
		
		stopButton = new Sprite();
		stopButton.graphics.lineStyle( 2, 0x000000 );
		stopButton.graphics.beginFill( 0xFF0000 );
		stopButton.graphics.drawRect( 0, 0, 30, 30 );
		//stopButton.buttonMode = true;
		stopButton.x = 225;
		stopButton.y = 330;
		//stopButton.addEventListener( MouseEvent.CLICK, handleStop );
		stopButton.alpha = 0.4;
		addChild( stopButton );
		
		previousButton = new Sprite();
		previousButton.graphics.lineStyle( 2, 0x000000 );
		previousButton.graphics.beginFill( 0x0000FF );
		previousButton.graphics.drawRect( 0, 0, 30, 30 );
		previousButton.buttonMode = true;
		previousButton.x = 75;
		previousButton.y = 330;
		previousButton.addEventListener( MouseEvent.CLICK, handlePrevious );
		addChild( previousButton );
		
		nextButton = new Sprite();
		nextButton.graphics.lineStyle( 2, 0x000000 );
		nextButton.graphics.beginFill( 0x0000FF );
		nextButton.graphics.drawRect( 0, 0, 30, 30 );
		nextButton.buttonMode = true;
		nextButton.x = 275;
		nextButton.y = 330;
		nextButton.addEventListener( MouseEvent.CLICK, handleNext );
		addChild( nextButton );
		
		songs = new Vector<String>();
		songs.push( 'brother' );
		songs.push( 'behindblueeyes' );
		songs.push( 'runner' );
		songs.push( 'toymaker' );
		
		songInfo = new Vector<String>();
		songInfo.push("Brother\nArtist: Stuck in the Sound\nAlbum: Pursuit\nYear: 2012");
		songInfo.push("Behind Blue Eyes\nArtist: The Who\nAlbum: Who's Next?\nYear: 1971");
		songInfo.push("Cloud Titans\nArtist: Petrified Productions\nAlbum: Runner 2 Soundtrack\nYear: 2013");
		songInfo.push("The Toymaker\nArtist: Oscar Araujo\nAlbum: Lords Of Shadow 2 Soundtrack\nYear: 2014");
		
		loadSong(currentSongId);
		
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		addEventListener( Event.REMOVED_FROM_STAGE, close );
		
		if ( Inventory.musicPlaying )
		{
			playButton.removeEventListener( MouseEvent.CLICK, handlePlay );
			stopButton.addEventListener( MouseEvent.CLICK, handleStop );
			pauseButton.addEventListener( MouseEvent.CLICK, handlePause );
			playButton.buttonMode = false;
			stopButton.buttonMode = true;
			pauseButton.buttonMode = true;
			playButton.alpha = 0.4;
			stopButton.alpha = 1;
			pauseButton.alpha = 1;
			
			currentSongId = Inventory.musicId;
			loadSong( Inventory.musicId );
			currentSongIsPlaying = true;
		}
	}
	
	private function close( e:Event )
	{
		removeEventListener( Event.REMOVED_FROM_STAGE, close );
		
		if ( currentSongIsPlaying )
		{
			Inventory.musicPlaying = true;
			Inventory.musicId = currentSongId;
		}
		else
		{
			Inventory.musicPlaying = false;
			Inventory.musicId = 0;
		}
	}
	
	private function handlePlay( e:MouseEvent )
	{
		playButton.removeEventListener( MouseEvent.CLICK, handlePlay );
		stopButton.addEventListener( MouseEvent.CLICK, handleStop );
		pauseButton.addEventListener( MouseEvent.CLICK, handlePause );
		playButton.buttonMode = false;
		stopButton.buttonMode = true;
		pauseButton.buttonMode = true;
		playButton.alpha = 0.4;
		stopButton.alpha = 1;
		pauseButton.alpha = 1;
		
		Inventory.musicChannel = currentSong.play();
		
		currentSongIsPlaying = true;
		
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.MUSIC ) );
	}
	
	private function handleStop( e:MouseEvent = null )
	{
		playButton.addEventListener( MouseEvent.CLICK, handlePlay );
		stopButton.removeEventListener( MouseEvent.CLICK, handleStop );
		pauseButton.addEventListener( MouseEvent.CLICK, handlePause );
		playButton.buttonMode = true;
		stopButton.buttonMode = false;
		pauseButton.buttonMode = false;
		playButton.alpha = 1;
		stopButton.alpha = 0.4;
		pauseButton.alpha = 0.4;
	
		Inventory.musicChannel.stop();
		
		currentSongIsPlaying = false;
		
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.MUSIC ) );
	}
	
	private function handlePause( e:MouseEvent )
	{
		if ( currentSongIsPlaying )
		{
			pausePosition = Inventory.musicChannel.position;
			Inventory.musicChannel.stop();
			currentSongIsPlaying = false;
		}
		else
		{
			Inventory.musicChannel = currentSong.play(pausePosition);
			currentSongIsPlaying = true;
		}
		
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.MUSIC ) );
	}
	
	private function handlePrevious( e:MouseEvent )
	{
		if ( currentSongIsPlaying )
		handleStop();
		
		if ( currentSongId == 0 )
		currentSongId = songs.length -1;
		else
		currentSongId--;
		
		loadSong( currentSongId );
		
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.MUSIC ) );
	}
	
	private function handleNext( e:MouseEvent )
	{
		if ( currentSongIsPlaying )
		handleStop();
		
		if ( currentSongId == songs.length - 1 )
		currentSongId = 0;
		else
		currentSongId++;
		
		loadSong( currentSongId );
		
		dispatchEvent( new PhoneUiEvent( PhoneUiEvent.MUSIC ) );
	}
	
	private function loadSong( id:UInt )
	{
		currentSong = Assets.getMusic( 'music/' + songs[id] + '.mp3', true );
		displaySongData( id );
	}
	
	private function displaySongData( id:UInt )
	{
		dataDisplay.text = songInfo[id];
	}
	
}