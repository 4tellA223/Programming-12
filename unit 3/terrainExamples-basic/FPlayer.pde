class FPlayer extends FBox{
   FPlayer(){
     super(gridSize,gridSize);
     setPosition(180,0);
     setRotatable(false);
      setFillColor(red);
   }
   void act(){
    handleInput();
    checkForCollisions();
   }
   void handleInput(){
     float vy = getVelocityY();
     float vx = getVelocityX();
     if(akey)setVelocity(-500,vy);
     if(dkey)setVelocity(500,vy);
     if(jumpkey)setVelocity(vx, -250);
   }
   void checkForCollisions(){
     ArrayList<FContact> contacts = getContacts();
       for(int i = 0;i < contacts.size();i++){
         FContact fc = contacts.get(i);
         if(fc.contains("spike"))setPosition(200,0);
         if(fc.contains("trampoline"))setRestitution(2);
         else setRestitution(0);
     }
   }
}
