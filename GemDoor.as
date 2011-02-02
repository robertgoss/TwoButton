package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Image;

  public class GemDoor extends Entity
  {

    [Embed(source = 'assets/gem_wall.png')] 
    private const GEM_WALL:Class;

    private var hieght_:Number;
    private var width_:Number;

    public function GemDoor(x_:Number,y_:Number)
    {
      x = x_
      y = y_

      hieght_ = 34
      width_ = 64

      graphic = new Image(GEM_WALL);
    }

    public function shatter():void
    {
      x = 2000;//Very rubbish way of killing this
      y = 2000;
    }

    public function collide_with(button:Button):Boolean
    {
      var but_x:Number = button.centre_x();
      var but_y:Number = button.centre_y();
      var but_rad:Number = button.radius();
      if( (but_x+but_rad)>(x) && (but_x-but_rad)<(x+width_) )
      {
	if( (but_y+but_rad)>(y) && (but_y-but_rad)<(y+hieght_) )
	{
	  var but_old_x:Number = button.old_x();
	  var but_old_y:Number = button.old_y();
	  if( (but_old_x+but_rad)<=(x) || (but_old_x-but_rad)>=(x+width_) )
	  {
	    button.flip_x();
	  }
	  if( (but_old_y+but_rad)<=(y) || (but_old_y-but_rad)>=(y+hieght_) )
	  {
	    button.flip_y();
	  }
	  return true;
	}
      }
      return false;
    }
  }
}