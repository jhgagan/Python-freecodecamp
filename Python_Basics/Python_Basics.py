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

