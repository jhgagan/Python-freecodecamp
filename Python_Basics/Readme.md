# Python Basics:

In this section we will be learning the basis of the Python language. This includes Variables, Expressions and Statements, Comments, Data Types, Arithmetic Operators etc.

A list of all the topics and the respective time stamps is provided below, 
(Note: this content can be found in the Decription of the video)

⌨️ (0:43:52) Setup Python Locally\
⌨️ (0:47:47) Creating New Repl\
⌨️ (0:48:45) Variables  \
⌨️ (0:51:21) Expressions and Statements  \
⌨️ (0:52:38) Comments  \
⌨️ (0:54:23) Data Types  \
⌨️ (1:00:16) Operators  \
⌨️ (1:00:44) Arithmetic Operators  \
⌨️ (1:03:52) Comparison Operators  \
⌨️ (1:05:13) Boolean Operators  \
⌨️ (1:07:26) Bitwise Operators  \
⌨️ (1:07:42) is & in Operators  \
⌨️ (1:08:21) Ternary Operator  \
⌨️ (1:09:40) Strings  \
⌨️ (1:12:36) String Methods  \
⌨️ (1:16:41) Escaping Characters  \
⌨️ (1:19:23) String Characters & Slicing  \
⌨️ (1:21:45) Booleans  \
⌨️ (1:26:07) Number Data Types  \
⌨️ (1:28:19) Built-in Functions  \
⌨️ (1:29:50) Enums  \
⌨️ (1:32:51) User Input  \
⌨️ (1:34:39) Control Statements  \
⌨️ (1:36:48) Lists  \
⌨️ (1:46:21) Sorting Lists  \
⌨️ (1:49:57) Tuples  \
⌨️ (1:53:49) Dictionaries  \
⌨️ (2:01:45) Sets  \
⌨️ (2:06:10) Functions  \
⌨️ (2:16:57) Variable Scope  \
⌨️ (2:18:35) Nested Functions   \
⌨️ (2:21:37) Closures  \
⌨️ (2:22:59) Objects  \
⌨️ (2:26:27) Loops  \
⌨️ (2:32:01) Break and Continue  \
⌨️ (2:33:02) Classes  \
⌨️ (2:39:12) Modules  \
⌨️ (2:45:55) Arguments from Command Line  \
⌨️ (2:52:42) Lambda Functions  \
⌨️ (2:54:51) Map, Filter, Reduce  \
⌨️ (3:02:41) Recursion   \
⌨️ (3:04:42) Decorators  \
⌨️ (3:06:45) Docstrings  \
⌨️ (3:09:54) Annotations  \
⌨️ (3:11:30) Exceptions   \
⌨️ (3:17:09) With  \
⌨️ (3:18:26) Installing Packages with pip  \
⌨️ (3:21:39) List Compression  \
⌨️ (3:23:09) Polymorphism  \
⌨️ (3:24:23) Operator Overloading  

## Variables

Variables are used to store values of variety of types in python. The of the variable has to follow the rules given below, 

- It has to start with an alphabet.
- It cannot have any speacial charaters in it except for numericals and underscore(_)
- It should not be a reserved word of Python

### Examples

Some examples of valid variable names are given below

#### Syntax:
    name = "Gagan"
    country = "Indian"
    Phone_39 = "320*******"
    Phone_91 = "886*******"

Some examples of invalid variable names are given below

#### Syntax:
    name$$ = "Gagan"
    39_Phone  = "320*******"
    while = "While is a keyword"

Here, variable name$$ is invalid as it has a special symbol as part of it.
Variable 39_Phone is invalid as it starts with a number. Variable while is invalid as "while" is a keyword.

## Expression and Statements:

An expression is any code that returns an value.

### Example:

An examples of expressions are given below,

#### Syntax:
    1+1
    1*10/5+30

A statement is an operation on a value. The operation can be anything, Like printing the value or contatinating a value etc.

### Example:

An examples of statements are given below,

#### Syntax:
    name = "Gagan"
    print(name)

### Note:

You can add a semicolon (;) at the end of the pyhotn statement if you want but it will produce the same results even without it.

## Comments:

Everthing after a '#' is ignore by the compiler. So, comments can be used to write a description of the statement to make the program more readable.

#### Syntax:
    # This is a comment and this will not be read by the compiler
    Name = "Gagan:

