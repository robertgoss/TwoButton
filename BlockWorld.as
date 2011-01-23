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
      blockArray.push(new Block(320,470,320,20));
      //High Bounds
      blockArray.push(new Block(10,-1000,20,2000));
      blockArray.push(new Block(630,-1000,20,2000));

      //Catcher
      blockArray.push(new Block(445,130,10,60));
      blockArray.push(new Block(505,130,10,60));
      blockArray.push(new Block(475,165,70,10));
    }
  }
}