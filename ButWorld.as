package 
{ 
  import net.flashpunk.World; 
  import net.flashpunk.utils.Input; 

  public class ButWorld extends World 
  { 
    private var rope:Rope;
    private var button:Button;
    public var world:BlockWorld;
    private var vic:Victory;

    public function ButWorld() 
    { 
      world = new BlockWorld();
      add(world);

      rope = new Rope();

      button = new Button(rope);
      add(rope);
      add(button);

      vic = new Victory();
      add(vic);

      add(new Splash("INTRO",this));
    } 

    public function reset():void
    {
      button.reset();
      rope.reset();
    }

    override public function update() : void
    {
      super.update();
      rope.constrain(button)
      world.collide_with(button);
      if(Input.mousePressed)
      {
	rope.setup(button);
      }
      if(Input.mouseReleased)
      {
	rope.kill(button);
      }

      if(Input.mouseWheel)
      {
	rope.shorten(Math.min(0,Input.mouseWheelDelta))
      }

      if(vic.check_condition(button))
      {
	add(new Splash("VIC",this));
      }
    }
  } 
} 