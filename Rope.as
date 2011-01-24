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


    public function Rope()
    {
      graphic = new Image(ROPE);
      alive = false;
      rope_length = 0;
    }


    public function setup(button:Button):void
    {
      alive = true;
      x=Input.mouseX;
      y=Input.mouseY;
      var but_x:Number = button.centre_x();
      var but_y:Number = button.centre_y();
      rope_length = Math.sqrt((but_x-x)*(but_x-x) + (but_y-y)*(but_y-y));
    }

    public function kill():void
    {
      alive = false;
    }

    public function constrain(button:Button):void
    {
      if(alive)
      {
	var but_x:Number = button.centre_x();
	var but_y:Number = button.centre_y();
	var cur_length:Number = Math.sqrt((but_x-x)*(but_x-x) + (but_y-y)*(but_y-y));
	var ratio:Number = rope_length/cur_length;
	var new_x:Number = x + ((but_x-x)*ratio);
	var new_y:Number = y + ((but_y-y)*ratio);
	button.set_centre(new_x,new_y);
      }
    }
  }
}