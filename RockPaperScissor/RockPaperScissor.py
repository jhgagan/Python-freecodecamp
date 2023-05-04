''' 
Objective of this program is to implement the Rock, Paper, and Scissors game
'''

## import the random library to help us automate the tast of the computer's choice
import random

# now we define a function and add the varible declaration into the function body
def get_choices():
    # list of all the possible options
    choices = ['rock','scissor','paper']
    
    # variable to hold the player's choice
    player_choice = input("Enter a choice (Rock, Paper, Scissor): ")

    # variable to hold the computer's choice
    computer_choice = random.choice(choices)

    # creating a dictionary to store the player's choice and the computer's choice
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
# print the choices of the player and the computer
#    print("You chose: " + player +"\nComputer chose: " + computer)
# printing the choces of the player and the computer using the fstring commands
    print (f"You chose: {player} \nComputer chose: {computer}")

    #if player == computer:
    #    return "Tie"
    #elif ((player == "rock" and computer == "scissor") or 
    #      (player == "scissor" and computer == "paper") or
    #      (player == "paper" and computer == "rock")):
    #    return "player wins"
    #else:
    #    return "computer wins"
    
    ## Refactored if statements
    if player == computer:
        return "Tie"
    ## Player selects rock
    elif player == "rock" :
        if computer == "scissor":
            return "Rock smashes scissors! You wins"
        else:
            return "Paper covers rock! You lose"
    ## player selects scissors
    elif player == "scissor":
        if computer == "paper":
            return "Scissor cuts paper! You win"
        else:
            return "Rock smashers scissor! You lose"
    # player selects paper
    else:
        if computer == "rock":
            return "Paper covers rock! You win"
        else:
            return " Scissor cuts paper! You lose"

## getting the choice from the player and the computer
choices = get_choices()
## analysing the choices to determine the winner
result = Check_win(choices["Player"], choices["Computer"])
## printing the result
print(result)