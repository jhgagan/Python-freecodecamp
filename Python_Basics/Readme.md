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

## Dictionaries 

It is another important data structure of python. While list allows us to create a collection of values, dictionaries allows us to create a collection of key:value pairs. 

We already discussed dictionaries while creating the Rock, Paper, and Scissor game.  

Dictionaries contain a key and a corresponding value to the key. The example below will make it more clearer.

#### Syntax:
    # Creating the dictionary
    dog = {"name":"Roger", "age": 8}

The key can be any immutable value such as a string, number etc. Same hold true for the value as well.  It can be of any basic data type.

In the above mentioned example, "name" and "age" are the key values and, "Roger" and 8 are the values of the corresponding key value.

### Accessing the values in the dictionary:

You can access the values in the dicitonary similar to the way you access contents in an array 1D array.

#### Note:
A simple analogy for understanding dictionaries. You can think of a dictionary as a 1D array in which you can name the index's and reference the value of the array using the named index instead of the numerical index value.

### "get" method to access the key-value pair:

You can also access the content of the dictionary using the "get" method. 

##### Advantages of using "get" method:

- You can assign a default value if you find out that the key you are looking for in the dictionary doesn't exist. The example is given below

#### Syntax:
    # using the get method to read through the contents of the dictionary
    print("name"+dog.get("name"))
    # assigning a default value to a key from the get method
    print(dog.get("color", "brown"))

Here the dog.get("color", "brown") will return the "color" value from the dictionary. But, if it doesn't exist then the default value "brown" will be returned.

You can also use pop method to retried a key value pair from the dictionary and delete it from the dictionary at the same time. 

#### Syntax:
    # Poping the "name" key value pair
    print(dog.pop("name"))
    # Printing the dog dictionary to see the changes
    print(dog)

### "popitem" method

This method can be used to retrieve the last key-value pair inseted into the dictionary. Note that the "popitem" item method returns the key value pair as a tuple.

#### Syntax:
    # using the popitem function
    print("last item: "+str(dog.popitem()))

### Checking for a key in a dictionary

You can check if there is a specific key in the dictionary using the "in" opertor. 

#### Syntax:
    # Checking if there is a "color" in dog dictionary
    print("color" in dog)

### Getting a list of all the keys in a dictionary

Yoi can get a list containing all the keys of the dictionary using the keys method.

#### Syntax: 
    # print a list containing the keys of the dictionary
    print(dog.keys())

### Getting a list of all the values in a dictionary

Similar to getting a list of all the keys in the dictionary, you can also get a list of all the values in the dictionary using the values method.

#### Syntax
    # print a list of all the values of the dictionary
    print(dog.values())

### Getting a list of all the items in a dictionary

You can get a list of all the items in a dictionary using the items method.

#### Syntax:
    # creating a list of all the items in a dictionary
    print(list(dog.items()))

#### Note: 
You can find the length of the list using the len() method.

### Adding a key value pair to the dictionary

You can add new key-value pair to existing dictionary using the following syntax.

#### Syntax:
    # adding a new key-value pair to the dictionary
    dog["food"] = "Meat"

### Deleting a key value pair from the dictionary

You can delete a key-value pair from the dictionary using the del method. The syntax to use the method is given below.

#### Syntax:
    # delete the key-value pair with key "color"
    del dog['color']

### Copy dictionary

You can also create copies of the dictionary using the copy method. The syntax for it is given below.

#### Syntax:
    # copying the dog dictionary to dogCopy
    dogCopy = dog.copy()

## Sets

This is another important data structures of python. They are similar to tuples, but they aren't ordered and they are mutable, meaning they can be changed. They also have an immutable version called frozen set.

In some ways, they are dictionares without keys.

### Creating a set

You can create a set using the syntax given below.

#### Syntax:
    names = {"Roger", "Syd"}

### Intersection of two sets:

As we would have learnt in set theroy, intersection of two sets is the terms that are common in both the sets. The intersection of two sets is performed using '&' operator.

