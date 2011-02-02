package 
{ 
  import net.flashpunk.World; 
  import net.flashpunk.utils.Input; 

  public class ButWorld extends World 
  { 
    private var rope:Rope;
    private var button:Button;
    public var block_world:BlockWorld;
    public var gem_world:GemWorld;
    private var vic:Victory;

    public function ButWorld() 
    { 
      block_world = new BlockWorld(0,this);
      add(block_world);

      gem_world = new GemWorld(1);
      add_gems();

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
      block_world = block_world.next_level();
      gem_world = gem_world.next_level();
      add_gems();
      button.reset();
      rope.reset();
    }

    public function add_gems():void
    {
      var gemArray:Array = gem_world.gems();
      for(var i:int=0;i<gemArray.length;i++)
      {
	add(gemArray[i]);
	add(gemArray[i].gem_door());
      }
    }

    override public function update() : void
    {
      super.update();
      rope.constrain(button)
      block_world.collide_with(button);
      gem_world.collide_with(button);
      rope.set_length(button);
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