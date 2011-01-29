package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Backdrop;

  import net.flashpunk.utils.Input;

  public class Splash extends Entity
  {
    [Embed(source = 'assets/intro_1.png')] 
    private const INTRO:Class;

    [Embed(source = 'assets/vicotry_1.png')] 
    private const VIC:Class;

    private var wait:Boolean
    private var worl:ButWorld;

    public function Splash(type:String,world:ButWorld)
    {
      if(type=="INTRO")
      {
	graphic = new Backdrop(INTRO,false,false);
      }
      if(type=="VIC")
      {
	graphic = new Backdrop(VIC,false,false);
      }
      wait = false;
      if(Input.mouseDown)
      {
	wait = true;
      }
      worl = world;
    }

    override public function update():void
    {
      if(wait)
      {
	if(mouseDown == false)
	{
	  wait = false
	}
      }
      if(mouseDown==true and wait==false)
      {
	worl.reset();
	worl.remove(this);
      }
    }
  }
}