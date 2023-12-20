# gRPC 

## Introduction

gRPC is google's take on Remote Procedural Call. It was made open source in 2015. It is currently used by many of the world's largest companies, including Netflix, Cisco, Twitter (now X), and Uber. 

## Overview

In gRPC, a client application can directly call a method on a server application on a different machine as if it were a local object. This makes it easier to build and deploy distributed applications and services. Similar to other RPC systems, one needs to define a service, specifying the methods that can be called remotely with their parameters and remote types. 

On the server side, the server implements this interface and runs a gRPC server to handle client calls. 

On the client side, the client has a stub (in some languages referred to as just client) that provides the same method as the server.

## Protocol Buffers

Protocol buffers are a language neutral, platform-neutral extensible mechanism for serializing structured data.

It's like JSON, but smaller and faster. You define the structure of the data once and then you can use special generated source code to write and read the structured data. The data can be sent and received from a variety of data streams and a variety of languages.

### What problems do Protocol Buffers solve?

Protocol buffer provides a serialization format for packets of typed, structured data that are up to a few megabytes in size. The format is suitable for both short-lived network traffic and long-term network traffic data storage. 

They can also be extended with new information without invalidationg the existing data or requiring code to be updated.

### What are the benifits of using Protocol buffers?

Protocol buffers are ideal for situations in which you need to serialize structured, record-like, typed data in a language neutral, platform-neutral, extensible manner. The are most often used for defining the communication protocols and for data storage.

Some advantages of using protocol buffers include:
 - Compact data storage
 - Fast parsing
 - Availability in many programming languages.
 - Optimized functionality through automatically-generated classes

### When are Procotol buffers not a good fit?

They don't fit well with all data. Particularly, 
 - Protocol buffers tend to assume that entire messages can be loaded into memory at once and are not larger than an object graph. For data that exceeds a few megabytes, consider a different solution.
 - When protocol buffers are serialized, the same data can have many different binary serializations. You cannot compare two messages for equality without fully parsing them.
 - Messges are not compressed. While messages can be zipped or gzipped like any other file, special-purpose compression algorithms like the ones used by JPEG and PNG will prodce much smaller files for data of the appropriate type.
 - Protocol buffer messages are less than maximally efficient in both size and speed for many scientific and engineering uses that involve large, multi=dimensional arrays of floating point numbers. For these applications, FITS and similar formats have less overhead.
 - Protocol buffers are not well supported in non-object-oriented languages propular in scientific computing such as Fortran and IDL.
 - Protocol buffer messages don't inherently self-describe their data, but they have a fully relective schema that you can use to implement self-description. That is, you can't fully interpret one without access to its corresponding .proto file.
 - Protocol buffers are not a format standard of any organization. This makes them unsuitable for use in environments with legal or other requirements to build on top of standards.

## Core concepts, architecture and lifecycle.

