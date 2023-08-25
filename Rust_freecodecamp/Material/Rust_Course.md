# Rust Programming

## Why use Rust
 - Fastest language after C
 - Rich type system
 - No garbage collector (faster runtime)
 - Useful compiler output
 - Memory safety

## Hello world in Rust

Similar to C++, all the programs in Rust starts in the main function.

#### Syntax:
    fn main(){
        println!("Hello world!");
    }

# Variables

In Rust variables are assigned using 'let' keyword. Content can be printed to the output device using print!() or println!(). The scope of the variable is defined by the block of code in which it is declared.

Rust allows Shadowing. What does that mean? It means that rust allows a variable to be re-declared in the same scope with the same name.

In rust, you declare the datatype of the variable using the format, 

    let variable_name: datatype;
    // example
    let x: i32; // variable x of type 32-bit signed integer 


### Exercises:

1. Binding and mutability:
 - This means that a variable can be used only if it has been initialized. 

#### Syntax:
(Q1) Fix the error below with least amount of modification to the code

    fn main(){
        let x: i32 = 5; // Uninitialized but used, ERROR!
        let y: i32; // Uninitialized but also unused, only a Warning!
  
        x// valid 

        assert_eq!(x, 5)
        println!("Success");
    }

Solution:
    fn main(){
        let x: i32 = 5; // Uninitialized but used, ERROR! So, to solve this error we intiliazise the variable with a value
        let _y: i32; // Uninitialized but also unused, only a Warning! To solve this warning we prepend the variabe name with an underscore

        assert_eq!(x, 5)
        println!("Success");
}

(Q2) USE mut to mark a variable as mutable

    // Fill the blanks in the code to make it compile 
    fn main()   {
        let __ __ = 1;
        ___ += 2;

        assert_eq!(x, 3);
        println!("Success!");
    }

Solution:
    fn main()   {
        let mut x = 1;
        x += 2;

        assert_eq!(x, 3);
        println!("Success!");
    }    

(Q3) A scope is the average range within the program for which ghe item is valid.
    fn main(){
        let x: i32 = 10;
        {
            let y: i32 = 5;
            println!("The value of x is{} and value of y is {}", x, y);
        }
        println!("The value of x is {} and value of y is {}", x, y);
    }

Solution:
    fn main(){
        let x: i32 = 10;
        let y: i32 = 5;
        {
            println!("The value of x is{} and value of y is {}", x, y);
        }
        println!("The value of x is {} and value of y is {}", x, y);
    }

(Q4) Fix the error with the use of define_x
    fn_main()
    {
        println!("{}, world!", x);
    }

    fn define_x(){
        let x = "hello";
    }

Solution:
    fn_main()
    {
        define_x();
    }

    fn define_x(){
        let x : &str = "hello";
        println!("{}, world!", define_x());    
    }

# Numbers

## Integer Types

Rust has a number of number types. But there are 2 main types of integer numbers peresnt.

- Signed integers: Can represent both positive and negative integers
- Unsigned integers: Can represent only positive integers.

|   Length  |   Signed  |   Unsigned    |
|   :-----: |   :-----: |   :-------:   |
|   8bit    |   i8  |   u8  |
|   16bit   |   i16 |   u16 |
|   32bit   |   i32 |   u32 |
|   64bit   |   i64 |   u64 |
|   128bit   |   i128 |   u128 |
|  arch   |   isize |   usize |

## Default Types

The default size of the number types in rust are signed 32bit for Integers and f64 for float.

## usize & isize

These values are architecture dependent.
- On 32-bit architecture: 32 bit
- On 64-bit architecture: 64 bit
- Pointer sized integer type, matches size of a word in the given platform. 

##### Note: 
"Word" refers to the number of bits the processor can access at a time. i.e., a 32 bit processor can access 4 Bytes(32 bits) at a time, and a 64 bit processor can access 8 Bytes (64 bits) at a time.

**usize** gives you the guarantee to be always big enough to hold any pointer or any offset in a data structure.

## Floating point

There are two types of floating point numbers, namely, f32 and f64, they are 32 bits and 64 bits respectively in size. The representation of these floats are as per the IEEE-754 specifications.

### Exercise

(Q1) Remove something to make it work
    fn main(){
        let x: i32 = 5;
        let mut y: u32 = 5;

        y = x;
        
        let z = 10; // datatype of z

        print!("Success!")
    }

Solution:
    fn main(){
        let x: i32 = 5;
        let mut _y: i32 = 5; //_y is done to prevent the warnings

        _y = x;

        let _z = 10;    // data type of _z is i32

        print!("Success!")
    }


## Computations

You can check the results of the computation of different mathematical operations using the *assert!* macro. A set of all the computations and the results and explaination is given below, 

Example 1, 

    fn main(){
    // integer addition in Rust
    assert!( 1u32 + 2u32 == __ );
    }

Here, the sum of two numbers of unsigned 32 bit integer type results in a 32 bit integer.

Example 2, 

    // integer subtraction
    assert!(1i32 - 2 == __ );

Here, the subtraction is performed. The first number is of the type signed integer of 32 bits, but the second one is not specified so the default type will be assumed, i.e., signed integer 32 bits. soo the result will be -1i32.

Example 3, 

    assert!(1u8 - 2 == -1); // assert!(1i8 - 2 == -1);

This operation in it's current form will not be possible, reason being the first number is an unsigned integer by defualt the second number will be a 32 bit unsigned number. Also, it is important to note that the result of the subtraction will be negative so you can't type cast the second number to an unsgined integer. so the easiest thing to do would be to type cast the first number to a signed integer of 8 bits.

Example 4,

    assert!( 3 * 50 == 150);

This operation is as straightforward as it can get. Because the type of the number is not specified, the compiler assumes the type to be signed 32 but integer.

Example 5,

    assert!(9.6 / 3.2 == 3.0); // assert!(9.6f32 / 3.2f32 == 3.0f32 );

This will raise an error due to floating point precision. So, to avoid errors due to precision we can cast all the values to 32 bit.

Example 5, 

    assert!( 24 % 5 == __); // assert!( 24 % 5 == 4 );

Here, we have the modulus operation. It is the same as in C++ or any other progamming language. So, the answer will be 4.

Example 6, 

    assert!(true && false == __ );  // assert!(true && false == false);
    assert!(true || false == __ );  // assert!(true || false == true);
    assert!(!true == __); // assert!(!true == false);

Here, we have the boolean operations.

Example 7

    println!("0011 AND 0101 is {:04b}", 0b0011u32 & 0b0101b32); // 0001
    println!("0011 OR 0101 is {:04b}", 0b0011u32 | 0b0101b32);  // 0111
    println!("0011 XOR 0101 is {:04b}", 0b0011u32 ^ 0b0101u32); //0110 
    println!("1 << 5 is {:04b}", 1u32 << 5); // 2^5 = 32
    println!(" 0x80 >> 2 is 0x{:x}", 0x80u32 >> 2 ); //0x80 is a hexa decimal value that needs to be right shifted by 2 places.

Here , we have a few bitwise operations.

# Char, Bool and Unit

## Character

Char refers to the character datatype. This is a primitive datatype, like integer or floating point.

    use std::mem::size_of_val;

    fn main(){
        let c1: char = 'a'; //4 Bytes
        println!("{}", size_of_val(&c1)); 
        // Printing the size of the character variable c1.
        assert_eq!(size_of_val(&c1), 4); // 

        let c2: char = '$'; //4 Bytes
        assert_eq!(size_of_val(&c2));

        println!("Success!");
    }

In Rust, the size of the character datatype is large enough to hold all the different chacters.

Also, note that the char datatype values are to be enclosed within single quotes. As anything enclosed with double quotes will be considered to be a string.

#### Excercise

    // Make it work
    fn main(){
        let c1: char = "c"; // let c1: char = 'c';
        print_char(c1);
    }

    fn print_char(c: char){
        println!("{}", c);
    }

This code in it's current form will raise type mismatch error. To fix this we need to change the value of c1 from "c" to 'c'. Things enclosed within the double quotes are considered to be strings and not char. The type mismatch error was due to that. 

## Boolean

This is also a primitive datatype. A boolean variable can either store 'true' or *'false'* value in it. *'true'* can also be represented with **1**, similarly, *'false'* can be represented with **0**. Size of the bool is 1 byte.

#### Exercise

    // Make println! get executed
    fn main()
    {
        let _f: bool = false;

        let t: bool = true;

        if !t { // if t 
            println!("Success!");
        }
    }

for println! to get executed t should hold the value false or just change the if condition to **t** instead of **!t**.

    //Make it work
    fn main(){
        let f: bool = true; // let f: bool false;
        let t: bool = true && false;    // equivalent to t = false
        // to get the result t and f should hold equal value. 
        assert_eq!(t, f);

        println!("Success!");
    }


Here, t and f should hold equal value for it to get executed correctly. So, we have a few options to get that ouptut. 

 - Initilaize f with false
 - Initilaize t with true || false;
 
## Unit

This is a primitive data type. It is represented by *()* in the code. 

The unit has exactly one value, and is used when there is no meaningful value that could be returned. So, we can say, the function below

    fn long() -> (){}
 and 

    fn short(){}

have the same return type. Meaning they are equivalent forms. 

Also, note that the size of unit type is 0 Bytes. 

This is technically an empty tuple.

## String

Will be discussed later in detail. For now, we need to know a few things. 

- While string literal is convenient, it is suitable for all situations in which we may want to use text. Few reasons being,
    - String literals are immutable.
    - String literals can't be used when we want user input for a unknown size.

Due to the above mentioned reasons we have another datatype *String*. This datatype manages data allocated on the healp and as such is able to store an amount of text that is unknown to us at compile time.

We can create/declare a *string* from string literal using the from function, as given below, 

    let s = String::from ("hello");

### Why can *Strings* be mutated but not *String literals*?

The answer for this lies in the the way memory allocation works for the two of them.

Strings use a heaps to store the data. String literals on the other hand us stacks. 

Accessing the data in a stack is a lot faster than accessing data stored in a heap. String store the data in a heap.  


# Blocks

This is a few lines of code that is enclosed within the curly braces. This can be used in various places, including but not limited to variable assignment.

Example, 

    let x: i32 = 10;
    let y: i32 = {
        let t: i32 = 5;
        x + t // if this statement is not ended with a semi colon, then it will be retuned
    };


the last statement x + t is not ended with a semi colon. So, that is returned by the block. The value returned by the block is assigned to the variable y.

Note that if in the same example you had an assignement operation as the last epression then it would not work. 

Example, 

    let x: i32 = 10;
    let y: i32 = {
        let t: i32 = 5;
        x += t // because this is an assignment operation. The returned value be unit ().
    };

# Match

Match is like a switch case statements of C++. An example for the syntax of Match is given below, 

    fn main(){
        let tp : i32 = 5

        match tp {
            1=> {
                //TODO
            }

            _ =>{   // This is similar to the default block of Swich case
                //TODO
            }
        }
    }


#### Note:we use an *unimplemented!()* or *todo!()* macro if a functon is yet to be implemented. To use it we just call the macro in the body of the function that has not been implemented yet. 

# Functions

Functions have to always annotate the type of the input parameters. 

Example for a function is given below, 

    fn main(){
        let (x, y) = (1, 2);
        let s: i32 = sum(x, y);

        assert_eq!(s, 3);

        println!("Success!");
    }

    fn sum(x : i32, y : i32)
    {
        x + y 
    }

As the statement, *x + y* doesn't have a semi-colon, it will be returned by the function.

Note if the statement would have ended with a semi-color then the return value would be unit *()*.

## Diverging function

This function will never return back to the function that called it. This type of a function declared as given below,
    
    fn never_return() -> !{
        // This function never returns to the parent function.

    }

# Ownership

It is a concept that is unique to Rust.

This is a set of rule that govern the memory management. These rules are enforced at compile time. If the rules are voilated then the program won't compile.

## Owner:
Rules of ownership in Rust.
 - Each value in Rust has an owner.
 - There can only be one owner at a time. 
 - When the owner goes out of the scope. The value will be dropped.

## Variable Scope:

A scope is the range within a program where the value is valid.

Example, 

    // variable s is out-of-scope here, So, Invalid.
    {
        let s: i32 = 6;
        // variale s is within it's scope here. So, valid.

    }
    // variable s is out-of-scope here. So, Invalid.


To understand the concept of ownership in a better way. Let's see an example with the String datatype.

There are two types of scope. 
- Global scope
- local scope

### **Global scope:**

The variable is valid through out the code.

### **Local scope:** 

The variable is valid only within the block defined by the curly braces.


## Memory:

Two types of regions of the RAM is used by a program at runtime. 

- Stack memory
- Heap memory

## Stack memeory

Stack follows the *Last in, First out* model. 

For a stack all the data stored on the stack must have a known, fixed size( like integers, char, bool, etc.)

Pushing to the stack is faster than allocating on the heap, beacuse the location for new dadta is always at the top of the stack.

Types of unknown size will get allocated to the heap and a pointer to values is pushed to the stack, because a pointer has a fixed size.

## Copy vs. Move

Scalar values with fixed sizes (all types we covered at the beginning) will automatically get copied in the stack, copying here is cheap.

Dynamically sized data won't get copied, but moved, copying would be too expensive.

Example, 

    let x = 5;
    let y = x; // Here the data is copied from x to y

    let s1 = String::from("hello");
    let s2 = s1; // Here the data is moved from s1 to s2

In the example shown above. we undestand that weather the data get's copied or moved is dependent on the way memory is allocated to that variable. i.e., If the memory is allocated dynamically, then the data will get moved. If the memory is allocated as a stack then, then the data will get copied.

### What I mean by data getting moved?

When a data is moved, like in the above example, in the background both s1 and s2 are pointing to the same memory location in the heap memory.

But, note that this voilated the second rule which says that there can only be ONE owner at a time. So, what Rust does to avoid this problem is, It drops *s1* after the assginment to *s2*.i.e., *s1* is no longer a valid data after the assignement to *s2*.

### Advantages of Ownership

Ownership prevents memeory safety issues:
 - Dangling pointers
 - Double-free 
    - Trying to free memory that has already been freed
- Memory leaks
    - Not freeing memory that should have been freed

## Clone()

Clone is a trait for types that can't be "implicitly copied".

We already know the relation between the move/copy operations and the memory allocation of the variable. 

I.e., if the a Heap memory is getting allocated to the data then the data will be moved and not copied. If a stack memeory is allocated then the data will be copied and not moved.

### **Exercises**:

**Exercise 1**

    fn main(){
        let x: String = String::from("hello, world!");
        let y: String = x;  // let y: String = x.clone();
        println!("{},{}", x, y);    // This will raise an error
    }

The statement *println!("{},{}", x, y);* will raise an error, because *x* is not valid anymore. 

*x* was a String. As it is a string a heap memory is allocated to this type of value. As a heap memory is allocated to it, it will be moved when it is being passed as an argument to another function. After it has been passed to another function as a parameter. The scope of the variable gets changed as well.

If we want to copy the data instead of moving it we can use the *clone()* trait (think of it as an in-built function for now).

**Exercise 2**
    
    fn main(){
        let s1: String = String::from("hello, World");
        let s2 = take_ownership(s1);

        println!("{}", s2);
    }

    fn take_ownership(s: String) -> String {
        println!("{}", s);
        s // this is done to return the value to the main()
    }

This code snippet will print an *unit()*. To be able to print the content as intended, we need to return a string from the *take_ownership* function.

**Exercise 3**

    fn main(){
        let s = give_ownership();
        println!("{}", s);
    }

    fn give_ownership() -> String {
        let s: String String::from("hello, world!")

        let _s = s.as_bytes();
        s
    }
 

