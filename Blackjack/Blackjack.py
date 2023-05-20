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
    ]# suit = suits[2]
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
card = deal(1)[0]

# printing the card
print(card[0], card[1]["value"])
# # # printing the cards to check if they have been shuffled
# # print(cards)

# # deal a card from the deck and store it in a variable
# cards_dealt = deal(2)
# card = cards_dealt[0]
# # print the card
# print(card)

# # storing the rank of the card
# rank = card[1]

# # printing the rank of the card 
# print(f"Rank:{rank}")

# if(rank == 'A'):
#     value = 11
# elif(rank == 'J' or rank == 'Q' or rank == 'K'):
#     value = 10
# else:
#     value = rank

# # dictionary of rank and value
# rank_dict = {"rank":rank, "value":value}

# # prinitng the contents of the rank_dict
# print(rank_dict["rank"], rank_dict["value"])

