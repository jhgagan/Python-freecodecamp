## Valid variable names
name = "Gagan"
country = "Indian"
Phone_39 = "320*******"
Phone_91 = "886*******"
age = 25

## Invalid variable names
#    name$$ = "Gagan"
#    39_Phone  = "320*******"
#    while = "While is a keyword"

## checking the type of a variable
print(type(name))
print(type(age))

## checking the type of the variable using the is instance function
print(isinstance(name, str))
print(isinstance(age, int))

## Explicit declaration
number_float = float(2)
number_int = int(2)
number_string = str("2")

# String Operations
print(name.lower())     # string methods returns a new modifed version of the string
print(name)    # the name variable is not alterd
print(len(name))    # returns the length of the string
print("Ga" in name)     # Checks if the name contains the substring "Ga"
special_string = "\" Eclosed by double quotes\""    # you can add special characters using escaping (using backslash '\')
print(special_string)
print(name[1])      # get the character at a position from the string using indexing
print(name[-1])     # negative indexing is going to start from the last character
print(name[1:2])    # we can get all the characters in a range using the ranging operator ':'


# Boolean example
# Done is a boolean variable with value True
done = bool(True)

if done :
    print("yes")
else:
    print("No")

# Complex numbers

num = complex(2,3) # 2 + 3j
# extracting the real and imaginary part of the given complex number
print (num.real, num.imag)

# Built in functions

# prints the absolute value of the argumnet
print(abs(-5))

# prints the nearest integer or float based on the precision set
print(round(5.49))
# setting the precision to 1
print(round(5.49,1))


from enum import Enum

class State(Enum):
    INACTIVE = 0
    ACTIVE = 1

print(f"enum value: {State.ACTIVE.value}")
print(State['ACTIVE'].value)
# listing all the values of an enum
print(f"listing enum values:{list(State)}")
# counting the number of constants in the enum
print(len(State)) 

# List 
list_var = ["Roger", 1, "Syd", True]

# checking if "Roger" is in the list
print("Roger" in list_var)
# reference an element using index numbers
print(list_var[2])

# updating the item in the list
list_var[2] = "Gunda"
# adding new element to the list
list_var.append("Judah")
# adding multiple new elements to the list at once
list_var.extend(["Judah", 5])
# printing the entire list
print(list_var)
# Using the += operator to add elements to the list
list_var += ["Tommy",7]
# Printing the list
print(list_var)

# removing the element from the list using remove
list_var.remove("Tommy")
# Print the list
print(list_var)
# remove the element of the list using the index
print(f"Popped element from the list: {list_var.pop()}")
#print the list
print(f"list: {list_var}")

# inseting into a list
list_var.insert(2,"Test")
# print the list
print(f"list after inseting \"Test\" to index location 2: {list_var}")
# inserting multiple elements
list_var[2:2] = ["Test1","Test2"]
# Printing the updated  list
print(f"Updated list :{list_var}")

# Modifying the list to contain only strings
list_var = ["Zebra", "zebra", "Bob", "bob", "Gagan", "gagan"]
# printing the unsorted string
print(f"Unsorted String: {list_var}")
# sorting the string
list_var.sort()
# print the string
print(f"Sorted string: {list_var}")
# sorting while considering the lower case and upper case as the same
list_var.sort(key = str.lower)
# printing the sorted variable
print(f"Sorted string list: {list_var}")

# Modifying the list to be unsorted
list_var = ["Zebra", "zebra", "Bob", "bob", "Gagan", "gagan"]
# sorting without modifying the original list
sorted_list = sorted(list_var, key = str.lower)
# printing the unsorted list 
print(f"Unsorted list: {list_var}")
# printing the sortede list
print(f"Sorted list {sorted_list}")

# Tuples
# creating a tuple
names = ("Roger", "Syd", "Gagan", "Harish")

# reading the content of the tuple using the indexing
names.index("Roger")
# checking the number of elements in the tuple
print(f"length of the tuple:{len(names)}")
# checking if the tuple has "Roger" in it
print("Roger" in names)
# slicing in tuples
print(names[0:2])
# sorting the contents of a tuple
sorted_tuple = sorted(names, key = str.lower)
# printing the sorted tuple
print(f'Sorted tuple: {sorted_tuple}')

# Combining two tuples
newTuple = names + ("Tina", "Quincy")
# printing the new tuple
print(f"New tuple: {newTuple}")

