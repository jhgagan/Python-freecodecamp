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

## Hand class:

This will represent a hand in the game. 

Now, we create a hand class with an constructor and then we initialse a variable card that is set to an empty list. 

In this game we will have a human controlled player and a program controlled dealer. So, let us a dealer parameter in the init constructor of the hand and when a hand object is created the dealer is set to true, else it is falsemethod in the hand class that will be

Now, let us add an add card method. The method should take a list as a parameter. 

#### Syntax:
    class hand:
        def __init__(self, dealer):
            self.cards = []
            self.value  = 0
            dealer = True
        
        def add_card(self, card_list):
            self.cards.extend(card_list)

Now to test if the above code is working we use the code below, 

#### Syntax:
    # creating a deck of cards
    deck = Deck()
    # shuffle the deck of cards
    deck.shuffle()

    # create a hand object
    hand = Hand()
    # add 2 cards from the shuffled deck 
    hand.add_card(deck.deal(2))
    # print to check if the cards have been added to the hand.card variable
    print(hand.cards[0], hand.cards[1])

Now, we will add the ability to calculate the value of a hand. Let's create method called  calculate_value, and in the method we will set the value to 0 initially.

Now, let's loop through the cards and calculate the value in hand by adding the values to the self.value variable.

The value of Ace can either be 1 or 11 based on the situation. So, to tackle this situation first we need to check if the hand has a Ace.

If the hand has ace then we check if the total value is greater than 21, if it is greater than 21 we subtract 10 from it.

We will also create a method, get_value(), to return the value of the cards in hand.

The is_blackjack() method checks if the total value in hand is equal to 21.

The display(self) method displays the dealer's and the player hand.

#### Syntax:
    def calculate_value(self):
        self.value = 0
        #since has_ace is a local variable we don't need to use "self."
        has_ace = False

        for card in self.cards:
            # getting the card value and making sure the value is an integer
            card_value = int(card.rank["value"])
            # adding the value of the card 
            self.value+=card_value
            # checking if the rank is ace
        if card.rank["rank"] == "A":
            has_ace = True
            
        #checking if the total value is greater than 21
        if self.value > 21 and has_ace:
            # reasigning the value of ace to 1 from 11
            self.value-=10
            
    def get_value(self):
        self.calculate_value()
        return self.value

    def is_blackjack(self):
        return self.get_value() == 21

    def display(self):
        # this will print "Dealer's hand" or "Your hand" based on what self is
        print(f'''{"Dealer's" if self.dealer else "Your"}hand:''')
        # A for loop to print out all the cards
        for card in self.cards:
            print(card)

        # if not the dealer then we need to print the value of the hand
        if not self.dealer:
            print(f"Value: {self.get_value()}")
        # To print a blank line
        print()

When you are playing blackjack you don't get to see everyone else's card. So, when the dealer's cards are printed during the game, only the seond one should display. The first one should display as hidden. 

In out game, at the end all the card in the dealer's hand will be displayed. So, let us introduce a new parameter for the display method. The display method with these changes is given below,

#### Syntax:
    def display(self, show_all_dealer_Card = False):
        # this will print "Dealer's hand" or "Your hand" based on what self is
        print(f'''{"Dealer's " if self.dealer else "Your "}hand:''')
        # A for loop to print out all the cards
        for index, card in enumerate(self.cards):
            # the back slash means that the syntax is continued in the next line
            if index == 0 and self.dealer \
            and not show_all_dealer_Card and not self.is_blackjack:
                print("Hidden")
            else:
                print(card)