You can perform this operation using the syntax given below.

#### Syntax:
    # creating two sets to give a example intersection
    set1 = {"Roger", "Syd"}
    set2 = {"Roger"}
    # intersection of the above two sets is done using this statement.
    intersect = set1 & set2
    # the term common to both the sets is "Roger" so that should be the output

### Union of two sets:

We can also perfrom the union of two sets. The "|" is used to perform the union operation. This operation is achieved using the syntax provided below.

#### Syntax:
    # creating two disjoint sets to better explain the union
    set1 = {"Roger", "Syd"}
    set2 = {"Gunda", "Tommy"}
    # Union of two sets
    union = set1 | sets 2

### Difference of two sets:

We can perform the difference of two sets using the '-' operator. The difference of two sets is a set of the terms that is present in the first set but not in the second set.

The syntax for this operation is given below.

#### Syntax:
    # Ceating two sets
    set1 = {"Roger", "Syd"}
    set2 = {"Roger"}
    # Difference of two sets
    diff = set1 - set2

### Super-set or Sub-set Check

You can also check if a set is super-set or sub-set of another set.

A set is called the super set of another if it contains all the terms present in the second set and more.

The syntax to perform this operation is given below.

#### Syntax:
    # Ceating two sets
    set1 = {"Roger", "Syd"}
    set2 = {"Roger"}
    # Super-set check
    super_set= set1 > set2
    # Here the set1 contains all the elements preset in set 2, so it is the super-set.


A set is called a sub set of another if it only contains the terms that are present in another set.

The syntax to perform this operation is given below.

#### Syntax:
    # Ceating two sets
    set1 = {"Roger", "Syd"}
    set2 = {"Roger"}
    # Sub-set check
    sub_set= set2 < set1
    # Here the set2 contains only the elements preset in set 1, so it is the sub-set.

#### Note: 
- You can also count the number of terms in a set using the len() function.
- You can also get a list of the elements in the set by passing the set to the (list) constructor
- You can if an item is contained in the set using the 'in' operator

All the elements of the set are unique. You will not have copies of the terms in a set.

### Functions:

Functions help us write a set of instructions that we can run when we need, any number of times. Using functions makes is a lot easier to read and reuse repetitive code with ease.

Functions can also accept one or more parameters.

Some terms to note while we discuss about the funtions,
- function definition - This is the part where the set of instructions/statements of the function are defined. This is usually done before you call a function. 
- function call - This is how you run the function within the main code. The function call is done by mentioning the name of the function with its argumnets list as given below, 

#### Syntax:
    function_name(arguments)


The syntax for the definition of a function is given below.

#### Syntax:
    # Function definition
    def hello():
        # body of the function
        print('Hello!')

    # function call 
    hello()

### Funtion with parameter/s:
Function can accept a variety of parameters. The data of parameters has to be the same as in the function definiton. 

An example of a function with a parameter is given below.

#### Syntax:
    # Function that accepts a parameter.
    def hello(name): # 'name' is called an argument here
        # body of the function
        print('Hello!' + name)

    # function call 
    hello("Roger") # "Roger" is called a parameter

An argument can have a default value, so that if no value is passed the default value will be used.

The syntax for this is given below, 

#### Syntax:
    # Function that accepts a parameter.
    def hello(name = "my friend"): # 'name' is called an argument here
        # body of the function
        print('Hello!' + name)

    # function call 
    hello("Roger") # "Roger" is called a parameter  

We can also accept multiple parameters. The syntax and explaination for this is given below.

#### Syntax:
    # Function that accepts parameters.
    def hello(age, name = "my friend"): # 'name' is called an argument here
        # body of the function
        print('Hello!' + name + ", You are "+ str(age)+ "Years old")

    # function call 
    hello(10, "Roger") # "Roger" is called a parameter  
    hello(10)

### Note:

Parameters are passed by reference, What does that mean?
It means that if you pass a (immutable) variable to a function and you modify the value of the variable in the function. The modifications done on the variable will not be valid outside the function. 

