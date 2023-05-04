# Rock Paper Scissor Game 

In this part I will be noting down the things I understand from the course. 

First we created two variables to hold the player's choice and computer's choice, respectively. Next, we create a function get_choices and add the variable declarations in the function definition.

## How to define a variable?

There are two ways to define a variable in python. Let's have a look at the easier way to declare the variables first.

In this way we just write the name of the variable and then assign a value to it. 
This way Python will decide the appropriate datatype and assign it to the variable. But, make sure that the names of the variable is not the same as the key words or reserved words.

#### Syntax:
    player's choice = "rock"
    number = 1
    character = 'a'

In the second type we mention the datatype of the variable prior to the name of the variable. In this case it is not mandatory to assign a value to the variable at the time of creating the variable.

#### Syntax:
    int number = 0
    char character
    string words = "Random String"

## How to define a function in python?

We define the function using the syntax given below,

#### Syntax:

    def function_name(argumnets):
        body_of_the_function
        return (variable or leave it blank)

make sure to maintain the indendations carefully, in pythong the start and end of a code block is defined by the indendations. 

## How to call a function?
You can call the function by typing out the name of the function followed by the argumnet list enclosed between the paranthesis. If the function returns a value make sure to assign the function call to a variable.

#### Syntax:
    \# Function without a return value

    function()

    \# Function with a return value but without arguments list
    value = function()

    \# Funtion with a return value and arguments
    value = function(arg1, arg2)

## Datatype - Dictionaries

Dictionaries is a dataype in python that is used to store data values in a key, value pair format. The example given below will make the declaration and the concept more clearer.

#### Syntax:
    dict = {"Name":"Gagan", "Country":"India"}

### Accessing the elements of a Dictionary
To access an element of a dictionary we use the format given below,

#### Syntax:
    name = dict["Name"]
    country = dict["Country"]

dict[\"Name\"] statements returns the value of the key "Name" and dict[\"Country\"] statement returns the value of the key "Country"

Here, the "Name" is set to "Gagan" and "Country" is set to "India". "Name" and "Country" are the keys, and "Gagan" and "India" are the values. Values can also be a variable. 

After Leaning about the Dictionaries datatype it makes more sense to create a dictionary of choice with the key as "Player" and "Computer" with their corresponding values.

## User Input

Setting the values in the code is fine, But to be able to make a program more user friendly it need to be more interactive. To make the program more interactive and more dynamic we can also get the user's input.

### How to get the user input?

We can get the user's input using the input() function.

#### Syntax:

    player_choice = input("Enter a choice (Rock, Paper, Scissor): ")

In the above statement, the String that is provided as the argument to the input function gets printed to prompt the user to provide an input. Then the user's input is assigned to the variable player_choice.

## Importing Libraries, Creating Lists, and Calling Methods

This will be used to make sure that the computer is able to "randomly" (technically it is not really random) select one of the three choices (Rock, Paper, Scissors). We will be trying to do it using the Random library in python. 

To use a library in the program we first need to import it. This is done my using the statement below at the beginning of the program, before the main body of the program.

#### Syntax:
    import random

### Lists

A list in python is used to store multiple items in a single variable. Each element of the list is separeted by a comma.

#### Syntax:
    food = ['pizza', 'carrot', 'eggs']

Now, using the random library and passing the list as an argument to the function 'random.choice()' we can get a random element from the list as an output.

#### Syntax:
    dinner = random.choice(food)

Now, we can use the same to get a random choice from a list of 'rock', 'paper' ,and 'scissor' and assign it to the variable "computer_choice".

### Check_win() function:

Now, we define a "Check_win()" function to check if the computer won or the player won in that particular game. The function will take the player's choice and the computer's choice as its arguments.

## Conditional statements:

### If statement

This is use to do smarter options when you have a condition and the output or the procedure has to change based on the conditon's satifaction or dissatifaction. 

#### Syntax:
    if (condition 1):
        body 1
    elif (condition 2):
        body 2
    else:
        body 3

here the body 1 will execute only if the condition 1 is satisfied. If condition 1 is not satisfied but condition 2 is satisfied then body 2 will be executed. If both condition 1 or condition 2 is not satisfied then the body 3 will be executed.

### Refacotring statements:

Refactoring of the statements is done so that the result of the refactored code is unchanged but improves the readability of the code.

This can be done using the nested if statements

## String concatination:

One can contatinate two string using the '+' operator in python. 

example,
#### Syntax:
    print("String 1 "+" String 2")

This is output: String 1 String 2

## f-strings

This will help you make strings with variables and strings 

#### Syntax:
    age = 25
    print(f"Jim is {age} years old.")

Output for the above provided code will be:
Jim is 25 years old.


