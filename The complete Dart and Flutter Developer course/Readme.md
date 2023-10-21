# The complete Dart & Flutter Development course 

This will be my personal notes of the course I found on youtube. The link to the course is given below. I will try to finish about 30 mins of the video everyday and about 1 hr on weekends. So, I should be able to complete the course in about 4 weeks.
I am starting the couse on a Sunday, October 15, 2023.

Course Video Link - https://www.youtube.com/watch?v=CzRQ9mnmh44

## What is Dart

Dart is a programming language developed by Google. It shares similarities with other programming language like JS and Java. 

## Why use Dart?

The primary reason why people use Dart is because we want to learn Flutter. Flutter allows us to develop apps for IOS, Android and Windows with a single code base. Dart is not only used to build the UI. It can also be used to build the back-end, databases and even servers.

## Compilation Process

Dart comes with 2 compilation processes. 

Compilation means the process of converting the source code in machine code. Dart using two types of compilation process, namely,

Just in Time - JIT
Ahead of Time - AOT

### Just in Time: 
During the development Dart uses JIT compilation which allows for fast iterations and immediate feedback. Which effectively reduces the compilation times and makes the development faster. 

### Ahead of Time:
At the end of the development it is adviced to use the AOT compilation. AOT compilation produces more optimized machine code, this reduces the execution time, making the application more efficient.

At first we will use the DartPad to learn basics of Dart

link to DartPad - https://dartpad.dev/

## Basics of Dart

Basic template of dart includes the *main()* loop.

    void main() {

    }

### Printing 

For printing things on to the console we use the *print()* method. 

    void main(){
        print("Hello, World!");
    }

The above code will print the message, **Hello, World!**.

To print a text in Dart we need the content to either be enclosed within "" (double quotations) or ''(Single Quotations).

### Mathematical operations:

You can do basic mathematical operations on numbers in Dart. 

Note: You can use *+* to do the concatication operation of string in Dart.

    void main(){
        print("a" + "B");
    }

The above code will result in **ab**

### Commenting in Dart

We can write comments in Dart using *//* or */\*  \*/*.

// - is single line comment
*/\*  \*/* - Block comment
There is also another type comments called as documentation comments. This content will be updated at a late stage when it gets introduced in the course. (If I remember)

Comments are not read by the machine. It is for the developer to make note of contents.