**Exercise 4**

    fn main(){
        let s = String::from("hello, world");
        
        print_str("{}",s);

        println!("{}",s);   
        // This will raise an error as the ownership of the String s is transferred to the function print_str
        // To solve this we can either create another variable and make sure the print_str returns the ownership from print_str function to the main.
        // Or we can use the clone() method.
        // print_str("{}", s.clone());
    }

    fn print_str(s: String){
        println!("{}",s);
    }

**Exercise 5**

    fn main(){
        let x: (i32, i32, (), String) = (1, 2, (), "hello".to_string());
        let y: (i32, i32, (), String) = x;
        println!("{:?}, {:?}", x, y)
    }

This will also raise an error. String as we already know is allocated in the heap memory. So, the value will not get copied when you assign to a new variable. Instead, the value will be moved (Ownership trasnferred).

Here on line, 

    let y: (i32, i32, (), String) = x;

The ownership gets transferred from *x* to *y*. So, *x* can't be used further anymore. but it is used in the next statement. That will raise an error.

To solve this error, we can use the clone or copy functions. That way the ownership will not get transferred. Using the clone function is straight forward. 

Using the copy function is not. So to use the copy funciton we first make sure that *x* contains a string literal instead of a string. 

Why? The string literal is allocated to a stack and not a heap so when you assign it to a new variable the ownership will not get transferred.

So the solution, 

    fn main(){
        let x: (i32, i32, (), &str) = (1, 2, (), "hello");
        let y: (i32, i32, (), &str) = x;
        println!("{:?}, {:?}", x, y)
    }


# Mutability

It is important to note that when the ownership of a variable gets changed the mutability of the new owner can be changed.

For example, 
    fn main(){
        let s:String = String::from("hello, ");

        // transfer of ownership and change of mutability.
        let mut s1 = s;

        s1.push_str("world");

        println!("Success!");

    }

# Direct allocation to Heap

You can directly allocate a data on to the heap by using the box::new(_value_) method. The Box::new() method returns a pointer pointing to a heap memory where the data is store.

for example, 

    fn main(){
        let x = Box::new(5);
        // if you also want to specify the data type
        let x: Box<i32> = Box::new(5);

        // y has to be mutable as the value is changed in the next statement
        let mut y: Box<i32> = Box::new(1);
        
        *y = 4;

        assert_eq!(*x, 5);

        println!("Success"); 
        
    }

# Partial move
Within the destructuring of a single variable, both by-move and by-reference pattern bindings can be used at the same time. Doing this will result in a partial move of the variable, which means that parts of the variable will be moved while other parts stay. In such a vase, the parent variable cannot be used afterwards as a whole, however the parts that are only referenced (and not moved) can still be used.

For Example, 

    fn main(){
        #[derive(Debug)]
        struct Person{
            name: String,
            age: box[u8],
        }

        let person: Person = Person{
            name: String::from("Alice"),
            age: Box::new(20), 
        };

        // 'name' is moved out of person, but 'age' is referenced
        let Person{name, ref age} = person;

        println!("The person's age is {}", age);

        // Error! borrow of partially moved value: 'person' partial move occurs
        // println!("The person struct is  {:?}", person);
        
        // The 'person' can't be used but 'person.age' can be, as it is not moved 
        println!("The person's name is {}", name);
    }


# Tuples

Tuples are declared and used as given below,

    fn main(){
        let t: (String, String) = (String::from("hello"), String::from("world"));
    }

Index of tuples in rust can be done as shown in the example below, 

    fn main(){
        let t: (String, String) = (String::from("hello"), String::from("world"));
        
        //Transferring the ownership of the String in index 0 to s
        let _s: String = t.0;

        // Error! the element at index 0 has it's ownership changed to _s
        //println!("{:?}", t);

        // We can still access the data in index 1, because the owner of the data at index 1 is still the same variable
        //println!("{:?}", t.1);
    }

**Exercise**
    
    fn main(){
        let t: (String, String) = (String::from("hello"), String::from("world"));

        let (s1, s2) = t.clone();

        println!("{:?}, {:?}, {:?}", s1, s2, t);
    }

In the line, 

    let (s1, s2) = t.clone();

We can't directly assign *t* to *(s1, s2)*, as the content of the tuple t is Strings. Strings are stored in heap so, ownership get's changed when you assign to a new variable.

So to avoid errors we will have to clone it to use it.

# Borrowing

It  is a way to temporarily access data without taking ownership of it. When borrowing you're taking the reference(pointe) to the data, not the data itself.

Borrowing helps to prevent dangling pointers and data races.

Data can be borrowed immutabily and mutably. 

Note that there are certain rules when borrowing which we have ot comply with, otherwise the program won't compile.

## Rules

 - At any given time, you can have either one mutable reference or any number of immutabe references. You can have both at the same time.

 - References must always be valid.

Example, 

    fn main(){
        let s1 = String::from("hello");
        
        let len = calculate_length(&s1);

        println!("The length of '{}' is {}.", s1, len);
    }

    fn calculate_length(s:&String) -> usize {
        s.len()
    }


Let's see an example for mutable references,

    fn main(){
        let mut s = String::from("hello");

        // we have to explicitly state that the refernce is mutable
        change(&mut s);
    }

    fn change(some_string: &mut String){
        some_string.push_str(", world");
    }

# Dangling Reference
Let's use the Example below, 
    fn main(){
        let reference_to_nothing = dangle();
    }

    fn dangle() -> &String {
        let s = String::from("hello");

        &s
    }

Here we see that the function dangle returns a reference to the variable *s*. But the problem is that as soon as the control is returned to the main function (after the execution of the dangle function) the variable *s* is out of score so it is not valid anymore. Meaning that the variable *reference_to_string* is pointing to a memory that is not valid anymore. That means that the second rule of borrowing is voilated. So, it can't be done.

SO the solution to the above problem is by just returning the string itself rather than the reference to the string.

# Exercise on References and Borrowing

**Exercise 1**

    fn main(){
        let x: i32 = 5;

        let p: &i32 = __; // let p: &i32 = &x

        println!("the memory address of x is {:p}", p); 
        // {:p} is a notation to let the println! to print the pointer as a hexadecimal value.

    }

**Exercise 2**;

    fn main(){
        let x: i32 = 5;
        let y : &i32 = &x;

        assert_eq!(5, y);// y is a pointer we need to check the content of the variable y is pointing to, So dereferencing.
        // assert_eq!(eq, *y);
        println!("Success!");
    }

**Exercise 3**

    fn main(){
        let mut s = String::from("hello, ");

        borrow_object(s);// we need to pass the pointer to the variabe s
        // borrow_object(s&);

        println!("Success!");

    }

    fn borrow_object(s: &String){

    }

**Exercise 4**

    fn main(){
        let mut s =  String::from("hello ,");

        push_str(s);
        // we need to pass the mutable refrence here
        // push_str(&mut s);

        println!("Success!");
    }

    fn push_str(s: &mut String){
        s.push_str("world")
    }

**Exercise 5**

    fn main(){
        let mut s: String = String::from("hello, ");

        let p = __;
        
        //here we can just change the ownership to a mutable variable p
        // let p: &mut String = s;

        // if we want to let p borrow s then we can pass a mutable reference to p
        //let p: &mut = &mut s;
        p.push_str("world");

        println!("Success!");

    }


# Ref

ref can be used to take references to a value, similar to &. Let us try to understand this concept better with the help of an example.

    fn main(){
        let c: char = 'c';

        let r1: &char = &c;

        let ref r2: &char = c;

        assert_eq!(*r1, *r2);


        assert_eq!(get_addr(r1), get_addr(r2));

        println("Success!");
    }

    fn get_addr(r: &char) -> String {
        format!("{:p}", r)
    }

Format macro is similar to the println macro, the difference being that the format macro returns a String.


# Borrowing Rules Exercise

**Exercise

    fn main(){
        let must s: String = Sring::from("hello");

        let r1 = &mut s;
        let r2 = &mut s;

        println!("{}, {}", r1, r2);

        println!("Success!");
    }

Here we have two mutable refences which is not allowed. So, we will need to change the code to only have one mutable referece at a time.


This is one possible solution to it.
    fn main(){
        let must s: String = Sring::from("hello");

        let r1 = &mut s;
        println!("{}", r1);

        let r2 = &mut s;
        println!("{}", r2);
        
        println!("Success!");
    }

We can also just change *r1*, *r2* from mutable references to immutable reference. As we can have any number of immutable reference to a single memory as shown below,

    fn main(){
        let must s: String = Sring::from("hello");

        let r1 = &s;
        let r2 = &s;

        println!("{}, {}", r1, r2);

        println!("Success!");
    }


# Mutability Exercise

**Exercise**
    
    fn main(){
        let s: String = String::from("hello, ");
        // let mut s: String = String::from("hello ,");

        borrow_object(&mut s);

        println!("Success!");

    }

    fn borrow_object(s: &mut String){

    }


Here, we are passing a mutable reference of s to the function borrow_object. But, s is an immutable object so, this will raise an error. To solve this problem we need to declare s as an immutable object.


While borrowing an immutable variable as a mutable referece is a problem, borrowing a mutable variable as a immutable reference is not a problem.

Example, 

    fn main(){
        let mut s = String::from("hello ");

        // passing the mutable variable s as an immutable reference
        borrow_object(&s);

        s.push_str("world");

        println!("Success!");

    }

    fn borrow_object(s: &String){}

**Exercise**
    
    //Comment one line to make this compile without errors
    fn main(){
        let mut s: String = String::from("hello ");

        let r1: &mut String = &mut s;
        r1.push_str("world");
        let r2: &mut String = &mut s;
        r2.psuh_str("!");

        // commenting the line below should be enought to make the code work
        println!("{}", r1);
    }

**Exercise**

    fn main(){
        let mut s: String = String::from("hello, ");

        let r1: &mut String = &mut s;
        let r2: &mut String = &mut s;

        // add a line to get an error: cannot borrow 's' as mutable more than once at a time.
        
        //adding the statement below is enough to raise the error
        println!("{}, {}", r1, r2);
    }

# String vs &str (String slices)

&str is also called as string slices.

- String is a heap-allocted string type that owns its contents and is mutable.

- A&Str is an immutable sequence of UTF-8 bytes in memeory, it does not own the underlying data and is immutable.

- Think of &str as a view on a sequence of characters (stored as UTF-8 bytes) in memory.

Which of the two to use, and when to use.

- Use &str if you just want a view of a string

- &str is more lightweight and efficent that String.

- Use String if you need to own the data and be able to mutate it.

# String Literal

