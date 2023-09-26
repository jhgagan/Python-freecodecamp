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

A widget that doesn't change over the time or with the interaction of the user, in my understanding, is a stateless widget 


