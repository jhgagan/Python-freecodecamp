'''In this file we will be trying to implement the Blackjack game.'''
# import the necessary library
import random
  
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
            {"rank": "Q", "value" : 10},
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

# creating the instance of the deck class 
deck1 = Deck()
deck2 = Deck()

#shuffling deck2
deck2.shuffle()

# now we print the cards of the deck1 instance
print(deck1.cards)
# print the cards of deck2
print(deck2.cards)
