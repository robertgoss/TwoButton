package 
{ 
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Image;

  public class Button extends Entity 
  { 

    [Embed(source = 'assets/player.png')] 
    private const PLAYER:Class;

    private var old_x_:Number;
    private var old_y_:Number;
    private var collided:Boolean;

    public function Button() 
    { 
      graphic = new Image(PLAYER);
      old_x_ = x = 100;
      old_y_ = y = 100;
      collided = false;
    } 

    override public function update():void
    {
      old_x_ = x;
      old_y_ = y;
      collided = false;
      

      x = x+1;
      y = y+.4;
    }

    public function old_x():Number
    {
      return old_x_;
    }

    public function old_y():Number
    {
      return old_y_;
    }

    public function radius():Number
    {
      return 20;
    }

    public function flip_x():void
    {
      
    }

    public function flip_y():void
    {
      
    }

  } 
} 