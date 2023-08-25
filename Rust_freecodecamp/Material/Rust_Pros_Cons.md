# Rust 

## Background

### Creator: Graydon Hoare

### Important Events

- #### **2006: Started off as a personal project**

- #### **2009: Project sponser by Mozilla**

- #### **2021: Rust Foundation formed by its founding companies (AWS, Huawei, Google, Microsoft, and Mozilla)**

- #### **2021: Google announced support for Rust in AOSP**

- #### **2022: Supported in development of Linux kernel**
---
## Similarities of Rust and C/C++

- Syntax
- Concepts like Polymorphism, Inheritance (Traits) and OOP

## Difference of Rust and C/C++

- Rust doesn't have a garbage collection
- Memory safety is given preferance over the other fucntionalities

---
## Advantages of Rust over C/C++

- Memory management and memory safety
- Compile speed is compareable to C/C++
- Methods to avoid code duplication for accomodating multiple data types
- Foreign Function interface ( FFI for interfacing with C, CXX for interfacing with C++)
- *Cargo Package handler*

## Disadvantages of Rust over C/C++

- Relatively new 
- Relatively low community support
- Not standardised 
# Cargo
Cargo is the *Rust package manager*. It downloads the Rust packages's dependencies, compies your packages, makes distributable packages, and uploads them to crates.io, the Rust community's package registry.

## Why Cargo exists?

In rust libraries and executable programs are called *Crates*. *Crates* are compiled using the rustc compiler. 

Most non-trivial programs will (most likely) have dependencies on external libraries. Problems arise when you have to obtain the correct versions of all the necessary dependencies and keep them up to date. This is usually prone to errors.

This is where *Cargo* shines. Cargo allows Rust packages to declare their various dependencies and ensure that you'll always get a repeatable build.

To acomplish this goal, Cargo does four things:
 - Introduces two metadata files with various bits of package information.
 - Fetches and build your packages's dependencies.
 - Invokes rustc or another build tool with the correct parameters to build your package.
 - Introduces conventions to make working with Rust packages easier.

Cargo normalizes the commands needed to build a given program or library; this is one aspect to the above mentioned conventions. As we show later, the same command can be used to build different artifacts, regardless of their names. Rather than invoke rustc directly, we can instead invoke something generic such as cargo build and let cargo worry about constructing the correct rustc invocation. Furthermore, Cargo will automatically fetch from a registry any dependencies we have defined for our artifact, and arrange for them to be incorporated into our build as needed.

It is a popular opinion that once you know how to build one Cargo-based project, you know how to build all of them.

## What happens when you create a new package in Cargo?

Let's understand through an example.

    $ cargo new hello_world --bin

We're passing --bin because we're making a binary program: if we were making a library, we'd pass --lib. 

This also initializes a new git repository by default. To avoid it you can pass --vcs none.

The above code generates this result.
    
    $ cd hello_world
    $ tree .
    .
    ├── Cargo.toml 
    └── src
        └── main.rs

    1 directory, 2 files

If you take a look at *Cargo.toml*, 

    [package]
    name = "hello_world"
    version = "0.1.0"
    edition = "2021"

    [dependencies]

This is called a manifest. 
The manifest contains all of the metadata that Cargo needs to compile your package. This file is written in the TOML format.

By default Cargo compiles your code in debug mode. 

In debug mode compilation time is shorter since the compiler doesn't do optimizations, but the code will run slower. 

You can also use Release mode. In release mode compilation time is longer, but the code will run faster.

Cargo also manages the organisation of the files in the library. 

- Cargo places the source files inside the *src* directory. 
- For Cargo the top level project directoty is only for the *README*, *Configuration files*, *License information*, and files that are not related to the source code.


## Cargo as Convention

For more intricate projects, it is better and easier to let Cargo coordinate the build.

## Tests

Cargo can run the test with the 

    cargo test

command.

Cargo mainly looks for tests to run in two places:

 - each of your *src* files 
 - any tests in *tests/*.

Test in the *src* files should be unit tests and documentation tests. 

Test in tests/ should be inegration-style tests.

You can run test using 

    cargo test

You can also run a specific test using the 

    cargo test foo 

This will run any test with *foo* in its name.

It will also compile any examples you've included to ensure they still compile. 

It also runs documentation tests to ensure your code samples from documentation comments compile. 

# Static code analysis in Rust

- There are a lot of open source static analysis libraries. But there isn't any hardcore static analyser for Rust yet. 

- As per popular opinions on different platforms, it seems that people think there won't be one in the near future either. 

---

### 
**To do** 
- Cargo - **Done**
- static code analysis in rust - **Done**
- Basic application to run on the system. 