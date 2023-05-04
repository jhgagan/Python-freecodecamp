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