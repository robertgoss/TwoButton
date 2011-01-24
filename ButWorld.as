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

      rope = new Rope();

      button = new Button(rope);
      add(button);

      add(rope);
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
    }
  } 
} 