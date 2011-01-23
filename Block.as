package
{
  public class Block
  {
    private var x:Number;
    private var y:Number;
    private var width:Number;
    private var hieght:Number;

    public function Block(x_:Number,y_:Number,width_:Number,hieght_:Number)
    {
      x = x_
      y = y_
      width = width_/2;
      hieght = hieght_ / 2;
    }

    public function collide_with(button:Button):Boolean
    {
      var but_x:Number = button.centre_x();
      var but_y:Number = button.centre_y();
      var but_rad:Number = button.radius();
      if( (but_x+but_rad)>(x-width) && (but_x-but_rad)<(x+width) )
      {
	if( (but_y+but_rad)>(y-hieght) && (but_y-but_rad)<(y+hieght) )
	{
	  var but_old_x:Number = button.old_x();
	  var but_old_y:Number = button.old_y();
	  if( (but_old_x+but_rad)<=(x-width) || (but_old_x-but_rad)>=(x+width) )
	  {
	    button.flip_x();
	  }
	  if( (but_old_y+but_rad)<=(y-hieght) || (but_old_y-but_rad)>=(y+hieght) )
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