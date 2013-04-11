# Introduction

Frank Lloyd Wright once said “You can’t make an architect. You can however open the doors and windows toward the light as you see it.” In this book, I hope to shed some light on how to improve the structure of your web applications, opening doors to what will hopefully be more maintainable, readable applications in your future.

The goal of all architecture is to build something well; in our case, to craft code that is enduring and delights both ourselves and the developers who will maintain our code long after we are gone. We all want our architecture to be simple, yet beautiful.

Modern JavaScript frameworks and libraries can bring structure and organization to your projects, establishing a maintainable foundation right from the start. They build on the trials and tribulations of developers who have had to work around callback chaos similar to that which you are facing now or may in the near future.

When developing applications using just jQuery, the piece missing is a way to structure and organize your code. It's very easy to create a JavaScript app that ends up a tangled mess of jQuery selectors and callbacks, all desperately trying to keep data in sync between the HTML for your UI, the logic in your JavaScript, and calls to your API for data.

Without something to help tame the mess, you're likely to string together a set of independant plugins and libraries to make up the functionality or build everything yourself from scratch and have to maintain it yourself. Backbone solves this problem for you, providing a way to cleanly organize code, separating responsibilities into recognizable pieces that are easy to maintain.

In "Developing Backbone.js Applications," I and a number of other experienced authors will show you how to improve your web application structure using the popular JavaScript library, Backbone.js

### 什么是MVC?

现在有大量的框架给开发者提供一种简单的方式，MVC(Model-View-Controller)模式的变种，来组织他们的代码。MVC把我们在应用中关心的问题分隔成三部分：

* Models描述了特定域信息和应用中的数据。可以认为是一“类”你可以模拟的数据 — 比如一个用户、照片或者Todo笔记。Models 应该要通知它的所有观察者它当前的状态(比如Views)。
* Views通常被认为是应用中的用户界面(比如你的标记和模板)。但不一定是。Views需要知道已经存在的Models以便于观察它们，但不用直接跟它们通讯。
* Controllers控制了应用中的输入(比如点击，用户操作)和视图(可以看作是输出)。当一个Controller更新一个Model的状态时(比如编辑Todo的内容)，它不会直接告诉View。这就是View和Model之间自然的观察关系。

JavaScript‘MVC’框架可以帮助我们不用总是严格的遵循上面的模式来组织代码。有些框架会在View中包含Controller的功能(比如 Backbone.js)，有些框架会整合他们自己认为更有效的组件。

出于这种原因我们把这类框架称之为MV*模式，就是，你可能有View和Model，但是更可能还包含其它东西。

### 什么是Backbone.js?

![](img/backbonejsorg.png)

Backbone.js是一个构建client端代码的轻量级JavaScript框架。它可以非常容易的管理和解耦应用，使你在长远中更容易维护代码。

开发者通常使用Backbone.js创建单页应用或者SPA。简单的说，这些应用可以让浏览器在client端对数据的改变做出响应而不用从服务器端完整地加载你的标记，意味着不用整个重新刷新页面。

在我写这本书的时候Backbone.js是一个成熟、流行的框架，有庞大的开发者社区，丰富的插件和扩展。它被Disqus、Walmart、SoundCloud还有Foursquare用来构建伟大的应用。

### 你何时需要一个Javascript MV*框架?

当用JavaScript构建一个单页应用的时候，不管它包含一个复杂的用户界面还是简单的，尝试减少创建新Views时的HTTP请求，你可能会发现自己通过MV*框架，比如Backbone.js，创建了很多小块。

在起初，写个避免嵌套式代码的框架并不难，但是同样说写些关于Backbone的标准也不重要是不对的。

如何架构一个应用比尝试组合DOM操作库，模板和路由来的更重要。成熟的MV*框架通常不仅包含可能你发现自己会写的一些模块，还包含在之后的过程中你可能会发现的问题的解决方案。这其中节省的时间你不可低估。

所以，你何处需要MV*框架而何处不需要?

如果你要开发一个只需要跟API或者后台数据服务通讯的应用，应用随着数据在浏览器中的变化会有偏重量级的展现和控制，你将会发现MV*框架非常有用。这类比较好的例子就是GMail和Google Docs。

这种应用通常下载一个包含所有脚本、样式、用户常用任务标记的载体，然后在后台完成添加一系列的行为。你可以在阅读email或者要写的一个文档之间来回切换而根本不需要这个应用去重新渲染整个页面。

但是，如果你要构建一个大部分繁琐的视图/页面依然依赖服务器端的应用，只需要一点Javascript或用jQuery实现一点交互，MV框架就可能有点过重了。当然有复杂的Web应用，对视图的局部刷新可以有效的结合单页应用的方式，但不管怎样，坚持简单的原则总会让你驾驭自如。

一个软件(框架)发展的成熟度不是简单的因其存在了多长时间。而是这个框架的可靠程度和它扮演的角色的重要程度。它在解决通用问题上是否有效？随着开发人员使用它构建更大、更复杂的应用框架是否持续改进？


