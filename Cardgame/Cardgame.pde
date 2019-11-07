ArrayList<Card> cards;
String [] cardFile = 
  {"1C", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC", 
  "1D", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD", 
  "1H", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH", 
  "1S", "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS"};
Player player = new Player(1, 100, "Your");
Player dealer = new Player(-1, 1000-100, "Dealer's");

void setup() {
  size(1000, 500);

  //initiaiserer vores arraylist cards
  cards = new ArrayList<Card>();

  //laver 52 kort i vores arrayliste cards.
  for (int i=0; i<52; i++) {
    cards.add(new Card(cardFile[i]));
  }
}

void draw() {
  background(85, 107, 47);
  text("Push s to stop", width/2-100, 450);

  player.displayCards();
  player.displayPoints();

  dealer.displayPoints();
  dealer.displayCards();

  if (!player.drawMore) {
    if (dealer.totalPoints <= 16) {
      drawCard(dealer);
    } else {
      if (dealer.totalPoints < player.totalPoints && player.totalPoints <= 21) {
        winScreen("You win!");
      } else if (dealer.totalPoints <= 21 && player.totalPoints != 21) {
        winScreen("You lose");
      } else { 
        winScreen("It's a draw!");
      }
    }
  }
}

void winScreen(String s) {
  text(s, width/2-80, height/2);
}


void mousePressed() {
  drawCard(player);
}
void keyPressed() {
  if (key == 's') {
    player.drawMore = false;
  }
}

void drawCard(Player person) {
  if (person.drawMore && person.totalPoints < 21) {
    int x = (int) random(1, cards.size());
    Card c = cards.get(x);
    person.getCard(c);
    person.countPoints(c);
    cards.remove(x);
  }
}
