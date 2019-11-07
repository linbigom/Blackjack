class Card{
  PImage cardImage;
  int cardX;
  int cardY = height/2;
  String value;
    
  Card(String value){
    this.value = value;
    cardImage = loadImage(this.value+".png");
  }
  void display() {
    imageMode(CENTER);
    image(cardImage, cardX, cardY,130,200);
  }
}