# creating dictionary
dog = {"name":"Roger", "age" : 8}

# accessing the data stored in the dictionary. 
# printing the name of the dog variable. 
print("name: "+dog["name"])

# you can also access the content of the dicitonary using the get method.
print("name"+dog.get("name"))

# assigning a default value to a key from the get method
# here the dog dictionary doesn't have a color variable so it should return "brown"
print("color: "+dog.get("color", "brown"))

# Let's add a color key and value pair and try the above statement again
dog = {"name":"Roger", "age" : 8, "color":"green"}
# Let's print the value of the color key using the get method
print("color: "+dog.get("color", "brown"))

# using the pop method
print(dog.pop("name"))
# printing the dog dictionary to observe the changes in the dictionary
print(dog)

# creating the dictionary with 3 key value pair 
dog = {"name":"Roger", "age" : 8, "color":"green"}
# using the popitem function
print("last item: "+str(dog.popitem()))
#printing the dictionary
print(dog)

# checking if there is a "name" key in dog dictionary
print("name" in dog)
# printing the list of the keys of a dictionary
print(dog.keys())

# printing the list of values of a dictionary
print(dog.values())
# printing the list of all the values
print(list(dog.items()))

# adding a new key value pair to the dictionary
dog["food"] ="Meat"
# printing the updated dictionary
print(dog)

# delete a key-value pair from the dictionary
del dog["age"]
# printing the key-value pair from the updated dictionary
print(dog)

# Creating a copy of a dictionary
dogCopy = dog.copy()
# printing the copy of the dictionary
print(f"Copy of the dog dictionary: {dogCopy}")

# Set creation
set1 = {"Roger", "Syd"}
set2 = {"Roger"}

# Intersection of the two sets
intersect = set1 & set2
# Print the intersect
print(f"Intersection of two sets:{intersect}")

# creating two disjoint sets to better explain the union
set1 = {"Roger", "Syd"}
set2 = {"Gunda", "Tommy"}
#Union of two sets
union = set1 | set2
# prinitng the union
print(f"Union of two sets:{union}")

# Creating two sets to explain the difference operation
set1 = {"Roger", "Syd"}
set2 = {"Roger"}
# Difference of two sets
diff = set1 - set2
# printing the difference
print(f"difference of two sets: {diff}")

# Ceating two sets
set1 = {"Roger", "Syd"}
set2 = {"Roger"}
# Super-set check
super_set= set1 > set2
#printing the super set check
print(f"Is set1 the super set of set2: {super_set}")

# Ceating two sets
set1 = {"Roger", "Syd"}
set2 = {"Roger"}
# Sub-set check
sub_set= set2 < set1
# printing the sub set check
print(f"Is set2 the sub set of set1: {sub_set}")

# count and print the number of terms in a set
print(f"Number of terms in set1 is {len(set1)}")

# getting a list containing the elements of the set
list_set = list(set1)
# Printing the list of set elements
print(f"List of all the elements persent in set1: {list_set}")

# checking if "Roger" is a element of the set
check  = "Roger" in set1
# Printing the check condition
print("Is \"Roger\" an element of the set " + str(check))

# Function definition
def hello():
    # body of the function
    print('Hello!')

# function call 
hello()

# Function that accepts a parameter
def hello(name):
    # body of the function
    print('Hello! ' + name)

# function call 
hello("Roger")
hello("Quincy")

# Function that accepts a parameter
def hello(name = "my friend"):
    # body of the function
    print('Hello! ' + name)

# function call 
hello("Roger")
hello("Quincy")
hello()

# Function that accepts parameters
def hello(age, name = "my friend"):
    # body of the function
    print(f'Hello! {name}, you are {age} years old')

# function call 
hello(39 ,"Roger")
hello(40)

# Explanation to passing by reference
def change(num):
    num = 2
    print(f"Changed value = {num}")
   
num = 1
print(f"value of num = {num}")
change(num)
print(f"value of num = {num}")

# Example for datatype in which the changes done in the function is reflected outside the function defintion
def change(num):
    num["value"] = 3
    print(f"Changed value = {num}")
   
num = {"value": 2 }
print(f"value of num = {num}")
change(num)
print(f"value of num = {num}")


#Function definition
def hello(name):
    if not name:
        return
    print(f"Hello {name}!")
    
hello("Beau")

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
print(return_value("Syd"))
# Storing the returned value in variables
ret_name, ret_name2, ret_val = return_value("Syd")