- A string literal is a sequence of characters enclosed in double quotes(")

- Fixed size, compile-time known sequence of UTF-8 bytes

- The type is '&` static str', which indicates the data is stored in static storage, meaning it is valid throughout the entire lifetime od the program.

- The data is hardcoded into the executable and stored in read-only memory, meaning they are immutable

## *replace()* function

The *replace* function can be used to replace a substring. Let us see an 

Note: To be able to use *replace()* the string should be mutable.

example. 

    fn main(){
        let mut s:String = String::from("I like dogs");
        // Allocates new memory and stores the modified string there
        let s1 = s.replace("dogs", "cats");

        assert_eq!(s1, "I like cats");

        println!("Success!")
    }


## String concatination

We can concatinate a String with &str, and String's ownership can be moved to another variable.

    fn main(){
        let s1: String = String::from("hello, ");
        let s2: String = String::from("world!");
        
        //This statement would raise an error.
        let s3: String = s1 + s2;

        assert_eq!(s3, "hello, world!");
        println!("{}", s3);
    }

The line, 
    
    let s3: String = s1 + s2; 

will raise an error. The reason is that we can only concatinate one string with another string literal. Two strings can't be concatinated.

So, to solve the above problem we can convert the second string to a string literal using the *as_str()* function.

    fn main(){
        let s1: String = String::from("hello, ");
        let s2: String = String::from("world!");

        let s3: String = s1 + s2.as_str();
        // short-hand notation for using a string as a string literal 
        // let s3: String = s1 + &s2;
        assert_eq!(s3, "hello, world!");
        println!("{}", s3);
    }

The short hand notation to use string as a string literal is by preceding the name of the string variable by passing it as a reference. 

## String literal to String

We can use *String::from()* or *to_string()* methods to convert a &str (String literal) to String

    fn main(){
        let s: String = "hello, world".to_string();
        let s1: &str = s.as_str();

        println!("Success!");
    }


# String escape

You can use escapes to write bytes by their hexadecimal values. It is similar to using escape sequences in C++. One of the main difference between the escape scquence of C++ and the escapes of Rust is that, C++ uses ASCII characters and rust uses UTF-8 (Unicode Transformation Format).

But as UTF-8 is backwards compatible with ASCII, converting the C/C++ code that is dependent on ASCII won't be hard.

    fn main(){
        // Fill the blank below to show "I'm writing Rust"
        let byte_escape = "I'm writing Ru\x73\x74!";
        println!("What are you doing\x3F (\\x3F means ?) {}", byte_escape);

        // ...Or Unicode code points.
        let unicode_codepoint = "\u{211D}";
        let character_name = "\"DOUBLE-STRUCT CAPITAL R\"";

        println!("Unicode character {} (U+211D) is called {}", 
            unicode_codepoints, character_name);

        let long_string = "String literals
                            can span multiple likes.
                            The linebreak and indentation here \
                            can be escaped too!";
        
        println!("{}", long_string);
    }

The hexadecimal code of letter "S" is \x73. So, the hexadecimal code of letter "T" has to be \x74.

This is similar to the escape secqueces in C++. to use the escapes in Rust, you need to precede the hexadecimal code value with "\x". To print the hexadecimal code itself you have to precede the hexadecimal value by "\\x"

Note: You can't use index to access a character in a string. But you can use slice to do the same.

Example,

    fn main(){
        let s1: String = String::from("hi, world");
        let h = s1[0]; // This is not allowed
        //let h = s1[0..1]; // This is how you access a charcter in Rust
        assert_eq!(h, "h");

        let h1 = &s1[3..5];
        assert_eq!(h1, "wo");

        println!("Success!");

    }

# Array

Array is a fixed-size collection of elements of the same data type stored as contiguous block in stack memory.

The syntax of an array is 

   let arr_name: [type; Length] = [...]; 

which indicated that the elngth is fixed at complile time

Array can neither grow nor shrink.

Example of erronous declaration of an array.

    fn init_arr(n: i32){
        let arr = [1; n]
    }

This will cause an errors the compiler has no idea about the size of the array.

Example of a correct declaration of an array.

    fn main(){
        let arr: [i32; 5] = [1, 2, 3, 4, 5];

        assert!(arr.len() == 4); // The length of the array is 5. so this statement will raise an error.

        println!("Success!");
    }

Note: We can also ignore parts of the array type or even the whole type, and let the compiler decide it.

example, 

    fn main(){
        let arr0 = [1, 2, 3];   // This is allowed in Rust
        let arr: [_; 3] = ['a', 'b', 'c'];  // This is also allowed
        
        // A char take 4 bytes in Rust: Unicode char
        assert!(std::mem::size_of_cal(&arr) == __); // the size of arr is 4*3 = 12

        println!("Success!");
    }


## Some short hand notations

- All elements in an array can be initialized to the same value at once.

  Example, 

    fn main(){
        let list: [i32, 100] = [1;100] ; //[1, 1, 1, 1, ..., 1]

        assert!(list[0] == 1);
        assert!(list.len() == 100);

    println!("Success!");
    }
    
-  All elements of the array must be of the same type. It is the same in all programming languages.

 - Rust is a 0 indexing language. So , Indexing starts at 0.

    fn main(){
        let arr: [char; 3] = ['a', 'b', 'c'];

        let ele = arr[1]; // This is wrong as the indexing starts at 0
        // let ele = arr[0];

        assert!(ele == 'a');

        println!("Success!");
    }


- Out of bound indexing creates panic (errors).

# Slice

Slice is a reference to a contiguous sequence of elements in a collection. 
- It Provides a way to borrow part of a collection without taking ownership of the entire collection.
- Can be created from arrays, vectors, Strings and other collections implementing the Deref trait.

Example Slice, 

    let a = [1, 2, 3, 4, 5];

    let slice = &a[1..3]

    assert_eq!(slice, &[2, 3]);
    
- slice has the type &[i32] in this example. 

- Works like string slices do , by storing a reference to the first element and a length.

**Exercise**

    fn main(){
        let arr: [i32; 3] = [1, 2, 3];
        let s1: [i32] = &arr[0..2]; // this slice will hold the elements in position 0 and 1.

        let s2: str  = "hello, world" as str;

        println!("Success!");
    }


**Exercise**

    fn main(){
        let arr: [char; 3] = ['&','*','%']; // In the course it is mentioned as a UTF-8 character.

        let slice: &[char] = &arr[..2]; // this is the short hand notation for &arr[0..2]
        
        // Modify this line to make the code work
        assert!(std::mem::size_of_val(&slice) == 8);

        println!("Success!");   
    }

Here, we have a slice that is holding a pointer to the location where the data is stored. We also need to note that the slice is a two-word value. meaning that the size of the slice will be usize*(# of words).

So, the correct statement for the assert! macro is,

    assert!(std::mem::size_of_val(&slice) == 16);

**Exercise**

    fn main(){
        let arr: [i32; 5] = [1, 2, 3, 4, 5];

        let slice: __ = __;
        // let slice: &[i32] = &arr[1..4];

        assert_eq!(slice, &[2, 3, 4]);

        println!(Success!");
    }


**Exercise**

    fn main(){
        let s: String = String::from("hello");

        let slice1: &str = &s[0..2];
        // fill the blank to make the coede work, Don't use 0..2 again
        let slice2: &str = &s[..2];

        assert_eq!(slice1, slice2);

        println!("Success!")
    }

**Exercise**

    fn main(){
        let s: &str = "some characters from UTF-8";

        // Modify this line to make the code work
        let slice: &[str] = &s[0..2]; // let slice: &[str] = &s[..5];

        assert!(slice == "some");

        println!("Success!");
    }

**Exercise**

    fn main(){
        let mut s: String = String::from("hello world");

        let word: &str = first_word(&s);
        // This will cause the error
        s.clear();

        println!("the first word is: {}", word);
    }

    fn first_word(s: &str) -> &str {
        &s[..1]
    }

## Need to review this again later. (Concept is not yet clear)
To solve the error we need to change the position of the println! macro from the last that is after the s.clear function. The reason for this is that the function uses a mutable reference as it's argumnet. But word holds an immutable reference. so If we call the println! macro prior to calling the clear function it will not cause an error.

Note: A refernce to a string can be implicitly converted to a string literal by the compiler.

# Tuple

It is a way to store related pieces of information in a single variable. It is a collection of values of different types of data grouped together as a single compound value.

It is stores as a fixed-size contiguous block of memeory on the stack.

Its syntax is given below, 

    let tup: (type, type, type) = (data, data, data);

Example of a tuple,

    fn main(){

        let _t0: (u8, i16) = (0, -1);

        // we can also have nested tuples
        let _t1 = (u8, (i8, char)) = (1, (-7, 'c'));

        // Fill in the blank to make the code work
        let t: (u8, __, i64, __, __) = (1u8, 2u16, 3i64, "hello", String::from(", world"));
        // let t: (u8, u16, i64, &str, String) = ...;    
    }

Extracting the members from the tuples. We can acces the members of tuple using indexing.

    fn main(){
        let t: (&str, &str, &str) = ("i", "am", "sunface");
        
        // Modify this to make the code work
        assert_eq!(t.1, "sunface");
        // assert_eq!(t.2, "sunface");

        println!("Success!");
    }


We also need to note that long tuples cannot be printed. An example, is given below. 

    fn main(){
        let too_long_tuple = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);

        println!("too long tuple: {:?}", too_long_tuple);
    }

How long of a tuple is too long?

A tuple containing upto 12 elements can be printed. But tuples exceeding 12 elements can't be printed. Do note that tuple with more than 12 elements can still be used for the other functions but it just won't be printable.

## Destructuring tuples

    fn main(){
        let tup: (i32, ) = (1, 6.4, "hello");

        // Fill the blank to make the code work
        let __ = tup;
        //let (x, z, y) = tup;
        
        assert_eq!(x, 1);
        assert_eq!(y, "hello");
        assert_eq!(z, 6.4);

        println!("Success!");
    }

**Exercise**
    fn main(){
        let (x, y, z);

        // Fill the blank
        __ = (1, 2, 3);
        //(y, z, x) = (1, 2, 3);

        assert_eq!(x, 3);
        assert_eq!(y, 1);
        assert_eq!(z, 2);
    }


Tuples can also be used as functional arguments and return values

    fn main(){
        let (x, y) = sum_multiply(__);
        //let (x, y) = sum_multiply((2,3));

        assert_eq!(x, 5);
        assert_eq!(y, 6);

        println!("Success!");
    }

    fn sum_multiply(nums: (i32, i32)) -> (i32, i32){
        (nums.0 +nums.1, nums.0*nums.1)
    }

# Struct

This is a compound type allowing to group together values of differet types into a named data structure. Similar to tuples, but each values has a name so values can be access through its name. It has to be instanciated with data, think of it like the struct is the template for the instance you create from it.

It is similar to the struct from C++.

    struct User{
            active: bool,
            username: String,
            email: String,
            sign_in_count: u64,
    }

    fn main(){
        let user1 = User{
            active: true, 
            username: Srting::from("someusername123"),
            email: String::from("someone@example.com"),
            singin_in_count = 1,
        };  
    }

## Accessing and Mutating

You can also access and mutate the contents of a struct type variable.

Example, 

    let user1 = User{
        active: true, 
        username: Srting::from("someusername123"),
        email: String::from("someone@example.com"),
        singin_in_count = 1,
    };

We can access and mutate single fields of structs:
    
    user1.email = String::from("anotheremail@example.com");

## Functions returning Structs

Functions can instantiate and return structs. An example is given below,

    fn build_user(email: String, username: String) -> User{
        User{
            active: true, 
            username: username,
            email: email,
            singin_in_count = 1,
        }; 

        // if the name of the field and the variable matches you can write it in the way given below

        //User{
        //    active: true, 
        //    username,
        //    email,
        //    singin_in_count = 1,
        // };
    }

## Struct update syntax

If we want to create a new instance by using some of the fields from an already existing struct we can do so using the struct update syntax.

    fn main(){
        let user1 = User{
            active: true, 
            username: String::from("someusername123"),
            email: String::from("someone@example.com"),
            sign_in_count: 1,
        };

        let user2 = User{
            active: user1.active, 
            username: user1.username, 
            email: String::from("another@example.com"),
            sign_in_count: user1.sign_in_count,
        };
        // Instead of declaring user2 as given above it can done in a simpler way

        let user2 = User{
            email:String::from("another@example.com"),
            ..user1
        };
    }

The second was of instasitating the user2 is by only mentioning the field that is different from the user1 followed by ..user1 for the next field.

# Tuple Structs

This is like normal structs but using tuple-like syntax for defining their fields. In other words it is a tuple with named elements.

It has to be instantiated by paranthesis insteadd of curly braces. The elements are to be accessed through point notation.

Example, 

    struct Color(i32, i32, i32);
    struct Point(i32, i32 ,i32);

    fn main(){
        let black = Color(0, 0, 0);
        let origin = Point(0, 0, 0);
    }

# Unit-Line Structs

These are Structs without any field. In other words they are empty structs. They are used when working with traits (to be covered later).
It doesn't store any data (cuz empty).

**Exercise**

    struct Person {
        name: String, 
        age: u8, 
        hobby: String
    }

    fn main(){
        let age: u8 = 30;
        let p: Person = Person{
            name: String::from("sunface"),
            age, // same as age: age
        // hobby field is not initiated 
            hobby: String::from("coding"), 
        };

        println!("Success!");
    }

### Note:
When instanciating a struct all the fields have to be initialised. 


**Exercise**

    //Fix the error and fill in the blanks
    struct Color(i32, i32, i32);
    struct Point(i32, i32, i32);
    fn main(){
        let v = Point(0, 127, 255);
        check_color(v);

        println!(Success!);
    }

    fn check_color(P: Color) {// input parameter can't be color as it has not been instatiated in the code.
        let Point(x, _, z) = p;
        assert_eq!(x, 0);
        assert_eq!(p.1, 127);
        assert_eq!(z, 255);
    }


### Note: 
One can make a whole struct mutable when instantiating it, but Rust doesn't allow to mark only certain fields as mutable.

**Exercise**
    
    struct Person{
        name: String,
        age: u8,
    }

    fn main(){
        let age = 18;
        // The value of p.age is changed later but it is declared as an immutable struct so, 
        // let mut p = Person{...}
        let p = Person{
            name: String::from("sunface"),
            age,
        };

        // Changing the value of age
        p.age = 30;
    

    //Fill in the blank
    __ = String::from("sunfei");
    // p.name = String::from("sunfei"); 
    
    println!("Success!");
    }

## Using field init shorthand syntax to reduce repitions

**Exercise**

    struct Person{
        name: String, 
        age: u8,
    }

    fn main(){
        println!("Success!");
    }

    fn build_person(name: String, age:u8) -> Person{
        Person{
            age, 
            __, //name,
        }
    }


**Exercise**

    struct User {
        active: bool, 
        username: String, 
        email: String,
        sign_in_count: u64,
    }

    fn main(){
        let u1 = User {
            email: String::from("someone@example.com"),
            username: String::from("sunface"),
            active: true,
            sign_in_count: 1,
        };   

        let u2: User= set_email(u1);

        println!("Success!");
    }

    fn set_email(u: User) -> User{
        User{
            email: String::from("contact@im.dev"),
            __ //..u
        }
    }

## Printing the structs

One can't print a struct directly. you will have to use "#[derive(Debug)]" to make a struct printable

    #[derive(Debug)]
    struct Rectangle{
        width: u32, 
        height: u32,
    }

    fn main(){
        let scale: u32 = 2;
        let rect1: Rectangle = Rectangle{
            width: dbg!(30 * scale),    // Print the debug info to stderr and assign the value
            height: 50,
        };

        dbg!(&rect1);

        println!("{:?}", rect1); // Print debug info to stdout
    }


When you use a debug trait you can print the content like a normal print statement by using the "{:?}" (debug) notation. 

## Partial move

Within the destructuring of a single variable, both by-move and by-reference pattern bindings can be used at the same time. Doing this will result in a partial move of the variable, which means that parts of the variable will be moved while other parts stay. In such a case, the parent variable cannot be used afterwards as a whole, however the parts that are only referenced (and not moved) can still be used.

    fn main(){
        #[derive(Debug)]
        struct Person{
            name: String, 
            age: Box<u8>,
        }

        let person = Person{
            name: String::from("Alice"), 
            age: Box::new(20),
        };

        let Person{ name, ref age} = person;

        println!("The person's age is {}", age);

        println!("The person's name is {}", name);

        println!("Ther person's age from person struct is {}", person.age);
    }


**Exercise**
    
    // Fix errors to make it work
    #[derive(Debug)]
    struct File{
        name: String, 
        data: String,
    }

    fn main(){
        let f: File = File{
            name: String::from("readme.md"),
            data: "Rust By Practice".to_string(),
        };

        let _name: String = f.name;

        // Only modify this line
        println!("{}, {}", _name, f.data);
    }


# Enums

Enums is another way of definind a type with only one of a possible set of values. We can only access one variant of an enum at a time. It can hold additional information using tuples. Especially useful when using in match statement.

Example, 

    enum IpAddr {
        V4(String),
        V6(String),
    }

    let home = IPAddr::V4(String::from("127.0.0.1"));

    let loopback = IPAddr::V6(String::from("::1"));

Enum for Ip address. An IP address can either be of V4 format or V6 format. Each variant in the enum holds a String value. 

Enums can also be declared with an explicit discriminator

Example, 

    enum Number{
        Zero, // By default 0
        One, // 1
        Two, // 2
    }

    enum Number1{
        Zero = 0,
        One, 
        Two,
    }

    enum Number2{
        Zero = 0.0, // You can't use a floating point number as a discriminator
        One = 1.0,
        Two = 2.0,
    }

    enum Number3{
        Zero = 5,
        One,    //6
        Two = 9,
        Three   //10
    }

    fn main(){
        // An enum variant ccan be converted to an integrer by 'as'
        // Number0::One as u8
        // Number1::One as i8...
        assert_eq!(Numeber0::One, Number1::One);
        assert_eq!(Number1::One, Number2::One);

        println!("Success!"); 
    }

Each enum variant can hold its own data.

    enum Message{
        Quit, 
        Move{ X:i32, y: i32 },
        Write(String),
        ChangeColor(i32, i32, i32),
    }


    fn main() {
        let msg1 = Message::Move{x: 1, ,y: 2}; // Instantiating with x = 1, y = 2
        let msg2 = Message::Write(String::from("hello, world!")); // Instantiating with "hello, world!"

        println!("Success");
    }


We can also get the data that a enum variant is holding by using pattern match (It was similar to S witch Case of C++)

Example, 

    fn main(){
        let msg: Message = Message::Move{x: 1, y: 1};

        if let Message::Move{x: a, y: b} = msg {
            assert_eq!(a, b);
        } else {
            panic!("NEVER LET THIS RUN!");
        }

        println("Success!")  
    }

**Exercise**

    #[derive(Debug)]
    enum Message{
        Quit, 
        Move{x: i32, y: i32}, 
        Write(String),
        ChangeColor(i32, i32, i32),
    }

    fn main(){
        let:msgs: [Message; 3] = [
            Message::Quit,
            Message::Move{x:1, y:3},
            Message::ChangeColor{255, 255, 0}
        ];

        for msg in msgs{
            show_message(msg)
        }
    }

    fn show_message(msg: Message){
        println!("{}",msg);
    }

## Option Enum

Option is an ennum that represents a value that may or may not be present. Known in other languages as "null", refering to the absence of value. It is used to handle cases where  a function or method might fail to return a value.

Option enum is defined by the standard library

    enum Option<T> {
        None, 
        Some(T),    // This can hold any type of Data 
    }

    fn main() {
        let five = Some(5);
        let six = plus_one(five);
        let none = plus_one(None);
    }

    fn plus_one(x: Option<i32>) -> Option<i32> {
        match x {
            None=> None, 
            Some(i)=> Some(i + 1),
        }
    }

plus_one() expects an argument of type Option, so we have to wrap an i32 inside Some().

X gets matched and if there is a Some() value, it gets incremented by one.




**Exercise**

    fn main(){
        let five = some(5);
        let six = plus_one(five);
        let none = plus_one(None);

        if let Some(n) = six{
            println!("{}", n);

            println("Success!");
        }
        else {
        panic!("NEVER LET THIS RUN");
        }
    }

    fn plus_one(x: Option<i32>) -> Option<i32> {
        match x {
           None => None, 
            Some(i) => Some(i + 2),
        }
    }

# Flow Control

Normally the flow of the program is Top to bottom, line by line. But it can be controlled. It referes to the ability to control the order in which statements or instructions are executed in a program. It allows to specify which instructions should be executed under which conditions and in what order.

Some ways to control the flow is using the following statements, 

- Conditionals
    - if/ else
    - match

- Loops
    - for/ while/ loop
    - continue/ break

## If/else

It is a conditional statement that can be found in almost all the programming langugaes.

    fn main(){
        let n = 5;

        if n < 0 {
            println!("{} is negative", n);
        } __ n > 0 { // else if
            println!("{} is positive", n);
        } __ { // else
            println!("{} is zero, n);
        }
    }

**Exercise**

    fn main() {
        let n: i32 = 5;

        let big_n: i32 = 
            if n <10 && n > -10 {
                println!(", and is a small number, increase ten-fold");

                10*n //no semicolor as it has to be assigned to big_n
            } else {
                println!(", and is a big number, halve the number");

                n/2.0 //no semicolor as it has to be assigned to big_n
            };

        println!("{} -> {}", n, big_n);
    }

## For
The *for in contruct can be used to iterate through an Iterator, e.g, a range

    fn main() {
        for n in 1..100 {
            if n == 100{
                panic!("NEVER LET THIS RUN")
            }
        }

        println!("Success!");
    }


**Exercise** 

    fn main(){
        let names:[String; 2] = [String::from("liming"), String::from("hanmeimei")];

        for name in names {
            println!("{}", &name);
            // Do something with name...
        }

        println!("{:?}", names);

        let numbers: [i32; 3] = [1, 2, 3];
        // The elements in numbers are Copy, so there is no move here
        for n in numbers{
            println!("{}", n);
            // Do something with name..
        }
    }

**Exercise**

    fn main() {
        let a: [i32; 4] = [4, 3, 2, 1];

        // Iterate thr indexing and value in 'a'
        for (i, v) in a.iter().enumerate(){ // using enumerate method similar to enumerate of python
            println!("The {}th element is {}", i+1, v);
        }
    }

## While loop

A while keyword can be used to run a loop when a condition is true.  

    fn main() {
        let mut n: i32 = 1;

        // Looping while the condition is true
        while n <> 10 {
            if n % 15 == 0 {
                println!("fizzbuzz");
            } else if n % 3 == 0 {
                println!("fizz");
            } else if n % 5 == 0 {
                println!("buzz");
            } else {
                println!("{}", n);
            }

           n += 1; // incrementing the number 
        }

        println!("n reached {}, so loop is over", n);
    }

## Break

We can use *Break* statement to break the loop

    fn main() {
        let mut n: i32 = 0;
        for i in 0..=100 {
            if n == 66 {
                __ // break;
            }
            n +=1;
        }

        assert_eq!(n , 66);

        println!("Success!");
    }

## Continue

Continue will skip over the remaining code in current iteration and go to the next iteration.

    fn main(){
        let mut n = 0;
        for i in 0..=100{
            if n != 66 {
                n +=1;
                continue;
            }

            __ //break;
        }

        assert_eq!(n, 66);

        println!("Success!");
    }

## Loop

Loop is special iterator that is generally used with break or continue. 
It is basically an infinte loop that has to be broken out of or skip some iterations using the continue and break statements.

fn main(){
    let mut count = 0u32;

    println!("Let's count until infinity!");

    // Infinte loop
    loop{
        count += 1;
        if count == 3{
            println!("three");
            // skip the rest of this iteration
            continue;
        }

        println!("{}", count);

        if count == 5{
            println!("OK, that's enough");

            break;
        }

    }
}

#### Note:
In rust you can also return a value with the break statement.

**Exercise**
fn main(){
    let mut counter: i32 = 0;

    let result = loop {
        counter += 2;

        if counter == 10{
            break counter;  // returning counter while we break
        }
    };

    assert_eq!(result, 20);

    println!("Success!");
}

## Nested loop control:
It's possible to brek or continue outer loops when dealing with nested loop, in these cases, the loops must be annotated with some 'label', and the label must be passed to the break/ continue statement.

    fn main() {
        let mut count = 0;
        'outer: loop{
            'inner: loop {
                if count >=20 {
                    // this would break only the inner1 loop 
                    break 'inner1;
                }
                count += 2;
            }

            count += 5;

            'inner2: loop {
                if count >= 30 {
                    //This breaks the outer loop 
                    break 'outer;
                }

                // This will continue the outer loop
                countinue 'outer;
            }
        }

        assert!(count == 30);

        println!("Success!");
    }

