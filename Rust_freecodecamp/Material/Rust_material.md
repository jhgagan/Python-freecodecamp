# Rust Progamming

## Background Information
Some things to Note before we get started with Rust. 
 - Rust is a multi-paradigm, general -purpose programing language that emphasizes performance, type safety, and concurrency.
 - It also enforces memory safety - ensuring that all refereces point to valid memeory - without requiring the use of grabage collector or referece counting present in other memory-safe languages.

 - First appeared: May 15, 2015
 - License: MIT and Apache 2.0

## Tools required to run a Rust Code:

- rustc - The compiler which compiles the rust code into binary
- rustup - The cmd utitlity to install and update Rust
- cargo - The Rust build system and package manager

# Basics of Rust

## Variables in Rust

One can declare the varibales in Rust using the keywords.

### Keywords:
 - *let* - used for variable declaration
 - *const* - used for variable declaration 
 - *static* - used for variable declaration
 - *mut* - used to make the variable mutable

Note that, in Rust by default all the variables are immutable, meaning that the value fo the variable can't be changed. 
By all the vriables I mean let, const and static.

But, one can make the variable mutable by using the *mut* keyword.

An example of the variable declaration in Rust is given below,

# Syntax:
    // Examples of variable declaration
    let my_variable = 0;
    const MY_CONSTANT: u8 = 0;
    static MY_STATIC: u8 = 0;

    // Example of the decalration of a mutable variable
    let mut my_mutable_variable = 0;

## Rust name casing conventions

Unlike Python but similar to C++, Rust is statically typed, meaning that the variables have to be explicitly declared. 

Rust convention relies on some casing conventions. (Good practice to follow this):

|   Object  |   Casing  |
|   :---:   |   :---:   |
|   Variables   |   snake_case  |
|   Functions   |   snake_case  |
|   Files   |   snake_case  |
|   Constants   |   SCREAMING_SNAKE_CASE   |
|   Statics |   SCREAMING_SNAKE_CASE    |
|   Types   |   PascalCase  |
|   Traits  |   PascalCase  |
|   Enums   |   PascalCase  |

## Functions in Rust:

The functions are decalred using the *fn* keyword.

Functions return using the *return* keyword, and similar to C++, you need to explicitly specify the return type fo the function. 

Unless the return type is an empty tuple. i.e., If it is a empty tuple you don't have to specify the return type.

A syntax template for the function is shown below, 

# Syntax:
    fn main() -> () { // Unnecessary return type
    my_func();
    }

    fn my_func() -> u8 {
        return 0;
    }

Note that if an expression in the function is missing **;**, then that expression is retuned.

Example, 

    fn my_func() -> u8 {
        0   // This expression will be returned as it is missing the ;
    }

### Passing the function parameters:

The funciton parameters are passed to the function using the : syntax:

Example, 

    fn main()   {
        let _unused_variable = my_func(10);
    }
    
    fn my_func(x: u8) -> i32    {
        x as i32
    }

##### Note: 
The underscore before the variable name is a convention to indicate that the variable is unused. 

The *as* keyword asserts the type of the expression, provided the type conversion is valid.

##  Strings and Slices in Rust

The difference between the *String* struct and *str* type.

Example, 
    let my_str = &str = "Hello World";

    let my_string: String = String::from("Hello, world!");

From the above example, we can distinguish between the *String* and *str*. The variable *my_str* is a reference to a string literal. In simple terms it means that *my_str* holds the address to the string "Hello, world!". The variable *my_string* is an instance of the *String* struct (Structure). 

*my_str* is stack stored, meaning that the value of it can't change. and it's size is fixed.

*my_string* is heap stored, meaning that *my_string* can have unknown size ath compile time.

##### Note: 

The string literal is also known as a string slice. This is because a *&str* refers to part of a string. This is also the similarity between the arrays and the strings.

Example, 

    let my_string = String::from("The quick brown fox");
    let my_str: &str = &my_string[4..9]; // "quick"

    let my_arr: [usize; 5] = [1, 2, 3, 4, 5];
    let my_arr_slice: &[usize] = &my_arr[0..3]; //[1, 2, 3]