The explanation of mutability and immutability along with a list of the datatypes of each category can be found in this link - https://realpython.com/python-mutable-vs-immutable-types/#:~:text=Python%20has%20both%20mutable%20and,dictionaries%2C%20and%20sets%20are%20mutable.

The code snippet below will be an example to the explaination above.
#### Syntax:
    def change(num):
        num = 2
        print(f"Changed value = {num}")
    
    num = 1
    change(num)
    print(f"value of num = {num}")

### Returning a value from a function

A function can also return value/s. This is performed using the 'return' statement. 

#### Note: 
If there is any statements after the return statements, they will not be executed. 

#### Syntax:
    #Function definition
    def hello(name):
        if not name:
            return
        print(f"Hello {name}!")
    
    hello("Beau")

    # Function that returns a value:
    def return_value(name):
        print(f"Hello {name}!")
        return name, "Beau", 8

    # Printing the retured value
    print(hello("Syd"))
    # storing the returned value in variables
    ret_name, ret_name2, ret_val = return_value("Syd")

## Variable Scope:

When you declare a variable, the visibility of the variable in different parts of the code varies on a variety of factors. for exmaple, a variable declared inside the function body is not necessarily visible outside the body of the function. But it is possible to make it be visible to the code outside the body of the function by declaring it as a global variable.

This is to be noted as this can at time cause semantic errors. (Semantic errors - The syntax will not necessarily raise an error but you might not get the desired output as the meaning of the code is different.)

## Nested Funtion

Functions in python can be nested inside other functions. This function that is declared inside a function is only visible wihtin that function.

An example of nested function is given below, 

#### Syntax:
    # Function definition
    def talk(phrase):
    # nexted function definition
        def say(word):
            print(word)
        
        words = phrase.split(' ')
        # Loops will be explained at a later stage
        for word in words:
            say(word)
    
    talk('I am going to buy milk')


#### Note: 
if you want to access the variable that is declared within in the function but not inside the nested function, then you have to use 'nonlocal' before the varibale name when using it for the first time within the nested function. 

An example of the above scenario is exmplained below,

#### Syntax:
    def count():
        count = 0

        def increment():
            nonlocal count
            count = count + 1
            print(count)

        increment()

    count()

## Closures

This is an inner function object, a function that behaves like an object, that remembers and has access to variables in the local scope in which it was created even after the outer function has finished executing.

An example for this is given below,

#### Syntax:
    def counter():
        count = 0

        def increment():
            nonlocal count
            count = count + 1
            return count

        # here we are returning the nested function like it is a variable
        return increment

    increment = counter()

    # when you run this you will notice that the count value keep increasing after each call even though 
    # count value is to be reset to 0 when counter function is directly called
    print(f"Increment 1:{increment()}")
    print(f"Increment 2:{increment()}")
    print(f"Increment 3:{increment()}")

## Objects

Everything in python is an object. Even values of basic primitive types, like integers, string , floats, list,tuples, etc. Objects have attributes and methods. They can be accessed using the (.) dot syntax.

#### Syntax:
    # age is created as areal number so it has both a real part and an imaginary part
    age = 8
    print(age.real)
    print(age.imag)
    # you can also get the bit length of the variable age
    print(age.bit_length)

A variable holding a list value has access to a different set of methods.

#### Syntax:
    items = [1, 2]
    items.append(3)
    items.pop()
    # this prints the location in the memory
    print(id(items))

So, the method available to a variable depends on the datatype of the variable

#### Note:
If an objects provides methods to change the contents of the variable then it is mutable. If it doesn;t provide methods to change the contents of the variable then it is immutable.

## Loops

It is an essential part of programming. In python we have two types of loops, 
- While loop
- For loop

### While loop:
They are defined using the while keyword. They repeat the contents of the body of the while loop until the condition is false

#### Syntax:
    while condition == True:
        print("The condition is True")

Example of a while loop with a counter is given below, 

