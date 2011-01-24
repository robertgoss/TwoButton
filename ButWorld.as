package 
{ 
  import net.flashpunk.World; 
  import net.flashpunk.utils.Input; 

  public class ButWorld extends World 
  { 
    private var rope:Rope;
    private var button:Button;
    private var world:BlockWorld;

    public function ButWorld() 
    { 
      world = new BlockWorld();
      add(world);
      setupPhysics();

      button = new Button()
      add(button);

      rope = new Rope()
      add(rope);
    } 

    public function setupPhysics() : void
    {

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
	rope.kill();
      }
    }
  } 
} 