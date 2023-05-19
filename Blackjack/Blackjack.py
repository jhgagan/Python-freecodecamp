'''In this file we will be trying to implement the Blackjack game.'''
# import the necessary library
import random

# Shuffle function
def shuffle():
    random.shuffle(cards)
    return

# dealing cards
def deal(number):
    cards_dealt = []
    for x in range(number):
        cards_dealt.append(cards.pop()) 
    return cards_dealt

 # the variables
cards = []
suits = ["clubs", "spades", "hearts", "diamonds"]
ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q" , "K"]
# suit = suits[2]
# rank = 'K'
# value = 10

# # print the card rank that is assigned to the user
# print(f"your card is : {rank} of {suit}") 

# suits.append("snakes")

# # for loop to print each suit 
# for suit in suits:
#     print(suit)

# for loop to update the cards list with all possible combinations ranks and suits
for suit in suits:
    for rank in ranks:
        cards.append([suit, rank])
        
# # printing to check if all the possible combinations have been generated
# print(cards)

# shuffle the cards using the shuffle method of the random module
shuffle()

# # printing the cards to check if they have been shuffled
# print(cards)

# deal a card from the deck and store it in a variable
cards_dealt = deal(2)
card = cards_dealt[0]
# print the card
print(card)