# Pattern Match 

It is a powerful construct that allows to compare a value against a set of patterns, then execute different code based on which pattern matches. Patterns can be made up of literal values, variable names, wildcards, etc. In match, all possible cases must be handled, enforced by the compiler.

Example, 

    enum Coin {
        Penny,
        Nickel, 
        Dime, 
        Quarter,
    }

    fn value_in_cents(coin: Coin) -> u8 {
        match coin {
            Coin:: Penny => 1,
            Coin::Nickel => 5,
            Coun::Dime => 10,
            Coin::Quarter => 25,
        }
    }

Here, we have an enum Coin which holds differnt denominations of US coins.

value_in_cents() takes as argument a Coin (which can only hold one field of the enum) and checks, which field in the enum has been matched. Then reutns the right amount as u8.

# if let

In a match statement, every case has to be handled. This sometimes leads to annoying boilerplate code that is not necessary. Instead we can use if let to unwrap a value of an Option type.

Example, 

    let config_max = some(3u8);
    match config_max{
        some(max) => println!("The maximum is configured to be {}", max), 
        _ => (),
    }

To avoid the boilerplate code given above we can use if let 

    let config_max = some(3u8);
    if let Some(max = config_max) {
        println!("The maximum is configured to be {}", max);
    }

**Exercise**

    enum Direction {
        East,
        West, 
        North, 
        South, 
    }

    fn main() {
        let dire = Direction::South;
        match dire {
            Direction::East => println!("East"),
            Direction::North | Direction::South => {// Matching South or North here
                println!("South or North");
            },
            Direction::West => println!("West"),
        };
    }

#### Note:
Match is an expression and not a statement so we can use it in assignements.

Example, 
    
    fn main() {
        let boolean: bool = true;

        // Fill the blank with a match expression:
        //
        // boolean = true => binary = 1
        // boolean = false => binary = 0
        let binary = match boolean{
            true => 1,
            false => 0,
        };

        assert_eq!(binary, 1);

        println!("Success!");
    }


Using match to get the data an enum variant holds.

    enum Message {
        Quit, 
        Move { x: i32, y: i32},
        Write(Sring),
        ChangeColor(i32, i32, i32),
    } 

    fn main(){
        let msgs: [Message, 3] = [
            Message::Quit, 
            Message::Move{x:1, y:3},
            Message::ChangeColor(255, 255, 0)
        ];

        for msg in msgs {
            show_message(msg)
        }

        println!("Success!");
    }

    fn show_message(msg: Message) {
        match msg {
            Message::Move => {
                // match Message::Move
                assert_eq!(a, 1);
                assert_eq!(b, 3);
            }, 
            Message::ChangeColor(_, g, b) => {
                assert_eq!(g, 255);
                assert_eq!(b, 0); 
            }

              => println!("no data in these variants");
        }
    }


# Matches

They look like "Match", but can do something different. It allows us to test an array for a pattern match.

Example, 
    fn main() {
        let alphabets: [char; 7] = ['a', 'E', 'Z', '0', 'X', '9', 'Y'];

        // Fill the blank with 'matches!' to make the code work 
        for ab in alphabets {
            assert!(matches!(ab, 'A'..='Z'|'a'..='z'|'0'..='9'))
        }

        println!("Success!");
    }

let's see the assert statement more in detail.

    assert!(matches!(ab, 'A'..='Z'|'a'..='z'|'0'..='9'))

In this statement we are using the *matches* function to check for pattern. 

The pattern here is to check if the characters from the array is an alphabet or a number. 

The statement below means from A to and including Z.

    'A'..='Z'

**Exercise**

    enum MyEnum{
        Foo,
        Bar
    }

    fn main(){
        let mut count = 0;

        // we have mentioned a vector here. The size of the vector can shrink or expand, in other words it is a dynamic arrray (in terms of size) 
        let v: Vec<myEnum> = vec![MyEnum::Foo, MyEnum::Bar, MyEnum::Foo];
        for e in v{
            if mstches!(e == MyEnum::Foo) {   
                count += 1;
            }
        }

        assert_eq!(count, 2);

        println!("Success!");
    }

**Exercise (If let)**

    fn main() {
        let o: Option<i32> = Some(7);

        // Remove the whole 'match' block , using 'if let' instead
        match o {
            Some(i) => {
                println!("This is a really long string and '{:?}", i);
            
                println!("Success!");
            }
            _
             => {}
        };

        // This is the solution
        if let Some(i) = o {
            println!("This is a really long string and '{:?}", i);
            
            println!("Success!");
        }

**Exercise**

        enum Foo {
            Bar(u8)
        }

        fn main() {
            let a : Foo= Foo::Bar(1);

            // solution
            if let Foo::Bar(i) = a {
                println!("foobar holds the value: {}", i);

                println!("Success!");
            }
        }
    
    }

**Exercise**

    enum Foo {
        Bar,
        Baz,
        Qux(u32)
    }

    fn main()
    {
        let a: Foo = Foo::Qux(10);

        // Remove the codes below, using 'match' instead
        if let Foo::bar = a {
            println!("match foo::bar")
        } else if let Foo::Baz = a {
            println!("match foo::baz")
        } else {
            println!("match others")
        }

        match a{
            Foo::Bar => println!("match Foo::bar"),
            Foo::Baz => println!("match Foo::baz"),
            _ => println!("match others"),
        }

    }

**Shadowing**

    fn main(){
        let age: Option<i32> = Some(30);
        if let Some(age) = age {
            assert_eq!(age, Some(30));
        }   //  The new variable 'age' goes out of scope here

        match age{
            // Match can also intorduce a new shadowed variable
            Some(age) => println!("age is a new variable, it's value is {}", age),
            _ => ()
        }
    }

# Pattern

Just like in C/C++ or any other language yoou can use Logical OR (|) to match multiple patterns. One can also use ..= to match an inclusive range.

    fn main(){}
    fn match_number(n: i32){
        match n {
            1 => println!("One!"),
            //Fill in the blank with '|', DON'T use '..' or '..='
            2 | 3 | 4 | 5 => println!("match 2-> 5"),
            // Match an inclusive range
            6..=10 => {
                println!("match 6 -> 10")
            }, 
            _ => {
                println!("match -infinite -> 0 or 11 -> infinite")
            }
        }
    } 


**Exercise**

The **@** operator lets us create a variable that holds a value, at the same time we are testing that value to see wheater it matches a pattern.

    struct Point{
        x: i32,
        y: i32,
    }

    fn main(){
        // Fill in the blank to let p match the second arm
        let p: Point = Point { x:__, y:__ }; // 0 < x < 5, y = 10 / 20 / 30

        match p {
            Point {x, y: 0 }=> println!("On the x axis at {}", x),
            //second arm 
            Point{ x:0..=5, y: y@ ( 10 | 20 | 30 ) }=> println!("On the y axis at {}"), 
            Point{ x, y } => println!("On neither axis: ({}, {})", x, y)
        }
    }

**Exercise**

    enum Message{
        Hello{ id: i32},
    }

    fn main(){

        let msg: Message = Message::Hello{id: 5};

        match msg{
                
            Message::Hello {
                id: id@3..=7,
            }, => println!("Found an id in range[3, 7]: {}", id),
            Message::Hello {
                id: newid@ (10 | 11 | 12) } => {
                    println!("Found an id in another range[10, 12]: {}", newid)
                }
            Message::Hello { id } => println!("Found some other id: {}", id),
        } 
    }


# Match Guard

It is an additional if condition specified after the pattern in a match arm that must also match, along with the pattern matching, for that arm to be chosen.

    fn main() {
        let num: Option<i32> = Some(4);
        let split: i32 = 5;
        match num {
            Some(x) if x < split => assert!(x < split),
            Some(x) => assert!(x >= split),
            None => (),
        }

        println!("Success!");
    }

**Exercise**
Ignoring the remaining part of the value with ..

    // Fill in the blank to make the code work
    fn main(){
        let numbers = {2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048};

        match  numbers {
            (first, .. , last) =>{  // this is destructuring
                assert_eq!(first, 2);
                assert_eq!(last, 2048);
            }
        }

        println!("Success!");
    }

**Exercise**

Using pattern &mut V to match a mutable reference needs you to be very careful, dure to v being a value after matching.

    //FIX the error with least changing
    // Don't remove any code line
    fn main(){
        let mut v: String = String::from("hello,");
        let r : &mut String = &mut v;

        match r {
            &mut value => value.push_str("world!") 
            // r is already a mutable reference so we don't need to do it again with value

            // Solution:
            // value => value.push_str("world!")
        }
    }

# Method

##Definition: Methods are similar to functions: Declare with fn, have parameters and a return value. Unlike functions, methods are defined within the context of a struct (or an enum or a trait object), and their first parameter is always self, which represents the instance of the struct the method is being called on. 

A method is a function that is associated with a particular type or struct. It takes parameters and returns a value, but defined as a memeber of a struct or enum. It is called using dot notaion(like accessing memebers of a struct). It is implemented through an "impl" block.

Example, 

    #[derive(Debug)]
    struct Rectangle {
        width: u32, 
        height: u32, 
    }

    impl Rectangle {
        fn area(&self) -> u 32 {
            self.width * self.height
        }
    }


Inside the impl block for the type Rectangle we define the method area() that doesn't take any arguments and returns the product of width and height of an instance as an u32 integer.

    let rect1 = Rectangle{
        width: 30, 
        height: 50, 
    };

    println!("The area of the rectangle is {} square pixels.", rect1.area());

Here, we create an instance of Rectangle with values for width and height. Then we can call the method using dot notation on the instance we've created.

*self* referes to the instance the method is called upon, in this case rect1.

