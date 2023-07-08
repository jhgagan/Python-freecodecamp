'''In this file we will be trying to implement the Blackjack game.'''
# import the necessary library
import random

# Card Class
class Card:
    def __init__(self, suit, rank ):
        self.suit = suit
        self.rank = rank

    def __str__(self):
        return f'{self.rank["rank"]} of {self.suit}'

# create a class deck to hold the 3 parts of the game, i.e., a card, a deck and a hand
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
                # here we are appending an object of Card class
                self.cards.append(Card(suit, rank))

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

# Hand class
class Hand:
    def __init__(self, dealer = False):
        self.cards = []
        self.value = 0
        self.dealer = dealer

    def add_card(self, card_list):
        self.cards.extend(card_list)

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
            
        # if not the dealer then we need to print the value of the hand
        if not self.dealer:
            print(f"Value: {self.get_value()}")
        # To print a blank line
        print()


# creating a deck of cards
deck = Deck()
# shuffle the deck of cards
deck.shuffle()

# create a hand object
hand = Hand()
# add 2 cards from the shuffled deck 
hand.add_card(deck.deal(2))
# print to check if the cards have been added to the hand.card variable
#print(hand.cards[0], hand.cards[1])
#print(f"value {hand.get_value()}")
hand.display()