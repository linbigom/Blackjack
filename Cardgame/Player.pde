class Player {
  ArrayList<Card> drawnCards;
  int pointOfCard;
  int totalPoints;
  PFont font;
  boolean drawMore = true;
  int direction;
  int startX;
  String playerName;

  Player(int direction, int startX, String playerName) {
    drawnCards = new ArrayList<Card>();
    this.direction = direction;
    this.startX = startX;
    this.playerName = playerName;
  }

  void displayCards() {
    for (Card c : drawnCards) {
      c.display();
    }
  }

  void countPoints(Card drawnCard) {
    String points;
    points = drawnCard.value;

    String[] withoutColor = (splitTokens(points, "[CHDS]"));

    if ((withoutColor[0].equals("J"))||(withoutColor[0].equals("Q"))||(withoutColor[0].equals("K"))) {
      pointOfCard = 10;
    } else {
      pointOfCard = Integer.parseInt(withoutColor[0]);
    }
    totalPoints += pointOfCard;
    println(totalPoints);
  }
  void getCard(Card drawnCard) {
    drawnCard.cardX = startX+130/2*drawnCards.size()*direction;
    drawnCards.add(drawnCard);
  }
  void displayPoints() {
    textSize(25);
    //font = loadFont("BritannicBold-48.vlw");
    //textFont(font);
    if (direction == -1) {
      text(playerName + " total points:  " + totalPoints, startX-260, 60);
      int pointsTill21 = 21-totalPoints;
      text("Points untill 21:  " + pointsTill21, startX-260, 110);
    } else {
      text(playerName + " total points:  " + totalPoints, startX, 60);
      int pointsTill21 = 21-totalPoints;
      text("Points untill 21:  " + pointsTill21, startX, 110);
    }
  }
}
