float lastWater;
float lastFood;
class TileType
   {
     static final int Food = 1, Grass = 2, Water = 3;
    
   }
   int creatureX = 1;
   int creatureY = 0;
   
   
public class Tiles
{
  float Food;
  int TileType;
  public Tiles(int tileType,float food)
  {
    Food = food;
    TileType = tileType;
  }
}
class Render
{
  public Tiles[][] MapLayout;
  int[] RenderPos = 
  {
    4,20,36,50
  };
  public void PassLayout()
  {
    creature.CollectResources(MapLayout); //<>//
  }
  public void InitLayout()
  {
    MapLayout = new Tiles[][]
   {
    //                     0,                   1,                       2,                           3
       {new Tiles(TileType.Grass,0),new Tiles(TileType.Food,5),new Tiles(TileType.Grass,0),new Tiles(TileType.Grass,0)}, //0,
       {new Tiles(TileType.Food,5),new Tiles(TileType.Grass,0),new Tiles(TileType.Grass,0),new Tiles(TileType.Grass,0)}, //1,
       {new Tiles(TileType.Grass,0),new Tiles(TileType.Water,0),new Tiles(TileType.Grass,0),new Tiles(TileType.Grass,0)}, //2,
       {new Tiles(TileType.Grass,0),new Tiles(TileType.Grass,0),new Tiles(TileType.Grass,0),new Tiles(TileType.Grass,0)}  //3
   };
   
  }
  public void renderTile(int y, int x, int tileX, int tileY)
   {
     int tile = MapLayout[x][y].TileType; //<>//
     switch(tile)
     {
       case 1: // Food
         fill(200, 35, 35);
         rect(tileX+300, tileY, 16, 16);
         break;
       case 2: // Grass
         fill(105, 198, 116);
         rect(tileX+300, tileY, 16, 16);
         break;
       case 3: // Water
         fill(128, 192, 214);
         rect(tileX+300, tileY, 16, 16);
         break;
       default:
         fill(0, 0, 0);
         rect(tileX+300, tileY, 16, 16);
         break;  
     }
   }
   public void renderMap()
   {
        renderTile(0,0,RenderPos[0],RenderPos[0]);  renderTile(1,0,RenderPos[1],RenderPos[0]);  renderTile(2,0,RenderPos[2],RenderPos[0]); renderTile(3,0,RenderPos[3],RenderPos[0]);  //Render 1st row of tiles (index [0-3,0] on tile array)
       renderTile(0,1,RenderPos[0],RenderPos[1]); renderTile(1,1,RenderPos[1],RenderPos[1]); renderTile(2,1,RenderPos[2],RenderPos[1]); renderTile(3,1,RenderPos[3],RenderPos[1]); //Render 2nd row of tiles (index [0-3,1] on tile array)
       renderTile(0,2,RenderPos[0],RenderPos[2]); renderTile(1,2,RenderPos[1],RenderPos[2]); renderTile(2,2,RenderPos[2],RenderPos[2]); renderTile(3,2,RenderPos[3],RenderPos[2]); // Render 3rd row of tiles (index [0-3],2] on the array)
       renderTile(0,3,RenderPos[0],RenderPos[3]); renderTile(1,3,RenderPos[1],RenderPos[3]); renderTile(2,3,RenderPos[2],RenderPos[3]); renderTile(3,3,RenderPos[3],RenderPos[3]); // Render 4th row of tiles (index [0-3],3] on the array)
   }
   public void renderCreature()
   {
       fill(0, 0, 0);
       float x = (float) RenderPos[creatureX];
       float y = (float) RenderPos[creatureY];
       rect(x+303,y+3,10,10);
   }


}
class Creature
{  
  float food = 7;
  float water = 40;
  int speed = 4;
  int canMove;
   public void CollectResources(Tiles[][] mapLayout)
   {
    if(mapLayout[creatureY][creatureX].TileType == 1)
     {
       if(mapLayout[creatureY][creatureX].Food > 1)
       {
       food += 3.5;
       }
       mapLayout[creatureY][creatureX].Food -= 1;
     }
     else if(mapLayout[creatureX][creatureY].TileType == 3)
     {
       water += 3.9;
     }
   }
   public int[] sendInput(Tiles[][] layout, int x, int y)
   {
       // Each value is getting a tile value (this value represents the type of tile it is)
     int below = layout[x][y].TileType;
     int upLeft = layout[x-1][y+1].TileType;
     int up = layout[x][y+1].TileType;
     int upRight = layout[x+1][y+1].TileType;
     int left = layout[x-1][y].TileType;
     int right = layout[x+1][y].TileType;
     int downLeft = layout[x-1][y-1].TileType;
     int down = layout[x][y-1].TileType;
     int downRight = layout[x+1][y-1].TileType;
     if (updates % 4 == 0)
     {
       canMove = 1;
     }
     else
     {
       canMove = 0;
     }
     int[] toSend = {below,upLeft,up,upRight,left,right,downLeft,down,downRight,canMove};
     return toSend;
   }
   public boolean changeValues()
   {
     food -= 2.3;
     water -= 2.7;
     foodDif = lastFood - food;
     waterDif = lastWater - water;
     if (water == 0 || food == 0)
     {
       return false;
     }
     else
     {
       lastFood = food - 2.3;
       lastWater = water - 2.7;
       return true;
     }
   }
  }