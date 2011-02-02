package
{
  public class Door
  {
    private var x:Number;
    private var y:Number;
    private var width:Number;
    private var hieght:Number;

    [Embed(source = 'assets/gem_wall_1.png')] 
    private const GEM_WALL:Class;

    public function Door(x_:Number,y_:Number,width_:Number,hieght_:Number)
    {
      x = x_
      y = y_
      width = width_/2;
      hieght = hieght_ / 2;

      graphic = new Image(GEM_WALL);
    }

    public function shatter():void
    {
      //TODO
    }
  }
}