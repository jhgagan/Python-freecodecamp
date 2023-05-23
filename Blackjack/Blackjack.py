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