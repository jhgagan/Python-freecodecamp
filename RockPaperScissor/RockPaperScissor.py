''' 
Objective of this program is to implement the Rock, Paper, and Scissors game
'''

## import the random library to help us automate the tast of the computer's choice
import random

# now we define a function and add the varible declaration into the function body
def get_choices():
    # list of all the possible options
    choices = ['rock', 'paper','scissor']
    
    # variable to hold the player's choice
    player_choice = input("Enter a choice (Rock, Paper, Scissor): ")

    # variable to hold the computer's choice
    computer_choice = random.choice(choices)

    choices = {"Player":player_choice, "Computer":computer_choice}
    # return the choices dictionary
    return choices

# random function used to explain the function calling
#def greeting():
#    return "Hi"

# call the get_choices function and store the values in a variable and print them
#choices = get_choices()
#print(choices)

'''
# calling the function greeting and assigning the return of the function to response
response = greeting()
print(response)
'''

# Check_win function
def Check_win(player, computer):
    if player == computer:
        return "Tie"
    elif (player == "rock" and computer == "scissor"):
        return "player wins"
    else:
        return "computer wins"