### Note:
In python, unlike C++, C, java etc, indendation has meaning and you can indend the statements randomly.

## Datatype:

Python has several built in data types. You can check the datatype of a variable by using the type() function.

Some of the pre built datatypes of python are,
- complex for complex numbers
- bool for booleans
- list for lists
- tuple for tuples
- range for ranges
- dict for dictionaries
- set for sets
- int for integers
- float for floating type values

We can also use isinstance() function to compare the datatype of a variable.

#### Syntax:
    name = "Gagan"
    isinstance(name,str)

This statement should return true as the name variable contains a string

### Note:
Python automatically detects the type of the variable based on the value you assign to the varibale during the first declaration of the variable

But you can also create a variable of a specific type using a class constructor.

#### Syntax:
    number_float = float(2)
    number_int = int(2)
    number_string = str("2")

You can also convert from one data type to another using class constructor. This process is called casting. The conversion might not always work. We need to make sure that the types are atleast similar. 

Like a string can't be converted into a int. But float can be converted into an int(with the loss of decimal places)

#### Syntax:
    age = int(25.50)
    print(isinstance(age, int))

## Operators:

We have already seen assignment operators (=). There are many other types of operators like arithmatic operators, bitwise operators etc.

### Arithmatic Operators:

These operators are used to do basic mathematical operations.
some of them are mentioned below, 

- Addition +
- Subtraction -
- Multiplication *
- Division /
- Remainder %
- Exponent **
- Floor division // 
- Increment ++
- decrement --

Some of these operators can also be combined with assignment operator as given below,

#### Syntax:
    age = 8
    age += 10

    age -= 10

    age *= 10

    age /=10

### Comparison operators:

These operators are used to compare two quantities

- a == b # equal to
- a != b # not equal 
- a > b # Greater than
- a <= b # Less than or equal to

### Boolean operator

These operators return a '1' or '0' value. That can also be interpreted as the operators that return a 'True' or 'False' value.

These follow the same logic as the logic gates so, you can just refer to the truth table.

- and 
- or
- xor
- not

### Bitwise operator:
These operators are used to calculate the bitwise calculations on integers. 

- << - Left shift
- \>\> - Rigth shift
- & - Binary AND
- | - Binary OR
- ~ - Binary NOT
- ^ Binary XOR 

### Identity operator:
Identity operator ('is') returns 'True' if both its parameters are the same.

### Membership operator:
Membership operator ('in') returns 'True' if the first element is part of the second element.

### Ternary operator:
This helps define a condition in a quick way. The syntax is given below

#### Syntax:
    # Equivalent if else statement would look like this
    if age > 18 :
        return True
    else:
        return False
    
    # Equivalent Ternary operator 
    return True if age > 18 else False

## String 
A String in python is a series of characters enclosed in quotes("", '').

example,
"String 1", 'String 2'

#### Note: 

A string can be multi line if it is enclosed by 3 quotation marks at the start and end of the string. 

### Built in methods of string:

String has some built in methods to help handle strings in a easier way. Some of the commonly used ones are mentioned below. 

- .upper() - converts the string to lower case
- .lower() - converts the string to upper case
- .title() - converts the string to title case
- .islower() - checks if the string is made of all lower case letters
- .isalpha() - check if a string contrain only charaters and is not empty
- .isalnum() - check if a string contrains characters or digits and is not empty
- .isdecimal() - to check if a string contains digits and is not empty
- .startsswith() - to check if the string starts with a specific string
- .endswith() - to check if the string ends with a specific string
- .replace() - to replace a part of a string
- .split() - to split a string on a specific character separator
- .strip() - to trim the whitespace from a string
- .join() - to append new letters to a string
- .find() - to find the position of a substring

## Booleans

This is a data type that can only store either 'True' or 'False' as it's value. They can be used with conditional statements or as flags. 

Also, all the numbers except for '0' is considered to be true in python. All strings are true except empty string. All lists, dictionary are True except for if they are empty

### Any method:

This method returns 'True' if any of the values in it's parameters are 'True'. 

### All method:

This method returns 'True' only if all the argumnets passed to it are 'True'.

## Number data types:

We have already discussed about integers and floats.

### Complex:

Complex numbers are an extenstion of a familiar real numbers system. In complex number all the numbers are represented with a real number part and imaginary numbers part. the imaginary part is always suffixed with 'i' or 'j'.

