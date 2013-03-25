#TigerJS Todo

###The offical Todo example app for:

[**TigerJS**](https://github.com/doublerebel/tiger), the modular rapid-development framework for Titanium Mobile apps

Based off of Alloy's example todo app found at:
https://github.com/appcelerator/alloy/tree/master/test/apps/models/todo

And loosely off [TodoMVC](https://github.com/addyosmani/todomvc)

---------------------------------
##Introduction

Titanium Mobile is a single-context JavaScript application framework for building cross-platform mobile apps.  Its unique design, but adherence to common standards, allows powerful existing web-development tools to build native calls to device code.

TigerJS is an expanded port of the popular single-page webapp framework, [SpineJS](https://github.com/spine/spine).  *(Spine is similar to Backbone, although I find it to be more simple, and therefore more flexible and more powerful.)*  Rather than "reinventing the wheel", TigerJS builds on production-ready, battle-tested code that has launched countless apps across tech.

TigerJS is:

  * **modular** -- TigerJS has a clear separation of concerns (MVC/MVVM), and its libraries can be used singly or as a package.

  * **reusable** -- A TigerJS component for one app is a component for *any* app.  TigerJS uses standard JS design patterns, and modules can be included in Tiger and non-Tiger apps.

  * **simple** -- TigerJS Is Just JavaScript.  It is easy to debug and includes several tools to make Titanium development easy, without obscuring what happens under-the-hood.

This Todo app strives to showcase these principles and inspire you to create your own TigerJS module or application!

*Important note:  Although the current version of this app is built in CoffeeScript, one of the best features of Spine/Tiger's class system is its included shims, providing the same functionality in Vanilla JS as in Coffee.*

---------------------------------
##TigerJS Todo structure

    /src/coffee               CoffeeScript source files for compilation into Resources/
    /src/coffee/app.coffee    Root controller (becomes /Resources/app.js)
    /src/coffee/models
    /src/coffee/views
    /src/coffee/controllers
    /Resources/lib            Where the Tiger libs are

CoffeeScript files can be compiled with Jake, Cake, or manually.  However, Tiger was designed with [Tintan](https://github.com/vic/tintan) in mind, a CoffeeScript build system for Titanium Mobile.
Tintan is (mostly) a wrapper around Jake tasks that makes it painless to call the Titanium python/JS build scripts.

Files created by `tintan boot:init`

    /package.json             Standard npm package description for the Titanium app
    /Jakefile.coffee          App-specific Tintan/Jake tasks
    /plugins/tintan/plugin.py Titanium build plugin (ensures pre-build CoffeeScript compilation)

----------------------------------
##TigerJS MVC/MVVM Separation of Concerns

TigerJS uses CommonJS and prototypal inheritance to quickly create powerful components.  Each file has self-contained logic, exported as a CommonJS module.  Modules communicate using the SpineJS event system and public methods.

**Models:**

*Business logic, validation, data conversion.*  Collections are Classes, and entries are Instances.  Creates an in-memory JS object store that can be persisted through adapters, such as the TigerDB adapter for the app SQLite database.  Complex model relations are available with tiger.relation.

**Views:**

*Style, layout, reactionary view manipulation.*  TigerJS wraps all Titanium elements in extendable Classes, and Views are typically extensions of those classes.  To make Views more reusable, all data-binding logic is in the Controller.  Rather than IDs or ClassNames, Views expose elements as object pointers on the View instance (i.e. `view.header`).

**Controllers:**

*Data-binding, inter-app communication, coordination*.  Defines which views go with what data and when.  Talks to other controllers through routing, events, and public methods.  Only controllers should address Models and Views.

----------------------------------
Stuff our legal folk make us say:

Appcelerator, Appcelerator Titanium and associated marks and logos are 
trademarks of Appcelerator, Inc. 

Titanium is Copyright (c) 2008-2013 by Appcelerator, Inc. All Rights Reserved.

TigerJS is licensed under the MIT License. Please
see the LICENSE file for the full license.

