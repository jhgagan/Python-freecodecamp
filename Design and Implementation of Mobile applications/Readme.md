# Design and Implementation of Mobile applications

This is my personal notes of the things I think are important from the course "Design and Implementation of Mobile applications" that I am attending at Politecnico Di Milano, Taught by Prof. Luciano Baresi.

## Lecture 3

In Flutter we have something similar to the concept of classes but they are called as Widgets.

### Widgets

- You build your UI out of widgets.
    - Flutter widgets are built using a modern framework that takes inspiration from React
- Widgets describe what their view should look like given their current configuration and state
    - When a widget's state changes, the widget rebuilds its description
    - The framework computes the diff against the previous description to determine the minimal changes needed in the underlying render tree to transition from one state to the next.

Flutter or Dart is a OBject oriented programming language. But we don't call them classes instead we call them Widgets.

Widgets can be of two types
- Stateless widget
- Stateful widget

#### Stateless widget

A widget that doesn't change over the time or with the interaction of the user, in my understanding, is a stateless widget.

eg. an image, a text.

#### Stateful widget

A widget that can change the content of it with the user's interaction.

eg. Textbox, scrollable widgets

### Material Design

By default the project is saved as a Material Design 2.0 project. to use the Material Design 3 we need to declare it in the code.

    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
            ),
            useMaterial3: true, # to start using Material Design 3
        ),
    )

### Rows and Columns

In flutter all the widgets have to be arranged in rows and columns. We can also nest stuff, i.e., We can have rows and columns within other rows and columns

### Stateful vs. Stateless Widgets

- A widget that has mutable state 
    - A widget's state consists of values that change change, like a slider's current value or whether a checkbox is checked.
- A widget's state is stored in a State object, which separates the widget's state from its appearance.
- When the widget's state changes, the state object calls setState() to tell the framework to redraw the widget.
- A stateless widget has no internate state to manage

## First Widget

This is our first stupid simple widget. It is a simple box

    class BlueBox extends StatelessWidget{
        const BlueBox({super.key});

        @override
        Widget build(BuildContext context) {
            return Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(),
                ),
            );
        }
    }

To include this widget into the UI we use the code below,

    import 'package:flutter/material.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
            title: const Text('Welcome to Flutter'),
            ),
            body: Center(
            child: Column(
                children: const [
                BlueBox(),
                BlueBox(),
                BlueBox(),
                ],
            ),
            ),
        ),
        );
    }
    }

### Additional Attributes (columns and rows)

- MainAxisSize (min or max)
    - determines how much space a row or column can occupy on the main axes
- MainAxis Alignment (start, end, center, spaceBetween, spaceEvenly, spaceAround)
    - positions children with respect to amin axis
- crossAxisAlighnemnt (many opitons)
    - positions children with respect to the cross axis (the other axis compared to the main axis)

### Aligning the 3 boxes

Example code snippet with the use of alignment.

    body: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxis Alignment.center,
            children: const[
                BlueBox(), BiggerBlueBox(), BlueBox(),
            ],
        ),
    ),

Note: The BiggerBlueBox widget has the height more then that of the others.

#### Better Example for the widget

Instead of creating a new widget for a bigger box it's always better to have the same widget with input parameters to have a bigger box. This is achieved in the lower example,

    // This widget can be used to get a box of different sizes and colors
    class Box extends StatelessWidget {
    const Box({super.key, this.width = 50, this.height = 50, this.color = Colors.blue});

    final double width;
    final double height;
    final Color color;

    @override
    Widget build(BuildContext context) {
        return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(),
        ),
        );
    }
    }

#### Buttons (Stateless):

This is what a button would look like when it is disabled

## Stateful widgets

- Maintain state that might change during the lifetime of the widget
    - Can change their appearance in response to the user evernts or when they receive data
        - Checkbox, Radio, slider, InkWell, Form, and TextField are examples.
- We always have two calsses that extend StatefulWidget and State
    - State consists of values that can change, like a slider's current value
    - State contains the widget's mutable state and the widget's build method
    - When the widget's state changes, the state object calls setState(), telling the framework to redraw the widget


Explaining the Home Page 

- This class is the configuration for the state
- It holds the values (title) providede by the parent(MyApp) and used by the build method of state
- Fields in a widget subclass are always marked final

Example code of the the MyHomePage:

    class MyHomePage extends StatefulWidget{
    const MyHomePage({state.key, required this.title});

    final string title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
    }


 - This call to setState tells flutter that something has chnaged in this State, which causes it to rerun the build method
    - This display can then reflect the updated values
    - if we changed_couter without calling setState(), build would not be called and nothing would happen

Code snippet of the widget

    class _MyHomePageState entends State<MyHomePage> {
        int _counter = 0;

        void _incrementCounter() {
            setState(() {
                _counter++;
            });
        }
    }