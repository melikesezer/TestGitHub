package
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	//import flash.geom.Point;
	import flash.ui.Keyboard;
	
	import objects.Ball;
	import objects.Wall;
	
	public class Main extends Sprite
	{		
		private const rightWallPosX:Number = 400;
		private var wallL : Wall;
		private var wallR : Wall;
		private var ball : Ball;
		
		
		
		public function Main()
		{
			init();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedDown);
				stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function update(event:Event):void
		{
			addChild(wallR);
			addChild(wallL);
			
		}
		
		public function init():void
		{
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			wallL   = new Wall(0xFFFFFF);
			wallL.x = 0;
			wallL.y = 150;
			
			addChild(wallL);
			
			wallR   = new Wall(0xFFFFFF);
			wallR.x = rightWallPosX;
			wallR.y = 150;
			
			addChild(wallR);
			
			
			ball = new Ball();
			ball.x = 150;
			ball.y = 150;
			
			addChild(ball);
			
			
		}
		private function keyPressedDown(event:KeyboardEvent):void {
			var key:uint = event.keyCode;
			var step:uint = 5;
			
			switch (key) {
				case Keyboard.DOWN :
					wallR.y -= step;
					break;
				
				case Keyboard.UP :
					wallR.y += step;
					break;
				
				case Keyboard.W : 
					wallL.y -= step ;
					break;
				
				case Keyboard.S :
					wallL.y += step;
					break;
				
				
			}
		}
		
		
}}
