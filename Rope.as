package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Image;

  public class Rope extends Entity
  {

    [Embed(source = 'assets/player.png')] 
    private const ROPE:Class;


    public function Rope()
    {
      graphic = new Image(ROPE);
    }


    public function setup():void
    {

    }

    public function kill():void
    {

    }
  }
}