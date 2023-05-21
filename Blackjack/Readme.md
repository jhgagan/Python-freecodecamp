# Blackjack Python Implementation

In this section, I will be following the video tutorial to try and implement the blackjack game. 

So first we create a variable called suit and set it to 'Hearts'. And then we create another variable rank and set it to equal 'K' for King, and then a variable called value and set it to equal 10.

We also need to store a list of containing the "Clubs", "Spades", "Hearts" and "Diamonds".

#### Sytnax:
    suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
    suit = 'Heart'
    rank = 'K'
    value = 10

Now we print the statement " Your card is : "

#### Syntax:
    print(f"Your card is : {rank}")

Add a for loop to the end of the code that prints each suit.

#### Syntax:
    for suit in suits:
        print(suit)

update the ranks variable to contains all the available ranks i.e., "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q" , "K".

#### Syntax:
    ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q" , "K"]

Create a empty cards list and fill it with all the possible combinations of suits and ranks using a nexted for loop.

#### Syntax:
    for suit in suits:
        for rank in ranks:
            cards.append([suit, rank])

For the blackjack game we need the cards to be shuffles and not ordered like it currently is. So, to shuffle the deck we can use the random library. Let's import the random library at the beginning of the code.

#### Syntax:
    import random

Now, to shuffle the cards in the list we can use the shuffle method from the random module.

#### Syntax:
    random.shuffle(cards)

Now, let's take a single card from the deck (Dealing a card from the deck of cards). We can do this by using the pop method. let us store the popped card in a variable named "card".

#### Syntax:
card = cards.pop()

Now let's make the code more cleaner. Let us move the shuffling part to a function called shuffle.

#### Syntax:
    def shuffle():
        random.shuffle(cards)
        return

Now let's create another function called deal that deals the card after shuffling

#### Syntax:
    def deal():
        card = cards.pop()
        return card

Now the deal function only returns one card. What if we wanted to deal more than one card. Let's account for this and make the necessary changes to the deal function. 

We first need to accept an argumnet and pop cards those many times.

#### Syntax:
    def deal(number):
        cards_dealt = []
        for i in range(0,number):
            cards_dealt.append(cards.pop()) 
        return cards_dealt

Let's also alter the code in the body of the program to print the first card in the cards_dealt list. 

#### Syntax:
    cards_dealt = deal(2)
    card = cards_dealt[0]   # Oth index element if the first element in the list
    print(card)

Now, let's separate out the rank part of the card.

#### Syntax:
    rank = card[1]

assign the rank for A to 11 and J, Q, K to 10

#### Syntax:
    if(rank == 'A')
    {
        value = 11
    }
    elif(rank == 'J' or rank == 'Q' or rank == 'K')
    {
        value = 10
    }
    else
    {
        value = rank
    }

    print(rank, value)

Now, we have to create a dictionary containing the key value pair of rank and value

#### Syntax:
    rank_dict = {"rank":rank, "value":value}

Now, we will refactor the previous code to get the value of each rank without using an if statement. Instead we will store both the rank name and value in the ranks list using dictionaries. We will update the rank list to a dictionary with rank and its corresponding value as the key, value pair.

#### Syntax:
    ranks = [
        {"rank": "A", "value" : 11},
        {"rank": "2", "value" : 2},
        {"rank": "3", "value" : 3},
        {"rank": "4", "value" : 4},
        {"rank": "5", "value" : 5},
        {"rank": "6", "value" : 6},
        {"rank": "7", "value" : 7},
        {"rank": "8", "value" : 8},
        {"rank": "9", "value" : 9},
        {"rank": "10", "value" : 10},
        {"rank": "J", "value" : 10},
        {"rank": "K", "value" : 10},
        {"rank": "Q", "value" : 10}
        ]

## Deck Class

Now, we create class to make the code more readable. We will be using class to model 3 parts of the game, namely, a card, a deck and a hand. 

So now we make a class in the beginning and put everything to that class.

Now, we create an instance of the deck class.

#### Syntax:
    class Deck:  
        def __init__(self):         
            # the variables of the class deck
            self.cards = []
            suits = ["clubs", "spades", "hearts", "diamonds"]
            ranks = [
                {"rank": "A", "value" : 11},
                {"rank": "2", "value" : 2},
                {"rank": "3", "value" : 3},
                {"rank": "4", "value" : 4},
                {"rank": "5", "value" : 5},
                {"rank": "6", "value" : 6},
                {"rank": "7", "value" : 7},
                {"rank": "8", "value" : 8},
                {"rank": "9", "value" : 9},
                {"rank": "10", "value" : 10},
                {"rank": "J", "value" : 10},
                {"rank": "K", "value" : 10},
                {"rank": "Q", "value" : 10}
                ]
            
            # for loop to update the cards list with all possible combinations ranks and suits
            for suit in suits:
                for rank in ranks:
                    self.cards.append([suit, rank])

        # Shuffle function
        def shuffle(self):
            random.shuffle(self.cards)
            return

        # dealing cards
        def deal(self, number):
            cards_dealt = []
            for x in range(number):
                card = self.cards.pop()
                cards_dealt.append(card) 
            return cards_dealt

## Card Class

Since a card is  separate concept from a deck, let's make a new card class that will capture the idea of the card. Let's construct a Class with a constructor that will assign the suit to "heart" and rank to "A". 

Now let's refactor the constructor of the Card class to take suit and rank and assign it to the memeber variables.

#### Syntax:
    class Card:
        def __init__(self, suit = "Heart", rank = "A"):
            self.suit = suit
            self.rank = rank

### __str__(self):

When a class has this method. It is called when a print is invoked by an object of this class. So we want a particular format.

#### Syntax:
    class Card:
        def __init__(self, suit = "Heart", rank = "A"):
            self.suit = suit
            self.rank = rank

        def __str__(self):
            return f"{self.rank["rank"]}  of {self.suit}"

Now we will change the constructor of Deck class to use an object of card class.

The chaged constructor syntax is as given below, 

#### Syntax:
    # constructor of the Deck class.
    def __init__(self):         
        # the variables of the class deck
        self.cards = []
        suits = ["clubs", "spades", "hearts", "diamonds"]
        ranks = [
            {"rank": "A", "value" : 11},
            {"rank": "2", "value" : 2},
            {"rank": "3", "value" : 3},
            {"rank": "4", "value" : 4},
            {"rank": "5", "value" : 5},
            {"rank": "6", "value" : 6},
            {"rank": "7", "value" : 7},
            {"rank": "8", "value" : 8},
            {"rank": "9", "value" : 9},
            {"rank": "10", "value" : 10},
            {"rank": "J", "value" : 10},
            {"rank": "K", "value" : 10},
            {"rank": "Q", "value" : 10}
            ]
        
        # for loop to update the cards list with all possible combinations ranks and suits
        for suit in suits:
            for rank in ranks:
                # here we are appending an object of Card class
                self.cards.append(Card(suit, rank))