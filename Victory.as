package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Backdrop;

  import net.flashpunk.utils.Draw;

  public class Victory extends Entity
  {
    private var width_:Number;
    private var hieght_:Number;

    public function Victory()
    {
      x = 450;
      y = 140;
      width_ = 50;
      hieght_ = 20;
    }

    public function check_condition(button:Button):Boolean
    {
      var but_x:Number = button.centre_x();
      var but_y:Number = button.centre_y();
      var but_rad:Number = button.radius();
      if( but_x>x && but_x<x+width_ )
      {
	if( but_y>y && but_y<y+hieght_ )
	{
	  return true;
	}
      }
      return false;
    }

    override public function render():void
    {
      Draw.rect(x,y,width_,hieght_,0xFF4444,0.4);
    }
  }
}