#### Syntax:
    count = 0
    while count < 10:
        print("The condition is True")
        count = count + 1

    print("After the loop")

### For loop:
This is used when you want to run the body of the for loop a specific number of time. 

####  Syntax:
    for item in range(15):
        print(item)

For loop can also be used to iterate through lists and dictionaries.

#### Syntax:
    items = [1, 2, 3, 4]
    for item in items:
        print(item) 

#### Note:
If we want to get the index of the element in the list, we can use enumerate.

#### Syntax:
    item = [1, 2, 3, 4]
    for index, item in enumerate(items):
        print(index, item)


## Break and continue

While and for loops can be intereupted and prematurely stopped from continuing execution using the break and continue statements.

### Cotinue: 

It stops the current interation and tells the loop to start the next iteration.
In basic words it means that continue skips an interation.

#### Syntax:
    items = [1, 2, 3, 4]
    for item in items:
        if item == 2:
            continue
        # in this loop when the item is 2 the print will be skipped
        print(item)

### Break:

Break stops the loop altogether and contiues with the instruction after the loop end.

#### Syntax:
    items = [1, 2, 3, 4]
    for item in items:
        if item == 2:
            continue
        # in this case the cases 3 and 4 will never be considered as it will exit # from the loop altogether
        print(item)

## Classes

Classes is a user defined datatype that is comprised of a variety of system defined datatypes and memeber functions.

From classes one can instancitate Object.

An Object is an instance of a class. 

A class is the type of an object.

#### Syntax:
    class Dog:
        # self is an argument of the instance that will point to itself
        # if it is too technical just keep in mind that this is how you create a # memeber function 
        def bark(self):
            print("woof!")

    # creating an instance of the class
    roger = Dog()
    # printing the type of roger
    print(type(roger))

### __init__ Constructor

This is a special type of function that is a constructor. An example of how to create this constructor is given below. Constructor is used to predefine the values for some of the variables associated with the object during the time of instanciation of the object.

#### Syntax:
    class Dog:
        def __inti__(self, name, age):
            # this will assing he values from variables name and age to the member variables at the time of object instancitaion.
            self.name = name
            self.age = age

        # self is an argument of the instance that will point to itself
        # if it is too technical just keep in mind that this is how you create a # memeber function 
        def bark(self):
            print("woof!")

    # creating an instance of the class
    roger = Dog("Roger", 8)
    # printing the name, age of the Dog() object
    print(roger.name)
    print(roger.age)
    # calling the bark method of the roger object
    roger.bark()

### Inheritance:

Inheritance is a very important feature of class. This allows the inherited class (child class) to be able to access a copy of the parent class. This can be very useful when we want to have different classes with similar structure with minor difference.

Example of inheritance is given below.

#### Syntax:
    # Parent class
    class Animal():
        def walk(self):
            print("Walking...")

    class Dog(Animal): # Dog class inherits the Animal Class
        def __init__(self, name, age):
            self.name = name
            self.age = age

        def bark(self):
            print("woof!")

    # Instanciating the Object variable roger of the class Dog 
    roger = Dog("Roger", 8)

    # printing the values in the name and age variables
    print(roger.name)
    print(roger.age)

    # calling a memeber function
    roger.bark()

    # calling a function of the parent class
    roger.walk()

## Modules
Every python file is a module. You can import a module from other files.

An example of how to import a module is given below, 

#### Syntax:

First we create as dog.py file and write the code given below,
    def bark():
        print("Woof!")

In the main file you write the code given below, 
    # Modules
    # Method 1
    import dog

    dog.bark()

    # Method 2
    # importing only the necessary function
    from dog import bark

    bark()

In the above two examples the module that is being imported is located in the same location as the file that is using the module. 

But, if the module that is to be used is in a different location then, we use the following method.
    # The module to be imported is in the lib folder
    # To be able to import the dog_sub.py module in the Python_basics.py file we first need to create an empty "__inti__.py" file in the lib folder. This tells python that there is a module that can be imported by other files. 
    # Then we can use the same code as mentioned in Method 1 or Method 2.