Example of a complex number: 2 + 3j

#### Syntax:

    # declaring a number of a complex type in python 
    num = complex(2,3) # 2 + 3j

## Built in Functions:

### abs

This method returns the absolute value of the number passed as an argument.

### round

This method will round the argument to the nearest integer value. You can also set the second argument to specify the precision.

you can find more built in functions from the libraries

## Enum

Enumeration are readable names that are bound to a constant value. you can use enums by first importing the enum package

#### Syntax:
    from enum import Enum

    class State(Enum):
        INACTIVE = 0
        ACTIVE = 1

Enums is the only way to create constants in python.

## User Input

To get the input from the user you can use the input() function.

#### Syntax:
    age = input("What is your age?")
    print(f"Your age is {age}")

## Control statement:

These help us to write the program to take decisions. Some of the exmaples of control statements are, if...else, switch, ternary operator etc.

## Lists:

It is a essential python data structure. IT can be composed of various types of data. All the elements need not be of the same datatype.

You can also reference the items in the list  using index numbers. you can also have negative indexing to start checking from the last element of the list.

#### Syntax:
    dogs = ["Roger", 1, "Syd", True]

You can also slice a list using the ':' operator

#### Syntax:
    spliced_list = dogs[2:3]

If you leave the numbers before or after the ':' operator it will consider the start or end of the list for the missing value.

### Updating the list

You can update existing items in the list by using the indexing numbers.

#### Syntax: 
    dogs[2] = "Gunda"

### Appending elements into the list

You can also add new elements into the list using the append method.

#### Syntax:
    dogs.append("Judah")

### Merging two lists

You can merge two list using the extend method.

#### Syntax: 
    list_variable name.extend(new_list)

### Using += operator with lists

It will do the same thing as extend

#### Syntax:
    list_variable_name += new list

### Removing elements from the list

You can remove elements from the list using the remove method. You can also remove the last element of the list using the pop method. Pop method also returns the element that has been "popped".

#### Syntax:
    # using the remove method
    list_variable_name.remove("element")
    # using the pop method
    popped_element = list_variable_name.pop()

### Inserting elements to the list

You can add/insert the elements to random locations of the list using the insert method. You can also add multiple elements to the list at a random location on the list using slicing.

#### Syntax:
    # adding elements to random locations on the list
    list_variable_name.insert(index, "element_content")
    # adding multiple elements to the list
    list_variable_name[index_loaction:index_location] = list_to_be_inserted


## Sorting lists

Python has built in functions to sort a list. 

#### Note:
All the elements have to be of the same datatype for the sorting to work. Else, it will raise errors.

While sorting the string, the sort method orders the upper case words first and then ordered the lower case words. You can fix this by using the parameter key and setting it to str.lower.

#### Syntax:
    # default sorting
    list_variable_name.sort()
    # sorting while considering the upper case and lower case letters as the same
    list_varible_name.sort(key = str.lower)

#### Note: 
Sorting modifies the original list. So you will need to either run sorting on a copy of original or copy the original before sorting it. 

There is a method to sort the list without modifying the original list by using a global function called 'sorted'. The 'sorted' function need the list to be sorted as an argument and you can set the 'key' to 'str.lower' to get a more conventional sorting. 

#### Syntax:
    # sorting
    sorted_list = sorted(list_variable_name, key = str.lower)

## Tuples:

Tuples are a fundamental data structure of python. They allow us to create a immutable groups or objects. Immutable meaning, once an object is created it cannot be modified.

You can't add or remove items in a tuple.

You can use negative index like other datatypes and data structure of python. You can also find the number of elements in the tuple using the 'len' method.

#### Syntax:
    # creating the tuple
    names = ("Roger", "Syd")
    # getting the content of the tuple using index value
    print(names[0])

#### Note:
You can get the index value of a element in the tuple of list using the index method

##### Syntax: 
    # Index of an element from the tuple
    names.index("Roger")

### Sorting the contents of a tuple

You can sort the contents of a tuple using the global function "sorted". Note this using sorted will not modify the original argument.

#### Syntax:
    # sorting contents of the tuple
    sorted_tuple = sorted(names, key = str.lower)

### Combining tuples

You can combine two tuples to create a new tuple using the '+' operator.

#### Syntax:
    newTuple = names + ("Tina", "Quincy")