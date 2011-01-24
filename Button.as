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
    public var vel_x:Number;
    public var vel_y:Number;
    private var radius_:Number;

    private var rope_:Rope;
    private var collide_x:Boolean;
    private var collide_y:Boolean;

    private var constrained:Boolean;

    public function Button(rope:Rope) 
    { 
      graphic = new Image(PLAYER);
      old_x_ = x = 100;
      old_y_ = y = 100;

      vel_x = 1;
      vel_y = 0.4;
      
      radius_ = 10;
      rope_ = rope;

      collide_x = false;
      constrained = false;
    } 

    override public function update():void
    {
      old_x_ = x;
      old_y_ = y;
      if(constrained==false)
      {
	x = x+vel_x;
	y = y+vel_y;
      }

      collide_x = false;
      collide_y = false;
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

    public function set_centre(n_x:Number,n_y:Number):void
    {
      x = n_x-radius_;
      y = n_y-radius_;
    }

    public function constrain():void
    {
      constrained = true;
    }

    public function unconstrain(vel_x_:Number,vel_y_:Number):void
    {
      constrained = false;
      vel_x = vel_x_;
      vel_y = vel_y_;
    }

    public function radius():Number
    {
      return radius_;
    }

    public function flip_x():void
    {
      if(collide_x)
      {
	return;
      }
      x = old_x_;
      vel_x = -vel_x;
      collide_x = true;
      if(collide_y==false)
      {
	rope_.flip();
      }
    }

    public function flip_y():void
    {
      if(collide_y)
      {
	return;
      }
      y = old_y_;
      vel_y = -vel_y;
      collide_y = true;
      if(collide_x==false)
      {
	rope_.flip();
      }
    }

  } 
} 