A list of some of the common modules availabe are given below,

- math for math utilities
- re for regular expressions
- json to work with JSON
- datetime to work with dates
- sqlite3 to use SQLite
- os for Operating System utilities 
- random for random number generation
- statistics for statistics utilities
- requests to perform HTTP network requests
- http to create HTTP servers
- urllib to manage URLs

Example of using one of these libraries is given below, 

#### Syntax:
    import math

    print(f"Squrare root of 4:{math.sqrt(4)}")

## Arguments from Command line

First let's learn how to run the python code from command line. 

#### Shell Syntax:
In terminal or shell we type the command given below, 
    
    python filename.py

### Using package sys
Now, let's see how to pass in the arguments from the command line. For being able to accept the arguments from the command line we have to do some changes to the python code. 

We will have to import the "sys" module. The "sys.argv" contains the arguments that is passed from the shell/terminal.

#### Syntax:
    # importing the sys module
    import sys
    # printing the arguments that were accepted from the shell or terminal
    print(sys.argv)

This is one way to do it. But, it is a very cumbersome way to accept arguments from the terminal as the programmer has to account for the datatype and checking if the accepted argument is of the correct datatype or not.

There is another way to accept the arguments from the terminal. For this we will be using a differnt package called "argparse".

Let's see how to use this module.

### Using package argparse

Using this package we can accept arguments in a very organised way. An example of how to use this package to accept arguments from the command line is given below.

#### Syntax:
    # Accepting arguments from the command line using the argparse package
    import argparse

    parser = argparse.ArgumentParser(
        description='This program prints the name of my dogs'
        )

    parser.add_argument('-c', '--color', metavar = 'color',
                        required = True, help = 'the color to search for')

    args = parser.parse_args()

    print(args.color)

#### Shell Command:
    python filename.py -c red

you can also set the choices. That way one can only parse a particular value that is present in the choice. An example of that is given below.

#### Syntax:
    import argparse

    parser = argparse.ArgumentParser(
        description='This program prints the name of my dogs'
        )

    parser.add_argument('-c', '--color', metavar = 'color',
                        required = True, choices={'red','yellow'} ,help = 'the color to search for')

    args = parser.parse_args()

    print(args.color)

## Lambda Functions

These functions are very small and only have one expression as their body. These functions do not have a name. To define the lambda functions you have to use the "lambda" keyword followed by the argument and then the expression.

#### Note:
The body of the lambda function has to be an expression and not a statement. An expression returns a value and a statement doesn't.

lambda functions cannot be invoked directly but you can assign them to a variable. as given in the example.

#### Syntax:
    # Lambda function definition with just one argument
    lambda num : num * 2

    # lambda function with more than one argument
    lambda a, b : a * b

    # assigning a lambda function to a variable
    multiply = lambda a, b : a * b

    # calling the lambda function
    print(multiply(2, 4))

lambda functions can be very useful when used with map, filter and reduce functions

## Map, Filter, and Reduce

Python provides three useful global functions that can be used with collections.

### map():
Map is a function that is used to run on each item in an iterable variable like a list and create a new list with the same number of items where the values of each item can be changed. 

You can understand better from the example given below, 

#### Syntax:
    # list
    numbers = [1, 2, 3]

    # this can be a lambda function
    def double(a):
        return a * 2

    double = lambda a : a * 2

    # this will iterate through each item in the list and create a new list
    result = map(double, numbers)

    # printing the result
    print(list(result))

### filter():
It takes an takes an iterable and returns a filter object, which is also an iteratble but with only some of the the original items. You can do so by returning True or False from the filtering function. 

An example is given below, 

#### Syntax:
    # list 
    numbers = [1, 2, 3]

    # function that returns True or False
    def isEven(n):
        return n % 2 == 0

    # filtering
    result  = filter (isEven, numbers)

    # you can also declare the lambda function directly as an argument of the filter function
    result = filter (lambda n : n % 2 == 0, numbers)

    # printing the result
    print(list(result))

