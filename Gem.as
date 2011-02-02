package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Image;

  public class Gem extends Entity
  {
    private var width_:Number;
    private var hieght_:Number;

    [Embed(source = 'assets/gem_1.png')] 
    private const GEM:Class;

    private var door:GemDoor;

    public function Gem(x_:Number,y_:Number,door_x:Number,door_y:Number)
    {
      x = x_
      y = y_

      width_ = 64;
      hieght_ = 64;
      
      door = new GemDoor(door_x,door_y);

      graphic = new Image(GEM);
    }

    public function shatter():void
    {
      x = 2000;//Very rubbish way of killing this
      y = 2000;
      
      door.shatter();
    }

    public function gem_door():GemDoor
    {
      return door;
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
	  shatter();
	  return true;
	}
      }
      return false;
    }
  }
}