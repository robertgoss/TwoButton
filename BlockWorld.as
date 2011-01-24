package
{
  import net.flashpunk.Entity; 
  import net.flashpunk.graphics.Backdrop;

  public class BlockWorld extends Entity
  {
    [Embed(source = 'assets/back_1.png')] 
    private const BLOCKWORLD:Class;

    private var blockArray:Array;

    public function BlockWorld()
    {
      graphic = new Backdrop(BLOCKWORLD,false,false);
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

    public function collide_with(button:Button):void
    {
      for(var i:int=0;i<blockArray.length;i++)
      {
	blockArray[i].collide_with(button);
      }
    }
  }
}