### Why Consider Backbone.js?

Backbone provides a minimal set of data-structuring (Models, Collections) and user interface (Views, URLs) primitives that are helpful when building dynamic applications using JavaScript. It's not opinionated, meaning you have the freedom and flexibility to build the best experience for your web application how you see fit. You can either use the prescribed architecture it offers out of the box or extend it to meet your requirements.

The library doesn't focus on widgets or replacing the way you structure objects - it just supplies you with utilities for manipulating and querying data in your application. It also doesn't prescribe a specific template engine - while you are free to use the Micro-templating offered by Underscore.js (one of it's dependencies), views can bind to HTML constructed using your templating solution of choice.

Looking at the [large](http://backbonejs.org/#examples) number of applications built with Backbone, it's clear that it scales well. Backbone also works quite well with other libraries, meaning you can embed Backbone widgets in an application written with AngularJS, use it with TypeScript, or just use an individual class (like Models) as a data backer for simpler apps.

There are no performance drawbacks to using Backbone to structure your application. It avoids run loops, two-way binding, and constant polling of your data structures for updates and tries to keep things simple where possible. That said, should you wish to go against the grain, you can of course implement such things on top of it. Backbone won't stop you.

With a vibrant community of plugin and extension authors, there's a liklihood that if you're looking to achieve some behavior Backbone is lacking, a complementary project exists that works well with it. This is made simpler by Backbone offering literate documentation of it's source code, allowing anyone an opportunity to easily understand what is going on behind the scenes.

Having been refined over two and a half years of development, Backbone is a mature library that will continue to offer a minimalist solution for building better web applications. I regularly use it and hope that you find it as useful an addition to your toolbelt as I have.


### Setting Expectations

The goal of this book is to create an authoritative and centralized repository of information that can help those developing real-world apps with Backbone. If you come across a section or topic which you think could be improved or expanded on, please feel free to submit an issue (or better yet, a pull-request) on the book's [GitHub site](https://github.com/addyosmani/backbone-fundamentals). It won't take long and you'll be helping other developers avoid the problems you ran into.

Topics will include MVC theory and how to build applications using Backbone's Models, Views, Collections, and Routers. I'll also be taking you through advanced topics like modular development with Backbone.js and AMD (via RequireJS), solutions to common problems like nested views, how to solve routing problems with Backbone and jQuery Mobile, and much more.

Here is a peek at what you will be learning in each chapter:

<i>Chapter 2, Fundamentals</i> traces the history of the MVC design pattern and introduces how it is implemented by Backbone.js and other JavaScript frameworks.

<i>Chapter 3, Backbone Basics</i> covers the major features of the core Backbone.js framework and technologies and techniques you will need to know in order to apply it.

<i>Chapter 4, Exercise 1: Todos - Your First Backbone.js App</i> takes you step-by-step through development of a simple client-side Todo List application.

<i>Chapter 5, Exercise 2: Book Library - Your First RESTful Backbone.js App</i> walks you through development of a Book Library application which persists its model to a server using a REST API.

<i>Chapter 6, Backbone Extensions</i> describes Backbone.Marionette and Thorax, two extension frameworks which add features to Backbone.js that are useful for developing large-scale applications.

<i>Chapter 7, Common Problems and Solutions</i> reviews common issues you may encounter when using Backbone.js and ways of addressing them.

<i>Chapter 8, Modular Development</i> looks at how AMD modules and RequireJS can be used to modularize your code.

<i>Chapter 9, Exercise 3: Todos - Your First Modular Backbone + RequireJS App</i> takes you through rewriting the app created in Exercise 1 to be more modular with the help of RequireJS.

<i>Chapter 10, Paginating Backbone Requests & Collections</i> walks through how to use the Backbone.Paginator plugin to paginate data for your Collections.

<i>Chapter 11, Backbone Boilerplate And Grunt BBB</i> introduces powerful tools you can use to bootstrap a new Backbone.js application with boilerplate code.

<i>Chapter 12, Mobile Applications</i> addresses the issues that arise when using Backbone with jQuery Mobile.

<i>Chapter 13, Jasmine</i> covers how to unit test Backbone code using the Jasmine test framework.

<i>Chapter 14, QUnit</i> discusses how to use the QUnit for unit testing.

<i>Chapter 15, SinonJS</i> discusses how to use SinonJS for unit testing your Backbone apps.

<i>Chapter 16, Resources</i> provides references to additional Backbone-related resources.

<i>Chapter 17, Conclusions</i> wraps up the our tour through the world of Backbone.js development.

<i>Chapter 18, Appendix</i> returns to our design pattern discussion by contrasting MVC with the Model-View-Presenter (MVP) pattern and examines how Backbone.js relates to both. A walkthrough of writing a Backbone-like library from scratch and other topics are also covered.
