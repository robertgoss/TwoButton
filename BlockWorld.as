package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.World; 
  import net.flashpunk.graphics.Backdrop;

  public class BlockWorld extends Entity
  {
    [Embed(source = 'assets/back_1.png')] 
    private const BLOCKWORLD_1:Class;

    private var blockArray:Array;

    private var lev_number:int;

    private var world_:World;

    public function BlockWorld(level_number:int,world:World)
    {
      lev_number = level_number;
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
      for(var i:int=0;i<blockArray.length;i++)
      {
	blockArray[i].collide_with(button);
      }
    }

    public function next_level():BlockWorld
    {
      return new BlockWorld(lev_number+1,world_);
    }


    public function level_1():void
    {
      graphic = new Backdrop(BLOCKWORLD_1,false,false);
      blockArray = new Array();
      //Bounds
      blockArray.push(new Block(10,230,20,460));
      blockArray.push(new Block(630,230,20,460));
      blockArray.push(new Block(320,470,640,20));
      //High Bounds
      blockArray.push(new Block(10,-1000,20,2000));
      blockArray.push(new Block(630,-1000,20,2000));
      blockArray.push(new Block(320,-1470,640,20));

      //Catcher
      blockArray.push(new Block(445,130,10,60));
      blockArray.push(new Block(505,130,10,60));
      blockArray.push(new Block(475,165,70,10));

    }

    public function level_2():void
    {
      graphic = new Backdrop(BLOCKWORLD_1,false,false);
      blockArray = new Array();
      //Bounds
      blockArray.push(new Block(10,230,20,460));
      blockArray.push(new Block(630,230,20,460));
      blockArray.push(new Block(320,470,640,20));
      //High Bounds
      blockArray.push(new Block(10,-1000,20,2000));
      blockArray.push(new Block(630,-1000,20,2000));
      blockArray.push(new Block(320,-1470,640,20));

      //Catcher
      blockArray.push(new Block(445,130,10,60));
      blockArray.push(new Block(505,130,10,60));
      blockArray.push(new Block(475,165,70,10));
    }
  }
}