# Associated functions
Functions that is assiociated with a struct or an enum, but doesn't take an instance as its first parameter. It is called using the name of the type, not an instance of it. It is often used as constructors for a struct or enum.

    [#derive(Debug)]
    struct Rectangle {
        width: u32, 
        height: u32,
    }

    impl Rectangle {
        fn new(width: u32, ,height: u32) -> Rectangle {
            Rectangle {
                width, 
                height,
            }
        }
    }

    fn main(){
        let rec1: Rectangle = Rectangle::new(5, 10);

        println!("Rectangle: {:?}", rec1);
    }

new() is an associated function because it doesn't have "self" as its first parameter. 

So, to call the new() function, we don't need an instance of the struct.

We can then call the associated function by using the name of the struct and the method name sparated by "::".

**Exercise**
    struct Rectangle {
        width: u32, 
        height: u32,
    }

    impl Rectangle{
        // Complete the are method which returns the are of a rectangel.
        fn area(&self) -> u32 {
            self.width* self.height
        }
    }

    fn main() {
        let rect1: Rectangle = Rectangle { width: 30, height: 50};

        assert_eq!(rect1.area(), 1500);

        println!("Success!");
    }


#### Note: 
*self* will take the ownership of the current struct instance, however, *&self* will only borrow a reference from the instance.

    struct TrafficLight{
        color: String,
    }
    impl TrafficLight{
        // Using 'Self' to fill in the blank.
        pub fn show_state(&self) {
            println!("the current state is {}", self.color);
        }

        //Fill in the blank, Don't use any variants of 'self'.
        pub fn change_state(&mut self) {
            self.color = "green".to_string()
        }
    }

    fn main(){
        println("Success!");
    }


#### Note: *self: &mut Self* is the same as *&mut self*.

**Exercise**

All functions defined within an *impl* block are caleld associated functions because they're associated with the type named after the *impl*. We can define associated functions that don't have self as their first parameter ( and thus are not methods) because they don't need an instance of the type to work with.

    #[derive(Debug)]
    struct TrafficLight{
        color: String,
    }

    impl TrafficLight {
        //1. Implement an associated function 'new',
        //2. It will return a TrafficLight contains color "red"
        //3. Must use 'Self', Don't use 'TrafficLight' in the fn signatures or body
        pub fn new() -> Self {
            Self{
                color: String::from("red"),
            }
        }

        pub fn get_state(&self) -> &str {
            &self.color
        }
    }

    fn main() {
        let light: TrafficLight = TrafficLight::new();
        assert_eq!(light.get_state(), "red");

        println!("Success!");
    }

## Multiple impl block

Each struct is allowed to have multiple *impl* blocks.

    struct Rectangle {
        width: u32, 
        height: u32,
    }

    //Using multiple 'impl' blocks to rewrite the code below.
    impl Rectangle{
        fn area(&self) -> u32 {
            self.width * self.height
        }
    }

    impl Rectangle{
        fn can_hold(&self, other: &Rectangle) -> bool {
            self.width > other.width && self.height > other.height
        }
    }

## Methods for Enum

We can also implemnent methods for enums.

    #[derive(Debug)]
    enum TrafficLightColor {
        Red, 
        Yellow, 
        Green,
    }

    //Implement TrafficLightColor with a method
    impl TrafficLightColor{
        fn color(&self) -> &str {
            match self{
                TrafficLightColor::Yellow => "yellow",
                TrafficLightColor::Green => "green",
                TrafficLightColor::Red => "red",
            }
        }

    }

    fn main() {
        let c = TrafficLightColor::Yellow;

        assert_eq!(c.color, "yellow");

        println!("{:?}", c);
    }

# Generics

These are placeholder for concrete types. It Enables writing more reusable and flexible code.

## Benefits:
- avoid having duplicate code for different types
- Zero cost abstraction, i.e., Rust compiler will at compile time fill out the generics with concrete types.

## Cost Generics (Advanced topic):
It a type parameter that represents a compile-time constant value. It allows to write generic code that operates on values that are known at compile time. It is used for array sizes, bit widths and other constants.

**Exercise**

    // FIll in the blanks to make it work
    struct A;           // Concrete type 'A'.
    struct S(A);        // Concrete type 'S'.
    struct SGen<T>(T)   // Generic type 'SGen'.

    fn reg_fn(_s: S){}

    fn gen_spec_t(_s: SGen<A>) {}

    fn gen_spec_i32(_s: SGen<i32>) {}

    fn generic<T>(_s: SGen<T>) {}

    fn main(){
        // Using the non-generic functions
        reg_fn(S(A));     // Concrete type
        gen_spec_t(SGen(A)); // Implicitly specified type parameter'A'.
        gen_spec_i32(SGen(7));   //Implicitly specified type parameter 'i32'.

        // Explicitly specified type parameter 'char' to 'generic()'.
        generic::<char>(SGen('c')); // here can only pass a char type value

        // Implicitly specified type parameter 'char' to 'generic()'.
        generic(SGen('z')); // here we can pass value of any type
    }


A function call with explicitly specified type parameters looks like: fun::<A, B,...>

    // Implement the generic function below
    struct SGen<T>(T)
    fn sum<T: std::ops::Add<Output = T>>(a: T, b: T) -> T {
        a + b
    }

    fn main() {
        assert_eq!(5, sum(2i8, 3i8));
        assert_eq!(50, sum(20, 30));
        assert_eq!(2.46, sum(1.23, 1.23));

        println!("Success");
    }

**Exercise**

3.

    //Implement struct Point to make it work.
    struct Point <T>{
        x: T,
        y: T,
    }


    fn main() {
        let integer: Point<i32> = Point { x: 5, y: 10};
        let float: Point<f64> = Point{ x: 1.0, y: 4.0};

        println!("Success!");
    }

4.

    // Modify this struct to make the code work
    struct Point<T, U> {
        x: T, 
        y: U,
    }

    fn main() {
        // Don't modify this code.
        let p: Point<i32, String> = Point{x:5, y:"hello".to_string()};

        println!("Success!");
    }

5.

    // Add generic for Val to make the code work, Don't modify the code in 'main'
    struct Val <T>{
        val: T,
    }

    impl<T> Val<T>{
        fn value(&self) -> &T {
            &self.val
        }
    }

    fn main() {
        let x: Val<f64> = Val{ val: 3.0};
        let y: Val<String> = Val{ val: "hello".to_string()};
        println!("{}, {}",.x.value(), y.value());
    }

6.

    struct Point<T, U> {
        x: T,
        y: U,
    }

    impl<T, U> Point<T, U>{
        // Implement mixup to make it work, Don't modify other code.
        fn mixup<V, W>(self, other: Point<V, W>) -> Point <T, W>{
            Point{
                x:self.x, 
                y: other.y,
            }
        }
    }

    fn main(){
        let p1: Point<i32, i32> = Point( x:5, y: 10);
        let p2: Point<&str, char> = Point( x: "Hello", y: 'c');

        let p3 = p1.mixup(p2);

        assert_eq!(p3.x = 5);
        assert_eq!(p3.y, 'c');

        println!("Success!");
    }

7.

    // Fix the error to make the code work.
    struct Point<T>{
        x: T,
        y: T,
    }

    impl Point<f32> {       // self has to be f64 as per the powi documentation.
        fn distance_from_origin(&self) -> f32 {
            (self.x.powi(2) + self.y.powi(2)).sqrt()
        }
    }

    fn main() {
        let p = Point<f64>{x: 5, y: 10};
        println!("{}", p.distance_from_origin());
    }

**Exercise** (Const generics)

    struct Array<T, const N: usize> {
        data: [T; N]    // array of type T and size N
    }

    fn main() {
        let arrays: [Array<i32, 3>; 3] = [
            Array{
                data: [1, 2, 3],
            },
            Array{
                data: [1.0, 2.0, 3.0],  // can't use floats here it has to be int (i32) data: [1, 2, 3]
            },
            Array{
                data: [1, 2]    // number of elements here should also be the same as the others (3 elements)
                // data: [4, 5, 6]
            }
        ];

        // valid declaration
        let floats: [Array<f64, 2>; 3] = [
            Array{ data: [1.0, 2.0] }, 
            Array{ data: [3.0, 4.0] },
            Array{ data: [5.0, 6.0] },
        ]

        println!("Success");
    }

# Traits:

It is a set of methods that can be implemented for multiple types in order to provide common functionality and behaviour between them. Traits consists of method signatures only, which then have to be implemented by the target type. It is similar to "classes" in other languages, not quite the same through. It defined the shared behaviour in an abstract way. 

Example, 

    trait Animal{
        fn sound(&self) -> String;
    }

    struct Sheep;
    struct Cow;
    
    impl Animal for Sheep {
        fn sound(&self) -> String {
            String::from("Maah")
        }
    }

    impl Animal for cow {
        fn sound(&self) -> String{
            String::from("Mooh")
        }
    }


Trait Animal has one method, sound(). In the trait we define only the signature.

Then we implement this trait for every type we want. Here we copy the signature and write the actual method.

# Deriveable Traits

It is the traits that can be automatically implemented for a struct or an enum by the Rust compiler. It is called "derivable" because they can be derived automatically. Mot common derivable traits: 
- Debug: Allowing to output content via "{:?}" 
- Clone: Enables type to be duplicated with  "clone()" method
- Copy: Enables type to be copied implicity, without requireing explicit "clone()" method
- PartialEq: Enables comparison.

## Traits as parameters

Traists can be used as parameters for functions. 

The function notify() takes as arguments any type that has implemented the Summary trait.

## Trait Bounds
 
Similar to example using "impl Summary" but more verbose. Trait bounds are declared like generics, after name of the function. Use trait bounds if you have lots of parameters to avoid this:
Example, 

    pub fn notify<T: Summary> (item: &T) {  // passing a trait as a parameter to a function
        println!("Breaking news! {}", item.summarize());
    }

    pub fn notify(item1: &impl Summary, item2: &impl Summary) {
        ...
    }

    pub fn notify <T: Summary>{item1: &T, item2: &T}{
        ...
    }

## Where Clauses

    fn some_function<T: Display + Clone, U: CLone + Degree>(t: &T, u: &U) -> i32 {
        ...
    }

if you have a function that makes heavy use of trait bounds, we can use a where clause to make the code cleaner:

    fn some_function<T, U>(t: &T, u: &U) -> i32 
    where
        T: Display + Clone, 
        U: Clone + Debug
    {
        ...
    }

Instead of declaring the trait parameter in the generic block we do it in a separte block using the where clause. It helps to make the code more readable.

## Return Types that Implement Trait

Here we have a trait Animal which is implemented for two structs, Dog and Cat.

    trait Animal {}

    struct Dog;
    struct Cat;

    impl Animal for Dog {}
    impl Animal for Cat {}

    fn return_dog() -> impl Animal {
        Dog {}
    }

    fn return_cat() -> impl Animal {
        Cat {}
    }

    fn main() {
        return_dog();
        return_cat();
    }

The two functions return a strut, wither Dog or Cat. that implements the Animal trait.

**Exercise**

1. Here we have implemented the "say_hi" function completely in the trait. This is called a default implementation, meaning that any type that implements this trait will automatically get the default implementation of this trait. So, the "say_hi" method need not be implmented in all the types that implements this trait. 

We only have the implementation of the function "say_something" so we need to implement the whole function 
    
    // Fill in the two impl blocks to make the code work. 
    // Don't modify the code in 'main' 
    trait Hello{
        fn say_hi(&self) -> String {
            String::from("hi")
        }

        fn say_something(&self) -> String;
    }

    struct Student {}
    impl Hello for Student{
        fn say_something(&self) -> String {
            String::from("I'm a good student")
        }
    }

    struct Teacher {}
    impl Hello for Teacher {
        fn say_hi(&self) -> String {
            String::from("Hi, I'm your new teacher")
        }

        fn say_something(&self) -> String {
            String::from("I'm not a bad teacher")
        }
    }

    fn main() {
        let s = Student {};
        assert_eq!(s.say_hi(), "hi");
        assert_eq!(s.say_something(), "I'm a good student");

        let t = Teacher {};
        assert_eq!(t.say_hi(), "Hi, I'm your new teacher");
        assert_eq!(t.say_something(), "I'm not a bad teacher");
        
        println!("Success!");
    }

2. Derive: The compiler is capable of providing basics implementations for some traits via the #[derive] attribute. 

**Exercise**

    // 'Centimeters', a tuple struct that can be compared
    #[derive(PartialEq, PartialOrd)]
    // PartialEq is for comparing equality
    // PartialOrd is for ordering 
    struct Centimeters(f64);

    // 'Inches', a tuple struct that can be printed
    #[derive(Debug)]
    struct Inches(i32);

    impl Inches {
        fn to_centimeters(&self) -> Centimeters {
            let &Inches(inches) = self;

            Centimeters(inches as f64 * 2.54) // This is getting returned
        }
    }

    // ADD some attributes to make the code work!
    // Don't modify other code!
    [#derive(Debug, PartialEq, PartialOrd)]
    struct Seconds(i32);

    fn main(){
        let _one_second: Seconds = Seconds(1);

        println!("One second looks like: {:?}", _one_second);
        let _this_is_true = (_one_second == _one_second);
        let _this_is_true = (_one_second > _one_second);

        let foot: Inches = Inches(12);

        println!("One food equals {:?}", foot);

        let meter: Centimeters = Centimeters(100.0);

        let cmp = 
            if foot.to_centimeters() < meter {
                "smaller"
            } else {
                "bigger"
           };

           println!("One foot is {} than one meter.", cmp);
    }

# Operator

In Rust, many of the operators can be overloaded via traits. That is, some operators can be used to accomplish different tasks based on their input arguments. This is possible because operators are syntactic sugar for method calls. For example, the + operator in a + b calls the add method (as ini a.add(b)). This add method is part of the Add trait. Hence, the + operator can be used by any implementor of the Add trait.

**Exercise**

    use std::ops;

    //Implement fn multiply to maket he code work. 
    // As mentioned above, '+' need 'T' to implement 'std::ops::Add' Trait. 
    // So, what about '*'?
    fn multiply<T: std::ops::Mul<Output = T>> (a:T, b:T) -> T{
        a * b // return the product // this is equivalent to a.mul(b)
    }

    fn main() {
        assert_eq!(6, multiply(2u8, 3u8));
        assert_eq!(5.0, multiply(1.0, 5.0));

        println!("Success!");
    }


**Note:** Only operators that are backed by a trait can be overloaded. For example, the addition operator (+) can be overloaded through the Add trait, but since the assignment operator (=) has not backing trait, there is not way of overloading its semantics. Also, this mechanism doesn't provide any mechanism to create new operators.

    use std::ops;

    struct Foo;
    struct Bar;
    
    #[derive(PartialEq)]
    struct FooBar; 
    #[derive(PartialEq)]
    struct BarFoo;

    // The 'std::ops::Add' trait is used to specify the functionality of '+'.
    // Here, we make 'Add<Bar>' - the trait for addition with a RHS of type 'Bar'. 
    // The following block implements the operation: Foo + Bar  = FooBar
    // Foo + Bar -> Foo.add(Bar)
    // Foo + Foo -> Foo.add(Foo)
    impl ops::Add<Bar> for Foo {
        type Output = FooBar;

        fn add(self, _rhs: Bar) -> FooBar {
            FooBar
        }
    }


    // Foo - Bar -> Foo.sub(Bar)

    impl ops::Sub<Foo> fro Bar {
        type Ouptput = BarFoo;

        fn sub(self, _rhs: Bar) -> BarFoo {
            BarFoo
        }
    }

    fn main() {
        // Don't modify the code below.
        // You  need to derive some trait for FooBar to make it comparable. 

        assert_eq!(Foo + Bar, FooBar);
        assert_eq!(Foo - Bar, BarFoo);

        println!("Success!");
    }

**Exercise**

    // Implement 'fn Summary' to make the code work. 
    // Fix the errors without removing any code line
    trait Summary {
        fn summarize(&self) -> String;
    }

    #[derive(Debug)]
    struct Post {
        title: String,
        authour: String,
        content: String,
    }

    impl Summary for Post {
        fn summarize(&self) -> String{
            format!("The author of post {} is {}", self.title, self.author)
        }
    }

    #[derive(Debug)]
    struct Weibo{
        username: String, 
        content: String,
    }

    impl Summary for Weibo {
        fn summarize(&self) -> String {
            format!("{} published a weibo {}", self.username, self.content)
        }
    }

    fn main() {
        let post = Post {
            title:"Popular Rust".to_string(),
            author: "Sunface".to_string(),
            content: "Rust is awesome!".to_string(),
        };

        let weibo  = Weibo{
            username:"sunface".to_string(),
            content: "Weibo seems to be worse than Tweet".to_string(),
        };

        summary(post)   
        summary(weibo)

        println!("{:?}", post);
        println!("{:?}", weibo);
    }
    
    // Note that while post and weibo are of different types they both implement the summary trait.
    // use reference to avoid the change of ownership of the variable 
    fn summary(a: &impl Summary) {
       let output: String =  a.summarize();
    
        println!("{}", output);
    } 

 

## Returning Types that Implement Traits

We can also use the impl Trait syntax in the return position to return a value od some type that implements a trait.

However, you can only use impl Trait if you're returning a single type, use Trait Objects instead when you really need to return several types.

**Exercise**

    struct Sheep {}
    struct Cow {}

    trait Animal {
        fn noise(&self) -> String;
    }

    impl Animal for Sheep {
        fn noise(&self) -> String {
            "baaaah!".to_string()
        }
    }

    impl Animal for Cow{
        fn noise(&self) -> String {
            "moooo!".to_string()
        }
    }


    //Returns some struct that implements Animals, but we don't know which one at compile
    // Fix the errors here, you can make a fake random, or you can use trait object.
    fn random_Animal(random_number:f 64) -> Box<dyn Animal>{
        if random_number < 0.5 {
            Box::new(Sheep {})
        } else {
            Box::new(Cow {})
        }
    }

    fn main() {
        let random_number: f64 = 0.234;
        let animal: Box<dyn Animal> = random_animal(random_number);
        println!("You're randomly chosen an animal, and it says{}", animal.noise());
    }

# Trait Objects

Using 'impl Trait' doesn't work when returning multiple types. Different implementation of a trait probably use different amounts of memory, but sizes of types must be known at complie time. In this case, trait objects can be used. A trait Objet is essentially a pointer to any type that implements the given trait, where the precise type can only be known at runtime.

## Dynamic Trait Objects

    trait Animal{}

    struct Dog;
    struct Cat;

    impl Animal for Dog{}
    impl Animal for Cat{}

    fn return_animal(s: &str) -> &dyn Animal {
        match s {
            "dog" => &Dog {},
            "cat" => &Cat {},
            _ => panic!(),
        }
    }

    fn main() {
        let animal1 = return_animal("cat");
        let animal2 = return_animal("dog");
    }

here we have a function which returns a type that implements the Animal trait. This could be Dog or Cat. As the trait object is behind a pointer, the size is known at complier time, which is usize(size of the pointer).

This allows for more flexible code as the exact return type doesn't have to be known at compile time as long as the size is fixed.

## Static Dispatch

- Resolves method calls at compile time.
- Compiler generates function code for each concrete type that implements trait
- Calls appropriate function based on concrete types
- Faster and more efficient based than dynamic dispatch, but doesn't provide great flexibility.

# Dynamic Dispatch 

In dynamic dispatch specific methods to be called is determined at runtime. This works by creating a reference or smart pointer to a triat object using '&dyn' or 'Box\<dyn >'. When trait object is created, compiler will build a vtable for that trait. 

**vtable* is a table that contains a pointer to the implementation of each method in the trait for the specific type of the object that the reference points to. Compiler will do a looup in a vtable to determine which method should be called for which type that implements the given trait. This loopup will cause overhead but allows for more flexible code.

# Box

Box is a smart pointer that allows to store data on the heap rather than the stack. Use Box when you have a type whose size can't be known at compile time. It returns a pointer to the data stores on the heap.

# & vs Box

## Memory :
Box allocates data on heap and owns it, also repsonsible for deallocating when value goes out of scope, reference only points to a value already in memory

## Lifetime: 
Box can be passed across scopes, reference has limited lifetime.

- Box can be cloned, reference can't.
- Box can be used in pattern matching.

**Exercise** 

**Trait Bound**

The impl Trait syntax word for straightforward cases but is actually syntax sugan for a longer form, which is called a trait bound. 

When working with generics, the type parameters often must use traits as bounds to stipulate what functionality a type implements.

    fn main() {
        asssert_eq!(sum(1,2), 3);

        println!("{}", sum(5,5));
    }

    // Implement 'fn sum' with trait bound in two ways.
    fn sum<T: std::ops::Add<Output = T>>(x: T, y: T) -> T{
        x + y
    }

**Exercise**

    //Fix the errors.
    struct Pair<T> {
        x: T,
        y: T,
    }

    impl<T> Pair<T> {
        fn new(x: T, y: T) -> Self {
            Self{
                x,
                y,
            }
        }
    }

    impl <T::std::fmt::Debug + PartialOrd +PartialEq> Pair<T> {
        fn cmp_display(&self) {
            if self.x >= self.y {
                println!("The largest member is x = {:?}", self.x);
            } else
            {
                println!("The largest memeber is y = {:?}", self.y);
            }
        }
    }

    [#derive(Debug, PartialOrd, PartialEq)]
    struct Unit(i32);

    fn main () {
        let pair = Pair{
            x: Unit(1), 
            y: Unit(3)
        };
        
        // The declaration of pair that is mentioned above and below are equivalent.
        let pair: Pair<Unit> = Pair::new(Unit(1), Unit(3));

        pair.cmp_display();
    }

# Associated Types

Associated types allow to specify a type that is associated with the trait. When implementing the trait for a specific type we have to specify the concrete type. Basically a type placeholder that the trait methods can use in their signature. Similar to generic types but are more flexible because they allow a triat to have different associated types for different implementing types.

Example, 

    //1
    trait MyTrait {
        type MyType;
        
        fn get_my_type(&self) -> Self::MyType;
    }
    
    //2
    struct MyStruct{}

    impl MyTrait for MyStruct {
        type MyType = i32;
        fn get_my_type(&self) -> Self::MyType {
            return 42;
        }
    }

**Exercise**

    trait Bird{
        fn quack(&elf) -> String;
    }

    struct Duck;
    impl Duck {
        fn swim(&self) {
            println!("Look, the duck is swimming")
        }
    }

    struct Swan;
    impl{
        fn fly(&self) {
            println!("Look, the duck ... oh sorry, the swan is flying")
        }
    }

    impl Bird for Duck {
        fn quack(&self) -> String {
            "duck duck".to_string()
        }
    }

    impl Bird for swan {
        fn quack(&self) -> String {
            "swan swan".to_string()
        }
    }

    fn main() {
        // Fill in the blank.
        let duck = __;
        duck.swim();

        let bird: Box<dyn Bird> = hatch_a_bird(2);
        // This bird has forgotten how to swim, so below lline will cause an error.
        // bird.swim();
        // But it can quack.
        assert_eq!(bird.quack(), "duck duck");

        let bird: Box<dyn Bird> = hatch_a_bird(1);
        // This bird has fogotten how to fly, so below line will cause an error.
        // bird.fly();
        //But it can quack too.
        assert_eq!(bird.quack(), "swan swan");

        println!("Success");
    }

    // Implement this function
    fn hatch_a_bird(species: u8) -> Box<dyn Bird> {
        match species {
            1 => Box::new(Swan),
            2 => Box::new(Duck),
            _ => panic!(), 
                
        }
    }

**Exercise**
**Array with trait objects**

    trait Bird{
        fn quack(&self);
    }

    struct Duck;
    impl Duck {
        fn fly(&self) {
            println!("Look, the duck is flying")
        }
    }

    struct Swan;
    impl Swan {
        fn fly(&self){
            println!("Look, the duck... oh sorry, the swan is flying")
        }
    }

    impl Bird for Duck{
        fn quack(&self) {
            println!("{}", "duck duck");
        }
    }

    impl Bird for swan{
        fn quack(&self) {
            println!("{}", "swan swan");
        }
    }

    fn main() {
        // Fill in the blanks to make the code work.
        let birds: [&dyn Bird; 2] = [&Duck, &Swan]; // usize

        for bird in birds {
            bird.quack();
            // the code below will cause an error.
            //bird.fly();
        }
    }

**&dyn and Box\<dyn>**

    Trait Draw{
        fn draw(&self) -> String;
    }

    impl Draw for u8 {
        fn draw(&self) -> String{
            format! ("u8: {}", self)
        }
    }

    impl Draw for f64 {
        fn draw(&self) -> String {
            format!("f64: {}", self)
        }
    }

    fn main() {
        let x = 1.1f64
        let y = 8u8;

        // Draw x.
        draw_with_box(Box::new(x));

        // Draw y.
        draw_with_ref(&y);

        println!("Success!");
    }

    fn draw_with_box(x: Box<dyn Draw>) {
        x.draw();
    }

    fn draw_with_ref(x: &dyn Draw) {
        x.draw(); 
    }


**Exercise**

    trait Foo {
        fn method(&self) -> String;
    }

    impl Foo for u8 {
        fn method(&self) -> String { format!("u8: {}", *self) }
    }

    impl Foo for String {
        fn method(&self) -> String { format!("string: {}", *self)}
    }

    // Implement below with generics.
    fn static_dispacth<T: Foo> (a: T){
        a.method();
    }

    // Implement below with trait objects.
    fn dynamic_dispatch (a: &dyn Foo){
        a.method();
    }

    fn main() {
        let x: u8 = 5u8;
        let y: String = "Hello".to_string();

        static_dispatch(x);
        dynamic_dispatch(&y);

        println!("Success!");
    }

# Object safe

You can only make object-safe traits into trait objects. A trait is object safe if all the methods defined in the trait have the following properties:

- The return type isn't Self.
- There are no generic type parameters.

Example, 

    // Use at least two approachers to make it work.
    // Don't add/remove any code line.

    trait MyTrait {
        fn f(&self) -> self;
    }

    impl MyTrait for u32 {
        fn f(&self) -> self { 42 }
    }
    
    impl MyTrait for String {
        fn f(&self) -> self { self.clone() }
    }

    fn my_function(x: Box<dyn MyTrait>) {
        x.f()
    }

    fn main() {
        my_function(Box::new(13_u32));
        my_function(Box::new(String::from("abc")));
    }
    

# String

std::string::String us a UTF-8 encoded, growable string. It is the most common sting type we used in daily development, it also has owensehip over the string contents.

## Basic operations

    // Fill in the blanks and Fix errors
    // 1. Don't use 'to_string()'
    // 2. Don't add/remove any code line

    fn main() {
        let mut s: String = String::from("hello, ");
        s.puch_str("world".to_string());
        s.push('!');

        move_ownership(s.clone());

        assert_eq!(s, "hello, world!");

        println!("Success!");
    } 

    fn move_ownership(s: String) {
        println!("ownserhip of \"{}\" is moved here!", s)
    }

## String and &str 

A string is stored as a vector of bytes (Vec<u8>), but guaranteed to always be a valid UTF-8 sequence. Srting is heap allocated, growable and not null terminated.

&str is a slice (&[u8]) that always points to a valid UTF-8 sequencec, and can be used to view into a String, just like &[T] is a view into Vec<T>.


    fn main() {
        let mut s = String:: from("hello, world!");

        let slice1: &str = s.as_str(); // &String -> &str
        assert_eq!(slice1, "hello, world");

        let slice2: &str = &s[..5] ;
        assert_eq!(slice2, "hello");

        let slice3: &mut String = &mut s ;
        slice3.push('!'); 
        assert_eq!(slice3, "hello, world!");

        println!("Success!");
    }

**Exercise** 

    fn main() {
        let s: String = String::from("hello, UTF-8 characters");
        let slice1: &str = &s[..1]; // tips: 'h' only takes 1 byte in UTF8 format
        assert_eq!(Slice1, "h");

        let slice2 = &s[7..12];
        assert_eq!(slice2, "UTF-8")

        // Iterate through all chars in s
        for (i, c) in s.chars().enumerate() {
            if i == 7 {
                assert_eq!(c, ' UTF-8')
            }
        }

        println!("Success!")
    }

## UTF8_slice

There is a crate called UTF8_slice that can be imported. You can use utf8_slice to slice UTF8 string, it can index chars instead of bytes.

Example, 
    
    fn main() {
        let s = "The 🚀 goes to the 🌑!";

        let rocket = utf8_slice::slice(s, 4, 5);
        // Will equal 🚀
    }


**Exercise** 

    fn main() {
        let mut s: String = String::new();  // vec<u8>
        s.push_str("hello");

        // SOme bytes, in a vector
        let v = vec![104, 101, 108, 108, 111]; // transaltes to hello

        // Turn a byte's vector into a String
        let s1: String = String::from_utf8(v).unwrap();

        assert_eq!(s, s1);

        println!("Success!");
    }

## Representation
A String is made up of three components: a pointer to some bytes, a length, and a capacity.

The pointer points to an internal buffer String uses to store its data. The lenght is the number of bytes currently stores in the buffer (always stored on the heap), and the capacity is the size of the buffer in bytes. As such, the length will always be less than or equal to the capacity.

Note: if a String has enough capacity, adding elements to it will not re-allocate

    // Modify the code below to print out:
    // 25
    // 25
    // 25
    // Here, there's no need to allocate more memory inside the loop.
    fn main() {
        let mut s: String = String::with_capacity(25); 
        //with_capacity function will allocate 25 units of memory to that variable

        println!("{}", s.capacity());

        for _ in 0..2 {
            s.pust_str("hello");
            println!("{}", s.capacity());
        }

        println!("Success!");
    }

# Vectors

Vector is like an array but dynamically sized ,meaning they can grow or shrink. Rust allocated memory for a vector from the heap as contiguous block of memory. 

All the elements of the vector should be of the same type.It has a special macro: vec!, that can be used to initialised a vector. 

## Note:

The String is actually just a vector of type u8 that gets allocated in the heap memeory (as any vector in Rust would).

Example, 

    let s1 = String::from("hello");

Here, the variable s1 holds 
- a pointer, that points to the first element of the string that is allocated in the heap memory.
- length of the String.
- capacity of the String is the total amount of memory that is received from the allocator.

so the actual size of s1 will be 24 bytes (3 * 8 bytes).

**Exercises**

    fn main() {
        let arr: [u8; 3] = [1, 2, 3];

        let v: Vec<u8> = Vec::from(arr);
        is_vec(v);

        let v: Vec<u8> = vec![1, 2, 3];

        // vec!(..) and vec![..] are the same macros, so
        let v: Vec<u8> = vec!(1, 2, 3);
        is_vec(v.clone());

        // In code below, v is Vec<[u8; 3]> , not Vec<u8>
        // Use Vec::new and 'for' to rewrite the below code
        let mut v1: Vwx<[u8; 3]> = vec!(arr); // vec::new();
        is_vec(v1.clone());

        for i in &v {
            v1.push(*i);
        }

        assert_eq!(v, v1);
    
        println!("Success!")
    }


**Exercise**

A Vec can be extended with the extend method

    fn main()
    {
        let mut v1: Vec<i32> = Vec::from([1, 2, 4]);
        v1.pop();   // removes the last element from the vector
        v1.push(3); // add 3 to the end of the vector

        let mut v2 = Vec::new();
        v2.extend(&v1); //meaning the elements form v1 will be put in to v2. 

        assert_eq!(v1, v2);

        prinltn!("Success!");
    }

**Exercise**

Turn X into Vec

    fn main(){
        // Array -> Vec
        // impl From <[T; N]> for vec
        let arr = [1, 2, 3];
        let v1 = __(arr);   // Vec::from(arr);
        let v2: Vec<i32> = arr.__();    //arr.into();

        assert_eq!(v1, v2);

        // String -> Vec
        // impl From<String> for Vec
        let s = "hello".to_string();
        let v1: Vec<u8> = s.__();   //s.into()

        let s = "hello";
        let v2: Vec<u8> = s.not_bytes();
        assert_eq!(v1, v2); 

        // impl<'_> From <&'_ str> fro Vec
        let s = "hello";
        let v3: Vec<u8> = Vec::from(s);
        assert_eq!(v2, v3);

        // Iterators can be collected into vectors
        let v4: Vec<i32> = [0; 10].into_iter().collect();
        assert_eq!(v4, vec![0; 10]);

        println!("Success!");
    }

**Exercise**

    //Fix the error and implement the code
    fn main() {
        let mut v: Vec<i32> = Vec::from([1, 2, 3]);
        // This loop just prints all the elements present in the vector
        for i in 0..5 {
            println!("{:?}", v.get(i)) // the get method returns an option<i32> so it is a safer option
        }

        for i in 0..5 {
            // Implement the code here

            match v.get(i) {
                Some(e) => v[i] = e + 1;    // this works for the first 3 elements 
                // when we go out of bounds of the vector we need to expand the vector with value that is equivalent to i + 2
                None => v.push(i + 2)
            }
        }

        assert_eq!(v, vec![2, 3, 4, 5, 6]);

        println!("Success!");
    }

**Exercise**

Slicing a vec can be mutable. On the other hand, slices are read-only objects. To get a slice, use reference.

In Rust, it's more common to pass slices as arguments rather than vectors when you just want to provide read access. The same goes for String and &str.

    fn main() {
        let mut v = vec![1, 2, 3];

        let slice1 : &[i32] = &v[..];

        // Out of bounds will cause a panic
        // You must use 'v.len' here
        let slice2: &[i32]= &v[0..4];
        // to avoid panic use it in the format below,
        let slice2: &[i32] = &v[0..v.len()];

        assert_eq!(slice1, slice2);

        // Slices are read only
        // Note: slice and &Vec are different 
        let vec_ref: &mut Vec<i32> = &mut v;
        (*vec_ref).push(4);

        // Note: slices can't be mutated. It is only a view to 

        let slice3: &[i32] = &mut v[0..];
        slice3.push(4);

        assert_eq!()
    }
 
**Exercise**

## Capacity

The capacity of a vector is the amount of space allocated fro any future elements that will be added onto the vector. This is not to be confused witht the lenght of a vector, which specified the number of actual elemetns within the vector. If a vector's length exceeeds its capacity, its capacity will automatically be increased, but its elements will have to be reallocated.

For example, a vector with capacity 10 and length 0 would be an empty vector with space for 10 more elements. Pushing 10 or fewer elements onto the vectot will not change its capacity or cause reallocation to occur. However, if the vector's length is increased to 11, it will have to reallocate, which can be slow. For this reason, it is recommended to use Vec::with_capacity whenever possible to specify how big the vector is expected to get.

    //Fix the errors
    fn main() {
        let mut vec = Vec::with_capacity(10);

        // The vector contains no items, even though it has capacity for more
        assert_eq!(vec.len(), 0);
        assert_eq!(vec.capacity(), 10);

        // These are all done without reallocating...
        for i in 0..10 {
            vec.push(i);
        }
        assert_eq!(vec.len(), 10);
        assert_eq!(vec.capacity(), 10);

        // ...but this may make the vector reallocate
        vec.push(11);
        assert_eq!(vec.len(), 11);
        assert!(vec.capacity() >= 11);

        // Fill in an appropriate value to make the 'for' done without reallocating 
        let mut vec = Vec::with_capacity(100);
        for i in 0..100 {
            vec.push(i);

        }

        assert_eq!(vec.len(), 100);
        assert_eq!(vec.capacity(), 100);

        prinltn!("Success!");
    
    }


**Exercise**

## Store distint types in Vector

The elements in a vector must be the same type, for example, the code below will cause error:

fn main() {
    // this will cause an error as they are of different types
    let v = vec![1, 2.0, 3];
}

But we can use enums or trait objects to store distint types.

Here, we are using enums

    #[derive(Debug, PartialEq)]
    enum IpAddr{
        V4(String),
        V6(String),
    }

    fn main() {
        // Fill in the blank
        let v: Vec<IpAddr> = vec![
            IpAddr::V4("127.0.0.1".to_string()),
            IpAddr::V6("::1".to_string()),
        ];


        assert_eq!(v[0], IpAddr::V4("127.0.0.1".to_string()));
        assert_eq!(v[1], IpAddr::V6("::1".to_string()));

        println!("Success");
    }

Here, we are using trait

    trait IpAddr {
        fn display(&self);
    }

    struct V4(String);
    impl IpAddr for V4 {
        fn display(&self) {
            println!("ipv4: {:?}", self.0)
        }
    }

    struct V6(String);
    impl IpAddr for V6 {
        fn display(&self) {
            println!("ipv6: {:?}", self.0)
        }
    }

    fn main() {
        // Fill in the blanks
        let v: Vec<Box<dyn IpAddr>> = vec![
            Box::new(V4("127.0.0.1".to_string())),
            Box::new(V6("::1".to_string())),
        ];

        for ip in v {
            ip.display();
        }
    }

# HashMaps

Hashmap is a datastructure to store key-value pairs. It is allocated on the heap as it is dynamically sized, can grow and shrink. It allows for efficent lookup, insertion and deletioin of data. Each key is hashed to a unique index in underlying array. 

where vectors store values by an integer index, HashMaps store values by key. It is a hash map implemented with quadratic probing and SIMD lookup. By default, HashMap uses a hashing algorithm selected to provide resistance against HashDoS attacks.

The default hashing algorithm is currently SipHash 1-3, though this is subject to change at any point in the furture. While its performance is very comptetitive for medium sized keys, other hashing alorithms will outperform it for small keys such as integers as well as large keys such as long stings, tho ugh those algorithms wil typically not protect against attacks such as HashDos.

The hash table implementation in a Rust port of Google's SwissTable. The origianal C++ version of SwissTable can be found here, and this CppCon talk gives an overview of how the algorithm works.


**Exercise**

    //import the HashMap
    use std::collections::HashMap;

    fn main() {
        let mut scores: HashMap<&str, i32> = HashMap::new();
        scores.insert("Sunface", 98);
        scores.insert("Daniel, 95);
        scores.insert("Ashley", 69.0);
        scores.insert("Katie", "58");   // all the key value pairs should be of the same type so this would cause an error
        // to avoid error use the below statement instead
        scores.insert("Katie", 58);

        //Get returns an Option <&V>
        let score: Option<&i32> = score.get("Sunface");   // accessing the values in the HashMap 
        assert_eq!(score, some(98));

        if scores.contains_key("Daniel") {
            // Indexing returns a value V
            let score: i32 = scores["Daniel"];
            assert_eq!(score, __); //95
            scores.remove("Daniel");
        }
    
        assert_eq!(scores.len(), __);

        for (name, score) in scores {
            println!("The score of {} is {}", name, score);
        }
    }


## Note:
You can access the content of the HashMap in two ways.
- get method
- directly access

when you use a get method, returns a Option\<&T> holding a reference to type of the value. But, when you directly access the the key-value pair it returns the value in it defualt data type.

Get is generally considered safer.

Also, note that a HashMap is unordered. So, the order won't be retained.  

**Exercise**

    use std::collections::HashMap;
    
    fn main() {
        let teams: [(&str, i32); 3] = [
            ("Chinese Team", 100),
            ("American Team", 10),
            ("France Team", 50),
        ];

        let mut teams_map1: HashMap<&str, i32> = HashMap::new();
        for team in &teams {
            teams_map1.insert(team.0, team.1);
        }

        // Implement team_map2 in two ways
        // Tips: one of the approaches is to use 'collect' method 
        let teams_map2: HashMap <&str, i32> = HashMap::into_iter().collect();
        // The above method can be uesd to directly convert an array of tuples containing the key value pairs to a HashMap

        assert_eq!(teams_map1, teams_map2);

        println!("Success!");
    }

**Exercise**

    use std::collections::HashMap;

    fn main() {
        // Type inference lets us omit an explicit type signature (which
        // would be 'HasjMap<&str, u8>' in this example).
        let mut player_stats = HashMap::new();

        // Insert a key only if it doesn't already exist
        player_stats.entry("health").or_insert(100);

        assert_eq!(player_stats["health"], 100);


        // Insert a key using a function that provides a new value only if it doesn't already exist
        player_stats.entry("health").or_insert_with(random_stat_buff);
        assert_eq!(player_stats["health"], 100);

        // Ensures a value is in the entry by inserting the default if empty, and return a mutable refence to the value in the entry.
        let health = player_stats.entry("health").or_insert(50);
        assert_eq!(health, 100);
        *health -= 50;
        assert_eq!(*health, 50);

        println!("Success!");
    }

    fn random_stat_buff() -> u8{
        //could actually return some random value here - let's just return 
        // some fixed value for now
        42
    }


## Requirements of HashMap Key

Any type that implements the *Eq* and *Hash* traits can be a key in *HashMap*. This includes:

- *bool* (through not very useful since there is only two possible keys)
- *int*, *uint*, and all variants thereof
- *String* and *&str* (tips: you can have a HashMap keyed by *String* and call *.get()* with an *&str*)

Note that *f32* and *f64* do no implement *Hash*, likely because floating-point precision errors would make using them as hashmap keys horribly error-prone.

All collection classes implement *Eq* and *Hash* if their contained type also respectively implements *Eq* and *Hash*. For example, *Vec<T>* will implement *Hash* if *T* implements *Hash*.


    use std::collections::HashMap;

    [#derive(Debug, Hash, PartialEq, Eq)]
    struct Viking{
        name: String,
        country: String,
    }

    impl Viking {
        ///Creates a new Viking.
        fn new(name: &str, country: &str) -> Viking {
            Viking {
                name: name.to_string(),
                country: country.to_string(),
            }
        }
    }

    fn main() {
        // Use a HashMap to store the vikings' health points.
        let vikings: HashMap<Viking, i32> = HashMap:: from([
            (Viking::new("Einar", "Norway"), 25),
            (Viking::new("Olaf", "Denmark"), 24),
            (Viking::new("Harald", "Iceland"), 12),
        ]);

        //USe derived implementation to print the status of the vikings.
        for (viking, health) in &vikings {
            println!("{:?} has {} hp", viking, health);
        }
    }

## Capacity

Like vectors, HashMaps are growable, but HashMaps can also shrink themselves when they have excess space. You can create a HashMap with a certain starting capacity using *Hash::with_capacity(uint)*, or use *HashMap::new()* to get a HashMap with a default initial capacity(recommeded).

Example, 

    use std::collections::HashMap;
    fn main() {
        let mut map: HashMap<i32, i32> = HashMap:;with_capacity(100);
        map.insert(1, 2);
        map.insert(3, 4);
        //Indeed, the capacity of HashMap is not 100, so we can't compare the equality assert!(map.capacity() >= 100);

        // Shrinks the capacity of the map with a lower limit. It will drop 
        //down no lower than the supplied limit while maintaining the internal rules
        // and possibly leaving some space in accordance with the resize policy.

        map.shrink_to(50);
        assert!(map.capacity() >= 50);

        // Shrinks the capacity of the map as much as possible. It will drop
        // down as much as possible while maintaining the internal rules
        // and possibly leaving some space in accordance with the resize policy.
        map.shrink_to_fit();
        assert!(map.capacity() >= 2);
        println!("Success!");
    }

## Ownership

For types that implement that *Copy* trait, like *i32*, the values are copied into *HashMap*. For owned values like *String*, the values will be moved and *HashMap* will be the owner of those values.

**Exercise**

    //Fix the errors with least changes
    // Don't remove any code line
    use std::collections::HashMap;
    fn main() {
        let v1: i32 = 10;
        let mut m1 = HashMap::new();
        m1.inisert(v1, v1);
        println!("v1 is still usable after inserting to hashmap: {}", v1);

        let v2 = "hello".to_string();
        let mut m2 = HashMap::new();
        //Ownership moved here
        m2.insert(& v2, v1);

        assert_eq!(vs, "hello");

        println!("Success!");
    }


# Type Coercion - as

Type Coercion is the tyep conversion also called as type casting, in C/C++, is primitive types that can be performed by as keyword. The *as* conversions can be chained. When casting to an unsigned type T, T::MAX+1 is added or subtracted until the value fits into the new type. Using unsafe methods ccan lead to undefined behavious.


**Exercise** 

# Convert by as
Rust provides no implicit type conversion(coercion) between primitive types. But explicit type conversions can be performed using the *as* keyword.

    //Fix the errors and Fill in the blank
    // Don't remove any code
    fn main() {
        let decimal = 97.123_f32;

        let integer: u8 = decimal as u8;

        let c1 : char = decimal as u8 as char;
        let c2 : char = integer as char;

        assert_eq!(integer + 1, 'b' as u8); 

        println!("Success!");
    }

**Exercise**

By default, overflow will cause compile errors, but we can add an global annotation to suppress these errors.

    #[allow(overflowing_literals)]
    // using this will allow overflow. but note that the answer you get will most probably still be wrong.
    fn main() {
        assert_eq!(u8::MAX, 255);
        // The max of 'u8' is 255 as shown above.
        // so the below code will cause an overflow error: literal out of range for 'u8'
        // PLEASE looking for clues within compile errors to FIX it. 
        // DON'T modify any code in main.
        let v: u8 = 1000 as u8;

        println!("{}", v);

        println!("Success!");
    }

When casting any avlue to an unsigned type T, T::MAX + 1 is added or subtracted until the value fits into the new type.

    #[allow(overflowing_literals)]
    fn main()
    {
        assert_eq!(1000 as u16, 1000);

        assert_eq!(1000 as u8, 232);

        // For positive numbers, this is the same as the modulus
        println!("1000 mod 256 is : {}", 1000 % 256);

        assert_eq!(-1_i8 as u8, 255);

        // Since Rust 1.45, the 'as' keyword performs a *saturating cast*
        // whe casting from float to int. If the floating point value exceeds 
        // the upper bound or is less than the lower bound, the returned value
        // will be equal to the bound crossed.
        assert_eq!(300.1_f32 as u8, 255);
        assert_eq!(-100.1_f32 as u8, 0)

        // This behaviour incurs a small runtime cost and can be avoided
        // with unsafe methods, however the results might overflow and 
        // return **unsound values**. Use these methods wisely:
        unsafe {
            //300.0 is 44
            println!("300.0 is {}", 300.0_f32.to_int_unchecked::<u8>());
            // -100.0 as u8 is 156
            println!("-100.0 as u8 is {}", (-100.0_f32).to_int_unchecked::u8());
            // Nan as u8 is 0
            println!("nan as u8 is {}", f32::NAN.to_int_unchecked::<u8>());
        }
    }


4. Raw pointer can be converted to memory address (integer) and vice versa.

    // Fill in the blanks
    fn main() {

    }

**Exercise**

# From/Into Conversions

*From* and *Into* traits are used for type conversions between different types without requireing explicit casts. It is part of the standard libray.
It can also be implemented for custom types. Implementing From for a type will give us Into implementation for the given type for free! (So always implement the from trait and not the into trait)

Example,

Here we have created a struct Number with one field value. We want to be able to convert an i32 value directly to a Number type value in the value field.

We do this by implementing the From trait for our custom type NUmber and providing the customized from method.

    #[derive(Debug)]
    struct Number {
        value: i32,
    }

    impl From<i32> for Number{
        fn from(n: i32) -> Number{
            Number {
                value: n,
            }
        }
    }

    fn main() {
        let num = Number::from(30);
        assert_eq!(num.value, 30);

        let num: Number = 30_i32.into();
        assert_eq!(num.value, 30);

        println!("Success!");
    }

The *From* trait allows for a type to define how to create itself from another type, hence providing a very simple mechanism for converting between several types.

The *From* and *Into* traits are inherently linked, and is actually part of it's implementation. It means if we write soemthing like :

    impl From<T> for U, 

then we can use,
    
     let u: U = U::from(T);
or 

    let u:U = T.into().

The into trait will typically require the type annotations as the compiler is unable to determine this most of the time.

For example, we can easily convert *&str* into *String* :

    fn main() {
        let my_str  = "hello";

        // three conversion below all depends on the fact: String implements From <&str>
        let string1 = String::from(my_str);
        let string2 = my_str.to_string();
        //Explicit type annotation is required here
        let string3: String = my_str.into();
    }

Because the standard library has already implmented this for us: 

    impl From<&'_ str> for String


**Exercise**

    fn main() {
        //impl From<bool> for i32
        let i1: i32 = false.into(); //0
        let i2: i32 = i32::from(false); //0
        assert_eq!(i1, i2);
        assert_eq!(i1, 0);

        // Fix the error in two ways
        // 1. impl From<char> for u32, maybe you should check the docs 
        // 2 a keyword from the last chapter
        let i3: i32 = 'a'.into(); // let i3: u32 = 'a'.into();

        //Fix the error in two ways
        let s: String = 'a' as String;
        // let s : String = 'a'.into();
        // let s : String = String::from('a');
    
        println!("Success!");
    }

# Implement From for custom types

**Exercise**

    // From is now included in 'std::prelude', so there is no need to introduce it into the current scope.
    // use std::convert::From;

    #[derive(Debug)]
    struct Number {
        value: i32,
    }

    impl From<i32> for Number {
        //Implement 'from' method
        fn from(value: T) -> Self {
            Self{
                value: valueSSS
            }
        }
    }

    // Fill in the blanks
    fn main() {
        let num = Number::from(30);
        assert_eq!(num.value, 30);

        let num: Number = 30.into();
        assert_eq!(num.value, 30);

        println!("Success!");
    }


When performing error handling it is often useful to implement *From* trait for our own error type. Then we can use ? to automatically convert the underlying eorror type to our own error type.

    use std::fs;
    use std::io;
    usd std::num;

    enum CliError {
        IoError(io::Error),
        ParseError(num::ParseIntError),
    }

    impl from<io::Error> for CliError {
        // Implement from method
        fn from(e: io::Error)-> Self{
            CliError::IoError(e)
        }
        
    }

    impl From<num::ParseIntError> fro CliError {
        // Implement from method
        fn from(e: num::ParseIntError)-> Self{
            CliError::ParseError(e)
        }
    }

    fn opne_and_pase_file(file_name: &str) -> Result<i32, CliError> {
        // ? automatically converts io::Error to CliError
        let contents = fs::read_to_string(&file_name)?;
        // num::ParseIntError -> CliError
        let num: i32 = contents.trim().parse()?;
        ok(num)
    }

    fn main() {
        println!("Success!"); 
    }

## TryFrom/TryInto

Similar to *From* and *Into*, *TryFrom* and *TryInto* are generic traits for converting between types. 

Unlike *From* and *TryInto* are used for fallible conversions and return a *Result* instead of a plain value.

**Exercise**

    //TryFrom and TryInto are included in 'std::prelude', so there is no need to introduce it again.
    // use std::convert::TryInto;

    fn main() {
        let n: i16 = 256;
        
        // Into trait has a method 'into', 
        // hence TryInto has a method ?
        let n: u8 = match n.try_into () {
            Ok(n) => n,
            Err(e) => {
                println!("there is an error when converting: {:?}, but we catch it", e.to_string());
                0
            }
        };

        assert_eq!(n, __); //0

        println!("Success!");
    }

**Exercise**

    #[derive(Debug, PartialEq)]
    struct EvenNum(i32);

    impl TryFrom<i32> for EvenNum {
        type Error = ();

        //Implement 'try_from'
        fn try_from(value: i32) -> Results<Self, Self::Error> {
            if value % 2 == 0 {
                Ok(EvenNum(value))
            } else {
                Err(())
            }
        }
    }

    fn main() {
        assert_eq!(EvenNum::try_from(8), Ok(EvenNum(8)));
        assert_eq!(EvenNum::try_from(5), Err(()));

        // Fill in the blanks
        let result: Result<EvenNum, ()> = 8i32.try_into();
        assert_eq!(result, Ok(EvenNum(8)));
        let result: Result<EvenNum, ()> = 5i32.try_into();
        assert_eq!(result, Err(( )));

        println!("Success!");
    }

## Others 

### Convert any type to String

To convert any type to *String*, you can simply use the *ToString* trait for that type. Rather than doing that directly, you should implement the *fmt::Display* trait which will automatically provides  *ToString* and also allows you to print the type with *println!*.

**Exercise**

    use std::fmt;

    struct Point {
        x: i32,
        y: i32,
    }

    impl fmt::Display for Point {
        //Implement fmt method
        fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
            write!(f, "The point is ({}, {})", self.x, self.y)
        }
    }

    fn main() {
        let origin: Point = Point {x: 0, y: 0};
        // Fill in the blanks
        assert_eq!(origin.to_string(), "The point is (0, 0)");
        assert_eq!(format!("{}", origin), "The point is (0, 0)");

        println!("{}", origin);

        println!("Success!");
    }

## Parse a String

We can use parse method to convert a ***String*** into a ***i32*** number, this is because ***FromStr*** is implemented for ***i32*** type in standard library: ***impl*** ***FromStr*** for ***i32***.

**Exercise**

    // To use 'from_str' method, you need to introduce this trait into the current scope
    use std::str::FromStr;

    fn mmain() {
        let parsed: i32 = "5".parse().unwrap();
        let turbo_parsed  = "10".parse::<i32>().unwrap();
        let from_str: i32 = i32::from_str("20").unwrap();
        let sum = parsed + turbo_parsed + from_str;
        assert_eq!(sum, 35);

        println!("Success!");
    }

# Panic!

This is the simplest form of error handling available to use in Rust. ***Panic!*** is macro just like ***println!***. ***panic!*** will print out an error message, unwind the stack and finally exit the program. In multithreaded programs it will exit the thread in which the ***panic!*** occurs, not the whole program.

**Exercise**
    // Fill the blanks

    fn drink(beverage: &str) {
        if beverage == "lemonade" {
            println!("Success!");
            // Implement the below code
            panic!()
        }

        println!("Exercise Failed if printing out this line!");
    }

    fn main() {
        drink("lemonade");

        println!("Exercise Failed if printing out this line!");
    }

**Exercise**
    // Make the code work by fixing all panics

    fn main() {
        assert_eq!("abc".as_bytes(), [97, 98, 99]);

        let v = vec![1, 2, 3];
        let ele = v[3];
        // unwrap may panic when get return a None
        let ele = v.get(3).unwrap();    // Some(2) -> 2

        // Sometimes, the compiler is unable to find the overflow errors for you in compile time, so a panic will occur
        let v = productin_rate_per_hour(2);

        //because fo the same reason as above, we have to wrap it in a function to make the panic occur
        // dividing by 0 causes a panic so let us instead divide by 1
        divide(15, 1);

        println!("Success!");
    }

    fn divide(x:u8, y:u8) {
        println!("{}", x / y) 
    }

    fn production_rate_per_hour(speed:u16) -> f64 {
        let cph: u16 = 221;  // this might cause overflow to have u8 so change to u16
        match speed {
            1..=4 => (speed * cph) as f64,
            5..=8 => (speed * cph) as f64 * 0.9,
            9..=10 => (speed * cph) as f64 * 0.77,
            _ => 0 as f64,
        }
    }

    pub fn working_items_per_minute(speed:u8) -> u32 {
        (production_rate_per_hour(speed) / 60 as f64) as u32
    }


## Detailed call stack

By default the stack unwinding will only give something like this:

    thread 'main' panicked at 'index out of bounds: the len is 3 but the index is 99
    note: run with 'RUST_BACKTRACE = 1' environment variable to display a backtrace

Though there is the reason of panic and the line of the code is showing where the panic has occured, sometimes we want to get more info about the call stack.

**Exercise**

This is done to get a detailed call stack details. 

    $ RUST_BACKTRACE = 1 cargo run

## Unwinding and abort

By default, when a panic occurs the program starts ***unwinding***, which means Rust walks back up the stack and cleans up the data from each function it encounters.

But this walk back and clean up is a lot of work. The alternative is to immediately abort the program without cleaning up.

If in your project you need to make the resulting binary as small as possible, you can switch from unwinding to aborting by adding below content to ***cargo.toml***:

    [profile.release]
    panic = 'abort'

# Result

'Result' is an ***enum*** type that represents the outcome of an operation that could potentially fail. Two possible variants:
 - Ok(T): A value T was found
 - Err(e): An error was found with a value e
The expected outcome is **Ok** , the **unexpected** outcome is **Err**. Since Result is an enum, the possible variants can be matched using a match pattern.

Example, 

    fn divide(x: f32, y:f32) -> Results<f32, &'static str> {
        if y == 0.0 {
            return Err("Division by zero");
        }
        Ok(x / y)
    }

    fn main() {
        let result = divide(10.0, 2.0);

        match result {
            Ok(val) => println!("Result: {}", val),
            Err(msg) => println!("Error: {}", msg),
        }
    }

The function divide() returns a Result that holds an f32 float in case of success and a string literal in case of an error. If the second argument provided is 0.0 we return an Error, because dividing by 0 is not allowed. Otherwise we divide the two arguments and return the result wrapped in Ok().

Wehn calling this function we receive a value of type Result. We can then match that result and specify what will be the output in case of success or in case of an error.

# Unwrap

The ***unwrap()*** method takes as input a value of ***type Result*** and takes out the value which is wrapped inside ***Ok(T)*** in case of success or panics in case of an error. 

# ? Operator

The ***? Operator*** is a shorthand way to propagate errors or unwrap ***Ok()*** results. Basically the same as ***unwrap()*** but instead of panic retuns an error. Replaces an entire match statement. Can be used in the main() function.

Example, 

    fn main() -> Result<(), ParseIntError> {
        let number_str = "10";
        let number = match number_str.parse::<i32>() {
            Ok(number) => number,
            Err(e) => return Err(e),
        };
        println!("{}", number);
        Ok(())
    }

becomes, 

    use std::num::ParseIntError;

    fn main() -> Result<(), ParseIntError> {
        let number_str = "10";
        let number = number_str.parse::<i32>()?;
        println!("{}", number);
        Ok(())
    }

# Type Alias

It is just a way of giving a new name to an existing type.
    type U64 = u64;

    fn main() {
        let number: U64 = 42;
    }

Don't confuse with associated types in traits!!

**Exercise**

## Result and ?

Result\<T> is an eum to describe possible errors. It has two variants:
- Ok(T): A value T was found
- Err(e): An error was found with a value ***e***

In short words, the expected outcome is OK, while the unexpected outcome is Err.

    // Fill in the blanks and Fic the errors
    use std::num::ParseIntError;

    fn multiply(n1_str: &str, n2_str: &str) -> Result<i32, ParseIntError> {
        let n1: Result<i32, ParseIntError> = n1_str.parse::<i32();
        let n2   : Result<i32, ParseIntError>= n2_str.parse::<i32>();
        Ok(n1.unwrap() * n2.unwrap())
    }

    fn main() {
        let result: Result<i32, ParseIntError> = multiply("10", "2");
        assert_eq!(result, Ok(20));

        let result: Result<i32, ParseIntError> = multiply("4", "2");
        assert_eq!("result.unwrap(), 8); //Ok(8) would be unwrapped to 8

        println!("Success!");
    }

## ? Operator

***?*** is almost exactly equivalent to unwrap, but ? returns instead of panic on Err.

    use std::num::ParseIntError;

    // Implement multiply with ?
    // Don't use unwrap here
    fn multiply(n1_str:&str, n2_str: &str) -> Result<i32, ParseIntError> {
        let n1: i32 = n1_str.parse::<i32>()?;    // Ok(3) -> 3
        let n2: i32 = n2_str.parse::<i32>()?;    // Ok(4) -> 4

        Ok(n1 * n2) // 12 -> Ok(12)
    }

    fn main() {
        assert_eq!(multiply("3", "4").unwrap(), 12);
        println!("Success!");
    }

**Exercise**

    use std::fs::File;
    use std::io::{self, Read};

    fn read_file1() -> Results<String, io::Error> {
        let f = File::open("hello.txt");
        let mut f: File = match f {
            Ok(file) => file, 
            Err(e) => return Err(e),
        };

        let mut s: String = String::new();
        match f.read_to_string(&mut s) {
            ok(_) => Ok(s),
            Err(e) => Err(e),
        }
    }

    // Fill in the blanks with one code line
    // Don't change any code lines
    fn read_file2() -> Result<String, io::Error> {
        let mut s = String::new();

        File::open("hello.txt")?.read_to_string(&mut s); //Ok(String) -> String

        Ok(s)
    } 

    fn main() {
        assert_eq!(read_file1().unwrap_err().to_string(), read_file2().unwrap_err().to_string)

        println!("Success!");
    }

## Map & and_then

***map*** and ***and_then*** are two common combinators for ***Results\<T, E>*** (also for Option\<T>).

**Exercise**

    use std::num::ParseIntError;

    //Fill in the blank in two ways: map, and_then 
    fn add_two(n_str: &str) -> Result<i32, ParseIntError> {
        n_str.parse::<i32>().map(|n| n + 2)
        // n_str.parse::<i32>().and_then(|n| Ok(n + 2))
    }

    fn main() {
        assert_eq!(add_two("4").unwrap(),6);

        println!("Success!");
    }


**Exercise**

    use std::num::ParseIntError;

    // With the return type rewritten, we use pattern matching without 'unwrap()'.
    // But it's so Verbose...
    fn multiply(n1_str: &str, n2_str: &str) -> Result<i32, ParseIntError> {
        match n1_str.parse::<i32>() {
            Ok(n1) => {
                match m2_str.parse::<i32>() {
                    Ok(n2) => {
                        Ok(n1 * n2)
                    },
                    Err(e) => Err(e),
                }
            }
        },
        Err(e) => Err(e),
    }

    // Rewritting 'multiply to make it succinct
    // You should use Both of 'and_then' and 'map' here.
    fn multiply1(n1_str: &str, n2_str: &str) -> Result<i32, ParseIntError> {
        // IMPLEMENT...  
        n1_str.parse::<i32>()
        .and_then(|n1| n2_str.parse::<i32>().map(|n2| n1*n2))
    }

    fn print(result: Result<i32, PraseIntError>) {
        match result {
            Ok(n) => println!("n is {}", n),
            Err(e) => println!("Error: {}", e),
        }
    }

    fn main() {
        // This still presents a reasonable answer.
        let twenty = multiply("10", "12");
        print(twenty); // Ok(20)

        // The following now provides a much more helpful error message.
        let tt = multiply("t", "2");
        print(tt);  // ParseIntError

        println!("Success!");

    }

## Type alias

Using ***std::result::Result\<T, ParseIntError>*** everywhere is verbose and tedious, we can use alias for this purpose.

At a module level, creating alias can be particularly helpful. erros foudni n a speocific module often has the same ***Err*** type, so a single alias can succinctly defined all associated ***Results***.

This is so useful even the ***std*** library even supplies one: ***io::Result***

**Exercise**

    use std::num::ParseIntError;

    // Fill in the blank
    type Res<i32> = Result<i32, ParseIntError>;

    // USe the above alias to refer to our specific 'Result' type.
    fn multiply(first_number_str: &str, second_number_str: &str) -> Res<i32> {
        first_number_str.parse::<i32>().and_then(|firs_number| {
            second_number_str.parse::<i32>().map(|second_number| first_number * second_number)
        })
    }

    //Here, the alias again allows us to save some space.
    fn print(result: Res<i32>) {
        match result {
            Ok(n) => println!("n is {}", n),
            Err(e) => println!("Error is {}", e),
        }
    }

    fn main() {
        print(multiply("10", "2"));
        print(multiply("t", "2"));

        println!("Success!");
    }

## Using Result in fn main

Typically ***the*** main function will look like this:

    fn main() {
        println!("Hello World!");
    }

However, ***main*** is also able to have a return type of Result. If an error occurs within the ***main*** function it will return an error code and print a debug representation of the error(Debug trait).

The following example shows such a scenario:

    use std::num::ParseIntError;

    fn main -> Result<(), ParseIntError> {
        let number_str: &str = "10";
        let number = match number_str.parse::<i32>() {
            Ok(number => number), 
            Err(e) => return Err(e),
        };

        // The same output can be obtained by the following 
        //let number: i32 = match number_str.parse::<i32>()?;

        println!("{}", number);
        Ok(())
    }

# Zip

This is an inbuilt method of rust that allows us to iterate through multiple iterators simultaneously. It helps make the code more readable and cleaner.

**Example**

    use std::iter::zip;

    let xs = [1, 2, 3];
    let ys = [4, 5, 6];

    // you zip the two together
    let mut iter = zip(xs, ys);

    // now when you use iter.next().unwrap() you get the iterators for xs and ys at once.

    assert_eq!(iter.next().unwrap(), (1, 4));
    assert_eq!(iter.next().unwrap(), (2, 5));
    assert_eq!(iter.next().unwrap(), (3, 6));
    assert_eq!(iter.next().is_none());

    //Nested zips are also possible:
    let zs = [7, 8, 9];

    let mut iter = zip(zip(xs, yx), zs);

    assert_eq!(iter.next().unwrap(), ((1, 4), 7));
    assert_eq!(iter.next().unwrap(), ((2, 5), 8));
    assert_eq!(iter.next().unwrap(), ((3, 6), 9));
    assert_eq!(iter.next().is_none());

---
Completed till 10:28:17. Next topic is Hashmap.
Topics left, 
- Cargo, Crates & Modules (10:28:23)
- Debug & Display (11:08:28)
- Lifetimes (11:30:13)
- Lifetime Elision (12:14:46)
- Closures (12:38:53)
- Iterators (13:30:08)