class FPlayer extends FBox{
   FPlayer(){
     super(gridSize,gridSize);
     setPosition(200,0);
     setRotatable(false);
      setFillColor(red);
   }
   void act(){
     float vy = getVelocityY();
     if(akey)setVelocity(-500,vy);
     if(dkey)setVelocity(500,vy);
   }
}