### reduce():
It is used to calculate a value out of a sequence like a list.

An example is given below.
expenses is a list of tuples containing the details of the expenses. You need to calculate the total expenses. The long way of calculating the expenses from a list of tuples would be to use a loop and iterate through each element of the list and to find the sum. 

Using reduce it can be simplified as given below,


#### Syntax:
    # importing reduce
    from functools import reduce

    expenses = [
        ('Dinner', 80),
        ('Car repair', 120)
    ]

    # long way to finding the total expenses 
    sum = 0
    for expense in expenses: 
        sum += expense[1]


    #using reduce function
    sum = reduce(lambda a, b: a[1] + b[1], expenses)

    print(f"Sum of expenses is {sum}")


#### Note:
To use the reduce() function you need to import the functools package.

## Recursion:

A function in python can call itself. This is called recusion. The best example case for the use of recursion is Factorial.

#### Syntax:
    # definition of the function
    def factorial(n):
        if n == 1: 
            return 1
        return n * factorial(n-1)

    # printing the factorial of 3
    print(factorial(3))


#### Note:
By default python stop recursion at 1000 calls.

## Decorators:
This is a way to change or enhance in any way how a function words. Decorators are defined with the decorator name just before the function definition. 

An example is given below, 
#### Syntax:
    def logtime(func):
        def wrapper():
            # do something before
            print("before")
            val = func()
            # do somthing after
            print("after")
            return val
        return wrapper

    # now the logtime decorator is assgined to the function hello
    @logtime
    def hello():
        print("Hello")

    hello()

So when ever we call the hello() function the decorator will also be called. A decorator is a function that takes a function as a parameter, wraps the function in an inner function that performs the job it has to do and returns that inner function.

you use decorator when you want to change the behaviour of a function without modifying the function itself. For example when you are logging, testing the performace etc, you can use this. 

## Docstrings:

Documentation is very important to understand the code either written by you or by someone else.  documentation can be written either with comments or with docstring. 

Example of a docstring is given below, 
#### Syntax:
    def increment(n):
        """Increment a number"""
        return n + 1

    print(help(increment))

Docsting can be multiple lines. It is also common to have a docstring at the beginning of the file explaining what the program does. You can use the help() global function to print the docstings. The help() function ignores the comments but prints the docstring. 

Docstrings help in automated creation of documentation. 


## Annotations
Python is dynamically typed, so we do not have to specify the type of the varibale, or function parameter or a function return value. Annotations allows us to specify the type of the vairable, function parameter or function return value.

#### Syntax:
    """ This function accepts only an int value and also returns only an int value. This is achieved using the annotations"""
    # we want to make this function accept only an int value
    def increment(n: int) -> int: 
    # this specifies that this function recieves an int and also returns an int
        return n + 1

    # a variable of integer type
    count: int = 0

Python will actually ignore this annotations, a separate tool myPy can be run standalone integrated by IDEs to automatically check for type errors statically. It will also check for type mismatch bugs before even running the code. 

This helps when the program become large and you have to handle the errors.

## Exception handling:
It is important to have a way to handle error, Python allows us to handle errors using the try and except blocks. 

#### Syntax:
    # You wrap the code the raises exceptions in try block and add the code that needs to be run in case of an exception in the except block. 
    try:
        # some lines of code
    except <ERROR1>: # checkffor a specific error
        # handler <ERROR1>
    except <ERROR2>: # check for a specific error
        # handler <ERROR2>
    except: # handles all the exception
        # handler
    else: # if no errors was found
        # no exceptions were raised, the code ran successfully
    finally: 
        # do something in any case

An example of error handling is given below, 

#### Synatx:
    result = 2 / 0
    # this line and below will not run cuz the previous line raised an error
    print(result)

    # this will raise a zero division error