The [T; n] notation is used to create an array of **n** elements of type **T**.

## The *char* type in Rust

In rust, a *char* is a Unicode Scalar Value. Unlike C++, where the characters were ASCII values. 

## Number types in Rust

There are many types of numbers in Rust:
 - Unsigned integers: u8, u16, u32, u64, u128
 - Signed integers: i8, i 16, i32, i 64, i128
 - Floating point numbers: f322, f64

Unsigned integers only represent positive whole numbers.

Signed integers represent both positive and negative whole numbers.

Floating point numbers represent both the positive and negative fractions.

## Structs in Rust

A *struct* is a custom data type used to group related data. In C++ also we have struct, it is a user defined data type in C++.

The *String* struct cosnsits of a vec field,  which is a *Vec* , vector of unsigned int (u8s). The *Vec* is a dynamically-sized array in Rust.

Example of a struct is given below, 

    // Structure Definition
    struct MyStruct {
        field_1: u8,
    }

    // Struct instance that is based on the previosuly defined structure
    let my_struct = MyStruct {  field_1; 0, };

## Enums in Rust

Similar to other languages, enums are useful for acting as types and as values.

Example, 

    // enum MyErrors    {
        BrainTooTired, 
        TimeofDay(String)
        CoffeeCupEmpty,
    }

    fn work() -> Result<(), Myerrors>   {   //  Results is also an enum
        if state == "mmissing semi-colon" {
            Err(MyErrors::BrainTooTired)
        }   else if state == "06:00"    {
            Err(MyErrors::TimeOfDay("It's too early to work".to_string()))
        }   else if state == "22:00"    {
            Err(MyErrors::TImeofDay("It's too late to work".to_string()))
        }   else if state == "empty"    {
            Err(MyErrors::CoffeeCupEmpty)
        }   else    {
            Ok(())
        }
    }

## Macros in Rust

Macro in rust is similar to the Macros in ImageJ. How? we can use macro to run other functions.

A macro in similar to a function, but macros differ from functions in a few main ways.

    - Macros are called using a bang (!)
    - Macros can take a variable number of arguments, while functions in Rust cannot

Most commonly used macro in Rust, *println!*. *println!* macro is used to print to the console.

Example, 
    let my_str = "Hello, world!";
    println!("{}", my_str);

you can also add variables into a string using *{}*.

Another common macro is called *panic!*. (This might be similar to cerr from c++, not sure but seems to be similar).

Panic is a poorly-handled error in Rust. *panic!* accepts a string literal, and panics with that message.

Example, 
    let am_i_an_error = ture;

    if(am_i_an_error) {
        panic!("There was an error!");
    }

## Ownership in Rust:

This is concept that is not found in C++. This concept is quite important in Rust.

This concept has 3 main rules:

 - Each value in Rust has a variable that's called its owner.
 - There can only be one owner at a time.
 - When the owner goes out of scope, the value will be dropped.

This concept is the main reason that Rust is able to manage without having a typical garbage collector, or having the programmer to explicitly manage memeory.

Example, This example shows the transfer of ownership and it's effects.
    
    fn main() { // first_string is not declared yet -> has no value
        let first_strign = String::from("freecodecamp"); // first_string is now owner of the value
        let second_string = first_string; // second_string is now the owner of the value "freecodecamp"
    
        println!("Hello, {}!", first_string); // first_string is NOT_VALID, because the value was moved to the second string.
    }

Example, This example shows how to make a variable have the same value but not take it's ownership.

    fn main() { // first_string is not declared yet -> has no value

        let first_strign: String = String::from("freecodecamp"); 
        // first_string is now owner of the value
    
        let second_string: &String = &first_string; 
        // first_string is still the owner of the value "freecodecamp", but now the variable second_string is also pointing to the same value.
    
        println!("Hello, {}!", first_string); 
        // first_string is \VALID here, because the value was not moved to the second string. instead second string just points to the same memory.
    }
