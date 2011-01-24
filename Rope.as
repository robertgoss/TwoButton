package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Image;

  import net.flashpunk.utils.Input;

  public class Rope extends Entity
  {

    [Embed(source = 'assets/player.png')] 
    private const ROPE:Class;

    private var alive:Boolean;
    private var rope_length:Number;

    private var angle:Number;
    private var angle_vel:Number;

    public function Rope()
    {
      graphic = new Image(ROPE);
      alive = false;
      rope_length = 0;
    }


    public function setup(button:Button):void
    {
      x=Input.mouseX;
      y=Input.mouseY;
      var but_x:Number = button.centre_x();
      var but_y:Number = button.centre_y();
      if(x==but_x && y==but_y)
	return
      alive = true;
      var diff_x:Number = but_x-x;
      var diff_y:Number = but_y-y;
      rope_length = Math.sqrt(diff_x*diff_x + diff_y*diff_y);
      button.constrain();
      angle = Math.atan2(diff_x,diff_y)
      diff_x = diff_x+button.vel_x;
      diff_y = diff_y+button.vel_y;
      angle_vel = Math.atan2(diff_x,diff_y)-angle;
    }

    public function kill(button:Button):void
    {
      alive = false;
      var but_x:Number=Math.sin(angle)*rope_length;
      var but_y:Number=Math.cos(angle)*rope_length;
      var but_vel_x:Number=Math.sin(angle+angle_vel)*rope_length - but_x;
      var but_vel_y:Number=Math.cos(angle+angle_vel)*rope_length - but_y;
      button.unconstrain(but_vel_x,but_vel_y);
    }

    public function constrain(button:Button):void
    {
      if(alive)
      {
	angle = angle+angle_vel;
	var but_x:Number = (Math.sin(angle)*rope_length)+x;
	var but_y:Number = (Math.cos(angle)*rope_length)+y;
	button.set_centre(but_x,but_y);
      }
    }

    public function flip():void
    {
      angle_vel = -angle_vel;
    }
  }
}