#### Syntax:
    # let's use a try and except block to overcome the error in the previous code snippet

    try:
        result = 2 / 0 
    except ZeroDivisionError: # check for zero division error
        print('Cannot divide by zero!')
    finally:
        result = 1
    
    print(result)

You can also raise exception in your own code. The syntax to do so is given below,

#### Syntax:
    # raise an exception
    raise Exception('An error!')

The above code snippet raises a general error. So, that will stop the exceution of the code. If you want to raise an exception without stopping the code then you can use the try and except block.

If you want to raise a specific error. An example to raise a specific error is given below, 

#### Syntax:
    try:
        raise Exception('An error!')
    except Exception as error:
        print(error)

You can also define your own exception class extending from exception. 

You can find the code snippet to do that below,

#### Syntax:
    class DogNotFoundException(Exception):
    print("inside")
        pass # this means nothing

    try:
        raise DogNotFoundException()
    except DogNotFoundException:
        print('Dog not found!')

#### Note:
you use the "pass" command when creating a class without a methods or a funcion without code. 

## With:
With is very helpful to simplify working with exception handling. For example, while working with files, each time we open a file we must remember to close it. With makes the process more transparent. 

An example code without the With statement is given below, 

#### Syntax:
    # file path
    filename = 'E:/Learning/Python_freecodecamp/Python_Basics/test.txt'
    
    try:
        file = open(filename, 'r')
        content = file.read()
        print(content)
    finally:
        file.close()

An alternative method to do this using the With statement is given below. Note that while using the file with the "With" command you do not have to manually close the file. We have built in exception handling as close will be automatically called.

#### Syntax:
    # file path
    filename = 'E:/Learning/Python_freecodecamp/Python_Basics/test.txt'

    with open(filename, 'r') as file:
        content = file.read()
        print(content)  

## pip:

"pip" is used to install third party packages in python. "pip" stands for preffered installed program. You can find almost all of the open-source packages from pypi.org. 

An example of how to install a package using pip is given below,
#### Syntax:
    pip install requests

    # the format is 
    pip install <package_name>

    # updating the existing package
    pip intall -U <package_name>

    #uninstalling a package
    pip uninstall <package_name>

    # information about the package
    pip show <package_name>

## List Compressions:

This is a way to create lists in a very consice way. An example is given below.

#### Syntax:
    # conventional list
    numbers = [1, 2, 3, 4, 5]

    # list compression
    numbers_power_2 = [n**2 for n in numbers]

    # prinitng the elements of the numbers_power_2
    print(numbers_power_2)

    # list compression equivalent operation
    numbers_power_2 = []
    for n in numbers:
        numbers_power_2.append(n**2)

List compression is sometimes preffered over loops as it make the code more readable and concise.

## Polymorphism:

In object-oriented programming, polymorphism (from the Greek meaning "having multiple forms") is the characteristic of being able to assign a different meaning or usage to something in different context - specifically, to allow an entity such as a variable, a function, or an object to have more than one form.

# Operator Overloading:

Operator overloading is a way for a single operator (method/function) to perform several operation based on the class (type) of operands(arguments).

An example is given below,

#### Syntax:
    class Dog:
        # the Dog class
        def __init__(self, name, age):
            self.name = name
            self.age = age

        def __gt__(self, other): # __gt__ is equivalent to >
            return True if self.age > other.age else False
    roger = Dog('Roger', 8)
    syd = Dog('Syd', 7)

    print(roger > syd)

The list of some of the operator and their equivalent method name is given below, 
- __add__() responds to the + operator
- __sub__() responds to the - operator
- __mul__() responds to the * operator
- __truediv__() responds to the / operator
- __floordiv__() responds to the // operator
- __mod__() responds to the % operator
- __pow__() responds to the ** operator
- __rshit__() responds to the >> operator
- __lshit__() responds to the << operator
- __and__() responds to the & operator
- __or__() responds to the | operator
- __xor__() responds to the ^ operator

This is the end of the basics of Python. Next in the video is about a simple python implementation of a blackjack game. The details of that can be found in the Blackjack folder.

Thank you
