package 
{ 
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Image;

  public class Button extends Entity 
  { 

    [Embed(source = 'assets/button.png')] 
    private const PLAYER:Class;

    private var old_x_:Number;
    private var old_y_:Number;
    private var vel_x:Number;
    private var vel_y:Number;
    private var radius_:Number;

    public function Button() 
    { 
      graphic = new Image(PLAYER);
      old_x_ = x = 100;
      old_y_ = y = 100;

      vel_x = 1;
      vel_y = 0.4;
      
      radius_ = 10;
    } 

    override public function update():void
    {
      old_x_ = x;
      old_y_ = y;

      x = x+vel_x;
      y = y+vel_y;
    }

    public function old_x():Number
    {
      return old_x_+radius_;
    }

    public function old_y():Number
    {
      return old_y_+radius_;
    }

    public function centre_x():Number
    {
      return x+radius_;
    }

    public function centre_y():Number
    {
      return y+radius_;
    }

    public function radius():Number
    {
      return radius_;
    }

    public function flip_x():void
    {
      x = old_x_;
      vel_x = -vel_x;
    }

    public function flip_y():void
    {
      y = old_y_;
      vel_y = -vel_y;
    }

  } 
} 