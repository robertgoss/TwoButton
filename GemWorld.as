package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.World; 

  public class GemWorld
  {
    private var lev_number:int;
    private var gemArray:Array;

    public function GemWorld(level_number:int)
    {
      lev_number = level_number;
      gemArray = new Array();
      switch(lev_number)
      {
	case 0:
	  level_1();
	  break;
	case 1:
	  level_1();
	  break;
	case 2:
	  level_2();
	  break;
	default:
	  lev_number = 1;
	  level_1();
	  break;
      }
    }

    public function collide_with(button:Button):void
    {
      for(var i:int=0;i<gemArray.length;i++)
      {
	gemArray[i].collide_with(button);
	gemArray[i].gem_door().collide_with(button);
      }
    }

    public function next_level():GemWorld
    {
      var gemWorld:GemWorld = new GemWorld(lev_number+1);
      return gemWorld;
    }

    public function gems():Array
    {
      return gemArray;
    }

    public function level_1():void
    {

    }

    public function level_2():void
    {
      var gem:Gem = new Gem(420,435,445,80)
      gemArray.push(gem);
    }
  }
}