## 序

![](img/logo.jpg)

欢迎阅读我的这本关于[Backbone.js](http://documentcloud.github.com/backbone/) 框架构建javascript应用的书（正在创作中）. 这本书依据Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported [协议](http://creativecommons.org/licenses/by-nc-sa/3.0/)发布，意味着你可以免费获取拷贝和帮助[改进](https://github.com/addyosmani/backbone-fundamentals/)它.

我非常高兴的宣布这本书将会由[O'Reilly 出版社](http://oreilly.com)在今年出版。读者可以购买出版的最新版本，或者一些数字格式的版本，或者从Git仓库里获取一份最新版本.

非常欢迎对现存的资料进行修正，同时我也希望跟大家一起为社区提供最新的有帮助的资源。
非常感谢[Jeremy Ashkenas](https://github.com/jashkenas)创建了Backbone.js和[这些](https://github.com/addyosmani/backbone-fundamentals/contributors) 社区成员对这个项目的帮助。

希望这本书对你有帮助!

# 前言

当空手创建一个Web应用时, 我们会自然而然的想到引入DOM操作库(比如jQuery)和一些实用的插件。这中做法的问题在于，不用多久就会因应用里 一大堆嵌套的jQuery回调和不在结构中实际存在的DOM元素而迷失。

简而言之, 我们被嵌套式的代码所束缚。幸运的是有现代的Javascript框架可以帮助我们引入项目的结构和组织方式, 该进成为在长时间运行的情况下也非常容易维护。

### 什么是MVC?

这些现代的框架给开发者提供一种简单的方式，MVC(Model-View-Controller)模式的变种，来组织他们的代码。MVC把我们在应用中关心的问题分隔成三部分：

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


###为什么你应该考虑使用Backbone.js?

下面这段话是否可以描述你的经历?:

"我想要一种灵活，能抽象分离应用中所关注的各个部分的东西。它提供了一个持久层，RESTful的同步，模型，视图(包含控制器)，基于事件驱动的通讯，模板和路由。必须支持当一个模型变化时允许更新视图。在架构上要留有自由发挥的余地。更理想点，有许多大公司都使用这个方案去构建非凡的应用。

我可能会构建复杂的东西，我希望这个框架有活跃的扩展社区，而且框架的扩展在大量的问题(Marionette, Chaplin, Aura, Thorax)中经过尝试。理想点，还要有解决方案相关的脚本工具(grunt-bbb, brunch)。"

如果是这样的话，请继续阅读...

Backbone的主要优势，无论你的目标平台和设备是什么，都将会帮助你：

* 组织应用的结构
* 简化服务器端的持久性
* 将DOM从页面数据中解构
* 模型数据，视图和路由都有一种简单的风格
* 提供DOM,模型和集合的同步


### 你可以从这本书中学到什么?

这本书的目的是提供权威和全面的关于Bakbone的信息给开发者帮助他们开发真实的应用。如果你无意中发现你认为可以改进或者补充的地方，请尽情的提交一个pull请求。无需多久，你就可以帮助其它开发人员避免你曾碰到过的问题。

这本书的内容会包含MVC原理，如何用Backbone的模型、视图、集合和路由构建应用。我也会带给你一些跟高级的话题比如使用Backbone.js进行模块化开发和AMD(通过RequireJS)，如何使用现代的软件包(比如Node和Express)构建应用，如何使用Backbone和jQuery Mobile解决路由问题，脚本工具的小提示，以及更多其它的东西。


# 基本原理

在这部分内容中我们将探索下像Backbone.js这类框架如何适应JavaScript应用架构。通常，开发者创建桌面和服务器类应用有丰富的设计模式供他们去选择，但是，在过去的仅仅几年中，这些模式已经应用到了客户端开发中。

在开始探索任何JavaScript框架之前，非常有必要先认知一下设计模式原理。

### MVC，MVP和Backbone.js

设计模式可以解决通用开发问题，可以引导开发者给他们的应用增加组织架构。

设计模式之所以这么有用是因为它是众多开发者从反复实践中总结出来的经验。尽管10或20年前开发者们在他们的项目中都使用不同的语言来实现模式，但是从中有许多值得我们学习的地方。

在这部分章节中，我们将会回顾2种比较流行的模式——MVC和MVP。我们将会探索如何使用Backbone.js快速实现这2种模式的更多细节。


## MVC

MVC(Model-View-Controller)是一种提倡通过分层来改进应用的设计模式。它强制通过第三个组件(Controller)来分离业务数据(Model)，用户界面(View)，控制器通常管理逻辑，用户输入，协调模型与视图间的通讯。这种模式最早是[Trygve Reenskaug](http://en.wikipedia.org/wiki/Trygve_Reenskaug)在Smalltaok-80(1979)中设计的，当初被称之为Model-View-Controller-Editor。1994,[“设计模式: 面向对象软件中可重用性元素”](http://www.amazon.co.uk/Design-patterns-elements-reusable-object-oriented/dp/0201633612) (“GOF”或者“四人帮”一书)中详细定义了MVC，这本书普及了它的应用。


### Smalltalk-80 MVC

随着时间的推移MVC模式变得更加笨重，非常有必要去了解下它早的设计初衷。在70年代，图形用户界面并不多见。有一种方法叫[Separated Presentation(表现分离)](http://martinfowler.com/eaaDev/uiArchs.html)，可以清晰的分离模仿现实世界概念(比如一张图片、一个人)的域对象和被渲染到用户屏幕的描述对象。

Smalltalk-80实现的MVC把这个概念贯彻的更深入，而且有目的性的把应用逻辑从用户界面中分离出来。它的观点是解耦应用这些部分也可以把模型重用到应用中其它的用户界面。这里有些非常有趣的关于Smalltalk-80's MVC架构的事情：

* 一个域元素被当做一个Model，而且用户界面(Views和Controllers)并不知道。
* 表现是View和控制器所关心的，但并不仅有一个view和controller。每个要展现到屏幕的元素都需要有一个View-Controller的组合，所以它们并没有正真的被分离。
* 在这个组合中，Controller扮演的是处理用户输入(比如键盘和鼠标点击事件)的角色，做些用户可感知的事情。
* 它依赖观察者模式在Model变化的时候来更新View。

有时，当开发者知道数十年前观察者模式(现在通常在发布/订阅系统中应用)也是MVC架构的一部分的时候，他们非常的惊讶。在Smalltalk-80的MVC中，View和Controller都观察了Model：Model改变的时候，View则做出响应。一个简单的例子就是基于股票市场数据的应用——因为它要展示实时的信息，所以在Models中的数据有任何改变都 要在View中立即刷新显示。

Martin Fowler在过去的些年中在写关于MVC起源[origins](http://martinfowler.com/eaaDev/uiArchs.html) 方面做了很多杰出的工作。如果你有兴趣了解更多关于Smalltalk-80 MVC的信息，推荐你阅读他的相关成果。



## 我们所知道的MVC

我们回顾了下70年代，回到现在。MVC模式已经应用到了各种程序语言上。比如，Ruby on Rails就是Ruby语言上实现的一个MVC web框架。JavaScript现在也有很多MVC框架，包括AngularJS—— 一个提供HTML、JavaScript扩展和动态内容渲染支持的框架，当然还有Backbone.js。“嵌套式”代码难于维护，结构混乱，让我们来看看MVC模式可以让Javascript开发人员做些什么。

MVC由三个核心部分组成:

### 模型(Models)

模型管理的应用的数据。它们不仅要关心用户界面层，同时也体现了应用需要的数据结构。当一个Model改变的时候(比如被更新)，它将立即通知它的观察者(比如View，后面会提到这个概念)做出对应的响应。

为了更清晰的理解model，假设我们有一个JavaScript做的todo应用。在这个todo app中，而每个待办事项都有一个自己的模型, 因为它代表着一个特定域的唯一数据。Todo的模型可能会有标题，是否完成这2个属性。一个特定的待办事项保存在一个model的实例中。这里有一个基于Backbone.js的Todo model的实现:

```javascript
  var Todo = Backbone.Model.extend({
    //默认属性
    defaults: {
      title: '',
      completed: false
    }
  });

  //默认属性的todo实例
  var firstTodo = new Todo();

  console.log("Todo's default title: " + firstTodo.get('title')); // ""
  console.log("Todo's default status: " + firstTodo.get('completed')); // false

  firstTodo.set('title', 'Enjoy reading the book');
  console.log('Title changed: ' + firstTodo.get('title'));

  //指定数据的todo实例
  var secondTodo = new Todo({ title: 'Try this code in chrome console'});

  console.log("Second todo title: " + secondTodo.get('title'));
  console.log("Second todo status: " + secondTodo.get('completed'));
```

不同的框架都会内置model的功能，而且通常都支持属性的验证，就像一个model的鉴定器一样，属性代表了model的内容。在实际应用中使用model的时候通常我们还需要一种方式对model进行持久化保存。持久化保存可以让我们在对model进行编辑和更新的时候保存它的最新状态。比如在浏览器中使用本地存储，或者与数据库同步。

一个model有可能会有多个views观察者。假设我们的Todo model包含了一些元数据，比如计划日期，说明，需要重复的日期(如果是我们定期会做的事情)。一个开发人员可以创建一个view来展现所有这些属性，或者也可以创建3个单独的view来显示每个属性。关键是Todo model不需要关系这些view如何组织，它只要在需要的时候通知数据更新就可以了。后面我们会谈到view的更多细节。

对于现代MVC/MV*框架，提供一种模型组合的方法并不常见。在Backbone中，这些组合叫"Collections"(集合)。把模型组合来管理可以让我们编写应用逻辑时基于一个组合来通知，它包含了任何一个model的改变。这样也避免了手动去观察单个的model实例。

下面我们看下如何把Todo models分组成Backbone Collection(集合)：

```javascript
  var Todo = Backbone.Model.extend({
    //默认属性
    defaults: {
      title: '',
      completed: false
    }
  });

  var Todos = Backbone.Collection.extend({
    model: Todo,

    // 为简单起见在本书的第一个部分我们都用localStorage来保存todo项。
    localStorage: new Store('todos-backbone')

    // 后面会用到的REST API:
    // url: "/todos"

  });

  var firstTodo = new Todo({title:'Read whole book'});

  //传入一个model的数组来初始化一个collection
  var todos = new Todos([firstTodo]);
  console.log(todos.length);

  // 通过Collection的方法来创建一个model，创建的model也会包含在collection内部。
  todos.create({title:'Try out code examples'});
  console.log(todos.length);

  var thirdTodo = new Todo({title:'Make something cool'});

  // 往collection中添加model
  todos.add(thirdTodo);
  console.log(todos.length);

  // Collection把所有models保存在models属性中，它是一个数组。
  console.log(todos.models);
```

如果你看到较老的关于MVC的资料，可能会告诉你models也管理应用的“状态”。在JavaScript中，应用的状态有一个特殊的意义，通常指某个view或某个固定时间用户屏幕上子view的当前状态。状态这个词经常在单页应用里讨论到，状态这个概念是需要被模拟的。


### 视图(Views)

视图是model的可视化展现，展现一个被过滤出来的视图或者它们的当前状态。一个view通常观察一个model，在model改变的时候被通知，然后做相应的自我更新。设计模式相关的文献通常把view当做是“哑巴”，因为它对models和controllers的信息知道的有限。

用户与view进行交互，通常就是阅读或者编辑model的数据。比如，在我们的这个todo应用案例中，todo model的视图展现发生在显示所有todo项列表的界面里。每个tod都用一个标题和完成复选框渲染。Model的编辑发生在“编辑”界面，用户选中一个特定的todo可以在form表单中编辑它的title。

在MVC中，正真开始更新model是在Controllers里，我们简短地来分析下。

我们通过一个简单的例子来进一步探索下view。下面我们用一个function来创建一个单独的Todo view，接受一个model和一个controller的实例。

在view里定义了一个通用的方法```render()```，用JavaScript模板引擎 ([Underscore](http://underscorejs.org "Underscore.js")渲染和更新```photoModel```的内容，内容被写入```photoEl```。

```photoModel```把```render()```添加为它的一个订阅者(subscribers)回调。这样，通过观察者(Observer)模式就可以在model改变的时候触发view的更新。

你可能想知道对用户交互行为这里是如何处理的。当用户点击view中的任何一个元素时，该做什么并不是由view决定的。应该是Controller来做决定。在这个简单的示例中，通过给```photoEl```添加事件监听，然后把click事件委派给controller，同时把需要的model传过去。

这种架构的好处就是各个组件复杂各自的角色，来实现应用的功能。



```javascript
var buildPhotoView = function( photoModel, photoController ){

    var base        = document.createElement('div'),
        photoEl     = document.createElement('div');

     base.appendChild(photoEl);

     var render= function(){
        // We use a templating library such as Underscore
        // templating which generates the HTML for our
        // photo entry
        photoEl.innerHTML = _.template('photoTemplate', {src: photoModel.getSrc()});
     }

     photoModel.addSubscriber( render );

     photoEl.addEventListener('click', function(){
        photoController.handleEvent('click', photoModel );
     });

     var show = function(){
        photoEl.style.display  = '';
     }

     var hide = function(){
        photoEl.style.display  = 'none';
     }


     return{
        showView: show,
        hideView: hide
     }

}
```


**模板**

在支持MVC/MV*的JavaScript框架中，非常值得近距离的去审视下JavaScript模板和View之间的关系。

长期实践证明通过手工拼接字符串来创建大块的HTML片段是非常低效的。使用这种方式的开发者们经常会发现，他们遍历自己的数据，包裹在嵌套的div里面，然后使用过时的技术，比如```document.write```把所谓的'template'插入到DOM中。这种方式意味着必须使用标准的标签，脚本代码要放在页面内，而且很快就会变得难以阅读和维护，特别是对于构建大的应用来说。

JavaScript模板库(比如Handlebars.js or Mustache)通常用于view中定义模板，在HMTL标签中包含了一些模板变量。这些模板块可以保存在外部也可以保存在自定义类型(比如'text/template')的script标签里。变量通过变量语法(比如{{name}})来定义。Javascript 模板库通常接受JSON的数据，并且往模板中填充数据这种繁重的工作也由框架自身来完成。使用模板库有非常多的好处，特别是当模板存在在外部时，应用可以根据需要动态的加载模板。

让我们来比较下2个HTML模板的列子。一个使用流行的Handlebars.js库实现，另一个使用Underscore的'microtemplates'。

**Handlebars.js:**

```html
<li class="photo">
  <h2>{{caption}}</h2>
  <img class="source" src="{{src}}"/>
  <div class="meta-data">
    {{metadata}}
  </div>
</li>
```

**Underscore.js Microtemplates:**

```html
<li class="photo">
  <h2><%= caption %></h2>
  <img class="source" src="<%= src %>"/>
  <div class="meta-data">
    <%= metadata %>
  </div>
</li>
```

在Microtemplates中，你也可以使用双大括号(比如```{{}}```) (或者其它你认为爽的字符)。使用大括号的话，可以向下面这样设置Underscore的```templateSettings``` 属性:

```javascript
_.templateSettings = { interpolate : /\{\{(.+?)\}\}/g };
```

**关于导航和状态的注意事项**

值得关注的是，在传统web开发中，在独立的view之间导航需要刷新页面。而在单页应用中，通过ajax从服务器端获取数据，可以在同一个页面里动态的渲染一个新的view，因为不会自动更新URL，导航的角色就落到了"router"(路由)的身上，路由独立的管理应用状态(比如允许用户收藏一个他们浏览过的view)。然而，路由并不是MVC或者类MVC框架的一部分，所以在这部分我并不打算介绍更多的细节。


###控制器(Controllers)

controller是在model和view之间的媒介人，通常完成两件事：model改变时更新view和用户修改view时更新model。

在我们这个图片库应用中，控制器要处理在图片编辑视图里用户触发的改变，当用户完成编辑之后要更新photo model。

大部分JavaScript MVC框架都把controller从MVC模式中分离出来单独说明。在我看来，这种变化的原因，可能Javascript框架作者最初参照了服务端MVC的观念(比如Ruby on Rails)。认识到这种方式跟服务器端的并不完全一样，而且MVC中的C在服务器端也不是用于解决管理状态问题。这是一个非常聪明的途径，但对于初学者来说更难以理解传统MVC模式和无Javascript框架中controller的特定意义。

那Backbone.js有Controller吗?并不真正有。Backbone的Views通常包含了"controller"的逻辑，而且Routers(后面会讨论)也用于帮助管理应用状态，但这两者都不是传统MVC模式中真正意义上的控制器。

在这方面，与官方文档或者网络博客中描述的相反，Backbone并不是正真的MVC/MVP或者MVVM框架。事实上，它更适合归类到MV*家族中，有自己的实现架构。当然这并没有什么不对，只是帮助你区分和理解传统MVC与你在Backbone项目中的MV*。


### Spine.js与Backbone.js中的Controllers对比


**Spine.js**

现在我们知道controllers负责当model变化时更新view(同样也在用户改变view时更新model)。因为Backbone没有它"自己"明确的controllers，所以可以通过回顾controller来对比它和其它MVC框架的实现差异。我们先来看下[Spine.js](http://spinejs.com/):

在这个例子中，我们会有一个控制器```PhotosController```，在应用中负责管理个人照片。会确保view更新时(例如用户编辑照片的元数据)相应的model也会更行。

(提示: 在这个列子中我们并不打算深入的研究Spine.js，但是非常值得通过它去学习更多关于Javascript框架的东西。)


```javascript
//在Spine中通过继承Spine.Controller来创建Controllers

var PhotosController = Spine.Controller.sub({
  init: function(){
    this.item.bind("update", this.proxy(this.render));
    this.item.bind("destroy", this.proxy(this.remove));
  },

  render: function(){
    // Handle templating
    this.replace($("#photoTemplate").tmpl(this.item));
    return this;
  },

  remove: function(){
    this.$el.remove();
    this.release();
  }
});
```

在Spine中，controllers被认为是应用的胶水，添加和响应DOM事件，渲染模板，保持views和models的同步(在上下文环境下我们才能判断是一个控制器)。

在上面这个例子中，把```render()```和```remove()```分别绑定给```update```和```destroy```事件。当一个照片实例被更新，根据元数据重新渲染view。同样，如果照片从库中被删除，就从view中移除。如果你想知道上面代码段中的```tmpl()```函数：在```render()```函数中，我们用它渲染一段JavaScript模板#photoTemplate，返回一段HTML字符串用于替换控制器的当前元素。

它给我们提供了一种轻量，简单的方式来管理model和view之间的变化。


**Backbone.js**

在这节的后面我们还会回顾一下Backbone与传统MVC之间的区别，但是现在先让我们来关注下controllers。

在Backbone中，controller的逻辑在Backbone.View和Backbone.Router之间共同存在。在Backbone的早期版本中有Backbone.Controlle这个东西，但是后来被重新定义成Router，更清晰的体现了它的角色。

Router的主要目的就是把URL映射到应用对应的状态。当一个用户浏览到www.example.com/photos/42时，Router就会用于根据这个ID展现图片，并且定义对这个请求应该返回哪些行为控制。Routers*可以*包含传统的控制行为，比如绑定models和views之间的行为，或者渲染view中的某一部分。但是，Backbone的贡献者Tim Branyen指出，不用Backbone.Router也可以做这些事情。这样看来，一个使用Router的范例可能会是这样：

```javascript
var PhotoRouter = Backbone.Router.extend({
  routes: { "photos/:id": "route" },

  route: function(id) {
    var item = photoCollection.get(id);
    var view = new PhotoView({ model: item });

    something.html( view.render().el );
  }
}):
```

##MVC给我们带来了什么?

总结来说，MVC中的分离促进了应用功能实现的模块化，而且可以：
* 更易于维护。当应用需要升级时可以非常清是否是数据相关的，如果是数据相关的可能要修改models或者controllers，如果是视觉相关的可能就要修改views。
* 解耦models和views， 意味着为业务逻辑编写单元测试页更简明。
* 避免在应用中复制model和controller代码这种低级行为。
* 如果应用规模较大分角色来开发的话，这种模块化可以让负责核心逻辑和界面的开发人员同时工作。


###深入探索

现在，相信你对MVC模式已经有基本的了解了。为了满足大家的求知欲，这里我们将探索的更深入一点。

GoF (Gang of Four，四人组，　《Design Patterns: Elements of Reusable Object-Oriented Software》/《设计模式》一书的作者：Erich Gamma、Richard Helm、Ralph Johnson、John Vlissides)并没有把MVC提及为一种设计模式，而是把它当做"一组用于构建用户界面的类集合"。在他们看来，它其实是其它三个经典的设计模式的演变：观察者模式(Observer)(Pub/Sub), 策略模式(Strategy)和组合模式(Composite)。根据MVC在框架中的实现不同可能还会用到工厂模式(Factory)和装饰器(Decorator)模式。我在另一本免费的书"JavaScript Design Patterns For Beginners"中讲述了这些模式，如果你有兴趣可以阅读更多信息。

正如我们所讨论的，models表示应用的数据，而views处理屏幕上展现给用户的内容。为此，MVC在核心通讯上基于推送/订阅模型(惊讶的是在很多关于MVC的文章中并没有提及到)。当一个model变化时它对应用其它模块发出更新通知("publishes")，订阅者(subscriber)——通常是一个Controller，然后更新对应的view。观察者——这种自然的观察关系促进了多个view关联到同一个model。

对于感兴趣的开发人员想更多的了解解耦性的MVC(根据不同的实现)，这种模式的目标之一就是在一个主题和它的观察者之间建立一对多的关系。当这个主题改变的时候，它的观察者也会得到更新。Views和controllers的关系稍微有点不同。Controllers帮助views对不同用户的输入做不同的响应，是一个非常好的策略模式列子。


###总结

已经回顾了经典的MVC模式，你现在应该明白了它是如何让开发者将一个应用清晰的分离开来。你应该也能区分出JavaScript MVC框架可能在实现上与原有模式的相似与不同。

当评定一个新的JavaScript MVC/MV*框架时，请记住——可以退一步想，看看它是如何实现Models, Views, Controllers或者其它备选方案，这样或许更能帮助你理解这个框架。


##MVP

模型-视图-提供者(Model-view-presenter)(MVP)是一种MVC涉及模式的衍生品，更关注于表现逻辑。它是由一个叫[Taligent](http://en.wikipedia.org/wiki/Taligent)的公司早在1990年代，当他们在使用一个C++ CommonPoint环境下模型时发起的。虽然MVC和MVP的目的都是将多重组件分离，但是它们有些基本原理上的不同。

在这个概要里我们将关注更适合基于web架构的MVP版本。

###Models, Views & Presenters(提供者)

MVP中的P代表presenter(提供者)。它是包含为view提供用户界面逻辑的组件。不同于MVC，对view的调用被委派给了presenter，它是从view上分离出来的，代替view与用户界面通讯。这使得在单元测试中可以做很多有用的事情，比如伪造views。

大部分通常的MVP实现都是使用被动视图(Passive View，一种对所有活动组件和用途"沉默"的view)，几乎没有逻辑。MVP的models基本上跟MVC的models一样处理应用数据。presenter也更MVC中的Controllers一样也负责与view和model通讯。正如你所猜测的，Presenters是MVP模式的核心， 包含了在views之上的表现逻辑。


通过view，presenters处理所有的用户请求，然后把所有数据传回。在这方面，它们取回数据，处理数据并且决定数据如何在view中展现。 在一些实现中，presenter同样与服务端交互，完成数据(models)的存储。Models可能会触发事件，但订阅事件并且通知view更新是presenter要做的。在这种被动式的架构中，没有直接进行数据绑定的概念。Views提供设置器( setters)给presenters来设置数据。

这种从MVC的转变的好处就是增加了应用的可测试性，而且在view和model之间有了跟清晰的分离。但是在这种模式中缺少对数据绑定的支持，意味着要为这种分离付出额外的成本。

尽管[被动view(Passive View)](http://martinfowler.com/eaaDev/PassiveScreen.html)也开放view接口的一种实现，但是它是一种变种，包括对事件的使用可以把Presenter与view进一步的解耦。因在JavaScript中没有接口结构，这里我们更多的把它当做一种协议而不是接口。但是技术上它还是一种API，从这个角度来看我们把它当做接口可能更准确。


同样，有一种[监督控制器(Supervising Controller)](http://martinfowler.com/eaaDev/SupervisingPresenter.html)，更接近于MVC和[MVVM](http://en.wikipedia.org/wiki/Model_View_ViewModel)模式，因为它从model和view提供直接的数据绑定。Key-value observing (KVO)插件(比如Derick Bailey's Backbone.ModelBinding插件)把这种Supervising Controller概念引入了Backbone中。


##MVP还是MVC?

MVP通常用于需要尽可能多复用逻辑的企业级应用中。有复杂views和大量用户交互的应用可能会发现MVC不是非常适合解决类问题，因为过多的依赖于多个控制器。而在MVP中，所有这些复杂的逻辑可以封装在presenter中，更容易维护。

因为MVP的views是通过接口来定义的，而且这个接口从技术上将是系统和view之间的唯一连接点(presenter除外)，这种模式同样允许开发者编写表现逻辑而无需等待设计师提供页面布局实现。

根据实现，MVP比MVC也更容易实现自动化单元测试。原因就是presenter可以作为完整的用户接口模拟，因而可以依赖其它组件进行单元测试。根据我的经验还还要依赖于MVP在何种语言上实现(选择MVP用于JavaScript项目跟ASP.NET比起来有非常大的不同)。


过一天之后，你对MVC的理解可能跟MVP差不多，因为他们的区别主要在于语义上。只要你清晰的把应用核心分解成models, views和controllers(或者presenters)，你就可以享受大部分的益处，而不用在意你选择哪种模式。

##MVC, MVP和Backbone.js

有极少数情况，如果有JavaScript框架宣称他们用传统的架构来实现MVC或者MVP，很多JavaScript开发者也不认为它们与MVC和MVP是互相排斥的(实际上我们看到在web开发框架中比如ASP.NET或者GWT，MVP被严格的实现)。这可能是因为它必须在应用中增加presenter/view的逻辑，而且仍然认为是一种MVC风格。

Backbone的贡献者[Irene Ros](http://ireneros.com/) 赞同这种方式，当她考虑把Backbone的views分割 成她们自己独特的组件，她需要一些东西来组装它们。这可以是一个控制器路由(比如```Backbone.Router```，后面会讲到)或者在数据请求回来之后的一个回调。

那些觉得与MVC相比Backbone.js更符合MVP定义的开发者认为：

* MVP的presenter比controller更好的描述了```Backbone.View``` (介于View模板和数据绑定间的层) 。
* model适合描述```Backbone.Model``` (跟传统MVC的"Model"没啥差别)。
* views最好的体现了模板(比如Handlebars/Mustache标记模板)。

对此的回应可能会是view也可以紧紧是一个view(按照MVC)，因为Backbone足够灵活让它可以多用途。MVC中的V和MVP中的都可以用```Backbone.View```完成， 因为它可以支持2种方式：渲染原子组件和组装通过其它view来渲染的组件。

同时我们也可以看出来，Backbone中controller的功能由Backbone.View和Backbone.Router共同完成，在下面这个例子中也可以看出来这方面确实存在。

在```this.model.on('change',...)```这一行，Backbone 的```PhotoView```用观察者模式订阅('subscribe')model的变化来更新view。同时在```render()```方法中也处理模板渲染，但是不同于其它的实现，用户交互同样也在view中处理(看```events```)。


```javascript
var PhotoView = Backbone.View.extend({

    //... 标签列表
    tagName:  "li",

    // 传入模板并缓存
    template: _.template($('#photo-template').html()),

    // 指定DOM的事件
    events: {
      "click img" : "toggleViewed"
    },

    // PhotoView监听model的变化，以便重新渲染。
	//因为在这个app中**Photo** and a **PhotoView**是一对一的关系,
	//为方便起见这里直接对model进行引用

    initialize: function() {
      _.bindAll(this, 'render');
      this.model.on('change', this.render);
      this.model.on('destroy', this.remove);
    },

    // 渲染photo对象
    render: function() {
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    },

    // 切换model`"viewed"`状态
    toggleViewed: function() {
      this.model.viewed();
    }

});
```

另一种不同的观点是，Backbone更类似我们前面提到的[Smalltalk-80 MVC](http://martinfowler.com/eaaDev/uiArchs.html#ModelViewController)。

正如Backbone忠实用户Derick Bailey[所写](http://lostechies.com/derickbailey/2011/12/23/backbone-js-is-not-an-mvc-framework/)，最好不要强制Backbone去适应某种设计模式。设计模式可以灵活的引导我们如何构建应用，但在这方便，Backbone都不是完美的符合MVC或者MVP。反而，它给我们带来了通过多重架构模式创建稳定框架的更好的概念。我们可以称之为**Backbone式**，MV*或者任何有帮助解释它别有风味的应用架构的定义。

这种概念如何起源非常值得弄清除，所以希望我对MVC和MVP的解释对你有帮助。大部分JavaScript框架的结构采用传统模式的路子，无论是有意还是无意的，重要的是他们都可以帮助我们开发更有组织，清晰，易维护的应用。


##背景资料

###Backbone.js

* 核心资料：Model, View, Collection, Router。采用自己的MV*风格。
* 良好的文档，而且一直在改进中。
* 被大公司用于伟大的应用，比如SoundCloud、Foursquare。
* views与models之间基于事件驱动通讯。正如我们所看到的，它直接给每个mode每个属性添加事件监听，可以让开发者更细粒度的控制view的改变。
* 支持通过自定义事件，或者单独的Key-value observing (KVO) 库进行数据绑定。
* 大力支持RESTful接口，所以models可以轻易的与后端关联。
* 可扩展的事件系统。在Backbone中可以非常[精细](http://lostechies.com/derickbailey/2011/07/19/references-routing-and-the-event-aggregator-coordinating-views-in-backbone-js/)的支持pub/sub。
* 原型通过```new```关键字来实例化，很多开发者更喜欢这种方式。
* 模板框架无关性，不过默认提供了Underscore的micro-templating。Backbone可以与其他模板框架一起使用比如Handlebars。
* 不支持嵌套的models，但是有[插件](https://github.com/PaulUithol/Backbone-relational)可以帮你解决。
* 为构建应用提供清晰和灵活的约定。Backbone不强制使用它的所有组件，有必须的组件就能正常工作。



# <a name="theinternals">核心内幕</a>

在这一章中，你将学习到Backbone的基本元素，models、views、collections和routers，同时还有如何使用命名空间(namespacing)来组织代码。但这意味着这就是官方文档的替代品，而是在你使用Backbone开发应用前帮助你理解背后的许多核心概念。

* Models(模型)
* Collections(集合)
* Routers(路由)
* Views(视图)
* Namespacing(命名空间)


##<a name="thebasics-models" id="thebasics-models">模型(Models)</a>

Backbone的models包含了应用中的交互是数据，以及数据的相关逻辑。比如，我们可以用一个model来代表一个photo对象，包含了它的标签(tags)，标题(title)，位置(location)这些属性

Models可以通过继承`Backbone.Model`来创建：

```javascript
var Photo = Backbone.Model.extend({
    defaults: {
        src: 'placeholder.jpg',
        title: 'an image placeholder',
        coordinates: [0,0]
    },
    initialize: function(){
        this.on("change:src", function(){
            var src = this.get("src");
            console.log('Image source updated to ' + src);
        });
    },
    changeSrc: function( source ){
        this.set({ src: source });
    }
});

var somePhoto = new Photo({ src: "test.jpg", title:"testing"});
somePhoto.changeSrc("magic.jpg"); // 触发"change:src"，在控制台打印信息

```

####初始化

`initialize()`方法在当一个model创建一个新的实例是调用。它是可选的，然后，后面你会发现使用它会更好。

```javascript
var Photo = Backbone.Model.extend({
    initialize: function(){
        console.log('this model has been initialized');
    }
});

// 创建一个自己的Photo实例:
var myPhoto = new Photo();
```

####Getters & Setters

**Model.get()**

`Model.get()`简单的提供了对模型属性的访问。 在初始化时传给model的属性是可以立即被访问到的。

```javascript
var myPhoto = new Photo({ title: "My awesome photo",
                          src:"boston.jpg",
                          location: "Boston",
                          tags:['the big game', 'vacation']}),

    title = myPhoto.get("title"), //My awesome photo
    location = myPhoto.get("location"), //Boston
    tags = myPhoto.get("tags"), // ['the big game','vacation']
    photoSrc = myPhoto.get("src"); //boston.jpg
```

或者，你想直接访问model实例的所有属性，可以通过下面这种方式：

```javascript
var myAttributes = myPhoto.attributes;
console.log(myAttributes);
```

最好使用`Model.set()`或者model的实例来设置model的属性。

通常不提倡直接访问`Model.attributes`。如果你想读取或者复制数据，提倡使用`Model.toJSON()`。 如果你想访问或者复制mode的属性用于JSON的字符串化(比如在传递给view之前序列化)，就可以用Model.toJSON()来完成。注意，它返回的是一个对象，如果要获取数据的字符串需要使用JSON.stringify()：


```javascript
var myAttributes = myPhoto.toJSON();
console.log(JSON.stringify(myattributes));
/* this returns:
 { title: "My awesome photo",
   src:"boston.jpg",
   location: "Boston",
   tags:['the big game', 'vacation']}
*/
```

####Model.set()

`Model.set()` 可以给一个model的实例传入属性。属性可以再初始化的时候设置也可以在后期设置。应该避免直接给model设置属性(比如,`Model.caption = 'A new caption'`)。Backbone使用Model.set()才知道何时广播model的数据改变。


```javascript
var Photo = Backbone.Model.extend({
    initialize: function(){
        console.log('this model has been initialized');
    }
});

// Setting the value of attributes via instantiation
var myPhoto = new Photo({ title: 'My awesome photo', location: 'Boston' });

var myPhoto2 = new Photo();

// Setting the value of attributes through Model.set()
myPhoto2.set({ title:'Vacation in Florida', location: 'Florida' });
```

**默认值**

当你想给model设置默认属性时(比如，当用户不会提供一份完整的数据时)，可以用`defaults`属性。

```javascript
var Photo = Backbone.Model.extend({
    defaults: {
        title: 'Another photo!',
        tags:  ['untagged'],
        location: 'home',
        src: 'placeholder.jpg'
    },
    initialize: function(){
    }
});

var myPhoto = new Photo({ location: "Boston",
                          tags:['the big game', 'vacation']}),
    title   = myPhoto.get("title"), //Another photo!
    location = myPhoto.get("location"), //Boston
    tags = myPhoto.get("tags"), // ['the big game','vacation']
    photoSrc = myPhoto.get("src"); //placeholder.jpg
```

**监听model的变化**

Backbone model的任何属性都可以绑定事件监听，观察他们属性的变化。监听器可以添加到`initialize()` 方法中:

```javascript
this.on('change', function(){
    console.log('values for this model have changed');
});
```

In the following example, we log a message whenever a specific attribute (the title of our Photo model) is altered.

```javascript
var Photo = Backbone.Model.extend({
    defaults: {
        title: 'Another photo!',
        tags:  ['untagged'],
        location: 'home',
        src: 'placeholder.jpg'
    },
    initialize: function(){
        console.log('this model has been initialized');
        this.on("change:title", function(){
            var title = this.get("title");
            console.log("My title has been changed to.. " + title);
        });
    },

    setTitle: function(newTitle){
        this.set({ title: newTitle });
    }
});

var myPhoto = new Photo({ title:"Fishing at the lake", src:"fishing.jpg"});
myPhoto.setTitle('Fishing at sea');
//logs 'My title has been changed to.. Fishing at sea'
```


**验证(Validation)**

Backbone支持通过`Model.validate()`对model进行验证，可以在设置model的属性前对值进行校验。

验证函数可以简单也可以看需要而极为复杂。如果属性值验证通过，`.validate()`方法可以不返回任何值。如果验证失败，需要返回一个自定义错误(error)。

下面是一个简单的验证例子：

```javascript
var Photo = Backbone.Model.extend({
    validate: function(attribs){
        if(attribs.src === undefined){
            return "Remember to set a source for your image!";
        }
    },

    initialize: function(){
        console.log('this model has been initialized');
        this.on("error", function(model, error){
            console.log(error);
        });
    }
});

var myPhoto = new Photo();
myPhoto.set({ title: "On the beach" });
//logs Remember to set a source for your image!
```

**提示**: Backbone使用Underscore `_.extend`方法对`attributes`对象进行浅拷贝，传递给`validate`函数。这就意味着，不能像JavaScript对象那样通过引用来改变任何`Number`, `String`或者`Boolean`类型的值。因为浅拷贝对对象不进行深度的复制，所以通过这些对象引用可改变属性值。

这里有一个[例子](http://jsfiddle.net/2NdDY/7/)(by @fivetanley)说明这个问题。


##<a name="thebasics-views" id="thebasics-views">视图(Views)</a>

Backbone中的Views不包含应用中的标记，但是它们定义models如何呈现给用户的逻辑。通常通过JavaScript模板来完成(比如：Mustache, jQuery-tmpl等)。view的`render()`方法可以绑定到model的`change()`事件上,这样view就可以保持更新而不用刷新整个页面。


####创建一个views

与上一章讲到的类似，创建一个view相对比较直接。需要继承自`Backbone.View`，下面代码中有详细的注解：

```javascript
var PhotoSearch = Backbone.View.extend({
    el: $('#results'),
    render: function( event ){
        var compiled_template = _.template( $("#results-template").html() );
        this.$el.html( compiled_template(this.model.toJSON()) );
        return this; //建议返回this,可以链式调用。
    },
    events: {
        "submit #searchForm":  "search",
        "click .reset": "reset",
        "click .advanced": "switchContext"
    },
    search: function( event ){
        //当'#searchForm'表单提交时调用。
    },
    reset: function( event ){
        //当class为"reset"的元素点击时调用。
    },
    switchContext: function( event ){
        //当class为"advanced"的元素点击时调用。
    }
});
```

####什么是el?

`el`通常是DOM元素的引用，所有views都必须有一个。所有view的内容都一次性插入这个DOM，可以让让浏览器执行最小化的重绘，渲染更快。

有2种方式给view指定一个DOM元素：元素在页面中已存在，或者一个新创建的元素，开发者手动添加。
如果元素已经存在，你可以设置`el`为一个css选择器或者直接对DOM的引用。

```javascript
el: '#footer',
// 或
el: document.getElementById( 'footer' )
```

如果要给view创建一个新的元素，设置view属性的任意组合：`tagName`, `id`和`className`。框架会为你创建一个新的元素，并且可以通过`el`属性来引用这个元素。

```
tagName: 'p', // 必须, 但默认会设为'div'
className: 'container', // 可选，可以设置多个class，比如：'container homepage'
id: 'header', // 可选
```

上面这段代码表示创建下面这个```DOMElement```，但是不会添加到页面DOM中。


	<p id="header" class="container"></p>



**理解`render()`**

`render()`是一个可选方法，定义模板的渲染逻辑。在这里示例中我们会用Underscore的micro-templating，但是你要记得，你也可以使用其它的模板框架。

Underscore的`_.template`方法把JavaScript模板编译成方法， 在渲染的时候执行。在上面这个view中，通过ID `results-template`获取模板标记，传给`_.template()`去编译。然后，把`el`元素的html设为用view相关联的model的JSON数据编译出来的模板结果。


转眼间!在短短几行代码之内，填充模板，给你一个完成数据填充的标签集合。


**`events`属性**

Backbone的`events`属性可以让我们通过自定义选择器或者直接绑定到`el`来添加事件监听。事件按照格式`{"事件名称 选择器": "回调函数"}`，支持大量的DOM事件，包括`click`, `submit`, `mouseover`, `dblclick` 还有更多。

不是特别明显的是，Backbone用jQuery的`.delegate()`来提供事件代理的支持，但有些改进，`this`始终指向当前的view对象。需要记住的是，events属性中指定的回调函数名称必须在view范围内有一个对应函数。


##<a name="thebasics-collections" id="thebasics-collections">集合(Collections)</a>

Collections是Models的集合，通过继承`Backbone.Collection`来创建。

通常，创建collection时也传入model的属性，和一些必要的实例化属性。

下面这个例子中将创建一个PhotoCollection，包含Photo的models：

```javascript
var PhotoCollection = Backbone.Collection.extend({
    model: Photo
});
```

**Getters和Setters**

从collection获取model有几种不同的方法。最直接的方式是使用`Collection.get()`，接受一个唯一id：


```javascript
var skiingEpicness = PhotoCollection.get(2);
```

有时你可能想通过它的client id来获取model。client id是在model未保存前Backbone自动给它分配的一个id。可以通过model的`.cid`属性来获取它的client id。


```javascript
var mySkiingCrash = PhotoCollection.getByCid(456);
```

Backbone的Collections没有setters这样的方法，但可以通过`.add()`来添加models，通过`.remove()`来移除models。

```javascript
var a = new Backbone.Model({ title: 'my vacation'}),
    b = new Backbone.Model({ title: 'my holiday'});

var photoCollection = new PhotoCollection([a,b]);
photoCollection.remove([a,b]);
```

**监听事件**

collections代表了一组元素，我们同样可以监听从collection `add`和`remove` models。下面是示例：

```javascript
var PhotoCollection = new Backbone.Collection();
PhotoCollection.on("add", function(photo) {
  console.log("I liked " + photo.get("title") + ' it\'s this one, right? '  + photo.get("src"));
});

PhotoCollection.add([
  {title: "My trip to Bali", src: "bali-trip.jpg"},
  {title: "The flight home", src: "long-flight-oofta.jpg"},
  {title: "Uploading pix", src: "too-many-pics.jpg"}
]);
```

另外，也可以绑定`change`事件来监听collection中models的变化。

```javascript
PhotoCollection.on("change:title", function(){
    console.log("there have been updates made to this collection's titles");
});
```

**从服务器端获取models**

`Collections.fetch()`默认接受从服务器端获取的models json数组。当数据返回时，当前collection的内容就会被替换成这个数组。


```javascript
var PhotoCollection = new Backbone.Collection;
PhotoCollection.url = '/photos';
PhotoCollection.fetch();
```

在配置的时候，Backbone设置了一个变量来标识扩充的HTTP方法是否被服务器支持。另外一个设置控制服务器端是否识别正确的JSON MIME类型。

```javascript
Backbone.emulateHTTP = false;
Backbone.emulateJSON = false;
```

Backbone.sync方法使用到的这些值实际上是Backbone.js不可分割的一部分。这个方法类似jQuery的ajax方法，所以参数结构上是基于jQuery的API。通过搜索代码里sync方法的调用会发现，任何时候，在model保存，获取，删除(销毁)时就会调用。

在后台，`Backbone.sync`方法在Backbone试图读取或保存models到server的时候就会调用。它使用jQuery或者Zepto的ajax实现来完成这些RESTful请求，当然，也可以使用你喜欢的方式去重写它。:

sync方法可以通过Backbone.sync全局性的重写，或者在一个更精确的范围内通过给Backbone collection或者一个单独的model添加sync方法重写。

没有什么花哨的插件API来添加一个持久层——简单的覆盖Backbone.sync方法就可以了：

```javascript
Backbone.sync = function(method, model, options) {
};
```

options默认参数:

```javascript
var methodMap = {
  'create': 'POST',
  'update': 'PUT',
  'delete': 'DELETE',
  'read':   'GET'
};
```

在上面这个列子中如果想在`.sync()`调用时log一个事件，可以这样做：

```javascript
var id_counter = 1;
Backbone.sync = function(method, model) {
  console.log("I've been passed " + method + " with " + JSON.stringify(model));
  if(method === 'create'){ model.set('id', id_counter++); }
};
```


**重置/刷新 Collections**

不同于单独的添加或者删除models，你可能想一次性整体更新collection。```Collection.reset()```可以设置新的models来更新整个collection：

```javascript
PhotoCollection.reset([
  {title: "My trip to Scotland", src: "scotland-trip.jpg"},
  {title: "The flight from Scotland", src: "long-flight.jpg"},
  {title: "Latest snap of Loch Ness", src: "lochness.jpg"}]);
```

注意，使用`Collection.reset()`不触发任何`add`和`remove`事件。而是触发一个`reset`事件。

###Underscore实用方法

因为Backbone强烈依赖Underscore，所以我们就可以使用它的许多实用方法来帮助开发。这里有一个使用Underscore的`sortBy()`方法基于某个属性对photo的collection进行排序的例子。

```javascript
var sortedByAlphabet = PhotoCollection.sortBy(function (photo) {
    return photo.get("title").toLowerCase();
});
```

可以在Underscore[官方文档](http://documentcloud.github.com/underscore/)找到更完整的用法。


###链式API

/*
This works by calling the original method with the current array of models and returning the result. In case you haven’t seen it before, the chainable API looks like this:
*/
跳过实用方法，Backbone的另一个甜蜜之处就是它对Underscore chain方法的支持。工作原理是使用当前的models数组调用原始方法，并且把结果返回。如果你之前从未见过，链式API就像这样：

```javascript
var collection = new Backbone.Collection([
  { name: 'Tim', age: 5 },
  { name: 'Ida', age: 26 },
  { name: 'Rob', age: 55 }
]);

collection.chain()
  .filter(function(item) { return item.get('age') > 10; })
  .map(function(item) { return item.get('name'); })
  .value();

// 将返回['Ida', 'Rob']
某些Backbone特定方法会返回this，同样也可以链接：

var collection = new Backbone.Collection();

collection
    .add({ name: 'John', age: 23 })
    .add({ name: 'Harry', age: 33 })
    .add({ name: 'Steve', age: 41 });

collection.pluck('name');
// ['John', 'Harry', 'Steve']
```


##<a name="thebasics-events" id="thebasics-events">事件(Events)</a>

正如我们讲述的，Backbone的对象都设计成继承而来，而且下面的每个对象都继承自`Backbone.Events`：

* Backbone.Model
* Backbone.Collection
* Backbone.Router
* Backbone.History
* Backbone.View

事件是处理用户行为的标准方式，通过对views，model和collection的变化声明事件绑定。掌控事件是使用Backbone提高生产力最快速的方式。

`Backbone.Events`同样提供一种方式给任何对象绑定和触发自定义事件。我们可以非常容易的把它与任何对象混合，而且不要求事件在绑定前必须声明。

示例:

```javascript
var ourObject = {};

// Mixin
_.extend(ourObject, Backbone.Events);

// Add a custom event
ourObject.on("dance", function(msg){
  console.log("We triggered " + msg);
});

// Trigger the custom event
ourObject.trigger("dance", "our event");
```

如果你对jQuery自定义事件或者发布者/订阅者(Publish/Subscribe)的概念比较熟悉的话，`Backbone.Events` 提供了一套类似的系统，`on`跟`subscribe`类似，`trigger`跟`publish`类似。

`on`基本上允许我们给任何对象绑定一个回调方法，就想上面例子中`dance`一样。任何时候事件被触发，回调函数就被执行。

官方的Backbone.js文档建议对事件名称使用命名空间的方式来连接，如果你的页面中有比较多事件的话，比如：

```javascript
ourObject.on("dance:tap", ...);
```

如果你想要在任何事件触发时都触发一个事件的话(比如你想要在屏幕中某个位置显示事件触发的名称)，可以用一个特定的`all`事件。`all`事件可以像下面这样使用：


```javascript
ourObject.on("all", function(eventName){
  console.log("The name of the event passed was " + eventName);
});
```

`off`可以从一个对象中移除已经绑定的回调。回到发布者/订阅者(Publish/Subscribe)的对照关系，思考下 `退订(unsubscribe)`自定义事件。

要移除前面给`myObject`绑定的`dance`事件，可以这样做：


```javascript
myObject.off("dance");
```

这会移除所有绑定在`dance`事件上的回调。如果只想移除指定名称的回调，可以这样：


```javascript
myObject.off("dance", callbackName);
```

最后，`trigger`触发指定事件的回调(或者以空格分隔的事件列表)。例如：


```javascript
// 单个事件
myObject.trigger("dance");

// 多个事件
myObject.trigger("dance jump skip");
```

也可以通过`trigger`第二个参数给每个(或所有)事件传入附加参数。例如：


```javascript
myObject.trigger("dance", {duration: "5 minutes"});
```


##<a name="thebasics-routers" id="thebasics-routers">路由(Routers)</a>

在Backbone中，Routers是用于帮助管理应用状态，以及关联url和应用的事件。通过URL片段的hash-tags，或者使用浏览器pushState或者History API。下面是一些Routers的示例：

```javascript
http://unicorns.com/#whatsup
http://unicorns.com/#search/seasonal-horns/page2
```

提示: 一个应用通常至少有一个路由映射，一个URL路由到一个function，这个function决定了当用户到达这个指定route的时候应该做什么。这种关系像下面这样定义：

```javascript
"route" : "mappedFunction"
```

那让我们通过继承`Backbone.Router`来定义第一个控制器吧。在这段指南中，我们继续创建图片库应用，需要一个GalleryRouter。

请注意下面代码中的注解：

```javascript
var GalleryRouter = Backbone.Router.extend({
    /* 定义route和function的映射*/
    routes: {
        "about" : "showAbout",
        /*使用范例: http://unicorns.com/#about*/

        "photos/:id" : "getPhoto",
        /*这是一个使用参数变量的列子(":param")，可以匹配2个斜杠之间的部分*/
        /*使用范例: http://unicorns.com/#photos/5*/

        "search/:query" : "searchPhotos",
        /*也可以定义多个routes映射到同一个function,比如这里的searchPhotos()。
		注意下面我们如何随意的传入一个已经存在的页码*/
        /*使用范例: http://unicorns.com/#search/lolcats*/

        "search/:query/p:page" : "searchPhotos",
        /*我们可以看到，URL中可以包含多个":param"参数*/
        /*使用范例: http://unicorns.com/#search/lolcats/p1*/

        "photos/:id/download/*imagePath" : "downloadPhoto",
        /*这是一个使用通配符(*splat)的例子。通配符可以匹配任意数量的URL部分，
		而且可以与参数":param"组合使用*/
        /*使用范例: http://unicorns.com/#photos/5/download/files/lolcat-car.jpg*/

        /*如果你想用通配符来做默认路由，最好放在URL的最后，
		不然就要在URL片段上使用正则表达式了。*/

        "*other"    : "defaultRoute"
        /*这是一个使用*splat的默认路由。Consider the
        default route a wildcard for URLs that are either not matched or where
        the user has incorrectly typed in a route path manually*/
        /*使用范例: http://unicorns.com/#anything*/

    },

    showAbout: function(){
    },

    getPhoto: function(id){
        /*
        注意前面route匹配的id会传入这个方法
        */
        console.log("You are trying to reach photo " + id);
    },

    searchPhotos: function(query, page){
        var page_number = page || 1;
        console.log("Page number: " + page_number + " of the results for " + query);
    },

    downloadPhoto: function(id, path){
    },

    defaultRoute: function(other){
        console.log("Invalid. You attempted to reach:" + other);
    }
});

/*现在我们就建立了一个router，记得实例化。*/

var myGalleryRouter = new GalleryRouter();
```

Backbone 0.5+以上版本，可以选择`window.history.pushState`对HTML5 pushState的支持。这就允许你像这样http://www.scriptjunkie.com/just/an/example来定义routes。浏览器不支持pushState时会降级处理。在这部教程中我们会使用hashtag方法。


####对路由器(routers)的数量会有限制吗?

安德鲁·德·安德拉德(Andrew de Andrade)指出，DocumentCloud在他们大多数应用中通常只使用一个路由器(router)。 在自己大多数应用项目中最好不要超过一个router，这样路由可以放在一个controller中，不会变的笨重。


####Backbone.history

下面，我们需要初始化`Backbone.history`，它应用中处理了`hashchange`事件。当它们被访问时会自动处理被定义的routes，并且触发回调。

`Backbone.history.start()`方法会告诉Backbone监听所有`hashchange`事件，就想下面这样：

```javascript
Backbone.history.start();
Router.navigate();
```

另外，如果你想在URL中的某个特定地方保存应用的状态可以用`.navigate()`方法。它可以不触发`hashchange`事件更新URL片段：


```javascript
/*假设当用户方法一张照片的时候我们需要给定一个片段(fragment)*/
zoomPhoto: function(factor){
    this.zoom(factor); //假设这是放大照片
    this.navigate("zoom/" + factor); //更新fragment，但是不触发hashchange事件。
}
```

`Router.navigate()`也可以在更新URL fragment的同时触发路由。

```javascript
zoomPhoto: function(factor){
    this.zoom(factor); //假设这是放大照片
    this.navigate("zoom/" + factor, true); //更新fragment，触发路由
}
```


### Backbone的同步API

Backbone.sync方法就是用于被重写以对后端的支持。该内置方法是根据RESTful JSON API衍生而来的—— Backbone最初是从一个Ruby on Rails应用中提取出来的，该应用以同样的方式使用像PUT之类的HTTP方法。

这种方式的工作原理就是model和collection类有一个sync方法，它调用Backbone.sync。当获取，保存或者删除元素时它们内部都会调用this.sync。

sync方法有3个参数：

* method: 可以是create, update, delete, read
* model: Backbone model对象
* options: 可能包含成功和错误的回调方法。

可以使用下面这种模式来实现一个sync方法：

```javascript
Backbone.sync = function(method, model, options) {
  var requestContent = {}, success, error;

  function success(result) {
    // 处理MyAPI的返回结果
    if (options.success) {
      options.success(result);
    }
  }

  function error(result) {
    // 处理MyAPI的返回结果
    if (options.error) {
      options.error(result);
    }
  }

  options || (options = {});

  switch (method) {
    case 'create':
      requestContent['resource'] = model.toJSON();
      return MyAPI.create(model, success, error);

    case 'update':
      requestContent['resource'] = model.toJSON();
      return MyAPI.update(model, success, error);

    case 'delete':
      return MyAPI.destroy(model, success, error);

    case 'read':
      if (model.attributes[model.idAttribute]) {
        return MyAPI.find(model, success, error);
      } else {
        return MyAPI.findAll(model, success, error);
      }
  }
};
```

这种模式把API的调用委派给了一个新的对象，这个对象可以是Backbone风格支持事件的的对象。它可以被安全的独立测试，而且可以用于除Backbone以外的其它库中。

除此之外还有很多其它的同步实现：

* Backbone localStorage
* Backbone offline
* Backbone Redis
* backbone-parse
* backbone-websql
* Backbone Caching Sync

### 处理冲突

跟大部分客户端项目一样，Backbone.js把所有东西都包裹在一个即时执行的函数表达式中：

```javascript
(function(){
  // Backbone.js
}).call(this);
```

在这个结构被执行的时候发生了几件事情。一个Backbone“名字空间(namespace)”被创建了，而且可以通过noConflict模式来让多个版本的Backbone在同一个页面中共存：

```javascript
var root = this;
var previousBackbone = root.Backbone;

Backbone.noConflict = function() {
  root.Backbone = previousBackbone;
  return this;
};
```

可以像下面这样调用来让多个版本Backbone在同一个页面中共存：

```javascript
var Backbone19 = Backbone.noConflict();
// Backbone19指向最近载入的Backbone
// `window.Backbone`则保存的是前一个载入的版本
```

这段初始化代码同样支持CommonJS模块，所以Backbone可以用在Node项目中：

```javascript
var Backbone;
if (typeof exports !== 'undefined') {
  Backbone = exports;
} else {
  Backbone = root.Backbone = {};
}
```

##<a name="thebasics-inheritance" id="thebasics-inheritance">继承(Inheritance)&混合(Mixins)</a>

Backbone的继承使用`inherits`方法，灵感来自于Google在Closure库中的实现。它主要是建立原型链。

```javascript
 var inherits = function(parent, protoProps, staticProps) {
      ...
```

主要的不同是，Backbone的API接受2个对象，包括“instance(实例)”和“static(静态)”方法。

依此而论，为了达到继承的目的，Backbone对象都包含一个`extend`方法：

```javascript
Model.extend = Collection.extend = Router.extend = View.extend = extend;
```

大部分基于的Backbone的开发都从这几个对象中继承而来，而且它们被设计成模仿经典的面向对象的实现。

如果这听起来很熟悉，因为`extend`是Underscore.js的一个功能，虽然Backbone用它做了很多事情。看看下面Underscore的`extend`:

```
each(slice.call(arguments, 1), function(source) {
  for (var prop in source) {
    obj[prop] = source[prop];
  }
});
return obj;
```

上面跟ES5的`Object.create`有很大不同，因为它实际上是复制一个对象的属性(方法和值)给另外一个对象。它不足以支持Backbone的继承和类模型，使用下面的步骤会更好：

* 实例方法检查是否有constructor属性。如果有，使用当前class的constructor，否则使用parent的constructor(比如Backbone.Model)。
* Underscore的extend方法会把父类的方法添加到新的子类上。
* `prototype`属性是用父类的原型(prototype)定义一个空的构造函数(constructor function)
* 定义子类原型的constructor和一个`__super__`属性。
* 这种模式也同样用于CoffeeScript中的class，所以Backbone中的class与CoffeeScript中的class兼容。


`extend`可以更广泛的使用，对于那些忠实于mixins的开发者来说也可以这样使用。你可以把功能定义在自己的object上，然后直接把它复制到一个Backbone对象上。

例如:

```javascript
 var MyMixin = {
  foo: "bar",
  sayFoo: function(){alert(this.foo);}
}

var MyView = Backbone.View.extend({
 // ...
});

_.extend(MyView.prototype, MyMixin);

myView = new MyView();
myView.sayFoo(); //=> "bar"
```

我们可以借此更近一步，把它应用到View的继承上。下面是如何扩展一个View的例子：

```javascript
var Panel = Backbone.View.extend({
});

var PanelAdvanced = Panel.extend({
});
```

不过，如果Panely已经有一个`initialize()`方法，PanelAdvanced同样也有一个`initialize()`方法，上一个就不会调用，所以需要显示的调用Panel的initialize方法：

```javascript
var Panel = Backbone.View.extend({
   initialize: function(options){
      console.log('Panel initialized');
      this.foo = 'bar';
   }
});

var PanelAdvanced = Panel.extend({
   initialize: function(options){
      this.constructor.__super__.initialize.apply(this, [options])
      console.log('PanelAdvanced initialized');
      console.log(this.foo); // Log: bar
   }
});
```

这不是最优雅的解决方案，如果有很多Views都要继承自Panel的话，就需要每个都记得调用Panel的initialize。

可能Panel目前initialize方法没什么用处所以没写，将来要添加的话你就不得不检查下所有继承自它的子类都调用了它的initialize方法。

所以，有另外一种方式来定义Panel，继承自它的views就不用调用它的initialize方法：

```javascript
var Panel = function (options) {

    // Panel的初始化代码
    console.log('Panel initialized');
    this.foo = 'bar';

    Backbone.View.apply(this, [options]);
};

_.extend(Panel.prototype, Backbone.View.prototype, {

    // 把所有Panel的方法都放这，例如：
    sayHi: function () {
        console.log('hello from Panel');
    }
});

Panel.extend = Backbone.View.extend;


// 其它继承自Panel的view：
var PanelAdvanced = Panel.extend({

    initialize: function (options) {
        console.log('PanelAdvanced initialized');
        console.log(this.foo);
    }
});

var PanelAdvanced = new PanelAdvanced(); //Log: Panel initialized, PanelAdvanced initialized, bar
PanelAdvanced.sayHi(); // Log: hello from Panel
```

只要使用得当，Backbone的`extend`方法可以节省很多时间并且减少冗余代码。

(非常感谢[Alex Young](http://dailyjs.com), [Derick Bailey](http://stackoverflow.com/users/93448/derick-bailey)和[JohnnyO](http://stackoverflow.com/users/188740/johnnyo) 给出这些提示).


##<a name="thebasics-namespacing" id="thebasics-namespacing">命名空间(Namespacing)</a>

当学习使用Backbone时，通常教程会忽视命名空间这个重要点。如果你对JavaScript中命名空间已经有经验的话，后面部分会给你一些如何确切的应用Backbone一些概念的建议，不过我还是要为初学者讲解下这个话题。

####什么是命名空间namespacing?

命名空间的基本概念就是避免与全局名字空间下的对象或者变量冲突。这非常重要，所以要保护好你的代码，避免被同一个页面里其它使用相同变量的代码破坏。作为全局空间下的一个良好'公民(citizen)'，同样要尽可能的不破坏其它开发者的代码运行。

JavaScript本身不想其它语言一样内置对命名空间的支持，但是有闭包可以达到类似的效果。

这部分我们通过一些例子简短的看下如果对models, views, routers和其它组件用命名空间管理。有几种模式：

* 单一全局变量(Single global variables)
* 对象常量(Object Literals)
* Nested namespacing

**单一全局变量**

在JavaScript中一种常用的命名空间的方式就是使用单一全局变量作为主要对象的引用。可以像下面这样返回一个包含方法和属性的对象：

```javascript
var myApplication = (function(){
    function(){
      // ...
    },
    return {
      // ...
    }
})();
```

可能前面你已经看到过这种技术了。一个Backbone特有的例子可能会像这样：

```javascript
var myViews = (function(){
    return {
        PhotoView: Backbone.View.extend({ .. }),
        GalleryView: Backbone.View.extend({ .. }),
        AboutView: Backbone.View.extend({ .. });
        //etc.
    };
})();
```

这里我们可以返回一组views，使用同样的方式也可以然会整个应用中的models, views和routers。尽管在确切的情况下它可以正常的工作，但单一全局变量最大的问题就是必须确保在同一个页面中没有其它人使用同样的全局变量。

Peter Michaux提到一种可以解决这个问题的方案，使用命名空间前缀。它只是一个内心的一个概念，他的观点就是使用一个通用的前缀(下面例子中，`myApplication_`)，然后所有方法，变量和其它对象的定义都加上这个前缀。

```javascript
var myApplication_photoView = Backbone.View.extend({}),
myApplication_galleryView = Backbone.View.extend({});
```

这得益于减少全局域下特定变量变化的观点，不过唯一对象命名也有同样的效果。另外，这种模式的最大问题在于当应用变得庞大时就会产生大量的全局变量。

更多关于Peter单一全局变量模式的观点可以阅读[更多好的文章](http://michaux.ca/articles/javascript-namespacing)。

提示：单一变量模式有很多其它的变种，不过经过一段时间评测，我觉得加前缀的方式在Backbone应用的最好。

**对象常量**

对象常量的好处是不会污染全局空间，但是要逻辑性的组织代码和参数。如果你想容易的创建支持深层嵌套的可读性结构代码的话，它非常有用。不像单一全局变量，对象常量经常考虑检测同样名称的变量是否存在，来减少冲突。

下面有2中方式在定义前来检测一个名字是否存在。我通常使用第二种。

```javascript
/*不会检测myApplication的存在*/
var myApplication = {};

/*
检测是否存在。如果已经定义则直接使用该实例。
方案1:   if(!myApplication) myApplication = {};
方案2:   var myApplication = myApplication || {};
然后就可以使用它来支持models, views和collections (或者任何其它数据)：
*/

var myApplication = {
    models : {},
    views : {
        pages : {}
    },
    collections : {}
};
```

也可以选择直接给它添加属性：

```javascript
var myGalleryViews = myGalleryViews || {};
myGalleryViews.photoView = Backbone.View.extend({});
myGalleryViews.galleryView = Backbone.View.extend({});
```

这种模式的好处是，可以容易的封装所有的models, views, routers等等，把他们清晰的分离，而且对代码扩展提供的坚实的基础。

这种模式有很多好处。它可以把应用的默认配置单独解耦出来成单独的一块，当你需要改造的时候就不用到整个代码里去找配置。下面有个例子，假设是一个保存应用的配置对象：


```javascript
var myConfig = {
    language: 'english',
    defaults: {
        enableGeolocation: true,
        enableSharing: false,
        maxPhotos: 20
    },
    theme: {
        skin: 'a',
        toolbars: {
            index: 'ui-navigation-toolbar',
            pages: 'ui-custom-toolbar'
        }
    }
}
```

这是一个纯粹的js对象，不过跟标准的JSON对象语法稍微有一点区别。至于为什么要用JSON对象来保存配置(比如传给后端的参数)，那只能说是随意了。

想进一步了解字面对象，推荐你阅读Rebecca Murphey的[优秀文章](http://rmurphey.com/blog/2009/10/15/using-objects-to-organize-your-code).

**嵌套的命名空间**

字面对象的一种扩展模式就是嵌套命名空间。这是一种在已经存在的顶级命名下避免冲突的常用模式，it's unlikely the same nested children do. 比如，Yahoo的YUId大量的使用了嵌套对象来做命名空间:

```javascript
YAHOO.util.Dom.getElementsByClassName('test');
```

Yahoo的YUI跟DocumentCloud(Backbone创建者)在他们的主要项目中一样都使用嵌套对象命名空间。下面是Backbone中使用嵌套命名空间的例子：

```javascript
var galleryApp =  galleryApp || {};

// 对嵌套的子对象进行检测
galleryApp.routers = galleryApp.routers || {};
galleryApp.model = galleryApp.model || {};
galleryApp.model.special = galleryApp.model.special || {};

// routers
galleryApp.routers.Workspace   = Backbone.Router.extend({});
galleryApp.routers.PhotoSearch = Backbone.Router.extend({});

// models
galleryApp.model.Photo   = Backbone.Model.extend({});
galleryApp.model.Comment = Backbone.Model.extend({});

// special models
galleryApp.model.special.Admin = Backbone.Model.extend({});
```

这对于你的Backbone应用，可读性强，结构清晰，非常安全的命名空间管理。唯一的要求就是JavaScript引擎要先找到 galleryApp对象，知道找到你调用的对象。不过，Juriy Zaytsev已经对使用嵌套命名空间的性能进行了测试，与使用单层对象命名基本上没什么差异。


**推荐(Recommendation)**

回顾上面的命名模式，在开发Backbone应用中我更喜欢用嵌套对象命名空间模式，而不是对象直接量模式。

单一全局变量可能会工作起来很好。但是，对大量代码的应用更需要一个具有可读性和扩展性的命名空间管理方式。我觉得这种方式对于大多数Backbone开发来说是个很不错的选择。

# <a name="practicaltodos">实践：Todos - 你的第一个Backbone.js应用</a>

现在，我们已经完成了基本概念的旅程，让我们开始写第一个Backbone.js应用——一个Todo列表应用。构建一个Todo应用是一个学习Backbone约定的很好方式。这是一个非常简单的应用，但是包含很多有趣而实用的问题，比如绑定(binding)，解析model数据，路由(routing)和模板渲染。

这一章我们将学习如何创建一个[TodoMVC.com](http://todomvc.com)上面的Backbone.js Todo应用。

<img src="img/todoapp.png" width="700px"/>

我们先站在一个较高的架构角度想想我们需要些什么东西。

* 一个`Todo` model来描述todo项实体
* 一个`TodoList` collection对todos的持久化保存
* 一种创建todos的方式
* 列举todos
* 编辑存在的todos
* 完成todos
* 删除todos
* 一种方式去标记项目已完成或者是遗留

基本上是经典的[CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete)方法。让我们开始吧!

##Index

首先，第一步是建立应用的依赖，在这个案例中会使用：[jQuery](http://jquery.com), [Underscore](http://underscorejs.org), Backbone.js和[Backbone本地存储转换器](https://github.com/jeromegn/Backbone.localStorage)。这些东西必须在主页面index.html中加载：


```

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Backbone.js • TodoMVC</title>
  <link rel="stylesheet" href="../../assets/base.css">
</head>
<body>
  <script src="../../assets/base.js"></script>
  <script src="../../assets/jquery.min.js"></script>
  <script src="js/lib/underscore-min.js"></script>
  <script src="js/lib/backbone-min.js"></script>
  <script src="js/lib/backbone-localstorage.js"></script>
  <script src="js/models/todo.js"></script>
  <script src="js/collections/todos.js"></script>
  <script src="js/views/todos.js"></script>
  <script src="js/views/app.js"></script>
  <script src="js/routers/router.js"></script>
  <script src="js/app.js"></script>
</body>
</html>

```

为了展示应用的各个部分是如何被单独分开的，每个部分都分别放在了单独的文件夹下，分别有models, views, collections和routers。app.js文件用于启动整个应用。


##Application HTML

现在来看下应用的静态HTML。需要一个`<input>`来创建todos，一个`<ul id="todo-list" />`来列举todos项，一个section包含一些操作，比如清空完成的todos。

```
  <section id="todoapp">
    <header id="header">
      <h1>todos</h1>
      <input id="new-todo" placeholder="What needs to be done?" autofocus>
    </header>
    <section id="main">
      <input id="toggle-all" type="checkbox">
      <label for="toggle-all">Mark all as complete</label>
      <ul id="todo-list"></ul>
    </section>
    <footer id="footer"></footer>
  </section>
  <div id="info">
    <p>Double-click to edit a todo</p>
    <p>Written by <a href="https://github.com/addyosmani">Addy Osmani</a></p>
    <p>Part of <a href="http://todomvc.com">TodoMVC</a></p>
  </div>
```

后面我们会填充todo-list，添加一个部分统计哪些项待完成。

回到基本概念——Todo model。

## Todo model

`Todo` model非常简单明了。有2个属性`title`和`completed`状态表示是否完成。这些属性有默认值传入：

```javascript

var app = app || {};

  // Todo Model
  // ----------
  // **Todo** model 有`title`, `order`，和`completed`属性。//

  app.Todo = Backbone.Model.extend({

    // todo默认属性，确保每个todo创建之后可以读到`title` 和 `completed`。
    defaults: {
      title: '',
      completed: false
    },

    // 切换`completed`状态。
    toggle: function() {
      this.save({
        completed: !this.get('completed')
      });
    }

  });
```

同样有一个`toggle()`方法，设置todo是否已经完成。


##Todo collection

接下来，用一个`TodoList` collection把models组合起来。这个collection是扩展自localStorage， 通过Backbone本地存储转换器自动使用HTML5进行本地存储，所以可以在页面请求之间保存。

然后有一些静态方法，`completed()`和`remaining()`, 分别返回已完成和未完成的todos数组。

最后有一个`nextOrder()`函数，通过`comparator()`比较保证他们按添加时的顺序排序。

```javascript

  // Todo Collection
  // ---------------

  // 使用*localStorage*来替代远程服务器存储
  var TodoList = Backbone.Collection.extend({

    // collection引用的model
    model: app.Todo,

    // 保存所有todos到`"todos"命名空间下。
    localStorage: new Store('todos-backbone'),

    // 过滤出所有已完成项
    completed: function() {
      return this.filter(function( todo ) {
        return todo.get('completed');
      });
    },

    // 过滤出所有未完成项
    remaining: function() {
      return this.without.apply( this, this.completed() );
    },

    // 虽然保存的时候是无序的，但是可以通过分配一个GUID来保证它的顺序。
    nextOrder: function() {
      if ( !this.length ) {
        return 1;
      }
      return this.last().get('order') + 1;
    },

    // 按添加时的顺序保存
    comparator: function( todo ) {
      return todo.get('order');
    }
  });

  // 创建一个全局的**Todos** collection。
  app.Todos = new TodoList();
```

##Application View

现在我们来看下应用的核心逻辑，views。因为每个todo都有自己的一小块逻辑，比如就地编辑，我们将使用元素控制器模式——包含2个views，一个控制collection的项，一个控制每个独立的Todo项。

换句话说，我们将创建一个`AppView`，包含新建todo，渲染todo列表。同时另外一个TodoView，关联到单个的Todo记录。Todo实例会负责它们的编辑，更新和销毁。

To keep thing simple, we'll keep things 'read-only' at the moment, and won't provide any functionality for creating, editing or deleting todos:

```javascript

  // The Application
  // ---------------

  // **AppView**，总体UI
  app.AppView = Backbone.View.extend({

    // 把view绑定到一个已经存在的DOM上
    el: '#todoapp',

    // 底部统计信息块的模板
    statsTemplate: _.template( $('#stats-template').html() ),

    // 初始化的时候绑定相关事件到`Todos` collection,
	// 当元素添加或改变的时候。触发从*localStorage*载入已存在的todos。
    initialize: function() {
      this.input = this.$('#new-todo');
      this.allCheckbox = this.$('#toggle-all')[0];
      this.$footer = this.$('#footer');
      this.$main = this.$('#main');

      window.app.Todos.on( 'add', this.addAll, this );
      window.app.Todos.on( 'reset', this.addAll, this );
      window.app.Todos.on( 'all', this.render, this );

      app.Todos.fetch();
    },

    // 重新渲染，只刷新统计信息，其它部分不改变。    
    render: function() {
      var completed = app.Todos.completed().length;
      var remaining = app.Todos.remaining().length;

      if ( app.Todos.length ) {
        this.$main.show();
        this.$footer.show();

        this.$footer.html(this.statsTemplate({
          completed: completed,
          remaining: remaining
        }));

      } else {
        this.$main.hide();
        this.$footer.hide();
      }

      this.allCheckbox.checked = !remaining;
    },

    // 通过创建一个view来新建一个单独的todo项，
    // 追加到`<ul>`中。
    addOne: function( todo ) {
      var view = new app.TodoView({ model: todo });
      $('#todo-list').append( view.render().el );
    },

    // 一次性添加**Todos** collection中的所有项。
    addAll: function() {
      this.$('#todo-list').html('');
      app.Todos.each(this.addOne, this);
    }

  });
```

我们完成了很多事情，el，`statsTemplate`，构造函数，几个view的特定方法。el指向的是todoapp元素。

我们来看下构造函数。它在Todo model上绑定了几个事件，add, reset和all。因为我们把更新和删除操作转向给`TodoView`去处理，所以这里我们暂时不管。这2部分的逻辑是：

* 当一个新的todo创建时，`add`事件会被触发，调用`addAll()`。遍历Todos，触发每个项的`addOne()`。

* `addOne()` 实例化一个TodoView view，渲染并且添加到Todo列表中。

* 当一个`reset`事件触发时(比如，从本地存储载入后大量更新colletion)，`addAll()`同样也会再次触发。

然后，我们可以添加创建新todos，编辑，根据是否完成来过滤等逻辑。

* events: 我们定义一个事件hash，包含DOM事件的回调。
  * `createOnEnter()`: 用户在`<input/>`回车时，创建一个新的todo，然后重置`<input/>`为下一次输入。
  * `clearCompleted()`: 移除todo列表中已标记完成的项。
  * `toggleAllComplete()`: 允许用户把列表中所有的项都设为已完成。
  * `initialize()`:
    绑定一个change:completed事件回调，让我们知道对一个存在的项发生了改变。
	同时，绑定filter事件回调，有点类似addOne() and addAll()。，通过filterOne() and filterAll()实现过滤当前UI中哪些需要显示(所有，已完成或者遗留的)。
  * `render()`:
	给选中项添加一些高亮样式。
  * `createOnEnter()`:
    当用户回车时创建一个新的Todo model。 newAttributes()来设置默认属性。
  * `clearCompleted()`:
    清空所有标记已完成的项。

```javascript

// The Application
  // ---------------

  // **AppView**，顶级主要的UI。
  app.AppView = Backbone.View.extend({

    // 把view绑定到一个已经存在的DOM上
    el: '#todoapp',

    // 底部统计信息块的模板
    statsTemplate: _.template( $('#stats-template').html() ),

    // 委托事件，新建，清空完成项
    events: {
      'keypress #new-todo': 'createOnEnter',
      'click #clear-completed': 'clearCompleted',
      'click #toggle-all': 'toggleAllComplete'
    },

    // 初始化的时候绑定相关事件到`Todos` collection,
	// 当元素添加或改变的时候。触发从*localStorage*载入已存在的todos。
    initialize: function() {
      this.input = this.$('#new-todo');
      this.allCheckbox = this.$('#toggle-all')[0];
      this.$footer = this.$('#footer');
      this.$main = this.$('#main');

      window.app.Todos.on( 'add', this.addAll, this );
      window.app.Todos.on( 'reset', this.addAll, this );
      window.app.Todos.on('change:completed', this.filterOne, this);
      window.app.Todos.on("filter", this.filterAll, this);

      window.app.Todos.on( 'all', this.render, this );

      app.Todos.fetch();
    },

    // 重新渲染，只刷新统计信息，其它部分不改变。
    render: function() {
      var completed = app.Todos.completed().length;
      var remaining = app.Todos.remaining().length;

      if ( app.Todos.length ) {
        this.$main.show();
        this.$footer.show();

        this.$footer.html(this.statsTemplate({
          completed: completed,
          remaining: remaining
        }));

        this.$('#filters li a')
          .removeClass('selected')
          .filter('[href="#/' + ( app.TodoFilter || '' ) + '"]')
          .addClass('selected');
      } else {
        this.$main.hide();
        this.$footer.hide();
      }

      this.allCheckbox.checked = !remaining;
    },

    // 通过创建一个view来新建一个单独的todo项，
    // 追加到`<ul>`中。
    addOne: function( todo ) {
      var view = new app.TodoView({ model: todo });
      $('#todo-list').append( view.render().el );
    },

    // 一次性添加**Todos** collection中的所有项。
    addAll: function() {
      this.$('#todo-list').html('');
      app.Todos.each(this.addOne, this);
    },

    filterOne : function (todo) {
      todo.trigger("visible");
    },

    filterAll : function () {
      app.Todos.each(this.filterOne, this);
    },

    // 创建todo model默认属性
    newAttributes: function() {
      return {
        title: this.input.val().trim(),
        order: app.Todos.nextOrder(),
        completed: false
      };
    },

    // 回车时新建**Todo** model，并保存到*localStorage*中。
    createOnEnter: function( e ) {
      if ( e.which !== ENTER_KEY || !this.input.val().trim() ) {
        return;
      }

      app.Todos.create( this.newAttributes() );
      this.input.val('');
    },

    // 清空所有完成项，销毁它们的方法。
    clearCompleted: function() {
      _.each( window.app.Todos.completed(), function( todo ) {
        todo.destroy();
      });

      return false;
    },

    toggleAllComplete: function() {
      var completed = this.allCheckbox.checked;

      app.Todos.each(function( todo ) {
        todo.save({
          'completed': completed
        });
      });
    }
  });

```

##Setup

先自我们有2个view：`AppView`和`TodoView`。前者需要在页面载入的时候实例化，代码才能执行。这非常简单，可以用jQuery的 `ready()`方法，在DOM载入之后执行。

```javascript

var app = app || {};
var ENTER_KEY = 13;

$(function() {

  // 创建**App**.
  new app.AppView();

});

```

##创建新的todos

从控制台创建todos当然非常好，但是不能要求用户那么做。我们给创建的section做个钩子，提供更好的接口。所有HTML都在index.html；我们要做的就是给section添加些事件。

<img src="img/todoview.png" width="590px"/>


我们看下`TodoView`。它负责单个Todo记录，确保view和todo的同步更新。

```javascript

  // Todo Item View
  // --------------

  // The DOM element for a todo item...
  app.TodoView = Backbone.View.extend({

    //... is a list tag.
    tagName:  'li',

    // Cache the template function for a single item.
    template: _.template( $('#item-template').html() ),

    // DOM事件
    events: {
      'dblclick label': 'edit',
      'keypress .edit': 'updateOnEnter',
      'blur .edit':   'close'
    },

    // TodoView监听model的变化，然后重新渲染。 Since there's
    // **Todo**和**TodoView**是一对一的关系，为方便起见这里直接引用model。
    initialize: function() {
      this.model.on( 'change', this.render, this );
    },

    // 重新渲染todo
    render: function() {
      this.$el.html( this.template( this.model.toJSON() ) );
      this.input = this.$('.edit');
      return this;
    },

    // 把view切换到`"editing"` 模式，显示input输入框。
    edit: function() {
      this.$el.addClass('editing');
      this.input.focus();
    },

    // 关闭`"editing"`模式，保存todo的修改。
    close: function() {
      var value = this.input.val().trim();

      if ( value ) {
        this.model.save({ title: value });
      }

      this.$el.removeClass('editing');
    },

    // 回车完成编辑
    updateOnEnter: function( e ) {
      if ( e.which === ENTER_KEY ) {
        this.close();
      }
    }
  });
```


在`initialize()`构造函数中，注册了一个监听model change的事件，当todo更新时，重新渲染view。

`render()`方法， 渲染了一个Underscore模板，`#item-template`，前面已调用`_.template()`编译到this.template。它返回一段用当前view元素替换的HTML片段。编译的模板结果存放在`this.el`， 就可以添加到todo列表中了。

我们这里的事件hash包括3个回调：

* `edit()`: 当用户双击todo列表中的项时切换view到编辑模式。就可以修改title属性了。
* `updateOnEnter()`: 用户回车，然后执行close()函数。
* `close()`: 对`<input/>`的输入值trim和验证，如果通过则保存todo，移除CSS class，关闭编辑模式。


##预览

现在我们来验证下它是否像我们预想的那样运行。打开index.html，如果正常，在控制台应该看不到errors。todo列表是空白，因为还没添加任何todo。现在还不能完全正常工作，不过我们可以从控制台创建一个todo。

`window.app.Todos.create({ title: ‘My first Todo item});` 

<img src="img/todoconsole.png" width="700px"/>

todos列表就多了一个todo了，刷新页面仍会保留，因为被本地存储保存了。

##模板


`TodoView`中使用的模板`#item-template`需要定义。在页面中包含模板的一种方式就是使用自定义类型的script标签。它不会被浏览器解析，只会当成普通的文本。Underscore micro-templating然后就可以访问到这段模板，渲染成HTML。

```html
  <script type="text/template" id="item-template">
    <div class="view">
      <input class="toggle" type="checkbox" <%= completed ? 'checked' : '' %>>
      <label><%- title %></label>
      <button class="destroy"></button>
    </div>
    <input class="edit" value="<%- title %>">
  </script>
```

上面模板中`<%=`之类的标签是Underscore.js的语法标签。在你自己的应用中也可以选择其它的模板库，比如Mustache或者Handlebars，而Backbone不关心。

`TodoView`中调用`_.template( $('#item-template').html() )`时模板就会被渲染。


我们还需要定义#stats-template模板，显示有多少条已完成项，同时包含清空按钮。

```html
  <script type="text/template" id="stats-template">
    <span id="todo-count"><strong><%= remaining %></strong> <%= remaining === 1 ? 'item' : 'items' %> left</span>
    <ul id="filters">
      <li>
        <a class="selected" href="#/">All</a>
      </li>
      <li>
        <a href="#/active">Active</a>
      </li>
      <li>
        <a href="#/completed">Completed</a>
      </li>
    </ul>
    <% if (completed) { %>
    <button id="clear-completed">Clear completed (<%= completed %>)</button>
    <% } %>
  </script>
```


##预览

现在刷新index.html看下我们的劳动成果。可以输入todo名称，回车来创建一个新的todo了。

![](img/todocompleted.png)


非常好，我们现在有很大进步了，那如何完成和删除todos呢？

##完成&删除todos

下面我们将下完成和删除todos。这是对每个todo项的特定操作，所以要给TodoView增加函数。

我们增加2个事件处理，一个togglecompleted事件绑定到todo的checkbox，和一个click事件绑定到`<button class="destroy" />`按钮。

checkbox的togglecompleted事件触发toggle()函数，切换todos的完成状态，然后重新保存todo——非常的直接。
button的click事件执行`clear()`，销毁todo。


That's all there is to it. Since we're binding to the change event, whenever the todo changes the view will automatically be re-rendered, checking or un-checking the checkbox as appropriate. Similarly, when the todo is destroyed, the model's `destroy()` function will be called, removing the todo from the view as we’re binding to the destroy event too.

另外我们还绑定了一个visible事件来处理是否可见的状态。它连同routers和coloection中的过滤器一起使用，如果当前需要过滤已完成的todo就可以只显示已完成的项。

这片教程已经够长了，所以不再做更新了。整个示例的[完整代码](https://github.com/addyosmani/todomvc/tree/master/architecture-examples/backbone/)在github上。

```javascript

  // Todo Item View
  // --------------

  // The DOM element for a todo item...
  app.TodoView = Backbone.View.extend({

    //... is a list tag.
    tagName:  'li',

    // Cache the template function for a single item.
    template: _.template( $('#item-template').html() ),

    // The DOM events specific to an item.
    events: {
      'click .toggle':  'togglecompleted',
      'dblclick label': 'edit',
      'click .destroy': 'clear',
      'keypress .edit': 'updateOnEnter',
      'blur .edit':   'close'
    },

    // The TodoView listens for changes to its model, re-rendering. Since there's
    // a one-to-one correspondence between a **Todo** and a **TodoView** in this
    // app, we set a direct reference on the model for convenience.
    initialize: function() {
      this.model.on( 'change', this.render, this );
      this.model.on( 'destroy', this.remove, this );
      this.model.on( 'visible', this.toggleVisible, this );
    },

    // Re-render the titles of the todo item.
    render: function() {
      this.$el.html( this.template( this.model.toJSON() ) );
      this.$el.toggleClass( 'completed', this.model.get('completed') );

      this.toggleVisible();
      this.input = this.$('.edit');
      return this;
    },

    toggleVisible : function () {
      this.$el.toggleClass( 'hidden',  this.isHidden());
    },

    isHidden : function () {
      var isCompleted = this.model.get('completed');
      return ( // hidden cases only
        (!isCompleted && app.TodoFilter === 'completed')
        || (isCompleted && app.TodoFilter === 'active')
      );
    },

    // Toggle the `"completed"` state of the model.
    togglecompleted: function() {
      this.model.toggle();
    },

    // Switch this view into `"editing"` mode, displaying the input field.
    edit: function() {
      this.$el.addClass('editing');
      this.input.focus();
    },

    // Close the `"editing"` mode, saving changes to the todo.
    close: function() {
      var value = this.input.val().trim();

      if ( value ) {
        this.model.save({ title: value });
      } else {
        this.clear();
      }

      this.$el.removeClass('editing');
    },

    // If you hit `enter`, we're through editing the item.
    updateOnEnter: function( e ) {
      if ( e.which === ENTER_KEY ) {
        this.close();
      }
    },

    // Remove the item, destroy the model from *localStorage* and delete its view.
    clear: function() {
      this.model.destroy();
    }
  });

```



##Todo路由

最后，我们来看下路由，可以允许我们把整个todo列表和已完成的列表加入收藏。我们会支持下列路由：

```javascript
#/ (all - 默认)
#/active
#/completed
```

<img src="img/todorouting.png" width="700px"/>

当route改变时todo list将会在model级别过滤出来，selected class的样式也会被切换。当一个项在有过滤状态下改变时，它也会相应的更新。比如，如果过滤状态是active，然后这个项是被选中(checked)的，将会被影藏。active过滤状态在页面重新载入时也会持续保存。

```javascript

  // Todo Router
  // ----------

  var Workspace = Backbone.Router.extend({
    routes:{
      '*filter': 'setFilter'
    },

    setFilter: function( param ) {
      // Set the current filter to be used
      window.app.TodoFilter = param.trim() || '';

      // 触发collection的filter事件，触发Todo view 项的hiding/unhiding。
      window.app.Todos.trigger('filter');
    }
  });

  app.TodoRouter = new Workspace();
  Backbone.history.start();
```

看到`window.app.Todos.trigger('filter')`这一行，只要设置了一个filter，就会触发collection的filter，切换需要显示和影藏的项。

最后，调用`Backbone.history.start()`路由到页面载入是最初的URL。

##总结

现在我们已经学完了如何创建一个完整的Backbone.js应用。这个应用可以通过[TodoMVC](http://www.todomvc.com)在线访问。

后面我们会学到如何使用Require.js来对这个应用进行进一步的模块化，把对数据的持久化切换到后端数据库，最后还有使用不同的测试框架对这个应用进行单元测试。



# <a name="backboneboilerplate">Backbone Boilerplate和Grunt-BBB</a>

[Backbone Boilerplate](https://github.com/tbranyen/backbone-boilerplate/) 是个非常好的构建Backbone.js应用的工具，由Backbone的贡献者[Tim Branyen](https://github.com/tbranyen)开发的。他在Bocoup超过一年以上大量使用Backbone构建apps，他从过去遇到的陷阱，误区和通用功能中提取和构建了boilerplate。包括app [StartupDataTrends.com](http://startupdatatrends.com).

Backbone Boilerplate (和它的姐妹项目[Grunt-BBB](https://github.com/backbone-boilerplate/grunt-bbb))内置了很多构建任务模板，代码压缩，合并，server(web服务器)，模板编译等。对各个层次的开发者来说都是个很好的选择。不过得沉重的提醒各位，使用它们会让你在开始构建项目的时候变得庞大。它们有很多内联文档，可以节省不少时间。

Backbone Boilerplate默认会给你提供：

* Backbone, [Lodash](https://github.com/bestiejs/lodash) (一个[Underscore.js](http://underscorejs.org/)的替代方案)和携带[HTML5 Boilerplate](http://html5boilerplate.com)的[jQuery](http://jquery.com)。
* Boilerplate模块代码
* Windows/Mac/Linux模板预编，合并、压缩js和css代码的build工具。
* 模板支持 (使用grunt-bbb - [B]ackbone [B]oilerplate [B]uild)，所以只需要花一点时间编写模块，集合(collections)等模板。
* 一个轻量的node.js webserver。
* 很多其它的Backbone.js片段，然任务更轻松。

## 初探

### Backbone Boilerplate

在开始使用Boilerplate创建应用前线安装它，可以直接从git库中克隆：

```shell
$ git clone git://github.com/tbranyen/backbone-boilerplate.git
```

或者获取最新的已经打好的包：

```shell
curl -C - -O https://github.com/tbranyen/backbone-boilerplate/zipball/master
```

### Grunt-BBB

正如Tim在Boilerplate文档中所说的，如果要使用build工具和他推荐的grunt-bbb帮助工具，必须安装[Grunt](http://gruntjs.org)。

Grunt是([Ben Alman](http://benalman.com))开发的一个基于Node的JavaScript构建工具。grunt-bbb helper非常实用，它提供了几个Backbone特定的工具来构建你的项目，而不用自己编写模板。

通过NPM安装grunt和grunt-bbb：

```shell
# 先运行
$ npm install -g grunt

# 然后
$ npm install -g bbb

# 创建一个新的project
bbb init
```

好的，我们继续。

使用grunt-bbb的典型流程是：

* 初始化一个新的项目(`bbb init`)
* 添加新的模块和模板(`bbb init:module`)
* 使用内置的server开发(`bbb server`)
* 运行build工具(`bbb build`)
* 部署和映射到生产环境静态资源(using `bbb release`)

## 创建一个新的项目

新建一个项目文件夹，执行`bbb init` 。如果一切都安装正常的话，就会自动生成一些项目目录和文件。我们来看下到底做了哪些事情。

### index.html

这是一个标准的基本HTML5样板文件，除了在底部引入了[Require.js](http://requirejs.org) 之外。

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,initial-scale=1">

  <title>Backbone Boilerplate</title>

  <!-- Application styles. -->
  <link rel="stylesheet" href="/assets/css/index.css">
</head>

<body>
  <!-- Main container. -->
  <div role="main" id="main"></div>

  <!-- Application source. -->
  <script data-main="/app/config" src="/assets/js/libs/require.js"></script>
</body>
</html>
```

Require.js是一个[AMD](https://github.com/amdjs/amdjs-api/wiki/AMD) (异步模块定义) 模块和脚本加载器，可以帮助我们在应用中管理模块。 这本书的后面部分我会讲到关于require.js的更多细节，不过还是先看下这里做了什么：

```
<script data-main="app/config" src="/assets/js/libs/require.js"></script>
```

`data-main`属性是告诉Require.js在加载完自身文件之后加载`app/config.js`(一个配置对象)。 你可能注意到了，它会自动加上省略的`.js`扩展名，不管你加还是不加它都会保持正确的路径。下面来看下这个引入的配置对象。

### config.js

Require.js配置对象可以配置依赖，经常引用(比如jquery)的模块路径别名，启动属性比如基本应用URL，以及`shim`这种不支持AMD的库。

下面是Backbone Boilerplate的一个配置对象：

```javascript
// Set the require.js configuration for your application.
require.config({

  // 使用main文件初始化整个应用。
  deps: ["main"],

  paths: {
    // JavaScript目录
    libs: "../assets/js/libs",
    plugins: "../assets/js/plugins",

    // 库路径
    jquery: "../assets/js/libs/jquery",
    lodash: "../assets/js/libs/lodash",
    backbone: "../assets/js/libs/backbone"
  },

  shim: {
    // Backbone库依赖lodash和jQuery。
    backbone: {
      deps: ["lodash", "jquery"],
      exports: "Backbone"
    },

    // Backbone.LayoutManager依赖Backbone。
    "plugins/backbone.layoutmanager": ["backbone"]
  }

});
```

上面定义的第一个配置项`deps: ["main"]`，是高速Require.js加载main.js文件，作为应用的入口。你可能注意到了，我么并没有定义`main`文件的路径。

这是因为我们没有重写`baseUrl`这个配置项，引入的文件都会基于index.html页面中脚本的`data-main`属性路径自动判断。换而言之，这里的`baseUrl`就是`app/`，我们引入的任何脚本都会相对于这个路径。

后面的一块是`paths`，可以对经常引用的基于`baseUrl`和paths/aliases的路径设定特定的别名。

```javascript
  paths: {
    // JavaScript folders.
    libs: "../assets/js/libs",
    plugins: "../assets/js/plugins",

    // Libraries.
    jquery: "../assets/js/libs/jquery",
    lodash: "../assets/js/libs/lodash",
    backbone: "../assets/js/libs/backbone"
  },
```

后面是`shim`配置：

```javascript
  shim: {
    // Backbone library depends on lodash and jQuery.
    backbone: {
      deps: ["lodash", "jquery"],
      exports: "Backbone"
    },

    // Backbone.LayoutManager depends on Backbone.
    "plugins/backbone.layoutmanager": ["backbone"]
  }
```

`shim`是Require.js配置里非常重要的一部分，可以允许我们家在不遵循AMD的库。这样我们引入库时就不用关系它是否支持AMD。

比如，下面这段代码中，我们规定Backbone.js依赖于Lodash(一个Underscore.js的分支)和jQuery，在Backbone载入前这2个库必须先载入。当它们完成载入之后导出一个全局的`Backbone`模块。

```javascript
    backbone: {
      deps: ["lodash", "jquery"],
      exports: "Backbone"
    }
```

最后，告诉Require.js Backbone [LayoutManager](https://github.com/tbranyen/backbone.layoutmanager)插件(模板和布局管理)在载入前必须先加载Backbone。

```javascript
    // Backbone.LayoutManager depends on Backbone.
    "plugins/backbone.layoutmanager": ["backbone"]
```

整个部分可以确保脚本按预期的顺序正确加载。

### main.js

接下来是`main.js`，定义了应用的入口。我们用一个全局的`require()`方法加载一个组需要引入的脚本，比如`app.js` 和路由`router.js`。在大多数时候，我们都会使用`require()`来引导一个应用，类似的用`define()`来做其它事情。(备: for bootstrapping an application and a similar method called  for all other purposes.)

依赖列表数组后面是一个回调函数，所有依赖的脚本加载完成之后才执行。注意，`app`分别`Router`引用的是数组中"app"和"router"别名对应的模块。

```javascript
require([
  // Application.
  "app",

  // Main Router.
  "router"
],

function(app, Router) {

  // 定义主要路由，通过这个实例来触发所有导航(navigation)
  app.router = new Router();

  // 触发初始路由，设置HTML5 History API 支持，默认根路径'/' ，在app.js中会改变。
  Backbone.history.start({ pushState: true, root: app.root });

  // 所有相对的导航跳转都传给navigate方法，通过路由来处理。
  //如果a标签有`data-bypass`属性，就忽略。  
  $(document).on("click", "a:not([data-bypass])", function(evt) {
    // Get the absolute anchor href.
    var href = $(this).attr("href");

    // 如果有href，而且是hash路径，通过Backbone来执行。
    if (href && href.indexOf("#") === 0) {
      // 组织默认行为，避免刷新
      evt.preventDefault();

      // `Backbone.history.navigate`触发路由和绑定的事件。
      Backbone.history.navigate(href, true);
    }
  });

});
```

Backbone Boilerplate包含了样板代码包含了使用HTML5 History API支持初始化router，处理其他navigation，所以这里就不必需要了。

### app.js

现在来看下`app.js`模块。通常，在没有Backbone Boilerplate的应用中，`app.js`包含核心逻辑和启动app需要的模块引入。

不过，在这个实例中，这个文件用来定义模板和布局配置，(备：as well as utilities for consuming layouts)。作为初学者，这部分代码可能比较难理解，但是作为基本的应用，你基本上不需要大量修改它。你只需要关心后面会讲到的app的模块就可以了。

```javascript
define([

  // Libraries.
  "jquery",
  "lodash",
  "backbone",

  // Plugins.
  "plugins/backbone.layoutmanager"

],

function($, _, Backbone) {

  // 用一个全局变量来保存配置和模块
  var app = {
    // 运行应用的根路径
    root: "/"
  };

  // 定义一个本地JavaScript模板对象。
  var JST = window.JST = window.JST || {};

  // 设定LayoutManager默认配置。
  Backbone.LayoutManager.configure({
    paths: {
      layout: "app/templates/layouts/",
      template: "app/templates/"
    },

    fetch: function(path) {
      path = path + ".html";

      if (!JST[path]) {
        $.ajax({ url: app.root + path, async: false }).then(function(contents) {
          JST[path] = _.template(contents);
        });
      }

      return JST[path];
    }
  });

  // Mix Backbone.Events, modules, and layout management into the app object.
  return _.extend(app, {
    // 创建一个嵌套Views的自定义对象.
    module: function(additionalProps) {
      return _.extend({ Views: {} }, additionalProps);
    },

    // Helper for using layouts.
    useLayout: function(name) {
      // 如果已经存在这个Layout, 就不再注入到DOM。
      if (this.layout && this.layout.options.template === name) {
        return this.layout;
      }

      // 如果已经存在一个layout，从DOM中移除。
      if (this.layout) {
        this.layout.remove();
      }

      // 创建一个新的layout
      var layout = new Backbone.Layout({
        template: name,
        className: "layout " + name,
        id: "layout"
      });

      // 插入到DOM
      $("#main").empty().append(layout.el);

      // 渲染布局(layout)
      layout.render();

      // 缓存引用
      this.layout = layout;

      // 返回引用，可以链式调用。
      return layout;
    }
  }, Backbone.Events);

});
```

### 创建Backbone Boilerplate模块

不要与简单的AMD混淆，一个Backbone Boilerplate`模块(module)`由下列部分组成的脚本：

* Model
* Collection
* Views (可选)

我们可以再次使用`grunt-bbb`的`init`来创建一个Boilerplate模块：

```shell
# 新建模块
bbb init:module

# Grunt提示
Please answer the following:
[?] Module Name foo
[?] Do you need to make any changes to the above before continuing? (y/N) n

Writing app/modules/foo.js...OK

Initialized from template "module".
```

它会创建一个下面这样的模块`foo.js`：

```javascript
define([
  // Application.
  "app"
],

// Map dependencies from above array.
function(app) {

  // Create a new module.
  var Foo = app.module();

  // Default model.
  Foo.Model = Backbone.Model.extend({

  });

  // Default collection.
  Foo.Collection = Backbone.Collection.extend({
    model: Foo.Model
  });

  // Return the module for AMD compliance.
  return Foo;

});

```

现在，你可能想知道Views是如何引入进来。尽管Backbone Boilerplate创建模块时默认没有包含Views，我们可以手动添加。

e.g:

```javascript
define([
  // Application.
  "app",

  // Views
  "modules/foo/views"
],

// Map dependencies from above array.
function(app, Views) {

  // Create a new module.
  var Foo = app.module();

  // Default model.
  Foo.Model = Backbone.Model.extend({

  });

  // Default collection.
  Foo.Collection = Backbone.Collection.extend({
    model: Foo.Model
  });

  // Default views
  Foo.Views = Views;

  // Return the module for AMD compliance.
  return Foo;

});
```

另外，我们也可以选择性的引入插件，比如Backbone本地存储或者离线适配器。

```javascript
define([
  "app",

  // Libs
  "backbone",

  // Plugins
  "plugins/backbone-localstorage"
],

function(app, Backbone, Views) {
  // Create a new module.
  var Foo = app.module();

  // Default model.
  Foo.Model = Backbone.Model.extend({

  });

  // Default collection.
  Foo.Collection = Backbone.Collection.extend({
    model: Foo.Model,

    // Save all of the items under the `"foo"` namespace.
    localStorage: new Store("foo-backbone"),
  });

  // Default views
  Foo.Views = Views;

  // Return the module for AMD compliance.
  return Foo;
});
```

在这个示例中我们使用了view的复数，因为一个View模块可以包含多个views。上例中`/modules/foo/views.js`文件代码像下面这样：

```javascript
define([
  "app",

  // Libs
  "backbone"
],

function(app, Backbone) {

  var Views = {};

  Views.Foo = Backbone.View.extend({
    template: "foo/bar",
    tagName: "li",
    ...
   });

  Views.Baz = Backbone.View.extend({
    template: "foo/baz",
    tagName: "li",
    ...
   });

   return Views;

});
```

Views中引用的模板(`template`)，相当于`app/templates`目录下对应的文件。比如`foo/bar`定位到`app/templates/foo/bar.html`，HTML模板可以包含Lodash/Underscore.js Micro-templating逻辑。


### router.js

最后，看下路由。Backbone Boilerplate默认创建的路由包含一个默认路由路径。

```javascript
define([
  // Application.
  "app"
],

function(app) {

  // 定义应用的router，可以在这里附加子路由。
  var Router = Backbone.Router.extend({
    routes: {
      "": "index"
    },

    index: function() {

    }
  });

  return Router;

});
```

如果我们想执行一些特定模块逻辑，当页面载入时(比如用户输出入了默认路由路径)，我们可以把一个模块拉入依赖项，选择性的使用Backbone LayoutManager附加Views到layout，就想下面这样：

```javascript
define([
  // Application.
  "app",

  // Modules
  "modules/foo"
],

function(app, Foo) {

  // Defining the application router, you can attach sub routers here.
  var Router = Backbone.Router.extend({
    routes: {
      "": "index"
    },

    index: function() {
            // Create a new Collection
            var collection = new Foo.Collection();

            // Use and configure a "main" layout
            app.useLayout("main").setViews({
                    // Attach the bar View into the content View
                    ".bar": new Foo.Views.Bar({
                            collection: collection
                    })
             }).render();
    }
  });

  // Fetch data (e.g from localStorage)
  collection.fetch();

  return Router;

});
```

## 总结

这章我们回顾了下ackbone Boilerplate，学习了如何使用BBB工具来构建应用。

如果你想学习更多关于如何构建app，BBB包含一些内置的模板样例app，可以非常简单的创建，reivew。

里面包含一个教程project (`bbb init:tutorial`) 和一个[TodoMVC](http://todomvc)项目的实现 (`bbb init:todomvc`)。推荐大家从代码库中check out下来，有个更清晰完整的理解。

更多关于Grunt-BBB，记得参考官方项目[repositoryy](https://github.com/backbone-boilerplate/grunt-bbb)。还有一个相关的项目[slide-deck](https://dl.dropbox.com/u/79007/talks/Modern_Web_Applications/slides/index.html)。

## 相关工具Tools和Projects

构建工具(scaffolding tools)可以快速的自动帮我们创建应用的基本文件。如果你因有这些工具而兴奋，推荐你check out [Yeoman](http://yeoman.io)(一个我即将面世的项目)和[Brunch](https://github.com/brunch/brunch)。

Brunch可以非常的同Backbone, Underscore, jQuery和CoffeeScript一起工作，而且被一些公司使用，比如Red Bull和Jim Beam。使用前可能需要更新一些第三方依赖模块(比如，最新的jQuery和Zepto)，初次之外，它可以非常稳定的使用。

Brunch可以通过nodejs包管理器来安装，非常容易上手。如果你使用Vim或者Textmate编辑器的话，你会发现这两者都有Brunch的绑定。


# <a name="commonproblems" id="commonproblems">常见问题和解决方案</a>

在这一章中，我们会回顾下一些开发者在使用Backbone.js开发的项目中经常会遇到的一些问题，并提出些可能的解决方案。

可能大部分问题都是跟Views相关。如果你对如何使用嵌套Views感兴趣的话，可以学习下view的处理和继承，这一章将会讲到这些。


#### 嵌套(Nesting)：在Backbone.js中渲染和添加子的最好方式是什么？

嵌套通常是保持views层次和编写可维护代码的较好方式。对于新手，可能会像下面这样使用子view：

```javascript

// 前面已经定义好了View, SubView
// 在父View中可能会这样：

...
initialize : function () {

    this.innerView1 = new Subview({options});
    this.innerView2 = new Subview({options});
},

render : function () {

    this.$el.html(this.template());

    this.innerView1.setElement('.some-element').render();
    this.innerView2.setElement('.some-element').render();
}
```

这种方式不用担心维护DOM元素插入的顺序。Views的初始化提前了，render()方法也不用一次处理那么多事情。不幸的是，不能设置元素的`tagName`和重新委派事件。

有一种方式可以解决这个问题：

```javascript

initialize : function () {

},

render : function () {

    this.$el.empty();

    this.innerView1 = new Subview({options});
    this.innerView2 = new Subview({options});


    this.$el.append(this.innerView1.render().el, this.innerView2.render().el);
}

```

这个版本中，同样也没有引入包含空占位符的模板，`tagName`的问题也通过view来定义得以解决。

另一个变化就是把逻辑转移到`onRender`事件，可以通过一点微妙的变化来改变：


```javascript

initialize : function () {
    this.on('render', this.onRender);
},

render : function () {

    this.$el.html(this.template);

    // more logic

    return this.trigger('render');
},

onRender : function () {
    this.innerView1 = new Subview();
    this.innerView2 = new Subview();
    this.innerView1.setElement('.some-element').render();
    this.innerView2.setElement('.some-element').render();
}
```

如果你在你的应用中发现嵌套views，有多重方法初始化，渲染和append子view。下面也是一种方案：

```javascript

var OuterView = Backbone.View.extend({
    initialize: function() {
        this.inner = new InnerView();
    },

    render: function() {
        this.$el.html(template); // or this.$el.empty() if you have no template
        this.$el.append(this.inner.$el);
        this.inner.render();
    }
});

var InnerView = Backbone.View.extend({
    render: function() {
        this.$el.html(template);
        this.delegateEvents();
    }
});

```

这种方案基于下面这几个设计思路：

* append子元素的顺序是相关的(The order in which you append the sub-elements matters)
* OuterView不包含InnerView中要设置的DOMHTML元素，意味着可以在InnerView中指定tagName。
* render() 在InnerView中元素被插入DOM之后调用。当InnerViews render()方法基于其它元素来渲染到页面时这非常有用。这是一个常见的案例。

第二种可能的方案，看起来更精简但会影响性能：

```javascript

var OuterView = Backbone.View.extend({
    initialize: function() {
        this.render();
    },

    render: function() {
        this.$el.html(template); // or this.$el.empty() if you have no template
        this.inner = new InnerView();
        this.$el.append(this.inner.$el);
    }
});

var InnerView = Backbone.View.extend({
    initialize: function() {
        this.render();
    },

    render: function() {
        this.$el.html(template);
    }
});
```

通常，更多的开发者选择第一种方案，因为：

* 大多数的veiws可能已经依赖于render()方法中的DOM
* 当OuterView重新渲染时，views不需要重新初始化，因为重新初始化可能会导致内存泄露和导致现有绑定出问题。(感谢[Lukas](http://stackoverflow.com/users/299189/lukas)和[Ian Taylor](http://stackoverflow.com/users/154765/ian-storm-taylor)给的这些提示)。



#### 在嵌套views中管理models最佳方式是什么？

为了能在嵌套的views中能访问到对应的models的属性，models需要知道自己引用的是哪个。Backbone.js本身不处理这些关系或者嵌套，意味着我们要自己来确保各各个models的关系。

有一种方式就是，让每个子model都有一个'parent'属性。这样就可以遍历父子关系的model了。假设有modelA, modelB和modelC：

```javascript

// 当初始化modelA时，建立parent model连接：

ModelA = Backbone.Model.extend({

    initialize: function(){
        this.modelB = new modelB();
        this.modelB.parent = this;
        this.modelC = new modelC();
        this.modelC.parent = this;
    }
}
```

在子model中就可以通过this.parent访问到父model。

当要使用嵌套views时，你会发现用tagName属性，让每个View都对应到一个单独的HTML标签会更容易：

```javascript
ViewA = Backbone.View.extend({

    tagName: "div",
    id: "new",

    initialize: function(){
       this.viewB = new ViewB();
       this.viewB.parentView = this;
       $(this.el).append(this.viewB.el);
    }
});

ViewB = Backbone.View.extend({

    tagName: "h1",

    render: function(){
        $(this.el).html("Header text"); // or use this.options.headerText or equivalent
    },

    funcB1: function(){
        this.model.parent.doSomethingOnParent();
        this.model.parent.modelC.doSomethingOnSibling();
        $(this.parentView.el).shakeViolently();
    }

});
```

当应用初始化的时候，就会初始化ViewA然后把它插入到body中。

另一种变种方法就是使用[Backbone-Forms](https://github.com/powmedia/backbone-forms)。跟我们前面写的方式很类似，可以像下面这样处理嵌套：

```javascript
var ModelB = Backbone.Model.extend({
    schema: {
        attributeB1: 'Text',
        attributeB2: 'Text'
    }
});

var ModelC = Backbone.Model.extend({
    schema: {
        attributeC: 'Text',
    }
});

var ModelA = Backbone.Model.extend({
    schema: {
        attributeA1: 'Text',
        attributeA2: 'Text',
        refToModelB: { type: 'NestedModel', model: ModelB, template: 'templateB' },
        refToModelC: { type: 'NestedModel', model: ModelC, template: 'templateC' }
    }
});
```

关于这种技术的更多信息可以看这里[GitHub](https://github.com/powmedia/backbone-forms#customising-templates).

(感谢[Jens Alm](http://stackoverflow.com/users/100952/jens-alm)和[Artem Oboturov](http://stackoverflow.com/users/801466/artem-oboturov)提供这些信息)

#### 可以在其他Views中触发另一个view的更新吗？


中介者(Mediator)模式是解决这种问题非常好的选择。

不必过多的去了解这种模式的细节，实际上就是使用一个事件管理器可以订阅和发布事件。ApplicationViewA可以订阅一个事件，比如'selected'，ApplicationViewB可以发布'selected'事件。

我喜欢这种方式的原因就是可以在views之间发送事件，而不用直接把他们绑定在一起。

例如:

```javascript

// See http://addyosmani.com/largescalejavascript/#mediatorpattern
// for an implementation or alternatively for a more thorough one
// http://thejacklawson.com/Mediator.js/

var mediator = new Mediator();

var ApplicationViewB = Backbone.View.extend({
    toggle_select: function() {
        ...
        mediator.publish('selected', any, data, you, want);
        return this;
    }
});

var ApplicationViewA = Backbone.View.extend({
    initialize: function() {
        mediator.subscribe('selected', this.delete_selected)
    },

    delete_selected: function(any, data, you, want) {
        ... do something ...
    },
});
```

ApplicationViewA不用关心是ApplicationViewB还是FooView发布了'selected' 事件，只需要知道它发生了就行了。所以，你就会发现应用中的各个部分的事件可维护性更强，而不仅仅是views。

(感谢[John McKim](http://stackoverflow.com/users/937577/john-mckim) 的提示和大量引用我的关于JavaScript设计模式的文章)。

#### 如何从子view中渲染(render)父view?

在这种情况下，需要在当某个事件触发时执行渲染。比如下面这个例子，假设是'somethingHappened'事件。父view可以绑定子view的通知，知道何时事件触发了，然后调用自己的render。

On the parent view:

```javascript
// Parent initialize
this.childView.on('somethingHappened', this.render, this);

// Parent removal
this.childView.off('somethingHappened', this.render, this);
```

On the child view:

```javascript

// After the event has occurred
this.trigger('somethingHappened');

```

子view触发一个"somethingHappened"事件，父view就会调用render函数。

(感谢[Bereznitskey](http://stackoverflow.com/users/269666/tal-bereznitskey)给的这点提示)。



#### 如何清除Vies以避免内存泄露？

随着应用的变大，如果让不再使用的views还存活的话将变得难以维护。所以，最好销毁不再使用的views，在需要的时候创建新的views。

一种方案就是创建一个BaseView，其它的views都继承自这个BaseView。主要思路就是需要在view中维护一个对所有订阅的事件的引用，当要销毁view是，所有绑定的事件都将解除绑定。

```javascript
var BaseView = function (options) {

    this.bindings = [];
    Backbone.View.apply(this, [options]);
};

_.extend(BaseView.prototype, Backbone.View.prototype, {

    bindTo: function (model, ev, callback) {

        model.bind(ev, callback, this);
        this.bindings.push({ model: model, ev: ev, callback: callback });
    },

    unbindFromAll: function () {
        _.each(this.bindings, function (binding) {
            binding.model.unbind(binding.ev, binding.callback);
        });
        this.bindings = [];
    },

    dispose: function () {
        this.unbindFromAll(); // 移除view绑定的所有事件。
        this.unbind(); // 移除当前view的所有事件监听。不是必须做，因为会被垃圾回收。
        this.remove(); // 调用Backbone.View.remove()方法，把this.el从DOM中移除，同时移除DOM事件。
    }

});
```

```javascript
BaseView.extend = Backbone.View.extend;
```

然后，如果view要给model或者collection绑定事件，就需要调用bindTo方法：

```
var SampleView = BaseView.extend({

    initialize: function(){
        this.bindTo(this.model, 'change', this.render);
        this.bindTo(this.collection, 'reset', this.doSomething);
    }
});
```

当移除view是，调用dispose()方法就会自动调清除所有东西：

```javascript
var sampleView = new SampleView({model: some_model, collection: some_collection});
sampleView.dispose();
```

(感谢[JohnnyO](http://stackoverflow.com/users/188740/johnnyo) 给的这些提示)。

#### 如何在父View或者子View中处理View的清理(disposal)?

最后一个问题，如何有效的销毁views，减少内存使用(有点像一种垃圾回收)。

无论是多个Parent还是Child Views，当不再使用的时候，都需要移除与view关联的DOM元素和绑定在这些所有子元素上的事件。

其实上一个问题的解决方案也可以处理这个问题，不过下面有一个要更明确的处理子view的例子：

```javascript
Backbone.View.prototype.close = function() {
    if (this.onClose) {
        this.onClose();
    }
    this.remove();
    this.unbind();
};

NewView = Backbone.View.extend({
    initialize: function() {
       this.childViews = [];
    },
    renderChildren: function(item) {
        var itemView = new NewChildView({ model: item });
        $(this.el).prepend(itemView.render());
        this.childViews.push(itemView);
    },
    onClose: function() {
      _(this.childViews).each(function(view) {
        view.close();
      });
    }
});

NewChildView = Backbone.View.extend({
    tagName: 'li',
    render: function() {
    }
});
```

这里的close()方法就是实现当view不再需要或者重置的时候进行销毁。大多数案例中view的移除都是在view层，所以不会影响到models。

比如，使用一个博客应用时移除一个评论的view，可能app中另一个view展示了评论选择，重置collection就会影响这些views。

(感谢[dira](http://stackoverflow.com/users/906136/dira)给出这些提示)

#### What's the best way to combine or append Views to each other?

假设有一个Collection，里面的每个元素也是一个Collection。你可以渲染里面嵌套的元素。但是如何渲染这种嵌套的数据结构，映射到HTML结构。

最直接的方法就是使用由Derick Baileys开发的[Backbone.Marionette](http://marionettejs.com)这样的框架。在这个框架里有一种CompositeView(复合view)。

CompositeView可以在同一个view中渲染model和collection。

它可以用一个模板渲染一个单独的model。也可以渲染一个collection中的每个model。它默认使用定义的同一个复合类型的view来渲染collection中的每个model。你只需要在view的实例initialize方法中指定collection即可，就可以递归的渲染。

这里有一个在线的[例子](http://jsfiddle.net/derickbailey/AdWjU/).

另外可以从这里获取[Marionette](http://marionettejs.com)的代码和文档。




# 更好的Model属性验证

在这本书的前面已经提到，`validate`方法是Model在`set`和`save`之前调用的，然后把在这个方法中处理得到的值传给model的属性。

默认情况下，我们定义了一个自己的`validate`方法的话，Backbone就会每次把所有Model的属性通过这个方法来校验，无用使用哪种方式来设置属性。

这就意味着它不能区分哪些属性是需要校验，哪些是不需要校验可以直接设置的。

为解决这个问题，我们来看一个典型的注册表单的例子：

* 通过blur事件触发表单项的验证
* 验证每个表单域，不管其他的model属性是否已验证过。

first name, last name, 和email输出框为空时，后面会出现必填项提示。 

HTML:

```
<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>Form Validation - Model#validate</title>
  <script src='http://code.jquery.com/jquery.js'></script>
  <script src='http://underscorejs.org/underscore.js'></script>
  <script src='http://backbonejs.org/backbone.js'></script>
</head>
<body>
  <form>
    <label>First Name</label>
    <input name='firstname'>
    <span data-msg='firstname'></span>
    <br>
    <label>Last Name</label>
    <input name='lastname'>
    <span data-msg='lastname'></span>
    <br>
    <label>Email</label>
    <input name='email'>
    <span data-msg='email'></span>
  </form>
</body>
</html>
```

如果简单的使用Backbone `validate`方法的话可以像下面这样：


```javascript
validate: function(attrs) {

    if(!attrs.firstname) return 'first name is empty';
    if(!attrs.lastname) return 'last name is empty';
    if(!attrs.email) return 'email is empty';

}
```

不幸的是，如果第一项为空，当在其它域触发验证时也会只出现first name域的错误提示。

另一种方案就是验证所有域，并且返回所有错误：

```javascript
validate: function(attrs) {

  var errors = {};

  if (!attrs.firstname) errors.firstname = 'first name is empty';
  if (!attrs.lastname) errors.lastname = 'last name is empty';
  if (!attrs.email) errors.email = 'email is empty';

  if (!_.isEmpty(errors)) return errors;

}
```

我们可以把它转换成一个完整的方案，为每个表单域定义一个Field model：

```javascript

$(function($) {

  var User = Backbone.Model.extend({

    validate: function(attrs) {

      var errors = this.errors = {};

      if (!attrs.firstname) errors.firstname = 'firstname is required';
      if (!attrs.lastname) errors.lastname = 'lastname is required';
      if (!attrs.email) errors.email = 'email is required';

      if (!_.isEmpty(errors)) return errors;

    }

  });

  var Field = Backbone.View.extend({

    events: {blur: 'validate'},

    initialize: function() {

      this.name = this.$el.attr('name');
      this.$msg = $('[data-msg=' + this.name + ']');

    },

    validate: function() {

      this.model.set(this.name, this.$el.val());
      this.$msg.text(this.model.errors[this.name] || '');

    }

  });

  var user = new User;

  $('input').each(function() {

    new Field({el: this, model: user});

  });

});

```

这样就可以单独的验证每个属性和设置message。

**提示**: [@braddunbar](http://github.com/braddunbar)也使用上面这种方案做写了一个[demo](http://jsbin.com/afetez/2/edit)

上面这种方案强制需要对表单的每个域都进行验证。如果我么在特定的案例中使用多个客户端验证方法，不想对每个属性都进行验证，所以这种方案并不是所有人想要的。

另一种选择就是[@gfranko](http://github.com/gfranko)的[Backbone.validateAll](https://github.com/gfranko/Backbone.validateAll) 插件，提供一种可选的对当前set/saved的model属性进行验证。

下面是一个示例：


```javascript

// Create a new User Model
var User = Backbone.Model.extend({

  // RegEx Patterns
  patterns: {

    specialCharacters: "[^a-zA-Z 0-9]+",

    digits: "[0-9]",

    email: "^[a-zA-Z0-9._-]+@[a-zA-Z0-9][a-zA-Z0-9.-]*[.]{1}[a-zA-Z]{2,6}$"
  },

  // Validators
  validators: {

    minLength: function(value, minLength) {

      return value.length >= minLength;

    },

    maxLength: function(value, maxLength) {

      return value.length <= maxLength;

    },

    isEmail: function(value) {

      return User.prototype.validators.pattern(value, User.prototype.patterns.email);

    },

    hasSpecialCharacter: function(value) {

      return User.prototype.validators.pattern(value, User.prototype.patterns.specialCharacters);

    },
    ...

    // We can determine which properties are getting validated by
    // checking to see if properties are equal to null

    validate: function(attrs) {

      var errors = this.errors = {};

      if(attrs.firstname != null) {

        if (!attrs.firstname) errors.firstname = 'firstname is required';
        else if(!this.validators.minLength(attrs.firstname, 2)) errors.firstname = 'firstname is too short';
        else if(!this.validators.maxLength(attrs.firstname, 15)) errors.firstname = 'firstname is too large';
        else if(this.validators.hasSpecialCharacter(attrs.firstname)) errors.firstname = 'firstname cannot contain special characters';

      }

      if(attrs.lastname != null) {

        if (!attrs.lastname) errors.lastname = 'lastname is required';
        else if(!this.validators.minLength(attrs.lastname, 2)) errors.lastname = 'lastname is too short';
        else if(!this.validators.maxLength(attrs.lastname, 15)) errors.lastname = 'lastname is too large';
        else if(this.validators.hasSpecialCharacter(attrs.lastname)) errors.lastname = 'lastname cannot contain special characters';

      }
```


可以在validate内部方法逻辑里决定哪些表单域是当前set/validated，而不关系其它没有设置的属性。

**提示**:  [@gfranko](http://github.com/gfranko)有一个相关的[demo](http://jsbin.com/afetez/11/edit)。


创建user实例时就可以通过定义`validateAll`来使用该插件的行为：



```javascript
var user = new User();
user.set({ "firstname": "Greg" }, {validateAll: false});

```

Backbone.validateAll不会覆盖默认的Backbone逻辑，所以它可以用于任何域验证的[场景](http://jsperf.com/backbone-validateall)。这一章中提到的2种方案都不错。



# <a name="restfulapps">RESTful应用</a>


##<a name="restful">用Backbone构建RESTful应用</a>

这一章我们来看下如何使用Backbone.js开发RESTful应用，和一些当下比较先进的技术。当后端提供纯粹的RESTful 数据API时，对models的获取(GET)，新建(POST)，更新(PUT)和删除(DELETE)操作可以非常简单的使用Backbone的Model API。这些API从本地存储切换到数据库/noSQL存储会比你预想的都简单。


##<a name="stack1">Stack 1: 使用Node.js, Express, Mongoose和MongoDB构建Backbone App</a>

The first stack we'll be looking at is:

* [Node.js](nodejs.org)
* [Express](http://expressjs.com/)
* [Mongoose](http://mongoosejs.com/)
* and [MongoDB](http://www.mongodb.org/)

使用[Jade](http://jade-lang.com/)作为view的模板引擎。

###Reviewing the stack

node.js是基于事件驱动的一个平台(内置[V8](http://code.google.com/apis/v8/design.html)引擎)，为快速和可扩展的web应用而设计。轻量，高效，并且非常适合数据密集型的实时应用。

Express是使用node.js编写的一个小型web开发框架，基于[Sinatra](http://www.sinatrarb.com/)。它支持很多有用的特性，比如直观(intuitive)的views，强健的路由(routing)和关注高性能。

MongoDB是一个开源面向文档的数据库，设计非常有扩展性和灵活性。作为一种[noSQL](http://en.wikipedia.org/wiki/NoSQL)数据库，不同于关系型数据库，MongoDB使用动态的schema保存类似JSON的文档。Mongo的一个目的就是消除key-value数据库(快速，可扩展性)和[关系型](http://en.wikipedia.org/wiki/Relational_database)数据库(功能丰富)之间的空缺。

Mongoose是一个简化与Mongo交互的一个JavaScript库。就像Express，它基于node.js环境设计，并且通过提供更友好的API尝试解决一些复杂的一步数据存储。同时加入了链式调用的特性，处理数据更加富有表现力。

Jade是一个受Haml(后面会提到)影响的模板引擎。 使用JavaScript实现(同样可以运行于node)。 为了支持Express，它自称支持很多特性，包括mixins, includes, caching, template inheritance(模板继承)等等。Jade虽然抽象，但不一定适合所有人，我们会分别讲述使用和不适用Jade的情况。


###实践

这一节，我们继续扩展Backbone Todo应用。我们要把Todos保存在MongoDB中，而不是使用本地存储。这部分代码可以参`practicals\stacks\option2`


**app.js**

(源代码参考[这里](https://github.com/addyosmani/backbone-boilerplates/blob/master/option2/app.js))

首先我们要引入依赖模块。Express, Mongoose和Path (一个处理文件路径的模块)。

```javascript
var application_root = __dirname,
  express = require("express"),
  path = require("path"),
  mongoose = require('mongoose');
```

然后创建一个Express server。`express.createServer()`可以简单的创建一个express.HTTPServer实例，后面会传入到routes。

```javascript
var app = express.createServer();
```

之后，要连接Mongoose数据库(这里我们使用localhost)。需要传入验证信息，URL中支持的参数为：`mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]`

```javascript
mongoose.connect('mongodb://localhost/my_database');
```

传入一个schema实例就可以非常容易的定义一个Mongoose model了。比如创建一个Todo model。

```javascript
var Todo = mongoose.model('Todo', new mongoose.Schema({
  text: String,
  done: Boolean,
  order: Number
}));
```


在`configure()`方法中可以用 Express server来建立当前环境。下面最后二行是配置view相关的，最后一行是指定模板view的模板引擎`app.set('view engine', 'jade')`。如果使用纯粹的HTML/JS的话可以忽略。

```javascript
app.configure(function(){
  // the bodyParser middleware parses JSON request bodies
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(application_root, "public")));
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
  app.set('views', path.join(application_root, "views"));
  app.set('view engine', 'jade')
});

```

如果想使用其它模板引擎的话可以参考这里['Templating'](https://github.com/joyent/node/wiki/modules#wiki-templating)
https://github.com/joyent/node/wiki/modules。比如要使用EJS，`app.set('view engine', 'ejs')`


Express可以基于通用的HTTP请求动作(get,put,post)映射到基于CRUD(Create, Read, Update 和 Delete)的API。下面的例子中，我们可以定义当浏览器请求根路径'/'时的响应。

```javascript
app.get('/', function(req, res){
  res.send('Hello World');
});
```

来看下更有用的的route，浏览到'/todo'，在回调函数中会使用Jade view 'todo.jade'渲染。配置参数可以通过第二个参数传进去。

```javascript
app.get('/todo', function(req, res){
  res.render('todo', {title: "Our sample application"});
});
```

下面看下'/api/' routes。

```javascript
app.get('/api/todos', function(req, res){
  return Todo.find(function(err, todos) {
    return res.send(todos);
  });
});
```

下面这个route的回调函数中支持基于ID来查询todos。route字符串(一旦编译)会从'/api/todos/:id'转换成一个正则表达式。所以，如果要做些更复杂的事情，可以在routes中包含正则表达式字符。

```javascript
app.get('/api/todos/:id', function(req, res){
  return Todo.findById(req.params.id, function(err, todo) {
    if (!err) {
      return res.send(todo);
    }
  });
});
```

同样的，我们要支持根据指定ID更新todos。下面这个例子通过ID查询todo，然后更新它的三个属性(text, done, order)。

```javascript
app.put('/api/todos/:id', function(req, res){
  return Todo.findById(req.params.id, function(err, todo) {
    todo.text = req.body.text;
    todo.done = req.body.done;
    todo.order = req.body.order;
    return todo.save(function(err) {
      if (!err) {
        console.log("updated");
      }
      return res.send(todo);
    });
  });
});
```

另一个核心的请求就是添加todos。下面代码新建<code>Todo</code> models并且保存。

```javascript
app.post('/api/todos', function(req, res){
  var todo;
  todo = new Todo({
    text: req.body.text,
    done: req.body.done,
    order: req.body.order
  });
  todo.save(function(err) {
    if (!err) {
      return console.log("created");
    }
  });
  return res.send(todo);
});
```

我们还需要支持删除。

```javascript
app.delete('/api/todos/:id', function(req, res){
  return Todo.findById(req.params.id, function(err, todo) {
    return todo.remove(function(err) {
      if (!err) {
        console.log("removed");
        return res.send('')
      }
    });
  });
});
```

最后，app运行时监听3000端口。

```javascript
app.listen(3000);
```

**script.js - 更新Backbone.js app**

在options 1(HTML模板) 和 2 (Jade)的`/public/js`目录下，你会看到Jerome Gravel-Niquet实现的Backbone Todo app。我们来看下[script.js](https://github.com/addyosmani/backbone-boilerplates/blob/master/option2/public/js/script.js)。为了能适应现在新的后端存储方式，我们要对它做一些小的修改。

`window.TodoList` (Backbone Collection) 有一个`localStorage`属性，使用了Backbone [localStorage](https://github.com/jeromegn/Backbone.localStorage) 适配器来利用浏览器的本地存储。

```javascript
window.TodoList = Backbone.Collection.extend({

    // Reference to this collection's model.
    model: Todo,

    // Save all of the todo items under the `"todos"` namespace.
    // Typically, this should be a unique name within your application
    localStorage: new Store("todos"),
```

为了切换成RESTful服务，使用`url`属性或者函数来指定服务器端的位置。然后collection内的Models使用`url`来构建它们自己的URLs。所有RESTful API的CRUD都基于'/api/todos'路径，所以可以像下面这样设置`url`。

```javascript
    // localStorage: new Store("todos"),
    url: '/api/todos',
```

这就是唯一需要修改的地方，怎么样，很简单吧？


**todo.jade**

这个应用中包含2个Jade模板,index页面(layout.jade)和主要的Todo容器页面(todo.jade)。也包含了页面中渲染每个Todo元素的script标签的模板。

```html
// Todo App Interface

#todoapp
  .title
    h1 Todos
  .content
    #create-todo
      input#new-todo(placeholder="What needs to be done?", type="text")
      span.ui-tooltip-top(style="display:none;") Press Enter to save this task
    #todos
      ul#todo-list
    #todo-stats


// Templates
script#item-template(type="text/template")
  <div class="todo <%= done ? 'done' : '' %>">
  .display
    <input class="check" type="checkbox" <%= done ? 'checked="checked"' : '' %> />
    .todo-text
    span#todo-destroy
  .edit
    input.todo-input(type="text", "value"="")
  </div>

script#stats-template(type="text/template")
  <% if (total) { %>
  span.todo-count
    span.number <%= remaining %>
    span.word <%= remaining == 1 ? 'item' : 'items' %>
    |  left.
  <% } %>
  <% if (done) { %>
  span.todo-clear
    a(href="#")
      |  Clear
      span.number-done <%= done %>
      |  completed
      span.word-done <%= done == 1 ? 'item' : 'items' %>
  <% } %>
```

**layout.jade**

```html
head
  meta(charset="utf-8")
  meta(http-equiv="X-UA-Compatible", content="IE=edge,chrome=1")

  title=title
  meta(name="description", content="")
  meta(name="author", content="")
  meta(name="viewport", content="width=device-width,initial-scale=1")

  // CSS concatenated and minified via ant build script
  link(rel="stylesheet", href="css/style.css")
  // end CSS

  script(src="js/libs/modernizr-2.0.6.min.js")
body

  #container
    header
    #main(role="main")!=body
    footer
  //! end of #container

  script(src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js")
  script
    window.jQuery || document.write('<script src="js/libs/jquery-1.6.2.min.js"><\\/script>')

  // scripts concatenated and minified via ant build script
  script(src="js/mylibs/underscore.js")
  script(src="js/mylibs/backbone.js")
  script(defer, src="js/plugins.js")
  script(defer, src="js/script.js")
  // end scripts

  // Change UA-XXXXX-X to be your site's ID
  script
    window._gaq = [['_setAccount','UAXXXXXXXX1'],['_trackPageview'],['_trackPageLoadTime']];
    Modernizr.load({load: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js'});

  //if lt IE 7
    script(src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js")
    script
      window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})
</html>

```


**static.html**

另外，不使用Jade的纯静态的html模板可以参考[这里](https://github.com/addyosmani/backbone-boilerplates/blob/master/option1/public/static.html)，下面是部分片段。

```html
<div id="container">
    <div id="main" role="main">

      <!-- Todo App Interface-->

      <div id="todoapp">
        <div class="title">
          <h1>Todos</h1>
        </div>

        <div class="content">
          <div id="create-todo">
            <input id="new-todo" placeholder="What needs to be done?" type=
            "text" /><span style="display:none;" class="ui-tooltip-top">Press Enter to
            save this task</span>
          </div>

          <div id="todos">
            <ul id="todo-list"></ul>
          </div>

          <div id="todo-stats"></div>
        </div>
      </div>


    <!-- Templates-->

      <script id="item-template" type="text/template">
      <div class="todo <%= done ? 'done' : '' %>">
      <div class="display"><input class="check" type="checkbox" <%= done ? 'checked="checked"' : '' %> />
      <div class="todo-text"></div><span id="todo-destroy"></span></div><div class="edit"><input type="text" value="" class="todo-input"/></div></div>
      </script>

      <script id="stats-template" type="text/template">
      <% if (total) { %>
      <span class="todo-count"><span class="number"><%= remaining %> </span><span class="word"><%= remaining == 1 ? 'item' : 'items' %></span> left.
      </span><% } %>
      <% if (done) { %>
      <span class="todo-clear"><a href="#"> Clear
      <span class="number-done"><%= done %></span> completed
      <span class="word-done"><%= done == 1 ? 'item' : 'items' %></span></a></span><% } %>
      </script>

    </div>
  </div>

  <!--! end of #container-->
```


### 运行

我们已经使用Node.js, Express and Mongoose开发了一个RESTful应用。我们来尝试下运行修改之后的Todo app。

####MongoDB

下载[MongoDB](http://www.mongodb.org/downloads)之后， 运行前需要2个步骤。

**Data目录**

MongoDB把数据保存在bin/data/db目录，但不会自动创建。 切换到下载目录然后解压MongoDB，运行下面的命令：

```html
sudo mkdir -p /data/db/
sudo chown `id -u` /data/db
```

**运行和连接到server**

打开2个控制台窗口。

第一个控制台，`cd`到MongoDB bin目录或者使用完整路基。启动`mongod`。

```html
$ ./bin/mongod
```
然后，第二个控制台，启动`mongo` shell会默认连接到localhost服务器。

```html
$ ./bin/mongo
```

####Express和Mongoose

Option1(使用HTML)和Option2(使用Jade)目录下都有一个install.sh脚本。可以通过npm(node包管理)快速的安装Express, Mongoose, Jade (MongoDB可选)。

* 确保已安装Node.js。如果还没装，从[这里](http://nodejs.org/#download)获取。
* 然后运行`$ ./install.sh`安装依赖模块。install.sh文件内容：

**install.sh**

```html
#!/bin/bash
npm install express
npm install mongodb --mongodb:native
npm install mongoose
npm install jade
```


* 安装完所有依赖模块之后，可以从下面获取代码，然后运行：

```html
git clone git://github.com/addyosmani/backbone-boilerplates.git
cd option2
node app.js
```

如果要运行option1(没有使用Jade)cd到option1，执行`node app.js`即可。

最后，上面2个案例都可以通过下面地址访问：

* Option 1: `http://localhost:3000/static.html`
* Option 2: `http://localhost:3000/todo`



#<a name="stack2">使用Ruby, Sinatra, MongoDB和Haml构建Backbone.js Apps</a>

##简介

这一章我们将探索使用Ruby作为后端来开发Backbone.js应用。我们会使用[Sinatra](http://www.sinatrarb.com/)——一种快速创建Ruby应用的DSL (domain specific language，特定领域语言)。类似于使用Node.js的[章节](https://github.com/addyosmani/backbone-fundamentals/#stack1) ，Ruby服务端将会提供Backbone.js应用的API。


## 什么是Sinatra?

过去，通常使用[Ruby on Rails](http://rubyonrails.org) (RoR)——一个流行的Ruby MVC web开发框架。Sinatra是一个更小，更轻量的框架。

Rails需要更严格的项目结构(比如需要使用controllers，views和routing等)，Sinatra则不需要这么多依赖，牺牲了数据连接，创建表单和Rails其它一些开箱即用的功能。

Sinatra有最小化的URLs映射和RESTful HTTP请求的响应功能。Sinatra对于不需要额外的RoR支持快速创建项目非常实用。

熟悉Rails的都知道，需要定义一个单独的routes文件来映射请求的响应。这就是controllers和其它相关模块所需要的。

Sinatra使用一种更直观的方法来处理路由。通过声明```get```,```post```, ```put``` 或者 ```delete``` 操作，就可以告诉Sinatra添加一个新的route，来响应请求。

这个框架非常适合写API，widget和小规模应用。正如前面提到的，我们将用它来编写API。



## 开始使用Sinatra

然我们从一个经典的"Hello World"例子开始。

提示: 开始前请先安装Sinatra。后面的[prerequisites](#preq)部分有安装指导。

###Routes


Sinatra可以通过HTTP行为来定义路由。所有route有一个非常简单的结构：

```ruby
<a HTTP action> <the desired route> do
   # some behaviour
end
```

输出"Hello World"的路由就想下面这样：

```ruby
require 'sinatra'

get '/' do
   "Hello World! Is it me you're looking for?"
end
```

保存为'.rb'文件然后运行：

```ruby
ruby -rubygems example.rb
```

在浏览器中通过http://localhost:4567浏览。

RESTful 服务通常HTTP动作有：`get`, `post`, `delete`和`put`。所有Sinatra的routes都是基于HTTP行为，映射到URL。我们把对路由的响应关联起来。Sinatra不强制要求总体结构，而是以简单的方式支持强大的APIs。

下面是一个例子：

```ruby
get '/items' do
  # list all items available
end

get '/item/:id' do
  # get a single item
end

post '/item' do
  # create a new item
end

put '/item/:id' do
  # update an existing item
end

delete '/item/:id' do
  # delete an item
end
```

Sinatra的路由非常容易上手，同时也支持更复杂的模式。你可能已经注意到上面的例子了，它可以支持命名参数(比如 ```/item/:id```)。可以通过```params```哈希来访问里面的值：

```ruby
get '/item/:id' do
  # this matches "GET /item/10" and "GET /item/11"
  # params[:id] is "10" or "11"
  "You reached #{params[:id]}"
end
```

Sinatra同样支持通配符，正则表达式的路由匹配。更多信息可参考官方[文档](http://www.sinatrarb.com/documentation)。 我们来看下handlers(处理器)。

Sinatra包含非常方便的方法来处理跳转(redirection)，终止(halting)和传递(passing)。

####跳转(redirection)

支持简单的302跳转响应：

```ruby
get '/items' do
      redirect '/items/welcome'
end
```

还可以传递参数：
redirect 'http://site.com/', 'Oops! I think we have a problem!'

####终止(Halting)

要立即停止一个请求可以使用'halt'：

```halt "who goes there!?"```

####传递(Passing)

'Passing'是把一个流程传递给另外一个对应的route。使用`pass`。下面这个例子中如果username不是(rick-astley) 就继续传递：

```ruby
get '/members/:username' do
 pass unless params[:username] == 'rick-astley'
 'Never gonna give you up, never gonna let you down'
end

get '/members/*' do
 'Welcome!'
end
```

同样有一些方法处理sessions(指基于cookie的session处理)。要使用Sinatra的session处理，先要开启：

```ruby
enable :sessions
```

然后像下面这样使用：

```ruby
get '/items' do
  session['visitCounter'] ||= 0;
  session['visitCounter'] += 1;
  "This page has been accessed #{session['visitCounter']} times"
end
```

提示：默认enable:sessions将会把说有数据保存在cookies中。如果你不想这样的话，可以用一些中间件来替代。可以参考[这里](http://www.sinatrarb.com/intro#Using%20Sessions)。


##模板和HAML


我们可以在Sinatra应用中使用ERB模板。ERB可以允许使用Ruby代码来输出内容和控制流程。下面是一个例子，view默认指向```views```目录。

```ruby
get '/items' do
  erb :default
  # renders views/default.erb
end
```

在渲染其它模板前，默认都会先加载views/layout模板。views/layout.erb文件像下面这样：

```html
<html>
  <head></head>
  <body>
    <%= data %>
  </body>
</html>
```

与ERB相比，另一个流行的模板是使用Haml来编写。 Haml有下面几个优点：

* 学些起来非常直接简单
* 对嵌套的DOM元素表达很形象，容易阅读
* 基于CSS语法之上，在web设计中很流行
* 有庞大的社区支持
* 跟ERB一样快

下面我们来看下ERB与Haml的比较：

####ERB

```html
<div class="todo" id="content">
  <h2 class="entry_title"><%= h @todo.title %></h2>
  <div class="entry_link"><%= link_to('link', @todo.link) %></div>
</div>
```

####Haml

```html
.todo#content
  %h2.entry_title= @todo.title
  .entry_link= link_to('link', @todo.link)
```


可以看到Haml非常像CSS的标记。跟容易阅读，而且不用在关心div,span,结束标记和其它语法规则，也不用在输入那么多代码。空格是语法的一部分，所以多个文档间会更容易对比变化(比如diff的时候)。

上面我们提到了设计师，作为开发者，通常需要于设计设交流。在很多公司，设计师需要为他们的设计写模板时，Haml是一个不错的选择。


```ruby
%h1 这是h1
%h2 这是h2

%p 下面一行有一个变量：@content
%p= @content

%p 在一行中包含Ruby代码可以使用 ==.
%p== Here is an example: #{@foobar}

%p 属性可以使用 {}
%p{:style => "color:green"} We just made this paragraph green!

%p 如果想给DOM指定class或者ID
%p.foo This has the foo class
%p.bar This has the bar class
%p#foobar This has the foobar id
%p.foo#foobar Or you can combine them!

%p 嵌套可以这样
%p
  或者这样

```

提示：Haml是空格严格的语法，如果空格不严格可能出错。它使用空格来表达HTML标签的嵌套。


#MongoDB Ruby驱动


##Getting started

MongoDB Ruby驱动安装好之后就可以链接Mongo数据库了。使用localhost和默认端口创建一个连接：

```ruby
require 'mongo'

# where 'learning-mongo' is the name of our database:
db = Connection.new.db('learning-mongo');
```

我们想要保存一些数据到'learning-mongo'。比如简单的note信息，我们notes collection开始：

```ruby
notes = db.collection('notes')
```
目前没有数据，因为我们还没有创建任何信息。

note可以使用key/value对来定义，调用`collection.insert()`插入到数据'learning-mongo':

```ruby
our_note = { :text => 'Remember the milk', :remindInterval => 'weekly'}
note_id = notes.insert(our_note)
```

插入到notes collection之后，返回的是一个Mongo的note对象`ObjectId`的引用。对于重新定位该对象非常有用。

```ruby
note = notes.find( :id => note_id ).first
```

也可以结合`collection.update()`方法和[query](http://www.mongodb.org/display/DOCS/Updating)操作(比如`$set`) 替换一个已存在的对象。

可以像下面这样更新document对象：

```ruby
note = notes.find( :id => note_id ).first
note[:text] = 'Remember the bread'
notes.update({ :_id => note_id }, note)
```

或使用`$set`，在不重写该对象的情况写保存实体：

```ruby
notes.update({ :_id => note_id }, '$set' => { :text = > 'Remember the bread' })
```

几乎每个MongoDB document都有一个_id字段作为它的第一个属性。它可以是任何类型，虽然MongoDB 为id提供了一个特定的BSON类型。它是12-位二进制值，分配时有高度的唯一性。


提示：我们这里使用了MongoDB Ruby Driver，或许你对**DataMapper**也感兴趣——一个可以使用相同API连接多重不同数据库的方案。不管是关系型数据库还是非关系型数据库都能适用，更多信息可参考[官方网站](http://datamapper.org/why.html)。[Sinatra: The Book](http://sinatra-book.gittr.com/#datamapper) 也包含了DataMapper相关的教程。


#实践

我们像上一章Express那样来使用Sinatra。提供RESTful API支持CRUD操作。同时使用MongoDB进行数据存储。如果你看过前面Todo案例，这部分将会非常简单明了。

还记得前面Todo案例已经存留了数据，景观是通过localStorage适配做的。现在我们要基于Sinatra API来做存储。我们简短的回顾下在这部分实践中实现CRUD操作的代码，我们不会从一开始基于一个接近完整的实际应用做示例。


###<a id="preq">安装依赖项</a>

####Ruby

如果使用OSX或Linux，Ruby可能是一个已预安装了的开源包，你可以从跳到下一段继续。 可以打开终端检查是否已安装了：

```$ ruby -v```

将会输出ruby的版本，如果未安装的话将会报错。

如果要手动安装的话，可以从这里下载最新版本 http://www.ruby-lang.org/en/downloads/。或者，[RVM](http://beginrescueend.com/rvm/install/) (Ruby版本管理器) 是一个命令行工具，可以轻松的安装和管理多个版本的ruby。


####Ruby Gems

接下来，安装Ruby Gems。Gems是一种Ruby程序或者库的标准打包方式，而且使用Ruby Gems可以非常简单的安装Ruby应用的依赖项。

OSX，Linux，Windows用户都可以到[http://rubyforge.org/projects/rubygems](http://rubyforge.org/projects/rubygems) 下载最新版本的Ruby Gems。打开终端，切换到下载目录执行：

```
$> tar xzvf rubygems.tgz
$> cd rubygems
$> sudo ruby setup.rb
```

下载的目录可能还包含一个版本号。Finally, a symlink (symbolic link) to tie everything togther should be run as follows:

```$ sudo ln -s /usr/bin/gem1.8.17 /usr/bin/gem```

检查Ruby Gems是否已安装成功：

```
$ gem -v
```


####Sinatra

有了Gems setup，现在就可以很轻松的安装Sinatra了。Linux和OSX用户可以在终端输入：

```$ sudo gem install sinatra```

Windows用户：

```c:\> gem install sinatra```


####Haml

作为另一个DSL和框架，Sinatra广泛的支持各种模板引擎。[ERB](http://www.ruby-doc.org/stdlib/libdoc/erb/rdoc/classes/ERB.html) 是Sinatra社区常推荐的一种，不过我们这一章将会探索下使用[Haml](http://haml.hamptoncatlin.com/)来定义模板。

Haml是对HTML更为抽象的标记语言，而且是一种轻量的标记语言，用于描述HTML，而且无需使用传统标记语法(比如开始标签和结束标签)。

安装haml只需要使用Ruby Gems执行一行命令：

```$ gem install haml```


####MongoDB

如果你在看前面的章节时还没安装MongoDB，赶紧[下载](http://www.mongodb.org/downloads)。也可以通过Ruby Gems用一条命令来安装：

```$ gem install mongodb```

现在我们还需要2个步骤来搭建好整个运行环境。

#####1.数据目录

MongoDB把数据保存在bin/data/db文件夹下，但是不会自动创建这个目录。切换到下载的目录解压Mongo，然后运行：

```
sudo mkdir -p /data/db/
sudo chown `id -u` /data/db
```

#####2.运行和连接到服务器

打开2个控制台窗口。

在第一个控制台，切换到MongoDB bin目录或者输入完整路径。 启动mongod。

```
$ ./bin/mongod
```

最后，在第二个控制台, 启动mongo shell，会默认连接到localhost服务器。

```
$ ./bin/mongo
```

####MongoDB Ruby Driver

我们将使用[MongoDB Ruby Driver](https://github.com/mongodb/mongo-ruby-driver), 需要下面的gems：

驱动自身：

```
$ gem install mongo
```

驱动的依赖，bson:

```
$ gem install bson_ext
```

以上是增强序列化速度最基本的扩展。

上面这些就是我们的准备条件。


##教程

先复制一份官方的代码到本地。


###应用文件
Clone [代码库](http://github.com/addyosmani/backbone-fundamentals) 切换到 `/practicals/stacks/option3`目录。在控制台运行：

```
ruby app.rb
```

浏览器中打开<code>http://localhost:4567/todo</code>看是否运行成功。

**提示：** Option3的Haml layout文件在/views目录下。

整个应用的目录结构：

```
--public
----css
----img
----js
-----script.js
----test
--views
app.rb

```

`public`目录包含了脚本和样式，基于HTML5 Boilerplate。可以在```public/js/scripts.js```文件中找到Models, Views和Collections (当然，也可以把每个组件拆分到子目录中，如果你愿意的话)。

```scripts.js``` 包含了下面这些Backbone组件定义：

```
--Models
----Todo

--Collections
----TodoList

--Views
---TodoView
---AppView
```

`app.rb`是一个小的Sinatra应用，支撑了我们这个案例的后台API。

最后，`views`目录包含了index和模板的Haml源文件，运行时都会编译成标准的HTML标记。

可以同下面的一些有注释的代码片段一起观看。

###Backbone

####Views

在主要的view (AppView)初始化时，要加载在Mongo中已保存的Todo项， 这部分由```initialize()```方法中```Todos.fetch()```这一行完成， 初始化方法中同时也绑定了`Todos`的add，reset，all事件。

```javascript
// Our overall **AppView** is the top-level piece of UI.
var AppView = Backbone.View.extend({

    // Instead of generating a new element, bind to the existing skeleton of
    // the App already present in the HTML.
    el: $("#todoapp"),

    // Our template for the line of statistics at the bottom of the app.
    statsTemplate: _.template($('#stats-template').html()),

    // Delegated events for creating new items, and clearing completed ones.
    events: {
      "keypress #new-todo":  "createOnEnter",
      "keyup #new-todo":     "showTooltip",
      "click .todo-clear a": "clearCompleted"
    },

    // At initialization
    initialize: function() {
      this.input    = this.$("#new-todo");

      Todos.on('add',   this.addOne, this);
      Todos.on('reset', this.addAll, this);
      Todos.on('all',   this.render, this);

      Todos.fetch();
    },

    // Re-rendering the App just means refreshing the statistics -- the rest
    // of the app doesn't change.
    render: function() {
      this.$('#todo-stats').html(this.statsTemplate({
        total:      Todos.length,
        done:
 ….
```

###Collections

在下面TodoList collection中，我们把`url`属性指向`/api/todos`，引用服务器端collection的location。当我们通过这个地址尝试访问Sinatra API时，应该返回一个保存在Mongo里的所有Todo项的列表。

为做到彻底，API也支持通过访问`/api/todos/itemID`返回指定的Todo项。编写Ruby代码的时候我们会再回顾下这点。

```javascript
 // Todo Collection

  var TodoList = Backbone.Collection.extend({

    // Reference to this collection's model.
    model: Todo,

    // Save all of the todo items under the `"todos"` namespace.
    // localStorage: new Store("todos"),
    url: '/api/todos',

    // Filter down the list of all todo items that are finished.
    done: function() {
      return this.filter(function(todo){ return todo.get('done'); });
    },

    // Filter down the list to only todo items that are still not finished.
    remaining: function() {
      return this.without.apply(this, this.done());
    },

    // We keep the Todos in sequential order, despite being saved by unordered
    // GUID in the database. This generates the next order number for new items.
    nextOrder: function() {
      if (!this.length) return 1;
      return this.last().get('order') + 1;
    },

    // Todos are sorted by their original insertion order.
    comparator: function(todo) {
      return todo.get('order');
    }

  });
```


###Model

Todo应用的model跟这本书前面讲到的大部分都没什么却别。不过需要注意的是在下面调用`model.url()`将返回Todo项在服务器端对应的相对URL。

```javascript

  // Our basic **Todo** model has `text`, `order`, and `done` attributes.
  var Todo = Backbone.Model.extend({
    idAttribute: "_id",

    // Default attributes for a todo item.
    defaults: function() {
      return {
        done:  false,
        order: Todos.nextOrder()
      };
    },

    // Toggle the `done` state of this todo item.
    toggle: function() {
      this.save({done: !this.get("done")});
    }
  });
```

###Ruby/Sinatra

现在已经定义主要的models, views和collections， 我们来看下Sinatra API的CRUD操作。

我们要确保任何基于数据的操作(创建, 更新, 删除)Mongo中的数据存储都能正确的反应出来。


###app.rb

首先引入依赖。包含Sinatra, Ruby Gems, MongoDB Ruby 和JSON。

```ruby
require 'rubygems'
require 'sinatra'
require 'mongo'
require 'json'
```

然后，创建一个新的Mongo连接，指定自己的配置参数。如果运行多线程的应用，'pool_size'可以设置一个最大的pool size，'timeout'可以指定最大的等待老的连接从pool释放的超时时间。

```ruby
DB = Mongo::Connection.new.db("mydb", :pool_size => 5, :timeout => 5)
```

最后，定义API的routes。注意，前面2个routes，root (`/`) 和todo items route `/todo`使用Haml作为模板渲染。

```ruby
class TodoApp < Sinatra::Base

	get '/' do
	  haml :index, :attr_wrapper => '"', :locals => {:title => 'hello'}
	end

	get '/todo' do
	  haml :todo, :attr_wrapper => '"', :locals => {:title => 'Our Sinatra Todo app'}
	end
```

`haml :index`告诉Sinatra使用`views/index.haml`作为应用的首页，```attr_wrapper```简单的定义模板内定义的局部变量的值。同样的，Todo items使用`views/todo.haml'模板。

其它的routes利用了`params`和一些MongoDB Ruby driver里的实用helper方法。更多细节可以阅读下面的一些说明：


```ruby
get '/api/:thing' do
  # 查询一个collection :thing, 把结果转换成数组，根据object的_id作为字符串生成个map，然后转换成json。
  DB.collection(params[:thing]).find.to_a.map{|t| from_bson_id(t)}.to_json
end

get '/api/:thing/:id' do
  # 通过id :id获取collection的第一个结果，:thing作为一个单独的document (就想一个光标，标准输出)调用find_one()。bson相关工具完成ID转换，最后输出JSON
  from_bson_id(DB.collection(params[:thing]).find_one(to_bson_id(params[:id]))).to_json
end

post '/api/:thing' do
  # 把post过来的内容转换成字符串，插入到collection #thing 并且返回ObjectId字符串。
  oid = DB.collection(params[:thing]).insert(JSON.parse(request.body.read.to_s))
  "{\"_id\": \"#{oid.to_s}\"}"
end

delete '/api/:thing/:id' do
  # 更具id :id 移除collection :thing 中的项，, 基于bson转换object id
  DB.collection(params[:thing]).remove('_id' => to_bson_id(params[:id]))
end

put '/api/:thing/:id' do
  # collection.update() ，使用$set设置单个属性值。put请求的内容转换成字符串，为安全考虑拒绝包含'_id'的名称。
  DB.collection(params[:thing]).update({'_id' => to_bson_id(params[:id])}, {'$set' => JSON.parse(request.body.read.to_s).reject{|k,v| k == '_id'}})
end

# 创建/转换 MongoDB ObjectId的方法
def to_bson_id(id) BSON::ObjectId.from_string(id) end
def from_bson_id(obj) obj.merge({'_id' => obj['_id'].to_s}) end

end
```

上面是一套精简而完整的API了，足以满足客户端的读写需求。

想了解MongoDB和MongoDB Ruby driver能做的更多事情，可以阅读它们的文档。

作为开发人员，可以尝试对这个案例做些更进一步的扩充：

* 验证：增强API的数据校验。还有些什么可以做的，以确保数据的安全呢？
* 搜索：基于关键字对todo进行搜索或者过滤。
* 分页：只返回指定页的todo内容。

###Haml/Templates

最后，我们来看下Haml文件，index (layout.haml) 和单个Todo项的模板(todo.haml)。这2个文件的自我描述性都非常强，不过可以来对比下上一章中使用Jade和这里使用Haml的区别。

提示：下面的Haml片段中，斜杠分隔符表示注释。 当斜杠在行开头时，后面的内容将会被转换成HTML注释。比如：

```/ These are templates```

编译成：

```<!-- These are templates -->```


###index.haml

```html
%head
  %meta{'charset' => 'utf-8'}/
  %title=title
  %meta{'name' => 'description', 'content' => ''}/
  %meta{'name' => 'author', 'content' => ''}/
  %meta{'name' => 'viewport', 'content' => 'width=device-width,initial-scale=1'}/

  / CSS concatenated and minified via ant build script
  %link{'rel' => 'stylesheet', 'href' => 'css/style.css'}/
  / end CSS

  %script{'src' => 'js/libs/modernizr.min.js'}
%body
  %div#container
    %header
    %div#main
      = yield
    %footer
  /! end of #container

  %script{'src' => 'http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'}

  / scripts concatenated and minified via ant build script
  %script{'src' => 'js/mylibs/underscore.js'}
  %script{'src' => 'js/mylibs/backbone.js'}
  %script{'defer' => true, 'src' => 'js/plugins.js'}
  %script{'defer' => true, 'src' => 'js/script.js'}
  / end scripts
```

###todo.haml

```html
%div#todoapp
  %div.title
    %h1
      Todos
      %div.content
        %div#create-todo
          %input#new-todo{"placeholder" => "What needs to be done?", "type" => "text"}/
          %span.ui-tooltip-top{"style" => "display:none;"} Press Enter to save this task
        %div#todos
          %ul#todo-list
        %div#todo-stats

/ Templates

%script#item-template{"type" => "text/template"}
  <div class="todo <%= done ? 'done' : '' %>">
  %div.display
    <input class="check" type="checkbox" <%= done ? 'checked="checked"' : '' %> />
    %div.todo-text
    %span#todo-destroy
  %div.edit
    %input.todo-input{"type" => "text", "value" =>""}/
  </div>

%script#stats-template{"type" => "text/template"}
  <% if (total) { %>
  %span.todo-count
    %span.number <%= remaining %>
    %span.word <%= remaining == 1 ? 'item' : 'items' %>
    left.
  <% } %>
  <% if (done) { %>
  %span.todo-clear
    %a{"href" => "#"}
      Clear
      %span.number-done <%= done %>
      completed
      %span.word-done <%= done == 1 ? 'item' : 'items' %>
  <% } %>
```

##总结

这一章，我们基于Ruby, Sinatra, Haml, MongoDB和MongoDB driver创建了Backbone应用的后端API。对于同一个应用，我个人觉得相对基于Node/Express的实现而言，使用Sinatra来开发后端API更爽。

这章并不是对于开发一个复杂应用的全面指南，我更希望它是一个入门，能帮助你在做下一个项目时决定尝试引入哪些好的东西。


# <a name="advanced">模块化开发</a>


##<a name="modularjs">介绍</a>

通常我们说一个应用是模块化的时候，它应该是由高度解耦的，把各个功能分开到模块中。或许你应该已知道，这种解耦通过移除可能存在的依赖促使app更容易维护。当模块化实施的非常有效时，就很容易看出某一部分的改动对其它部分的影响。

不过，不像一些更传统的编程语言，目前的JavaScript标准(ECMA-262)并不给开发者提供清晰，有组织模块导入方式。直到最近几年对组织JavaScript应用的需求逐渐明显，自然而然这就成了技术规范需要考虑的一件事。

取而代之，现在的开发者都被迫使用变种的模块化或者对象字面模式。模块脚本通过一个单一全局对象定义的命名空间与DOM捆绑在一起，在整个架构中，命名空间也可能引发命名冲突。如果不手动努力或使用第三方工具的话，也没有清晰的方式处理依赖管理。

对这些问题原生的解决方案支持将会在ES Harmony规范中得以支持。不过，值得高兴的是编写JavaScript模块也可以从现在开始做起，而且从来没有如此的简单过。

接下来，讲义讲到如何使用AMD模块和Require.js把代码单元包装成基于管理的模块。


##<a name="organizingmodules">用Require.js和AMD来组织模块</a>

如果你还未曾使用过它，[Require.js](http://requirejs.org) 是James Burke编写的一个非常流行的脚本加载器。他是一个对促性形成AMD模块规范有很多贡献的开发者，后面我们简短的讨论下AMD。Require.js可以帮助加载多个脚本文件，定义有依赖或无依赖的模块，加载无脚本依赖的文件，比如文本。

那么，为什么同Backbone一起使用Require.js呢？尽管Backbone为应用提供清晰明了的架构方便表现的很优秀，但有些关键领域还需要一些额外的辅助才能做得了：

1) Backbone没有一个特定的模块化开发方式。虽然它非常开放，可以让开发者选择经典的模块模式或者对象字面量来组织app(两种方式都工作的很好)，但这也意味着开发者不确定当需要关心其它问题是哪种才是最好的，比如依赖管理。

Require.js是适合AMD(Asynchronous Module Definition，异步模块定义)规范， 这种规范诞生的期望是对解决'写很多script标签，可能包含潜在的冲突，手动维护'提供一个更好的方案。另外还可以清晰的声明依赖，AMD在浏览器中运行的非常好，对依赖支持字符串ID，在同一个文件中声明依赖，并且提供避免污染全局命名空间简单易用的工具。

2) 如果手动处理依赖的话这将是一个非常大的挑战。我们编写JavaScript模块的时候，主观上都会想智能的重用代码块，有时候也意味着当用户首次进入应用的时候要动态的控制加载项，而不是整个庞大的代码都加载到运行环境中。

可以参照下GMail的web端。当用户刚开始载入页面时，Google影藏了一些widgets，比如chat模块，当用户点击'expand'的时候才展示。通过动态依赖载入，Google可以在用户需要使用时载入chat模块，而不是在页面初始化时强制全部载入。当构建大型应用时可以有助于提升性能和加载速度。


我之前写过关于AMD和其它模块规范以及脚本加载的[文章](http://addyosmani.com/writing-modular-js)有兴趣可以阅读下。虽然不适用脚本加载器和模块规范也可以完成应用的开发，但是考虑使用这些东西做开发具有重大意义。

###使用Require.js编写AMD模块

正如前面提到的，AMD的整个核心目的就是提供一种模块化JavaScript的开发规范。当你使用脚本加载器的时候，需要理解2个关键概念。一个就是`define()`方法用于模块定义，另一个就是`require()`方法用户处理依赖加载。`define()`用于定义命名或者匿名的模块，像下面这种格式：

```javascript
define(
    模块id(module_id) /*可选*/,
    [依赖项(dependencies)] /*可选*/,
    模块的定义函数(definition function) /*实现模块或者对象定义的函数*/
);
```

`module_id`是可选参数， 通常只在无AMD连接工具情况下才需要这个参数(可能在其它一些边缘情况下也有用)。没有这个参数时，称之为'匿名'模块。匿名模块的身份标识原则是DRY，避免使用重复的文件名和代码。

依赖项这个参数是一个数组，声明要定义的这个模块所依赖的模块列表。第三个参数，定义函数('definition function')，用于执行模块的实例化。一个标准的模块(能与Require.js兼容)可以像下面这样定义：

```javascript
// 这里省略了module ID，是一个匿名模块。

define(['foo', 'bar'],
    // 模块定义函数
    // 依赖项(foo and bar)映射到了函数的参数中
    function ( foo, bar ) {
        // 返回定义模块的导出接口(export)
        // (比如想提供给调用者的功能函数)

        // create your module here
        var myModule = {
            doStuff:function(){
                console.log('Yay! Stuff');
            }
        }

        return myModule;
});
```

####替代(Alternate)语法
也有一个更加[甜蜜版本](http://requirejs.org/docs/whyamd.html#sugar)的`define()`，可以通过局部变量`require()`来申明依赖。对于使用过node的用户来说，这显得非常亲切，而且更加容易添加和移除依赖。前面的代码片段可以使用下面这种语法来替代：

```javascript
// 这里省略了module ID，是一个匿名模块。

define(function(require){
        // 模块定义函数
		
    // 依赖项(foo and bar)被定义成了本地变量
    var foo = require('foo'),
        bar = require('bar');

        // 返回定义模块的导出接口(export)        

        // 创建模块
        var myModule = {
            doStuff:function(){
                console.log('Yay! Stuff');
            }
        }

        return myModule;
});
```

`require()` 方法可以在顶级JavaScript文件域也可以在模块内部域动态加载依赖。下面是一个例子：

```javascript
// 假设'foo'和'bar'是2个外部模块
// 这2个模块的'exports'分别传给了回调函数的(foo and bar)参数
// 这样就可以被访问了

require(['foo', 'bar'], function ( foo, bar ) {
        // rest of your code here
        foo.doSomething();
});
```


**把modules, views和其它组件包装成AMD**

现在来看下如何定义AMD模块，我们看下如何包装views,collections这些组件，这样就可以在任何需要的地方作为依赖项加载了。正因为简单，Backbone model只需要require Backbone和Underscore.js，所以编写一个AMD model模块就像下面这样简单：

```javascript
define(['underscore', 'backbone'], function(_, Backbone) {
  var myModel = Backbone.Model.extend({

    // 默认属性
    defaults: {
      content: "hello world",
    },

    // 一个空的初始化方法
    initialize: function() {
    },

    clear: function() {
      this.destroy();
      this.view.remove();
    }

  });
  return myModel;
});
```

注意，Underscore.js的实例映射到了`_`，Backbone映射到`Backbone`, 非常轻松的把非-AMD代码转换成了模块方式。 view则需要引入其它的依赖，比如jQuery，下面是示例：

```javascript
define([
  'jquery',
  'underscore',
  'backbone',
  'collections/mycollection',
  'views/myview'
  ], function($, _, Backbone, myCollection, myView){

  var AppView = Backbone.View.extend({
  ...
```
jquery被映射到别名(`$`)，再一次证明把应用的任何一部分封装成AMD模块都是非常容易的。


##<a name="externaltemplates">使用Require.js保持外部模板和文本插件</a>
把[Underscore/Mustache/Handlebars]模板转移到外部文件事实上非常冒进。在这个应用中，使用Require.js，我将会讨论如何使用这个特定的脚本加载器实现外部模板。

Require.js有一个特别的插件text.js，用于加载文本文件。按下面步骤使用这个文本插件：

1. 从这里下载http://requirejs.org/docs/download.html#text，放在应用的主要js目录或者子目录下。

2. 然后，在初始化Require.js配置中引入text.js插件。下面这段代码，假定在执行前Require.js已经被加载。其它部分的脚本加载进来只为了做示例。

```javascript
require.config( {
    paths: {
        'backbone':         'libs/AMDbackbone-0.5.3',
        'underscore':       'libs/underscore-1.2.2',
        'text':             'libs/require/text',
        'jquery':           'libs/jQuery-1.7.1',
        'json2':            'libs/json2',
        'datepicker':       'libs/jQuery.ui.datepicker',
        'datepickermobile': 'libs/jquery.ui.datepicker.mobile',
        'jquerymobile':     'libs/jquery.mobile-1.0'
    },
    baseUrl: 'app'
} );
```

3. 当使用`text!`前缀在表示依赖项时，Require.js会自动加载text插件，并且把这个依赖项当成文本资源。下面是一个例子。

```javascript
require(['js/app', 'text!templates/mainView.html'],
    function(app, mainView){
        // mainView文件的内容将被载入到mainView被使用。
    }
);
```

4. 最后我们可以把文本资源载入当成模板使用。你可能使用过Underscore.js的micro-templating (jQuery也一样)，通过特定的页内script标签来保存HTML模板，像下面这样

HTML:

	<script type="text/template" id="mainViewTemplate">
	    <% _.each( person, function( person_item ){ %>
	        <li><%= person_item.get("name") %></li>
	    <% }); %>
	</script>


JS:

```javascript
var compiled_template = _.template( $('#mainViewTemplate').html() );
```

不过，通过Require.js和text插件，把模板保存到外部文件就非常简单了(比如，`mainView.html`)：

```javascript
require(['js/app', 'text!templates/mainView.html'],
    function(app, mainView){

        var compiled_template = _.template( mainView );
    }
);
```

然后就可以在Backbone中把模板应用到view了中了：

```javascript
collection.someview.$el.html( compiled_template( { results: collection.models } ) );
```

所有模板解决方案都有自己的方法处理模板编译，但是如果你明白上面这些的话，用其它方案替代Underscore的 micro-templating就会相当琐碎。

**提示:** 你可能对[Require.js tpl](https://github.com/ZeeAgency/requirejs-tpl)也感兴趣。它是一个兼容AMD版本的Underscore模板系统，同样也支持最优化(预编译模板)，会有更好的性能而且没有eval。我已经使用过这个模板了，作为一个推荐资源。


##<a name="optimizingrequirejs">使用Require.js优化器优化Backbone应用</a>

有经验的开发者应该知道，编写小巧而又大型的JavaScript web应用时最后一个步骤是构建过程。大多数不平凡的应用基本上都由多个脚本文件组成，并且在推送生产环境前优化、压缩和合并脚本文件，以减少用户请求和下载脚本文件。

提示: 如果你从未了解过构建过程，可以阅读我一骗关于此话题的[文章](http://addyosmani.com/blog/client-side-build-process/)，或许对你有所帮助。

与其它架构的JavaScript框架相比，我更偏向于推荐使用YUI Compressor或者Google的closure编译工具，不过我们有更优雅的选择，当在Backbone应用中使用Require.js时。 Require.js有一个命令行优化工具r.js， 它包含下面这些功能：

* 合并特定的脚本，通过外部工具进行压缩，比如UglifyJS(默认)或者Google Closure编译器以达到最优化的到浏览器 端的交付，同时保留动态加载模块的能力。
* 通过@import内嵌css文件优化css和样式，去除注释等。
* 可以在Node和Rhino(后面会讲到)的AMD项目中运行。

你可能注意到第一条中提到'特定'一词。Require.js优化器只会合并在require和define调用时传入的顶级域(非局部的)字符串数组指定的模块。 根据[优化器的文档](http://requirejs.org/docs/optimization.html)意味着Backbone模块像下面这样定义：

```javascript
define(['jquery','backbone','underscore', 'collections/sample','views/test'],
    function($,Backbone, _, Sample, Test){
        //...
    });
```

为了更好的合并，下面这种内联的依赖：

```javascript
var models = someCondition ? ['models/ab','models/ac'] : ['models/ba','models/bc'];
```

将会被忽略。这是被设计成这样的，因为要确保动态的依赖/模块在优化只有也能正常工作。

虽然Require.js优化器在Node和Java环境下都运行的很好，不过还是强烈推荐在Node下执行，因为会显著快很多。以我的经验，这不过是环境配置的一小部分，所以选择你觉得舒适的就好了。

可以从[Require.js下载页面](http://requirejs.org/docs/download.html#rjs)或者通过[NPM](http://requirejs.org/docs/optimization.html#download)来获取r.js。现在Require.js优化器对单个脚本和css文件也工作的非常好，不过大部分实际情况都用于优化一整个Backbone项目。你*可以*通过命令行来处理，不过更简洁的方式是使用build配置文件。

下面是一个从本书后面会讲到的模块化jQuery Mobile应用中引用过来的build文件的例子。一段**build文件** (通常是`app.build.js`) 告诉Require.js复制`appDir`目录下的所有内容到`dir`定义的目录下(这个例子中是 `../release`)。 并且所有必要的优化都会应用到发布目录。`baseUrl`用于标识模块的路径。必须是相对于`appDir`的位置。

下面这个文件中还会看到一个数组`modules`。用于指定希望配优化的模块。这个例子中假定我们优化的主应用叫'app'， 对应到`appDir/app.js`。如果帮我们把`baseUrl`设为'scripts'，就会对应到`appDir/scripts/app.js`。

```javascript
({
    appDir: "./",
    baseUrl: "./",
    dir: "../release",
    paths: {
       'backbone':          'libs/AMDbackbone-0.5.3',
        'underscore':       'libs/underscore-1.2.2',
        'jquery':           'libs/jQuery-1.7.1',
        'json2':            'libs/json2',
        'datepicker':       'libs/jQuery.ui.datepicker',
        'datepickermobile': 'libs/jquery.ui.datepicker.mobile',
        'jquerymobile':     'libs/jquery.mobile-1.0'
    },
    optimize: "uglify",
    modules: [
        {
            name: "app",
            exclude: [
                //如果你更喜欢不引入特定的库，可以在这里排除
            ]
        }
    ]
})
```

r.js构建系统的工作原理就是遍历app.js(不管你传入了什么模块)并且解决依赖管理，把它们合并到最后`release`目录下。CSS也同样处理。

build一般放在项目下的'scripts'或'js'目录下。根据我们前面的描述，这个文件可以放在任何你想要的位置，但是也要相应的修改build文件里的内容。

最后，运行build，在`appDir`或者`appDir/scripts`目录下执行下面命令：

```javascript
node ../../r.js -o app.build.js
```

优化工作就完成了，只要UglifyJS/Closure工具安装正确，r.js就可以通过几条简单的语句优化整个Backbone项目。如果想对build配置信息了解更多，James Burke写的包含大量注释的[示例文件](https://github.com/jrburke/r.js/blob/master/build/example.build.js)，包含所有可用的配置选项。


## <a name="optimizebuild">使用Require.JS打包来优化和构建Backbone.js JavaScript应用</a>

*由[Bill Heaton](https://github.com/pixelhandler)贡献*

当一个JavaScript应用build在一个单独文件中过于复杂和庞大时，把应用的组件分组成包，允许依赖脚本异步下载，并且便于只加载**包**，而且允许网站其它模块化代码引入特定依赖项。

Require.JS, 作为模块加载库，有一个[优化器](http://requirejs.org/docs/optimization.html "Require.JS optimizer") ，用于构建基于JavaScript的应用并且提供各种选项。 build文件是用于投建的食谱，就像build.xml文件用于使用ANT构建项目。使用**r.js**构建的好处不仅仅是最小化代码加快下载速度，同样提供一种打包应用组件的方式。

* [优化单个JavaScript文件](http://requirejs.org/docs/optimization.html#onejs "Optimizing one JavaScript file")
* [优化整个项目](http://requirejs.org/docs/optimization.html#wholeproject "Optimizing a whole project")
* [分层或者包优化一个项目](http://requirejs.org/docs/faq-optimization.html#priority "Optimizing a project in layers or packages")

在一个复杂的应用中，用包来组这代码是一个非常吸引人的构建策略。这篇文章中讲述的build文件是基于一个正在开发中测试项目(下面列举了该项目的文件)。这个应用使用了开源库。 build文件的主要目的是使用模块化代码优化基于[Backbone.js](http://documentcloud.github.com/backbone/ "Backbone.js")开发的应用，使得它可以遵循[Asynchronous Module Definition (AMD)](https://github.com/amdjs/amdjs-api/wiki/AMD "Asynchronous Module Definition (AMD) wiki page") 格式。AMD和Require.JS提供了使用依赖编写模块化代码的架构。Backbone.js提供了开发models，views和collections，以及RESTful API交互的代码组织支持。

下面是这个应用的文件结构概览，接着后面的是build文件文件，用于构建模块化(或者分包)层次的JavaScript驱动的应用。

#### 文件结构

假定下面的目录和文件结构，app.build.js是build文件文件 (源代码目录和发布目录同级)。注意下面列表中以*section*命名的文件，可以是应用的任何一个组建(比如*header*, *login*)。

```text
.-- app.build.js
|-- app-release
`-- app-src
    |-- collections
    |   |-- base.js
    |   |-- sections-segments.js
    |   `-- sections.js
    |-- docs
    |   `--docco.css
    |-- models
    |   |-- base.js
    |   |-- branding.js
    |   `-- section.js
    |-- packages
    |   |-- header
    |   |   |-- models
    |   |   |   |-- nav.js
    |   |   |   `-- link.js
    |   |   |-- templates
    |   |   |   |-- branding.js
    |   |   |   |-- nav.js
    |   |   |   `-- links.js
    |   |   `-- views
    |   |       |-- nav.js
    |   |       |-- branding.js
    |   |       `-- link.js
    |   |-- header.js
    |   `-- ... more packages here e.g. cart, checkout ...
    |-- syncs
    |   |-- rest
    |   |   `-- sections.js
    |   |-- factory.js
    |   `-- localstorage.js
    |-- test
    |   |-- fixtures
    |   |   `-- sections.json
    |   |-- header
    |   |   |-- index.html
    |   |   `-- spec.js
    |   |-- lib
    |   |   `-- Jasmine
    |   |-- models
    |   |-- utils
    |   |-- global-spec.js
    |-- utils
    |   |-- ajax.js
    |   |-- baselib.js
    |   |-- debug.js
    |   |-- localstorage.js
    |   `-- shims.js
    |-- vendor
    |-- |-- backbone-min.js
    |   |-- jquery.min.js
    |   |-- jquery.mobile-1.0.min.js
    |   |-- json2.js
    |   |-- modernizr.min.js
    |   |-- mustache.js
    |   |-- require.js
    |   |-- text.js
    |   `-- underscore.js
    |-- views
    |   |-- base.js
    |   `-- collection.js
    |-- application.js
    |-- collections.js
    |-- index.html
    |-- main.js
    |-- models.js
    |-- syncs.js
    |-- utils.js
    |-- vendor.js
    `-- views.js
```

#### 构建以包来组织代码优化模块依赖的配置文件

build文件可以[与应用的各个部分并行下载](http://requirejs.org/docs/faq-optimization.html#priority "optimize modular dependencies in packages")

这种策略展示了构建常见或者站点范围内分组继承自base.js constructor的*models*, *views*, collections，base扩展了应有的backbone方法，比如Backbone.Model。*packages*目录通过分段/职责来组织代码，比如cart, checkout, 等等。注意，在这个例子中*header*包目录有点类似与app根目录的文件结构。一个*包(package)* (被模块化的代码)有对应用通用库的依赖项，也有包单独执行的特定代码； 其它的包不能引入另外的包的依赖项。*utils*目录有shims, helpers, 和通用库代码。*syncs* 目录定义了RESTful api交互或者本地存储的实现。*vendor* 库目录将不会构架，因为没有必要这么做，你可能会使用CDN(然后路径设为: *[empty:](http://requirejs.org/docs/optimization.html#empty "empty:")*)。最后*test*目录用于[Jasmine](http://pivotal.github.com/jasmine/ "Jasmine is a behavior-driven development framework for testing your JavaScript code") 单元测试，你可以选择让build工具忽略它。

同样注意与目录名称相同的.js文件，它们在paths中列出。这就是把一组文件分组构建的策略，下面是示例文件：

```javascript
({
    appDir: './app-src',
    baseUrl: './',
    dir: './app-build',
    optimize: 'uglify',
    paths: {
        // will not build 3rd party code, it's already built
        'text'         : 'vendor/text',
        'json2'        : 'vendor/json2.min',
        'modernizr'    : 'vendor/modernizr.min',
        'jquery'       : 'vendor/jquery-1.7.1',
        'jquerymobile' : 'vendor/jquery.mobile.min.js',
        'underscore'   : 'vendor/underscore',
        'mustache'     : 'vendor/mustache',
        'backbone'     : 'vendor/backbone',
        // files that define dependencies...
        // ignore vendor libraries, but need a group to do so
        'vendor'       : 'vendor',
        // application modules/packages these files define dependencies
        // and may also group modules into objects if needed to require
        // by groups rather than individual files
        'utils'        : 'utils',
        'models'       : 'models',
        'views'        : 'views',
        'collections'  : 'collections',
        // packages to build
        'header'       : 'packages/header'
        //... more packages
    },
    modules: [
        // Common libraries, Utilities, Syncs, Models, Views, Collections
        {
            name: 'utils',
            exclude: ['vendor']
        },
        {
            name: 'syncs',
            exclude: ['vendor', 'utils']
        },
        {
            name: 'models',
            exclude: ['vendor', 'utils', 'syncs']
        },
        {
            name: 'views',
            exclude: ['vendor', 'utils', 'syncs', 'models']
        },
        {
            name: 'collections',
            exclude: ['vendor', 'utils', 'syncs', 'models', 'views']
        },
        // Packages
        {
            name: 'header',
            exclude: ['vendor', 'utils', 'syncs', 'models', 'views', 'collections']
        }
        // ... and so much more ...
    ]
})
```

上面这个build文件的设计平衡了扩展性和性能。

**分组代码依赖示例**

vendor.js没有构建到一个包里面，可能会使用一些*no conflict*调用。

```javascript
// vendor库列表, 比如jQuery, Underscore, Backbone, 等等。
// 此模块构建时使r.js进行优化
// @see <http://requirejs.org/docs/faq-optimization.html>
define([ "jquery", "underscore", "backbone", "modernizr", "mustache" ],
function ($,        _,            Backbone,   Modernizr,   Mustache) {
    // 调用no conflicts可以使用多版本的$
    $.noConflict();
    _.noConflict();
    Backbone.noConflict();
});
```

应用的通用库代码。

```javascript
// List of utility libraries,
define([ "utils/ajax", "utils/baselib", "utils/localstorage", "utils/debug", "utils/shims" ],
function (ajax,         baselib,         localstorage,         debug) {
    return {
        "ajax" : ajax,
        "baselib" : baselib,
        "localstorage" : localstorage,
        "debug" : debug
    };
    // the shim only extend JavaScript when needed, e.g. Object.create
});
```

在另一个包文件中引入通用models的例子。

```javascript
// models列表
// 这个目录下的models被广泛使用
// 在这个模块(object)中分组这些models
// 当build时优化性能和保持依赖关系。
define([ "models/branding", "models/section" ],
function (Branding,          Section) {
    return {
        "Branding" : Branding,
        "Section"  : Section
    };
});
```

#### 代码规范的简短说明

注意上面的例子中参数可能是大写或者小写字母开头。参数变量中*大写*开头的是*构造器(Constructors)*，*小写*开头的变量则可能是构造器创建的一个实例，或者一个不能*new*的object或function。

推荐约定是构造器使用首字母大写的驼峰式命名(CamelCase)，其它用首字母小写的驼峰式命名(camelCase)。

#### 组织模块代码时的常见陷阱

小心不要定义循环依赖。举个例子，一个公共*models*包(models.js)依赖项中列举了models目录下的文件
    define([ "models/branding", "models/section" ], function (branding, section)
    // ...
    return { "branding" : branding, "section", section }

然后另外的包引入了一个公用的model，可以像下面这样访问models.js返回的modes对象。
    define([ "models", "utils" ], function (models, utils) {
    var branding = models.branding, debug = utils.debug;

可能使用这种方式引入"model"一段时间之后就形成了习惯。然后你需要添加一个公用model,这个model继承自一个已定义的model。 然后陷阱就出现了，你会添加一个新的model到models目录下并且在model.js里添加引用：

    define([ "models/branding", "models/section", "models/section-b" ], function (branding, section)
    // ...
    return { "branding" : branding, "section", section, "section-b" : section-b }

然而，*models/section-b.js*文件里你定义了一个对model.js的依赖...

    define([ "models" ], function (models, utils) {
    var section = models.section;

上面这个错误就是在models.js的依赖项中添加了models/section-b，而section-b的定义中又有对model.js的依赖。这样就形成了循环依赖。会导致require.js加载超时的错误，但不会告诉你有循环依赖。

其它常见错误可以参考Require.js站点的[COMMON ERRORS](http://requirejs.org/docs/errors.html "RequireJS common errors page")页面。

#### 使用r.js执行构建

如果已经通过Node的npm安装过r.js...

    > npm install requirejs

就可以执行build了：

    > r.js -o app.build.js


##<a name="practicalrequirejs">实践：使用AMD和Require.js构建模块化的Backbone app</a>

在这一章中，将实践一下我们第一个Backbone和Require.js项目——如何构建一个模块化的Todo应用。这个应用可以添加todos,编辑todo项和清除已标记完成的todo项。更高级的实践，可以参考移动Backbone开发的部分。

完整代码在仓库的`practicals/modular-todo-app`目录下(感谢Thomas Davis和J&eacute;r&ocirc;me Gravel-Niquet)。另外我的一个业余项目[TodoMVC](https://github.com/addyosmani/todomvc)包含了AMD和非AMD版本的源代码。

**提示:** Thomas可能在某些方面讲述了更详细的实践经验[backbonetutorials.com](http://backbonetutorials.com)，但是这一章节我会讲到我认为是和核心的概念。

###概览

编写'模块化'Backbone应用时一个简单的过程。但是，如果选择AMD作为模块格式的话需要注意一些关键概念上的差异：

* 因为AMD不是JavaScript或者浏览器的原生标准，它需要使用脚本加载器(比如Require.js或者curl.js)来支持这种格式的组件和模块的定义。正如我们所看到的，使用AMD和Require.js的同时协助会有那么多的好处。
* Models, views, controllers和routers需要被包装成AMD格式。这样可以在Backbone应用中每个组件都清晰的管理依赖关系 (比如collections被一个view引入)，跟AMD的非Backbone模块一样。
* 非Backbone组件/模块(比如utilities或者helpers)同样也可以包装成AMD方式。鼓励尝试开发这些模块时可以被独立使用和测试，不依赖于Backbone代码， 这样可以增加它们的复用性。

我们回顾了下基本概念，现在我们开始开发这个应用。下面是这个app的结构，作为参考：

```
index.html
...js/
    main.js
    .../models
            todo.js
    .../views
            app.js
            todos.js
    .../collections
            todos.js
    .../templates
            stats.html
            todos.html
    ../libs
        .../backbone
        .../jquery
        .../underscore
        .../require
                require.js
                text.js
...css/
```

###页面标签

这个应用的页面标签非常的简单，分为三个主要部分：一个input输入部分用于创建新的todo(`create-todo`)，一个列表部分展示所有存在的项(也可以就地编辑) (`todo-list`)和一个概括信息部分显示有多少条项待完成(`todo-stats`)。

```
<div id="todoapp">

      <div class="content">

        <div id="create-todo">
          <input id="new-todo" placeholder="What needs to be done?" type="text" />
          <span class="ui-tooltip-top">Press Enter to save this task</span>
        </div>

        <div id="todos">
          <ul id="todo-list"></ul>
        </div>

        <div id="todo-stats"></div>

      </div>

</div>
```

教程的后面部分将重点聚焦在JavaScript实践上。

###配置选项

如果你已经看过前面关于AMD的章节，就会注意到需要明确定义Backbone模块(view, collection或其它模块)的每个依赖项有点冗长。不过这点可以优化。

为了简化应用中可能会引用到的通用路径，我们可以使用Require.js [配置对象](http://requirejs.org/docs/api.html#config)，它通常定义在一个顶级脚本文件中。配置对象有很多有用的功能，最实用是名称映射。命名map是一个基本的key:value值对，key是要用到的路径的别名，value则是真是的路径。

下面这段代码中，你会看到一些典型的常用命名映射表的例子：`backbone`，`underscore`，`jquery`，RequireJS `text`插件。

**main.js**

```javascript
require.config({
  baseUrl:'../',
  paths: {
    jquery: 'libs/jquery/jquery-min',
    underscore: 'libs/underscore/underscore-min',
    backbone: 'libs/backbone/backbone-optamd3-min',
    text: 'libs/require/text'
  }
});

require(['views/app'], function(AppView){
  var app_view = new AppView;
});
```

main.js文件末尾的`require()`完成载入和实例化应用的主view(`views/app.js`)。通常会看到它和配置对象包含在一个项目的顶级脚本文件中。

除了提供命名映射之外，配置对象还可以用于定义其它属性，比如`waitSeconds`——脚本加载的超时时间，`时区(locale)`, 如果你想加载i18n自定义语言包的话。`baseUrl`用于检索模块的路径。

更多关于配置对象的信息可以大胆免费的阅读[RequireJS docs](http://requirejs.org/docs/api.html#config)。


###模块化models, views和collections

在深入探索把Backbone组件包装成AMD之前，我们先来回顾下一个简单的无AMD的view。下面这个view监听里它的mode(一个Todo元素)的变化并且当用户编辑这个项时重新渲染。

```javascript
var TodoView = Backbone.View.extend({

    //... is a list tag.
    tagName:  "li",

    // Cache the template function for a single item.
    template: _.template($('#item-template').html()),

    // The DOM events specific to an item.
    events: {
      "click .check"              : "toggleDone",
      "dblclick div.todo-content" : "edit",
      "click span.todo-destroy"   : "clear",
      "keypress .todo-input"      : "updateOnEnter"
    },

    // The TodoView listens for changes to its model, re-rendering. Since there's
    // a one-to-one correspondence between a **Todo** and a **TodoView** in this
    // app, we set a direct reference on the model for convenience.
    initialize: function() {
      this.model.on('change', this.render, this);
      this.model.view = this;
    },
    ...
```

在脚本中通常通过一个ID(或者其它选择器)获取模板的引用并获取它的内容。显然模板含蓄的定义在页面标签中。下面是前面引用的'内嵌'版本的模板：

```
<script type="text/template" id="item-template">
      <div class="todo <%= done ? 'done' : '' %>">
        <div class="display">
          <input class="check" type="checkbox" <%= done ? 'checked="checked"' : '' %> />
          <div class="todo-content"></div>
          <span class="todo-destroy"></span>
        </div>
        <div class="edit">
          <input class="todo-input" type="text" value="" />
        </div>
      </div>
</script>
```

这里模板本身没有问题，一旦我们要开发大应用需要很多模板时，把他们都包含在页面内载入就会变得无法管理和损失性能。需要立马解决掉这个问题。

现在我们来看下AMD版本的view。正如前面讨论的，'module'使用AMD的`define()`来包裹， 可以指定view引入的依赖项。使用映射路径'jquery'等。简化通用依赖的引用并且依赖项的实例被映射到本地变量(比如'jquery'`$`)。

**views/todos.js**

```javascript
define([
  'jquery',
  'underscore',
  'backbone',
  'text!templates/todos.html'
  ], function($, _, Backbone, todosTemplate){
  var TodoView = Backbone.View.extend({

    //... is a list tag.
    tagName:  "li",

    // Cache the template function for a single item.
    template: _.template(todosTemplate),

    // The DOM events specific to an item.
    events: {
      "click .check"              : "toggleDone",
      "dblclick div.todo-content" : "edit",
      "click span.todo-destroy"   : "clear",
      "keypress .todo-input"      : "updateOnEnter"
    },

    // The TodoView listens for changes to its model, re-rendering. Since there's
    // a one-to-one correspondence between a **Todo** and a **TodoView** in this
    // app, we set a direct reference on the model for convenience.
    initialize: function() {
      this.model.on('change', this.render, this);
      this.model.view = this;
    },

    // Re-render the contents of the todo item.
    render: function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.setContent();
      return this;
    },

    // Use `jQuery.text` to set the contents of the todo item.
    setContent: function() {
      var content = this.model.get('content');
      this.$('.todo-content').text(content);
      this.input = this.$('.todo-input');
      this.input.on('blur', this.close);
      this.input.val(content);
    },
    ...
```

从维护的角度来看，这版本的view没有什么逻辑上的不同，除了获取模板的方式之外。

使用Require.js text插件(依赖项为`text`)，可以把之前看到的模板保存在外部文件中(todos.html)。

**templates/todos.html**

```html
<div class="todo <%= done ? 'done' : '' %>">
    <div class="display">
      <input class="check" type="checkbox" <%= done ? 'checked="checked"' : '' %> />
      <div class="todo-content"></div>
      <span class="todo-destroy"></span>
    </div>
    <div class="edit">
      <input class="todo-input" type="text" value="" />
    </div>
</div>
```

这里就没有必要通过IDs来或去模板内容了，模板映射到了一个本地变量上(上面代码中的`todosTemplate`)。然后传给Underscore.js模板渲染方法`_.template()`，跟从script模板标签获取之后的处理方式一样。

接下来，我们看下如何定义models作为依赖项可以被拉进collections。这里有一个AMD兼容的model模块，有2个默认值：一个`content`属性是Todo item的内容和一个布尔值`done`，标识这个项是否已完成。

**models/todo.js**

```javascript
define(['underscore', 'backbone'], function(_, Backbone) {
  var TodoModel = Backbone.Model.extend({

    // Default attributes for the todo.
    defaults: {
      // Ensure that each todo created has `content`.
      content: "empty todo...",
      done: false
    },

    initialize: function() {
    },

    // Toggle the `done` state of this todo item.
    toggle: function() {
      this.save({done: !this.get("done")});
    },

    // Remove this Todo from *localStorage* and delete its view.
    clear: function() {
      this.destroy();
      this.view.remove();
    }

  });
  return TodoModel;
});
```

根据其它类型的依赖，我们可以容易的把model模块映射到本地变量(这个例子中是`Todo`)，这样就可以被作为`TodosCollection`的model使用。这个collection同样支持简单的`done()`过滤，筛选出已完成的Todo项，和一个`remaining()`过滤，筛选出仍在进行的项。

**collections/todos.js**

```javascript
define([
  'underscore',
  'backbone',
  'libs/backbone/localstorage',
  'models/todo'
  ], function(_, Backbone, Store, Todo){

    var TodosCollection = Backbone.Collection.extend({

    // Reference to this collection's model.
    model: Todo,

    // Save all of the todo items under the `"todos"` namespace.
    localStorage: new Store("todos"),

    // Filter down the list of all todo items that are finished.
    done: function() {
      return this.filter(function(todo){ return todo.get('done'); });
    },

    // Filter down the list to only todo items that are still not finished.
    remaining: function() {
      return this.without.apply(this, this.done());
    },
    ...
```

另外为了让用户在view中添加新的Todo项(作为models插入到collection中)，同时也期望显示有多少条项已完成和待完成。上面那个collection中已经定义了这样的filter，所以可以在主view中使用它们。

**views/app.js**

```javascript
define([
  'jquery',
  'underscore',
  'backbone',
  'collections/todos',
  'views/todos',
  'text!templates/stats.html'
  ], function($, _, Backbone, Todos, TodoView, statsTemplate){

  var AppView = Backbone.View.extend({

    // Instead of generating a new element, bind to the existing skeleton of
    // the App already present in the HTML.
    el: $("#todoapp"),

    // Our template for the line of statistics at the bottom of the app.
    statsTemplate: _.template(statsTemplate),

    // ...events, initialize() etc. can be seen in the complete file

    // Re-rendering the App just means refreshing the statistics -- the rest
    // of the app doesn't change.
    render: function() {
      var done = Todos.done().length;
      this.$('#todo-stats').html(this.statsTemplate({
        total:      Todos.length,
        done:       Todos.done().length,
        remaining:  Todos.remaining().length
      }));
    },
    ...
```
上面我们使用到了这个项目中的第二个模板，`templates/stats.html`映射到`statsTemplate`，用于渲染所有`完成`和`待完成` 状态。原理就是给模板传入Todos collection的lenth(`Todos.length` - 已创建的todo项数量) ，已完成的项的数量(`Todos.done().length`)和待完成项的数量(`Todos.remaining().length`)。

`statsTemplate`模板的内容在下面。没什么复杂，不过这里用了三元表达式来输出是"item"还是"items"。

```
<% if (total) { %>
        <span class="todo-count">
          <span class="number"><%= remaining %></span>
          <span class="word"><%= remaining == 1 ? 'item' : 'items' %></span> left.
        </span>
      <% } %>
      <% if (done) { %>
        <span class="todo-clear">
          <a href="#">
            Clear <span class="number-done"><%= done %></span>
            completed <span class="word-done"><%= done == 1 ? 'item' : 'items' %></span>
          </a>
        </span>
      <% } %>
```

Todo app剩下的代码主要是处理用户和应用的事件，不过目前已基本包含了这部分实践的核心概念。

想分析整个应用如何联合起来可以浏览[代码库](https://github.com/addyosmani/backbone-fundamentals/tree/master/practicals/modular-todo-app) 。希望对你有用。

**提示:** 虽然这第一部分实践内容没有使用到build配置文件和Require.js优化器，我们将在构建移动Backbone应用的章节使用到。


##<a name="decouplingbackbone">中介者(Mediator)模式和门面(Facade)模式解耦Backbone</a>

这一节将会讨论我在[大型JavaScript应用开发](http://addyosmani.com/largescalejavascript)这篇文章中讲到的一些概念。

*之后，你可能会对[Aura](http://github.com/addyosmani/aura)感兴趣—— - 我的一个比较流行的基于widget的  Backbone.js扩展框架，它是基于这章节我们会讲到的一些概念而建立的。*

### 概要

站在一个高角度来看，一个应用的架构应该是这样：

* **高度解耦**: 鼓励模块仅公开和订阅感兴趣的事件而不是直接互相通讯。这有利于构建出来的应用每个单元的代码都不会高度的粘连在一起(解耦)，并且更容易重用。
* **支持模块级的安全性**: 凭借什么模块只能执行它们被允许的行为。在Javascript应用中应用安全是一块经常被忽略的区域，但是可以非常容易通过灵活的方式实现。
* **支持故障转移**: 当某些部分模块失效时应用还可以平坦地运行。典型的例子就是GMail聊天部件。想象一下可以有一种方式构建应用，当页面中某个部件失败时(比如chat)，应用(mail)的剩余部分还可以继续运行不受影响。

这中架构在过去已经被很多公司所应用，包括Yahoo! (他们模块化的首页——Nicholas Zakas有相关的[谈论](http://www.youtube.com/watch?v=vXjVFPosQHw)) 和AOL应用到一些我们即将推出的项目。


需要三种设计模式可以实现这种架构：

* **模块模式**: 用于封装第一无二的代码块，function和变量可以为公开或者私有。('私有'只是模仿概念，当然在JavaScript中没有真正的私有)
* **中介者模式**: 用于当模块之间的通讯变得复杂时，但是也需要好的定义。如果出现一个系统，代码中模块之间有很多关系，此时就可能需要一个中央控制点，这个就非常适合使用这个模式。
* **门面模式**: 用于给一块庞大的代码提供方便的高层次的接口，影藏其内部的复杂性。

它们在这种架构中对应的角色是：

* **模块**: 模块定义基本上有2个概念。由AMD作为模块包装器，从技术角度来讲，每个model，view和collection都可以认为是一个模块。然而我们模块的概念是不仅限于MVC/MV*的代码块。后面，这种'模块'主要与广播和订阅感兴趣的事件而不是相互之间直接通讯相关。它们可能通过中介者模式实现。
* **中介者**: 中介者会有不同的角色，这要看你怎么期望如何去实现它。在我写的文章上中，我提到用它作为模块管理，它具有开启和停止模块的能力，不过使用Backbone之后，我认为它可以简化降级为中央'控制器(controller)'的角色，提供发布/订阅(pub/sub) 的能力就够了。当然我们可以全力以赴构建一个模块系统支持模块的启动，停止，暂停等等，不过这已超出这章的范围。
* **门面**: 这个扮演的是安全的中间层，提取应用的核心(中介者，Mediator)并且把从模块过来的消息回传给中介者，这样他们就不用直接接触了。门面同样执行应用的安全保障；它要根据配置(permissions.js, 后面我们会提到)检查模块的事件通知，确保来自模块的请求传入的行为是允许执行的。


### 实践

作为这章的实践部分，我们将使用前面提到的这3中模式扩展Backbone Todo应用。

这个应用被分解成了AMD模块，把Backbone模块都转换成应用级的模块。view给其它部分发布感兴趣的事件，模块可以订阅这些事件通知。

模块的所有订阅都通过一个门面(或者沙箱)。检查订阅者的名称和它尝试订阅的'通道/通知(channel/notification)'。如果一个通道没有被许可订阅(通过permissions.js确定), 那么这个订阅就被禁止。


**中介者**

代码在`aura/mediator.js`

下面是一个非常简单的额AMD包装的中介者模式实现，基于Ryan Florence之前的工作。他接受传入一个object，给它附加`publish()`和`subscribe()`方法。在一个大的应用中，中介者可能包含其它工具库，比如初始化处理器，启动和停止模块。为作示例，下面2个方法可以作为很好的说明。

```javascript
define([], function(obj){

  var channels = {};
  if (!obj) obj = {};

  obj.subscribe = function (channel, subscription) {
    if (!channels[channel]) channels[channel] = [];
    channels[channel].push(subscription);
  };

  obj.publish = function (channel) {
    if (!channels[channel]) return;
    var args = [].slice.call(arguments, 1);
    for (var i = 0, l = channels[channel].length; i < l; i++) {
      channels[channel][i].apply(this, args);
    }
  };

  return obj;

});
```


**门面**

代码在`aura/facade.js`

下面看下门面模式的实现。传统门面模式在JavaScript可能会向下面这样：

```javascript

var module = (function() {
    var _private = {
        i:5,
        get : function() {
            console.log('current value:' + this.i);
        },
        set : function( val ) {
            this.i = val;
        },
        run : function() {
            console.log('running');
        },
        jump: function(){
            console.log('jumping');
        }
    };
    return {
        facade : function( args ) {
            _private.set(args.val);
            _private.get();
            if ( args.run ) {
                _private.run();
            }
        }
    }
}());

module.facade({run: true, val:10});
//outputs current value: 10, running
```

它实际上市模块模式的一种变体，API可以完全影藏其真实实现，返回更简洁，而不是简单的返回一个支持方法的接口。把尽可能复杂的逻辑影藏在背后，给用户端的是体验始终是简单的API，他们只需要传入选项即可(注意我们的例子中是如何只返回一个抽象出来的方法)。这是一种提供简单接口调用的很好的方式。

也就是说，为了保持简单，我们AMD兼容的门面实现将有点像一个代理。模块将直接通过门面来访问中介者的`publish()`和`subscribe()`方法，不管怎么样，他们不会这么直接与中介者接触。这样门面可以提供应用级的对订阅和通知的校验。

我们也可以实现一个简单，但是灵活的权限检查器(如下所示)，对应权限配置验证订阅是否被允许。


```javascript
define([ "../aura/mediator" , "../aura/permissions" ], function (mediator, permissions) {

    var facade = facade || {};

    facade.subscribe = function(subscriber, channel, callback){

        // Note: Handling permissions/security is optional here
        // The permissions check can be removed
        // to just use the mediator directly.

        if(permissions.validate(subscriber, channel)){
            mediator.subscribe( channel, callback );
        }
    }

    facade.publish = function(channel){
        mediator.publish( channel );
    }
    return facade;

});
```

**权限**

代码在`aura/permissions.js`

在我们的权限配置中，支持检查订阅请求，确定他们是否允许清除。给应用强制加了一个灵活的安全层。

为了形象的了解其工作原理，考虑改变下说法，许可->渲染完成->todo计数器为false。这将完全禁止应用渲染或者显示对左边todo项计数的组件(因为他们不允许订阅那个事件通知)。其它部分可以正常运行。

下面是一个简化的示例，但可以想象一下在一个庞大的app中其强大的能力。

```javascript
define([], function () {

    // Permissions

    // A permissions structure can support checking
    // against subscriptions prior to allowing them
    // to clear. This enforces a flexible security
    // layer for your application.

    var permissions = {

        newContentAvailable: {
            contentUpdater:true
        },

        endContentEditing:{
            todoSaver:true
        },

        beginContentEditing:{
            editFocus:true
        },

        addingNewTodo:{
            todoTooltip:true
        },

        clearContent:{
            garbageCollector:true
        },

        renderDone:{
            todoCounter:true //switch to false to see what happens :)
        },

        destroyContent:{
            todoRemover:true
        },

        createWhenEntered:{
            keyboardManager:true
        }

    };

    permissions.validate = function(subscriber, channel){
        var test = permissions[channel][subscriber];
        return test===undefined? false: test;
    };

    return permissions;

});
```



**订阅者**

代码在`subscribers.js`

订阅者'模块'通过门面与中介者通讯，并且当指定的事件发布通知时执行相应的操作。

比如，当一个用户输入一项todo内容并'回车'时，应用发布一个消息通知告诉2件事：a) 有一项新的todo项可用了，b) 新的项目文本内容是X。然后就是让其它部分做任何想做的事情了。

要把Backbone应用升级为以使用发布/订阅(pub/sub)为主，你最终可能会做一些工作，把与特定view相关的逻辑转移到外围的模块。

以`todoSaver`为例—— 它的职责是一旦'notificationName'调用'newContentAvailable'被处罚则保存新的todo到model。'newContentAvailable'在上一个例子权限结构中可以找到。如果我想阻止订阅者订阅这个消息通知，只要把它设为flase就可以了。

此外，这是一个极其简化的获取权限结构的方式，但是无论在什么时候都能有效的控制应用的某些部分是否可以被指定的模块访问。

```javascript
define(["jquery", "underscore", "aura/facade"],
function ($, _, facade) {

    // Subscription 'modules' for our views. These take the
    // the form facade.subscribe( subscriberName, notificationName , callBack )

    // Update view with latest todo content
    // Subscribes to: newContentAvailable

    facade.subscribe('contentUpdater', 'newContentAvailable', function (context) {
        var content = context.model.get('content');
        context.$('.todo-content').text(content);
        context.input = context.$('.todo-input');
        context.input.bind('blur', context.close);
        context.input.val(content);
    });


    // Save models when a user has finishes editing
    // Subscribes to: endContentEditing
    facade.subscribe('todoSaver','endContentEditing', function (context) {
        try {
            context.model.save({
                content: context.input.val()
            });
            context.$el.removeClass("editing");
        } catch (e) {
            //console.log(e);
        }
    });


    // Delete a todo when the user no longer needs it
    // Subscribes to: destroyContent
    facade.subscribe('todoRemover','destroyContent', function (context) {
        try {
            context.model.clear();
        } catch (e) {
            //console.log(e);
        }
    });


    // When a user is adding a new entry, display a tooltip
    // Subscribes to: addingNewTodo
    facade.subscribe('todoTooltip','addingNewTodo', function (context, todo) {
        var tooltip = context.$(".ui-tooltip-top");
        var val = context.input.val();
        tooltip.fadeOut();
        if (context.tooltipTimeout) clearTimeout(context.tooltipTimeout);
        if (val == '' || val == context.input.attr('placeholder')) return;
        var show = function () {
                tooltip.show().fadeIn();
            };
        context.tooltipTimeout = _.delay(show, 1000);
    });


    // Update editing UI on switching mode to editing content
    // Subscribes to: beginContentEditing
    facade.subscribe('editFocus','beginContentEditing', function (context) {
        context.$el.addClass("editing");
        context.input.focus();
    });


    // Create a new todo entry
    // Subscribes to: createWhenEntered
    facade.subscribe('keyboardManager','createWhenEntered', function (context, e, todos) {
        if (e.keyCode != 13) return;
        todos.create(context.newAttributes());
        context.input.val('');
    });



    // A Todo and remaining entry counter
    // Subscribes to: renderDone
    facade.subscribe('todoCounter','renderDone', function (context, Todos) {
        var done = Todos.done().length;
        context.$('#todo-stats').html(context.statsTemplate({
            total: Todos.length,
            done: Todos.done().length,
            remaining: Todos.remaining().length
        }));
    });


    // Clear all completed todos when clearContent is dispatched
    // Subscribes to: clearContent
    facade.subscribe('garbageCollector','clearContent', function (Todos) {
        _.each(Todos.done(), function (todo) {
            todo.clear();
        });
    });


});
```

以上就是这个小节，如果你对上面的一些概念感兴趣可以看下我在Jquery首脑会议上有关大规模js应用的[幻灯片](http://addyosmani.com/blog/large-scale-javascript-application-architecture/)， 或者更早的[文章](http://addyosmani.com/largescalejavascript)。


##<a name="pagination">分页Backbone.js请求和Collections</a>

分页是做web应用无处不在的问题。可能大部分都会使用后端的API然后用沉重的JavaScript去调用。

这里，我们将使用一组我为Backbone.js写的**分页组件**，对你解决此类问题应该有帮助。他们是[Backbone.Paginator](http://github.com/addyosmani/backbone-paginator)的一部分。


当使用像Backbone.js这类框架开发时，一般会遇到下面这3种情况的分页：

**请求服务器层(API)**- 比如查询包含'Brendan'的期刊——如果有5,000个结果，每页只显示20条(那就有250页可供我们跳转了)。

这里其实有很多问题需要处理，比如保持其它URL参数(比如分类，查询，排序)在UI中能让用户定制搜索结果。还需要有一种清晰的方式能让view随着分页的切换而更新(比如首页、末页、下一页、上一页、1、2、3)，管理每页需要显示的数量等等。

**更多的是在客户端对返回的数据进行分页——** 比如返回包含100条结果的JSON数据。但是通过一个可导航的UI在浏览器中只展示20条数据。

与通过请求的问题类似，客户端分页也有其难点，比如重新导航(下一页，上一页，1，2，3)，分类，排序，切换每页显示的条数等等。

**无限结果** ——像Facebook这种服务，其内容的数字分页被替换成'加载更多'和 '查看更多'按钮。通常触发这个按钮会抓取下一页内容，不过展示结果不会替换上一页内容而是追加进去。

将结果追加到view的请求分页就是一个'无限'分页。

**现在我们来看下能从这一块得出什么结论：**

*分页器是一组自以为是的组件，使用Backbone.js对数据集合进行分页。它即提供对服务器进行分页请求（API)同时也要支持单次加载完整数据进行分页 ，更进一步也期望可以对N个结果的集合在一个view中分成M页。*


## 分页器组成

Backbone.Paginator主要支持2个分页组件：

* **Backbone.Paginator.requestPager**: 客户端通过请求服务端的API进行分页。

* **Backbone.Paginator.clientPager**: 从服务器端获取数据之后在UI上进行分页 (比如返回60条结果，每页20条则分成了3页)。


## 在线例子

线上两个分页组件的列子都使用了Netflix API。

* [Backbone.Paginator.requestPager()](http://addyosmani.github.com/backbone.paginator/examples/netflix-request-paging/index.html)
* [Backbone.Paginator.clientPager()](http://addyosmani.github.com/backbone.paginator/examples/netflix-client-paging/index.html)
* [Infinite Pagination (Backbone.Paginator.requestPager())](http://addyosmani.github.com/backbone.paginator/examples/netflix-infinite-paging/index.html)
* [Diacritic Plugin](http://addyosmani.github.com/backbone.paginator/examples/google-diacritic/index.html)

##Paginator.requestPager

在这一小节我们来实际应用下requestPager。

####1. 创建一个新的分页collection
首先，使用`Backbone.Paginator.requestPager()`定义一个分页collection：

```javascript
var PaginatedCollection = Backbone.Paginator.requestPager.extend({
```
####2: 跟平常一样设置collection的model

在collection中，跟正常情况一样根据服务器提供data的URL(或者base URL)指定collection使用的model。

```javascript
        model: model,
```
####3. 配置base URL和请求类型

我们需要设置一个base URL。请求的'type`默认是`GET`，`dataType`默认是`jsonp`为了可以跨域。

```javascript
    paginator_core: {
      // the type of the request (GET by default)
      type: 'GET',

      // the type of reply (jsonp by default)
      dataType: 'jsonp',

      // the URL (or base URL) for the service
      url: 'http://odata.netflix.com/Catalog/People(49446)/TitlesActedIn?'
    },
```

####4. 配置库如何显示结果

我们需要告诉组件库每页需要显示多少条结果，之类...

```javascript
    paginator_ui: {
      // API允许访问的最小页码
      firstPage: 0,

      // 分页器开始的页码
      // (同时也是分页器当前的页码)
      currentPage: 0,

      //每页条数
      perPage: 3,

      //API没有返回总页码时的一个默认总页数。
      totalPages: 10
    },
```

####5. 配置服务器请求的参数

通常有base URL还不够，可以传更多参数给服务器。
注意，你可以使用function来处理value的返回，也可以引用`paginator_ui`中指定的值。

```javascript
    server_api: {
      // the query field in the request
      '$filter': '',

      // number of items to return per request/page
      '$top': function() { return this.perPage },

      // how many results the request should skip ahead to
      // customize as needed. For the Netflix API, skipping ahead based on
      // page * number of results per page was necessary.
      '$skip': function() { return this.currentPage * this.perPage },

      // field to sort by
      '$orderby': 'ReleaseYear',

      // what format would you like to request results in?
      '$format': 'json',

      // custom parameters
      '$inlinecount': 'allpages',
      '$callback': 'callback'
    },
```

####6. 最后，配置Collection.parse()

最后我们需要做的事就是配置collection的`parse()`方法。我们要确保返回JSON响应数据的正确部分给collection填充，下面例子是`response.d.results` (Netflix API)。

你可能注意到我们把`this.totalPages`的值设为API返回数据的总页数。它可用于定义当前/最后页请求的最大可用页数，这样可以在UI上清晰的显示。同样用于决定点击是否有效，点击'下一页'按钮是否需要请求。

```javascript
        parse: function (response) {
            // Be sure to change this based on how your results
            // are structured (e.g d.results is Netflix specific)
            var tags = response.d.results;
            //Normally this.totalPages would equal response.d.__count
            //but as this particular NetFlix request only returns a
            //total count of items for the search, we divide.
            this.totalPages = Math.floor(response.d.__count / this.perPage);
            return tags;
        }
    });

});
```

####便利方法：

为了方便，下面这些方法是便于在view中与`requestPager`交互：

* **Collection.goTo( n, options )** - 跳转到指定页
* **Collection.requestNextPage( options )** - 跳转到下一页
* **Collection.requestPreviousPage( options )** - 跳转到上一页
* **Collection.howManyPer( n )** - 设置每页显示的数量

**requestPager** collection的`.goTo()`, `.requestNextPage()`和`.requestPreviousPage()`都是[Backbone Collection.fetch() method](http://documentcloud.github.com/backbone/#Collection-fetch)的扩展。所以，他们都可以接受相同的option参数对象。

这个option对象可以使用`success`和`error`参数传入一个function，服务器响应之后执行。

```javascript
Collection.goTo(n, {
  success: function( collection, response ) {
    // 调用服务器请求成功
  },
  error: function( collection, response ) {
    // 调用服务器请求失败
  }
});
```

可以使用[jqXHR](http://api.jquery.com/jQuery.ajax/#jqXHR)返回的这些方法来管理回调。

```javascript
Collection
  .requestNextPage()
  .done(function( data, textStatus, jqXHR ) {
    // called is server request success
  })
  .fail(function( data, textStatus, jqXHR ) {
    // called if server request fail
  })
  .always(function( data, textStatus, jqXHR ) {
    // do something after server request is complete
  });
});
```

如果想把返回的models添加到当前的collection，而不是替代collection的内容，可以传入`{add: true}`。

```javascript
Collection.requestPreviousPage({ add: true });
```

##Paginator.clientPager

`clientPager`跟`requestPager`类似，除了配置值是在UI级别影响已返回的数据分页。虽然没有显示，很多UI逻辑也与`clientPager`相关联。可以看'views/clientPagination.js'里的例子。

####1. 根据model和URL创建一个分页collection
创建一个`Backbone.Paginator.clientPager` collection：

```javascript
    var PaginatedCollection = Backbone.Paginator.clientPager.extend({

        model: model,
```

####2. 配置base URL和请求的类型

与requestPager的例子一致。

```javascript
    paginator_core: {
      // the type of the request (GET by default)
      type: 'GET',

      // the type of reply (jsonp by default)
      dataType: 'jsonp',

      // the URL (or base URL) for the service
      url: 'http://odata.netflix.com/v2/Catalog/Titles?&'
    },
```

####3. 配置如何显示结果

与requestPager例子同理。

```javascript
    paginator_ui: {
      // the lowest page index your API allows to be accessed
      firstPage: 1,

      // which page should the paginator start from
      // (also, the actual page the paginator is on)
      currentPage: 1,

      // how many items per page should be shown
      perPage: 3,

      // a default number of total pages to query in case the API or
      // service you are using does not support providing the total
      // number of pages for us.
      // 10 as a default in case your service doesn't return the total
      totalPages: 10
    },
```

####4. 配置传递给服务器的参数

与requestPager例子同理。

```javascript
    server_api: {
      // the query field in the request
      '$filter': 'substringof(\'america\',Name)',

      // number of items to return per request/page
      '$top': function() { return this.perPage },

      // how many results the request should skip ahead to
      // customize as needed. For the Netflix API, skipping ahead based on
      // page * number of results per page was necessary.
      '$skip': function() { return this.currentPage * this.perPage },

      // field to sort by
      '$orderby': 'ReleaseYear',

      // what format would you like to request results in?
      '$format': 'json',

      // custom parameters
      '$inlinecount': 'allpages',
      '$callback': 'callback'
    },
```

####5. 最后配置Collection.parse()

与requestPager例子同理。
```javascript
    parse: function (response) {
            var tags = response.d.results;
            return tags;
        }

    });
```

####便捷方法：

`clientPager`有下面这些方法在分页之间跳转，与requestPager的例子相似：

* **Collection.goTo(n)**
* **Collection.previousPage()**
* **Collection.nextPage()**
* **Collection.howManyPer(n)**
* **Collection.setSort(sortBy, sortDirection)** - 当前view更新排序。排序是自动的，可以对数字排序(尽管是被当成字符串)。
* **Collection.setFilter(filterFields, filterWords)** - 过滤当前view。过滤支持多个词，没有特定顺序，所有有完整文本搜索能力。同样，也可以传入一个或多个model，都可以进行过滤。最后一个选项是传入一个包含比较放和规则的对象。现在只有```levenshtein```方法可用。

```javascript
  this.collection.setFilter(
    {'Name': {cmp_method: 'levenshtein', max_distance: 7}}
    , "Amreican P" // Note the switched 'r' and 'e', and the 'P' from 'Pie'
  );
```

同样注意，levenshtein插件可以```useLevenshteinPlugin```变量加载和启用。

最后：Levenshtein比较返回两个字符串间的```距离(distance)```。它不允许*搜索*冗长的文本。

两个字符串之间的距离就是要使2个字符串相等需要添加，移除或者移动到左边或者右边的字符个数。

比如比较"Something"和"This is a test that could show something"会返回31，要比比较"Something"和"ABCDEFG"(9)大。

仅在短文本(titles, names, 等)中使用levenshtein。


* **Collection.doFakeFilter(filterFields, filterWords)** - 返回执行一个虚拟的```Collection.setFilter```调用后models的计数。

* **Collection.setFieldFilter(rules)** - 对model的每个值应用`rules`进行过滤。示例：有一个book的collection ，book有'release year'和'author'属性。你可以过滤出版时间在1999到2003间的书。然后可添加另外一个'规则'继续过滤这些书，作者名称以'A'开头的。规则可以是：function, required, min, max, range, minLength, maxLength, rangeLength, oneOf, equalTo, pattern。


```javascript

  my_collection.setFieldFilter([
    {field: 'release_year', type: 'range', value: {min: '1999', max: '2003'}},
    {field: 'author', type: 'pattern', value: new RegExp('A*', 'igm')}
  ]);

  //Rules:
  //
  //var my_var = 'green';
  //
  //{field: 'color', type: 'equalTo', value: my_var}
  //{field: 'color', type: 'function', value: function(field_value){ return field_value == my_var; } }
  //{field: 'color', type: 'required'}
  //{field: 'number_of_colors', type: 'min', value: '2'}
  //{field: 'number_of_colors', type: 'max', value: '4'}
  //{field: 'number_of_colors', type: 'range', value: {min: '2', max: '4'} }
  //{field: 'color_name', type: 'minLength', value: '4'}
  //{field: 'color_name', type: 'maxLength', value: '6'}
  //{field: 'color_name', type: 'rangeLength', value: {min: '4', max: '6'}}
  //{field: 'color_name', type: 'oneOf', value: ['green', 'yellow']}
  //{field: 'color_name', type: 'pattern', value: new RegExp('gre*', 'ig')}

```

* **Collection.doFakeFieldFilter(rules)** - 翻译执行```Collection.setFieldFilter```虚拟调用之后的models计数。

####实现提示：

可以在```View```用一些变量来代表分页器的实际状态。

```totalUnfilteredRecords``` - 结果记录的条数，包括以任何方式过滤掉的结果。(只在 ```clientPager```有效)

```totalRecords``` - 结果记录条数。

```currentPage``` - 分页器当前的页码。

```perPage``` - 分页器每页显示的结果条数。

```totalPages``` - 总页数。

```startRecord``` - 当前页显示的第一条记录的位置(比如2000条记录中的第41到50条) (只在```clientPager```有效)

```endRecord``` - 当前页显示的最后一条记录的位置(同上)

## 插件

**Diacritic.js**

这个插件用于Backbone.Paginator把分隔符(`´`, `˝`, `̏`, `˚`,`~`等.)替换与他们相近的字符。

要启用插件，把`this.useDiacriticsPlugin`设为true：

```javascript
Paginator.clientPager = Backbone.Collection.extend({

    // Default values used when sorting and/or filtering.
    initialize: function(){
      this.useDiacriticsPlugin = true; // use diacritics plugin if available
    ...
```



 [1]: http://github.com/addyosmani/backbone.paginator
 [2]: http://addyosmani.github.com/backbone.paginator/
 [3]: http://addyosmani.github.com/backbone.paginator/examples/netflix-request-paging/index.html
 [4]: http://addyosmani.github.com/backbone.paginator/examples/netflix-client-paging/index.html
 [5]: http://addyosmani.github.com/backbone.paginator/examples/netflix-infinite-paging/index.html
 [6]: http://github.com/addyosmani/backbone.paginator/issues
 [7]: https://github.com/cowboy/grunt


##Backbone & jQuery Mobile

###解决路由冲突

当使用jQuery Mobile开发Backbone应用时开发人员首先面对的主要问题就是这2个框架都有他们自己的方式来处理应用的导航(navigation)。

Backbone提供`Backbone.Router`以明确的方式定义定制化的导航路由，而jQuery Mobile鼓励使用URL hash fragments在同一个文档中引用独立的'pages'或者views。jQuery Mobile同时也支持自动引入通过XHR调用获取的外部内容，这就意味着这里面有相当多的跨框架混乱，当一个连接指向'#photo/id'时到底该做什么。

已经有人提出一些方案解决此问题，包括手动修补Backbone或者Backbone。我不太赞同这种做法，因为当框架有新版本发布时又需要进行手动修补。

同样也有[jQueryMobile router](https://github.com/azicchetti/jquerymobile-router)，尝试用另一种方法来解决此问题，不过我觉得我提出的方案即简单又可以无需对框架做扩展它们也可以和平共处。我的方法就是阻止其中一个框架监听hash change，这样就可以完全依靠另一个框架(比如`Backbone.Router`)来专门处理。

如果让jQuery Mobile这么做可以设置： 

```javascript
$.mobile.hashListeningEnabled = false;
```

放在其它所有初始化代码之前。

我是通过一些jQuery Mobile评论发现此方法的，并没有在官方文档里写明。不过非常高兴看到 http://jquerymobile.com/test/docs/api/globalconfig.html这里有更多细节信息。

如果我们阻止jQuery Mobile监听URL hash change的话，接下来的问题就是，如何继续使用内置的转换和效果支持在文档内切换到其它部分？这是一个非常好的问题，可以通过`$.mobile.changePage()`来解决：

```javascript
var url = '#about',
    effect = 'slideup',
    reverse = false,
    changeHash = false;

$.mobile.changePage( url , { transition: effect}, reverse, changeHash );
```

上面例子中，`url`可以引用一个URL或者一个要跳转的hash标识，`effect`是页面视图切换是的动画效果，最后2个参数 标识转换动画的方向(`reverse`)及是否更新地址栏URL的hash(`changeHash`)。对于后者，我把它设为false，避免两个地方来管理hash的更新，不过你把它设为true也没有问题。

**提示：** 更多关于如何解决jQuery Mobile Router插件与Backbone一起工作的问题，可以阅读[https://github.com/Filirom1/jquery-mobile-backbone-requirejs](https://github.com/Filirom1/jquery-mobile-backbone-requirejs)。


###实践：一个使用jQuery Mobile的Backbone, Require.js/AMD app

**提示：** 这部分内容的代码在`practicals/modular-mobile-app`。

###开始

如果你觉得[Backbone基本原理](http://msdn.microsoft.com/en-us/scriptjunkie/hh377172.aspx)还不错，你可能会对你想要做的一个app开始有个粗略的构想，开始考虑你的应用架构。理想上，你会想逻辑上做分离，将来维护时就更加简单。

**命名空间**

这个应用我选择嵌套的命名空间模式。只要正确实现，就可以清晰的定义app里的元素，views，其它模块等等。这段初始化结构是个包含应用默认值很好的位置(除非你更喜欢在一个独立的文件中维护)。


```javascript
window.mobileSearch = window.mobileSearch || {
    views: {
        appview: new AppView()
    },
    routers:{
        workspace:new Workspace()
    },
    utils: utils,
    defaults: {
        resultsPerPage: 16,
        safeSearch: 2,
        maxDate:'',
        minDate:'01/01/1970'
    }
}
```

**Models**

在Flickly应用中，至少有2个唯一型数据需要映射成model——搜索结果和个人照片，两者都包含额外的元数据，照片标题。如果把它简化，搜索结果实际上是按特定顺序的一组照片，所以应用只需要：

* 一个单独的model(照片或者'结果'实体)
* 一个搜索结果集合(collection)(包含一组结果实体)
* 一个照片集合(collection)(包含一个或多个结果实体)用于个人照片或者包含多于一张图片的照片。

**Views**

我们需要的view包括一个application view,搜索结果view,和一个photo view。单页应用中没有动态元素的静态view(比如'about'页面)可以不依赖于Backbone非常简单的创建出来。

**Routers**

有下面一些路由需要考虑：

* 基本的搜索查询`#search/kiwis`
* 带参数的搜索查询(比如排序，分页) `#search/kiwis/srelevance/p7`
* 获取指定photo `#photo/93839`
* 一个默认路由(没有参数传入`)


这篇教程将做简短的扩展以包含demo应用的完整内容。同时，也请看下practicals目录下完整程序示范了前面提到的Backbone和jQuery Mobile的router解决方案。


###jQuery Mobile: 超越移动应用开发

我看到的大多数jQM apps都是以给用户提供移动设备体验为目的而开发的。这是这个框架开发出来既定的目的，从根本上说没有什么错误，但是开发人员都忘了jQM是一个UI框架，与jQuery UI没有什么不同。它可用做widget工厂，完全可以比我们原本假定的用于做更多的事情。


如果你在桌面浏览器中打开Flickly，你会看到一个模仿Google.com的图片搜索UI，不过，分析一下它页面中的组件(按钮，文本输入框，tabs)。桌面UI看起来并不像移动应用， 但仍然可以使用jQM来做移动主题的组件；tabs, date-picker(日期选择), sliders(滑动) ——所有桌面UI都可以使用jQM在移动设备上提供给用户的。有了media queries, 桌面UI可以优化空白的使用，扩展组件的区域，提供可选布局，同时也可以把jQM作为组件框架。

这样的好处就是不用单独引入jQuery UI利用这些功能。幸好最近有了ThemeRoller，我的组件正如我所期望的那样看起来精确了，低分辨率下应用jQM UI，其它分辨率下应用jQM-ish UI。

需要记住的是如果不准备通过基于屏幕的条件判断来加载script/style的话(使用matchMedia.js等)，有更简单的方式，可以采取跨设备的组件主题。


#<a name="testing">单元测试</a>


##<a name="unittestingjasmine">使用Jasmine对Backbone应用进行单元测</a>

##简介

单元测试的定义就是把整个应用中小片可测试的代码从代码库中隔离，然后检验它的行为是否跟期望的一致。这个章节，我们会讲述如何使用一个流行的测试框架[Jasmine](http://pivotal.github.com/jasmine/)来测试Backbone应用，这个框架来自Pivotal Labs。

一个被称为'好'测试的应用，很明显功能上应该有分开的单元测试，以验证不同情况下它的正确性。所有测试应该在功能完成之前介入。这可以让开发者修改一块代码的时候通过单元测试确认他的修改是否会引发问题，建立代码质量的信心。

一个最基本的单元测试例子，开发者想要断言传入指定的value給一个sum函数其返回结果是否正确。与我们这本书有关的例子就是，我们想要断言一个用户添加一个新的Todo项到列表中，是否添加了一个指定类型的Model到Todos Collection。

构建现代的web应用时，通常认为最好的实践方式是在开发过程中引入自动的单元测试。这里我们关注下使用Jasmine的方案，当然也有很多其它选择值得考虑，包括QUnit。

##Jasmine

Jasmine自称是一个用于测试JavaScript代码的行为-驱动开发(Behavior-Driven Development，BDD)的框架。在开始使用这个框架之前，我们先来弄清楚下什么是[BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development)。

BDD是一种第二代测试方法，由[Dan North](http://dannorth.net/introducing-bdd/) (BDD方面的权威)首次定义，它是试图测试软件的行为。称之为第二代是因为其想法来自于领域驱动设计(Domain driven design，DDD)和精益软件开发，通过在敏捷过程中回答许多令人困惑的问题来帮助团队产出高质量软件。这类问题通常包含相关文档和测试。

如果阅读过一本关于BDD的书籍，有可能它会被描述成'由外及内的、基于拉(pull)的(outside-in and pull-based)'。原因就是它从精益生产借鉴了pull特性， 通过a) 注重系统的预期输出(outputs),b) 确保这些输出被达到，这2两点有效的确保开发出正确的软件方案。

BDD提出在一个项目中通常有多元利益体并且系统不是只有一个单一的无形用户。这些不同的群体，将会以不同的形式影响所编写的软件，而且软件系统的质量对于他们的意义他们有不同的理解。所以，要明白对于这个软件谁会给你带来价值以及软件会给他们带来什么价值，这点非常重要。

最后，BDD依赖于自动化。一旦定义好你期望的质量，你的团队可能就会定期的检查正在做的功能是否与他们期望的一致。为了促进效率，这个过程需要自动完成。BDDIn order to facilitate this efficiently, the process has to be automated. BDD严重依赖于自动规格测试，而Jasmine正好是一个做这件事的工具。

BDD可以帮助开发者和非技术的利益相关者做到：


* 更好的理解和提出解决问题的模式
* 把测试用例以非开发人员也能读懂的方式解释清楚
* 着眼于最小化编写的技术代码到业务表达语言之间的转换。

这就意味着开发者要把Jasmine单元测试给项目的利益相关者做展示，然后他们在观念上要理解代码的用途。

开发者经常跟另外一种测试方法[TDD](http://en.wikipedia.org/wiki/Test-driven_development) (test-driven development)一样来实施BDD。TDD背后的主要观点：

* 编写单元测试描述你的代码想要支持的功能
* 看着这些测试失败(因为要支持这些功能的代码写好)
* 编写代码让测试通过
* 清理，重复和重构

这一章我们将会用这两种方式(BDD和TDD)来为Backbone应用编写单元测试。

***提示*** 我看到很多开发者仍然是在完成编码之后才编写测试来做验证。虽然这也还不错，不过容易调入陷入，它只能测试到你现在代码所支持的行为，而不一定完整包含我们原本设计需要支持的功能。


##Suites, Specs & Spies

使用Jasmine时，要编写suites(套件)和specs(specifications，规格说明)。Suites主要描述场景，specs描述在这些场景l里要做些什么。

每个spec就是一个一个JavaScript函数，调用```it()```来描述，传入一个描述字符串和一个function。描述语要描述出指定单元代码的展现结果，牢记BDD的观念，表述应该有意义。下面是一个简单的例子：

```javascript
it('should be incrementing in value', function(){
    var counter = 0;
    counter++;
});
```

就其本身而言，一个spec如果没有设置行为代码的期望结果就没有什么用处了。使用```expect()```函数和[expectation matcher](https://github.com/pivotal/jasmine/wiki/Matchers) (比如```toEqual()```, ```toBeTruthy()```, ```toContain()```)来定义期望结果。示例：

```javascript
it('should be incrementing in value', function(){
    var counter = 0;
    counter++;
    expect(counter).toEqual(1);
});
```

上面代码中对```counter```的期望值要等于1。这种代码读起来非常简单(凭直觉就可以理解了，无需任何解释)。

一组Specs就构成了suites，通过Jasmine的```describe()```函数定义，传入一个描述字符串和一个函数。suite的名称或者描述通常是需要测试的组件或者模块。

Jasmine会把它作为给出报告时运行specs的分组名称。下面是一个简单的示例：

```javascript
describe('Stats', function(){
    it('can increment a number', function(){
        ...
    });

    it('can subtract a number', function(){
        ...
    });
});
```

Suites共享一个函数域，所以可以在describe函数内声明变量， specs里的函数也可以访问到：

```javascript
describe('Stats', function(){
    var counter = 1;

    it('can increment a number', function(){
        // the counter was = 1
        counter = counter + 1;
        expect(counter).toEqual(2);
    });

    it('can subtract a number', function(){
        // the counter was = 2
        counter = counter - 1;
        expect(counter).toEqual(1);
    });
});
```

***提示：*** Suites是按其定义的顺序执行，如果你要看整个应用测试报告的某个特定部分的测试结果，这可能非常有用。

Jasmine同样支持**spies(监视)** ——在单元测试中一种模仿，监视，和伪造行为的方法。Spies会替换它们监视的函数，可以模仿我们想要伪造的行为。

在下面这个例子中，我们用一个虚拟的Todo function监视```setComplete```方法，测试传入的参数是否符合期望。

```javascript
var Todo = function(){
};

Todo.prototype.setComplete = function (arg){
    return arg;
}

describe('a simple spy', function(){
    it('should spy on an instance method of a Todo', function(){
        var myTodo = new Todo();
        spyOn(myTodo, 'setComplete');
        myTodo.setComplete('foo bar');

        expect(myTodo.setComplete).toHaveBeenCalledWith('foo bar');

        var myTodo2 = new Todo();
        spyOn(myTodo2, 'setComplete');

        expect(myTodo2.setComplete).not.toHaveBeenCalled();

    });
});
```

更有可能会用到spies的地方是测试[asynchronous(异步)](http://en.wikipedia.org/wiki/Asynchronous_communication)行为，比如AJAX请求。Jasmine支持：

* 使用spies模仿AJAX请求来编写测试。可以在AJAX请求之前和请求之后运行测试代码。也可以伪造服务器端的响应，这种类型的测试好处就是更快，不需要等待实际的服务器调用。
* 异步测试部需要依赖spies

第一种测试，可以伪造AJAX请求，验证请求的URL是否正确以及执行回调，如果有的话。

```javascript
it("the callback should be executed on success", function () {
    spyOn($, "ajax").andCallFake(function(options) {
        options.success();
    });

    var callback = jasmine.createSpy();
    getTodo(15, callback);

    expect($.ajax.mostRecentCall.args[0]["url"]).toEqual("/todos/15");
    expect(callback).toHaveBeenCalled();
});

function getTodo(id, callback) {
    $.ajax({
        type: "GET",
        url: "/todos/" + id,
        dataType: "json",
        success: callback
    });
}
```

```andCallFake()```，```toHaveBeenCalled()```是匹配方法，所有Spy可用的匹配方法可以看Jasmine [wiki](https://github.com/pivotal/jasmine/wiki/Spies)。

第二种测试(异步测试)，我们可以用Jasmine支持的下面这三个方法对前面的例子做些改进：

* runs(function) - 立即运行一个代码块
* waits(timeout) - 下一个代码块执行前等待一段时间
* waitsFor(function, optional message, optional timeout)——暂停specs知道某些工作完成。Jasmine会等待这里提供的函数返回true然后再继续执行下一块代码。


```javascript
it("should make an actual AJAX request to a server", function () {

    var callback = jasmine.createSpy();
    getTodo(16, callback);

    waitsFor(function() {
        return callback.callCount > 0;
    });

    runs(function() {
        expect(callback).toHaveBeenCalled();
    });
});

function getTodo(id, callback) {
    $.ajax({
        type: "GET",
        url: "todos.json",
        dataType: "json",
        success: callback
    });
}
```

***提示：*** 当在单元测试中创建真实的服务器端请求时，会极大的拖慢测试运行的速度(有很多因素，包括服务器延迟)。同时也引入了外部依赖，原本可以(也应该要)最小化你的单元测试，所以强烈推荐你选择spies，避免使用真实的服务器端调用。

##beforeEach和afterEach()

Jasmine同样支持在每个测试之前(```beforeEach()```)或者之后(```afterEach```)执行特定的代码。这对强制为一致的条件非常有用(比如重置specs引入的变量)。下面这个例子中，```beforeEach()```中创建一个specs用于测试属性的Todo model。

```javascript
beforeEach(function(){
   this.todo = new Backbone.Model({
      text: "Buy some more groceries",
      done: false
   });
});

it("should contain a text value if not the default value", function(){
   expect(this.todo.get('text')).toEqual("Buy some more groceries");
});
```

每个```describe()```中都可嵌套自己的```beforeEach()```和```afterEach()```方法，which support including setup and teardown methods relevant to a particular suite。后面我们会使用```beforeEach()```来实践下。

##共享域

前面你可能注意到```beforeEach()```调用中我们定义了一个变量```this.todo```，然后在```afterEach()```也可以继续使用它。这要归功于Jasmine的共享函数域。共享域可以让所有块(包括```runs()```)访问的```this```的属性都是相同的，除了声明的变量之外(```var```声明的变量)。


##获取安装

现在我们来分析下基本原理，先下载Jasmine并且做好编写测试前的准备。

官方独立版本可以从这里[下载](https://github.com/pivotal/jasmine/downloads)。

下载到的包中还有一个SpecRunner.html文件。 Jasmine代码仓库可以从用git从这里获取https://github.com/pivotal/jasmine.git。

我们来看下SpecRunner.html文件(下面示例代码可能相对于新版本的Jasmine较老了)：

首先引入Jasmine和必要用于report的css：


	<link rel="stylesheet" type="text/css" href="lib/jasmine-1.1.0.rc1/jasmine.css"/>
	<script type="text/javascript" src="lib/jasmine-1.1.0.rc1/jasmine.js"></script>
	<script type="text/javascript" src="lib/jasmine-1.1.0.rc1/jasmine-html.js"></script>


然后，引入一些测试：


	<script type="text/javascript" src="spec/SpecHelper.js"></script>
	<script type="text/javascript" src="spec/PlayerSpec.js"></script>


最后是需要被测试的代码：


	<script type="text/javascript" src="src/Player.js"></script>
	<script type="text/javascript" src="src/Song.js"></script>


***提示：*** SpecRunner后面的代码是负责运行测试。 这里不做分析，鼓励你看看PlayerSpec.js和SpecHelper.js的代码。这是个如何做一组测试的很好的例子。

##TDD With Backbone

当使用Backbone开发应用时，需要测试个别的模块代码同时也要测试models, views, collections和routers。采用TDD测试方法，我们来看下测试Backbone [Todo](https://github.com/addyosmani/todomvc/tree/gh-pages/architecture-examples/backbone)这个示例项目中Backbone组件的一些specs。这一节我们将使用一个由Larry Myers修改版本的Backbone Koans项目， 在`practicals\jasmine-koans`目录下。

##<a name="testing-jasmine-models">Models</a>

Backbone models的复杂程度完全依赖于应用要实现的功能。下面例子中，我们将测试默认值，属性，状态改变，和验证规则。

首先，使用```describe()```创建suite：

```javascript
describe('Tests for Todo', function() {
```

Model的属性理想上应该有默认值。可以确保创建实例时未指定值的话可以使用默认值替代。这里的意思主要是与models交互是可以避免一些意外的行为。

下面这个spec，创建一个Todo没有传入任何属性，然后检查下```text```属性的值是什么。因为没有设置任何值，所以我们期望的值是返回```""```。

```javascript
it('Can be created with default values for its attributes.', function() {
    var todo = new Todo();
    expect(todo.get('text')).toBe("");
});
```

如果你在编写model前测试这个spec的话，会引发失败。这个spec需要传入一个```text```属性的默认值。示例：

```javascript

window.Todo = Backbone.Model.extend({

    defaults: {
      text: "",
      done:  false,
      order: 0
    }

```

接下来，我们测试下model在初始化之后会把属性值设为传入的值。另外也测试下其它几个属性的默认值是否是我们期望的。

```javascript
it('Will set passed attributes on the model instance when created.', function() {
    var todo = new Todo({ text: 'Get oil change for car.' });

    // what are the values expected here for each of the
    // attributes in our Todo?

    expect(todo.get('text')).toBe("Get oil change for car.");
    expect(todo.get('done')).toBe(false);
    expect(todo.get('order')).toBe(0);
});
```
Backbone models支持model.change()事件，当model的状态改变时触发。下面这个例子中，通过设置Todo model属性值来改变它的'state(状态)'，状态改变的原因非常值得测试，因为应用中可能有状态依赖的事件，比如当model被修改时想要显示一个确认视图。

```javascript
it('Fires a custom event when the state changes.', function() {

    var spy = jasmine.createSpy('-change event callback-');

    var todo = new Todo();

    // how do we monitor changes of state?
    todo.on('change', spy);

    // what would you need to do to force a change of state?
    todo.set({ text: 'Get oil change for car.' });

    expect(spy).toHaveBeenCalled();
});
```

通常在model中引入验证逻辑来确保来自用户的输入(或者其它模块)是有效的'(valid)'。Todo app可能会验证text输入框输入进来的内容没有粗鲁的单词。 同样的，
当保存Todo项```done```状态时，需要验证传入的值是true/false， 而不是字符串。

在下面的spec中，我们用了一些是验证失败的值，让model.validate()触发"error"事件。检验一下传入无效值是是否会真的触发失败。

使用Jasmine内置```createSpy()```方法创建一个errorCallback spy，就可以检测error事件了：

```javascript
it('Can contain custom validation rules, and will trigger an error event on failed validation.', function() {

    var errorCallback = jasmine.createSpy('-error event callback-');

    var todo = new Todo();

    todo.on('error', errorCallback);

    // What would you need to set on the todo properties to
    // cause validation to fail?

    todo.set({done:'a non-integer value'});

    var errorArgs = errorCallback.mostRecentCall.args;

    expect(errorArgs).toBeDefined();
    expect(errorArgs[0]).toBe(todo);
    expect(errorArgs[1]).toBe('Todo.done must be a boolean value.');
});

```
要让上面这段失败测试代码支持验证非常简单。这个model中，我们重写validate()方法(像Backbone文档推荐的那样)，检查model有'done'属性并且给它传入值时是一个合法的布尔值。

```javascript
validate: function(attrs) {
    if (attrs.hasOwnProperty('done') && !_.isBoolean(attrs.done)) {
        return 'Todo.done must be a boolean value.';
    }
}
```

这个完整的Todo model代码如下：

```javascript
var NAUGHTY_WORDS = /crap|poop|hell|frogs/gi;

function sanitize(str) {
    return str.replace(NAUGHTY_WORDS, 'rainbows');
}

window.Todo = Backbone.Model.extend({

    defaults: {
      text: '',
      done:  false,
      order: 0
    },

    initialize: function() {
        this.set({text: sanitize(this.get('text'))}, {silent: true});
    },

    validate: function(attrs) {
        if (attrs.hasOwnProperty('done') && !_.isBoolean(attrs.done)) {
            return 'Todo.done must be a boolean value.';
        }
    },

    toggle: function() {
        this.save({done: !this.get("done")});
    }

});
```


##<a name="testing-jasmine-collections">Collections</a>

现在我们需要定义specs来测试Backbone Todo model的collection(一个TodoList)。Collections处理列表的排序，过滤等。

测试collections时可能会有下面这些明确的specs：

* 可以添加新的Todo model对象或者对象的数组。
* 属性测试，确保类似collection的base URL是我们期望的值。
* 有意的添加状态```done:true```的todo项， 然后检查collection认为已完成项的数量和未完成项的数量。

这一节我们只会讲到前2个问题，第三个问题作为读者的扩着练习。

测试Todo models可通过一个对象或者数组来添加相对简单。首先，初始化一个TodoList collection，确保其长度为0。然后，添加新的Todos，对象和数组两种情况都添加一次，然后检查collection的length属性是否符合期望值：

```javascript
describe('Tests for TodoList', function() {

    it('Can add Model instances as objects and arrays.', function() {
        var todos = new TodoList();

        expect(todos.length).toBe(0);

        todos.add({ text: 'Clean the kitchen' });

        // how many todos have been added so far?
        expect(todos.length).toBe(1);

        todos.add([
            { text: 'Do the laundry', done: true },
            { text: 'Go to the gym'}
        ]);

        // how many are there in total now?
        expect(todos.length).toBe(3);
    });
...
```

跟model的属性一样，测试collections的属性也非常简单。下面是一个简单的测试collection.url的spec例子：

```javascript
it('Can have a url property to define the basic url structure for all contained models.', function() {
        var todos = new TodoList();

        // what has been specified as the url base in our model?
        expect(todos.url).toBe('/todos/');
});

```

对于第三个spec，collection会实现``done()```和```remaining()```方法，分别过滤已完成Todo项和未完成项。编写一个spec，创建一个collection，添加一个```done```状态为为```true```的model，2个```done```状态为```false```的model。然后测试调用```done()```和```remaining()```方法返回的结果的length，看是否正常。

TodoList collection实现代码可以像下面这样：


```javascript
 window.TodoList = Backbone.Collection.extend({

        model: Todo,

        url: '/todos/',

        done: function() {
            return this.filter(function(todo) { return todo.get('done'); });
        },

        remaining: function() {
            return this.without.apply(this, this.done());
        },

        nextOrder: function() {
            if (!this.length) {
                return 1;
            }

            return this.last().get('order') + 1;
        },

        comparator: function(todo) {
            return todo.get('order');
        }

    });
```


##<a name="testing-jasmine-views">Views</a>

在开始测试Backbone views前，先简短的来看一个编写Jasmine specs的jQuery plugin。

**The Jasmine jQuery Plugin**

Todo application使用jQuery来做DOM操作，有一个[jasmine-jquery](https://github.com/velesin/jasmine-jquery) 插件可以帮助简化BDD测试view创建的元素。


这个插件提供了很多额外的Jasmine [matchers](https://github.com/pivotal/jasmine/wiki/Matchers) 以帮助测试jQuery包装的sets：

* ```toBe(jQuerySelector)```示例 ： ```expect($('<div id="some-id"></div>')).toBe('div#some-id')```
* ```toBeChecked()``` 示例：```expect($('<input type="checkbox" checked="checked"/>')).toBeChecked()```
* ```toBeSelected()``` 示例 ```expect($('<option selected="selected"></option>')).toBeSelected()```

更多可以参看 [这里](https://github.com/velesin/jasmine-jquery)。它支持的完整matchers可以在项目主页上找到。它跟标准的Jasmine matchers类似，上面的matchers可以加.not前缀反过来使用(比如```expect(x).not.toBe(y)```)：

```javascript
expect($('<div>I am an example</div>')).not.toHaveText(/other/)
```

jasmine-jquery同时包含一个固定装置模型(fixtures model)，可以加载任意HTML内容到时候。可以像下面这样使用：

在一个外部文件中包含一段HTML：

some.fixture.html:
```<div id="sample-fixture">some HTML content</div>```

然后，实际测试时想下面这样载入：

```javascript
loadFixtures('some.fixture.html')
$('some-fixture').myTestedPlugin();
expect($('#some-fixture')).to<the rest of your matcher would go here>
```

jasmine-jquery插件默认会从一个特定目录加载fixtures：spec/javascripts/fixtures。如果想配置这个路径的话在初始化设置中```jasmine.getFixtures().fixturesPath = 'your custom path'```。

最后，jasmine-jquery包含对jQuery事件spying的支持，而且不需要什么额外的工作。可使用```spyOnEvent()```和```assert(eventName).toHaveBeenTriggered(selector)```方法来完成。下面是一个示例：

```javascript
spyOnEvent($('#el'), 'click');
$('#el').click();
expect('click').toHaveBeenTriggeredOn($('#el'));
```

**View测试**

这一小节我们从三个维度来看下编写Backbone Views的specs：初始化，view渲染和模板生成。后两个跟通常的测试差不多，不过我会简短的说下为什么对views的初始化编写specs也是有好处的。

##初始化

最基本的，为Backbone views写的specs需要验证view被正确的绑定到指定的DOM元素，被有效的数据model支持。考虑这样做的原因是，如果这些specs失败的话会导致后面一些更复杂的测试也失败，而且这些specs写起来比较简单，可以提供一个整体的价值。

为确保一致的测试配置条件，使用```beforeEach()```追加一个空的```UL``` (#todoList)到DOM并且用一个空的Todo model初始化一个TodoView实例。在```afterEach()```中移除前面的#todoList  ```UL```和view实例。

```javascript
describe('Tests for TodoView', function() {

    beforeEach(function() {
        $('body').append('<ul id="todoList"></ul>');
        this.todoView = new TodoView({ model: new Todo() });
    });


    afterEach(function() {
        this.todoView.remove();
        $('#todoList').remove();
    });

...
```

第一个spec就是检查我们创建的TodoView使用了正确的```tagName```(元素或者className)。目的就是确保创建时正确的绑定到DOM元素。

Backbone views通常一旦初始化会创建一些空的DOM元素，不过这些元素不会附加到可见的DOM中， 目的是在不影响性能和渲染的情况下让他们构建出来。

```javascript
it('Should be tied to a DOM element when created, based off the property provided.', function() {
    //what html element tag name represents this view?
    expect(todoView.el.tagName.toLowerCase()).toBe('li');
});
```

如果TodoView还没编写好的话，specs就会失败。通过指定```tagName```创建一个Backbone.View。

```javascript
var todoView = Backbone.View.extend({
    tagName:  "li"
});
```

也可以通过测试className来替代```tagName```，可以使用更高级的jasmine-jquery matcher ```toHaveClass()```来完成。

```
it('Should have a class of "todos"'), function(){
   expect(this.view.$el).toHaveClass('todos');
});
```

```toHaveClass()``` matcher对jQuery操作，而且如果没有使用这个插件的话就会引发异常(如果没有使用jasmine-jquery插件也可通过获取el.className来判断)。

你可能注意到```beforeEach()```中我们传入里一个新创建的Todo给view。Views应该基于一个有数据的model实例。因为它对view的功能非常重要，我们可以写一个spec来确保model是一定义(使用```toBeDefined()``` matcher) 并且测试model有默认属性，而且是我们期望的值。

```javascript
it('Is backed by a model instance, which provides the data.', function() {

    expect(todoView.model).toBeDefined();

    // what's the value for Todo.get('done') here?
    expect(todoView.model.get('done')).toBe(false); //or toBeFalsy()
});
```

##View渲染

接下来看下给view渲染编写specs。特别是，我们想测试下TodoView实际被渲染出来的元素是否符合期望。

对于小的额applications，有些BDD新手认为视觉上确认view的渲染可以替代view的单元测试。实际上，开发的应用可能变成多视个view时，通常从开端就劲量让这个过程自动化。同样也有aspects来验证屏幕上所看到的渲染效果。

我们编写两个spec来测试view。第一个测试检车view的```render()```方法正确的返回view实例，可以用于链式调用。第二个测试检查生成的HTML是基于TodoView相关联的mode实例的属性所期望的结果。

不同于前面我们写的specs，这一节我们会大量使用```beforeEach()```彰显如何使用嵌套的suites，以及确保specs的条件一致。第一个TodoView的spec，将创建一个简单的model (基于Todo)，然后用这个model初始化一个TodoView。

```javascript
describe("TodoView", function() {

  beforeEach(function() {
    this.model = new Backbone.Model({
      text: "My Todo",
      order: 1,
      done: false
    });
    this.view = new TodoView({model:this.model});
  });

  describe("Rendering", function() {

    it("returns the view object", function() {
      expect(this.view.render()).toEqual(this.view);
    });

    it("produces the correct HTML", function() {
      this.view.render();

      //let's use jasmine-jquery's toContain() to avoid
      //testing for the complete content of a todo's markup
      expect(this.view.el.innerHTML)
        .toContain('<label class="todo-content">My Todo</label>');
    });

  });

});
```

这些specs一旦运行，只有第二个('produces the correct HTML')失败。第一个spec ('returns the view object')，测试```render()```返回的TodoView实例， 可以通过因为这是Backbone的默认行为。我们并没有重写```render()```方法。

**提示：** 为了维护可读性，这一节中所有的模板例子都将使用下面这个最小化版本的Todo view模板。需要使用时可以返回来查看：

	<div class="todo <%= done ? 'done' : '' %>">
	        <div class="display">
	          <input class="check" type="checkbox" <%= done ? 'checked="checked"' : '' %> />
	          <label class="todo-content"><%= text %></label>
	          <span class="todo-destroy"></span>
	        </div>
	        <div class="edit">
	          <input class="todo-input" type="text" value="<%= content %>" />
	        </div>
	</div>



第二个spec失败会有下面这段提示：

```Expected '' to contain '<label class="todo-content">My Todo</label>'.```

原因是render()的默认行为不创建任何标签。我们来编写一个替代的render()来解决它：

```javascript
render: function() {
  var template = '<label class="todo-content"><%= text %></label>';
  var output = template
    .replace("<%= text %>", this.model.get('text'));
  this.$el.html(output);
  return this;
}
```

上面指定了一行模板字符串，然后用model对应的属性值替换"<% %>"区域内的内容。同时也返回TodoView实例，所以第一个spec也可以通过。像这样在spec中使用HTML字符串来进行测试有非常大的缺点。即便是模板微小的变化(一个tab或者空格符)就会导致spec失败，即便渲染结果是一样的。实际应用中模板也会更复杂，将耗费更多的时间去维护。更好的测试渲染输出结果的方法是使用jQuery来选择和检查。

基于这个思想，我们来重写这个spec，使用jasmine-jquery提供的自定义matchers：


```javascript
describe("Template", function() {

  beforeEach(function() {
    this.view.render();
  });

  it("has the correct text content", function() {
    expect(this.view.$('.todo-content'))
      .toHaveText('My Todo');
  });

});
```

讨论单元测试不提到fixtures是不可能的。Fixtures通常包含单元测试当需要时(可以是本地或者从外部文件)载入的测试数据(比如HTML)。 一直以来我们都是把jQuery的期望建立在view的el属性上。大部分情况这是有效的，不过，有时我们需要把标签渲染到document。再specs中处理这个问题的最理想方式就是使用fixtures (jasmine-jquery插件带给我们的另外一个特性)。

使用fixtures重写上面这个spec：


```javascript
describe("TodoView", function() {

  beforeEach(function() {
    ...
    setFixtures('<ul class="todos"></ul>');
  });

  ...

  describe("Template", function() {

    beforeEach(function() {
      $('.todos').append(this.view.render().el);
    });

    it("has the correct text content", function() {
      expect($('.todos').find('.todo-content'))
        .toHaveText('My Todo');
    });

  });

});
```

在上面这个spec中，把渲染的todo元素append到fixture。然后对这个fixture设置期望，当view对应到一个已经存在的DOM元素之后的一些desirable。有必要提供fixture和测试当view初始化的时候```el```属性是否指向正确的元素。


##使用模板系统进行渲染


JavaScript模板系统(比如Handlebars, Mustache 以及Underscore的Micro-templating)在模板字符串中支持条件逻辑。这就意味着我们可以一行字符串内使用if/else/三元表单时，可以构建更强大的模板。

在我们的案例中，当一个用户设置一个Tood项为完成(done)是，我们期望给他一点视觉上的反馈(比如文本上加一条横线)以区分其余的的项。可以通过给这个项附加一个class来实现。下面开始编写测试：


```javascript
describe("When a todo is done", function() {

  beforeEach(function() {
    this.model.set({done: true}, {silent: true});
    $('.todos').append(this.view.render().el);
  });

  it("has a done class", function() {
    expect($('.todos .todo-content:first-child'))
      .toHaveClass("done");
  });

});
```

这样会失败，并引发下面消息：

```Expected '<label class="todo-content">My Todo</label>'
to have class 'done'.
```

可以在render()方法中解决：


```javascript
render: function() {
  var template = '<label class="todo-content">' +
    '<%= text %></label>';
  var output = template
    .replace("<%= text %>", this.model.get('text'));
  this.$el.html(output);
  if (this.model.get('done')) {
    this.$(".todo-content").addClass("done");
  }
  return this;
}
```

不过，很快它就会变得不那么方便了。随着模板中逻辑的增加，它就会变得越复杂。木板库就可以帮助我们解决这些问题。前面提到有很多流行的木板系统可以选择，这里我们选择Underscore内置的Microtemplating。它有很多高级额选项等着你去探索。这么做的好处是不需要额外的文件，不需要做太大的调整我们就可以轻易改变这个Jasmine specs。

使用Underscore木板的TodoView对象：

```javascript
var TodoView = Backbone.View.extend({

  tagName: "li",

  initialize: function(options) {
    this.template = _.template(options.template || "");
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },

  ...

});
```

上面，initialize()方法在实例化的时候编译提供的Underscore木板(使用_.template()函数)。一种常见的引用模板的方式是把它们放到自定义类型的script标签中(比如type="text/template")。因为它不是浏览器能识别的脚本类型，所以会被忽略，不过可以通过id属性来获取到这里面的独立的模板代码然后使用它。在实际应用中，也可以从外部文件中加载模板进行测试。

为了保持简单，仅用于测试的目的，我们继续使用字符串的形式。这里有个技巧可以在Jasmine域内每个测试都可以自动创建或者扩展模版。在'spec'目录下创建一个目录('templates')然后添加一个脚本文件，如下面内容，to jasmine.yml or SpecRunner.html，我们可以添加一个todo属性包含Underscore模版：

```javascript
beforeEach(function() {
  this.templates = _.extend(this.templates || {}, {
    todo: '<label class="todo-content">' +
            '<%= text %>' +
          '</label>'
  });
});
```

最后，稍微修改下初始化TodoView对象时指向的template：

```javascript
describe("TodoView", function() {

  beforeEach(function() {
    ...
    this.view = new TodoView({
      model: this.model,
      template: this.templates.todo
    });
  });

  ...

});
```

在现有的specs中我们继续使用这种方式，我们给模版为Todo的状态添加一些条件逻辑：

```javascript
beforeEach(function() {
  this.templates = _.extend(this.templates || {}, {
    todo: '<label class="todo-content <%= done ? 'done' : '' %>"' +
            '<%= text %>' +
          '</label>'
  });
});
```

目前没有任何问题。不过请记得jasmine-jquery同样可以使用内置的```loadFixtures()```和```readFixtures()```方法轻易的支持载入外部fixtures到specs中。更多信息可以阅读官方[文档](https://github.com/velesin/jasmine-jquery)。


##总结

现在我们已经讨论如何为Backbone.js应用中的models, views和collections编写Jasmine测试。虽然测试路由(routing)有时是可取的，有些开发者认为它可以由第三方工具更好的完成比如Selenium，所以请记住这点。

James Newbery was kind enough to help me with writing the Views section above and his articles on [Testing Backbone Apps With SinonJS](http://tinnedfruit.com/2011/04/26/testing-backbone-apps-with-jasmine-sinon-3.html) were of great inspiration (you'll actually find some Handlebars examples of the view specs in part 3 of his article). If you would like to learn more about writing spies and mocks for Backbone using [SinonJS](http://sinonjs.org) as well as how to test Backbone routers, do consider reading his series.

##练习

作为练习，推荐大家尝试下Jasmine Koans，在`practicals\jasmine-joans`目录下，然后尝试fix一些里面有意提供的失败的测试。这是一种很好的了解Jasmine specs 和 suites工作原理和学习Backbone技巧的方式。


##扩展阅读
* [Jasmine + Backbone Revisited](http://japhr.blogspot.com/2011/11/jasmine-backbonejs-revisited.html)
* [Backbone, PhantomJS and Jasmine](http://japhr.blogspot.com/2011/12/phantomjs-and-backbonejs-and-requirejs.html)


##<a name="unittestingqunit">使用QUnit和SinonJS做Backbone应用的单元测试</a>

##简介

QUnit是由jQuery团队成员[Jörn Zaefferer](http://bassistance.de/)写的一个强大的JavaScript测试套件，并且大量的开源项目(比如jQuery和Backbone.js)用于测试他们的代码。它可用于标准的运行于浏览器的JavaScript代码，也可用于测试服务器端的代码(支持包括 Rhino, V8和SpiderMonkey环境)。这使得它可以为大量用例提供强大的解决方案。

不少Backbone.js贡献者认为如果不想使用Jasmine和BDD的话，QUnit是一个不错的入门级测试框架。正如我们后面会将到的，QUnit可以与一些第三方方案相结合，比如SinonJS，以提供支持spie和mock的更强大的测试方案，所以有些人说它要优于Jasmine。

个人认为还是值得比较下这2个框架，选择你自己最合适的。

#QUnit

##建立配置

建立起QUnit的配置非常简单，只需要几分钟。

首先我们通过三个文件建立起测试环境：

* 一个HTML**结构**用于显示测试结果，
* **qunit.js**测试框架文件，
* **qunit.css**显示测试结果的样式。

后面2个文件可以从[QUnit网站](http://qunitjs.com)下载。

也可以使用在线托管的QUnit源文件进行测试。从这里[https://github.com/jquery/qunit]可以找到。

####QUnit兼容的简短HTML：

```html
<!DOCTYPE html>
<html>
<head>
    <title>QUnit Test Suite</title>

     <link rel="stylesheet" href="qunit.css">
     <script src="qunit.js"></script>

     <!-- Your application -->
     <script src="app.js"></script>

     <!-- Your tests -->
     <script src="tests.js"></script>
</head>
<body>
    <h1 id="qunit-header">QUnit Test Suite</h1>
    <h2 id="qunit-banner"></h2>
    <div id="qunit-testrunner-toolbar"></div>
    <h2 id="qunit-userAgent"></h2>
    <ol id="qunit-tests">test markup, hidden.</ol>
</body>
</html>
```

我们通过ID分别来看下上面元素的作用，当QUnit运行时：

* **qunit-header** 显示suite的名称
* **qunit-banner** 如果有测试失败显示红色，如果全部测试都通过显示绿色
* **qunit-testrunner-toolbar** 包含额外的显示测试的选项
* **qunit-userAgent** 显示navigator.userAgent属性
* **qunit-tests** 包含所有测试的结果

如果正确的运行，页面看起来就会像下面这样：

![screenshot 1](img/7d4de12.png)

每个测试名称后面的数字以(a, b, c)这种格式显示，分别对应a) 失败的断言(assert), b) 通过的断言，c) 断言总数。 点击测试名称展开显示这个测试用例的所有断言。绿色的表示测试通过。

![screenshot 2](img/9df4.png)

如果有测试失败，这个测试就会高亮(顶部qunit-banner也会变成红色)：

![screenshot 3](img/3e5545.png)


##断言(Assertions)

QUnit支持一些基本的**断言**，用于验证代码返回的结果是否我们期望的值。如果一个断言失败了，我们就知道存在bug。与Jasmine类似，QUnit可以非常简单的用于回归测试。 尤其是，当发现一个bug时可以写一个断言来测试这个bug的存在，写一个pathc然后一起提交。如果之后代码的变更break了这个测试，你就知道哪里的问题，更容易解决了。

我们先来看一些QUnit支出的断言：

*   `ok ( state, message )` - 如果第一个参数是true则通过
*   `equal ( actual, expected, message )` - 简单的强制类型的相等比较断言
*   `notEqual ( actual, expected, message )` - 与上一个相反
*   `expect( amount )` - 每个test期望的断言的总数量
*   `strictEqual( actual, expected, message)` - 比`equal()`更严格的比较，这个方法可以更好的避免一些细节上无意的bugs
*   `deepEqual( actual, expected, message )` - 与`strictEqual`相似，使用(`===`)比较对象，数组，元数据内容。

创建QUnit测试用例非常简单，使用```test()```，第一参数是```name```显示在测试结果中，第二个参数```callback```包含所有的断言。这个方法调用之后QUnit就运行了。

####一个基本的测试用例：

```javascript
var myString = 'Hello Backbone.js';

test( 'Our first QUnit test - asserting results', function(){

    // ok( boolean, message )
    ok( true, 'the test succeeds');
    ok( false, 'the test fails');

    // equal( actualValue, expectedValue, message )
    equal( myString, 'Hello Backbone.js', 'The value expected is Hello Backbone.js!');
});
```

上面所做的就是定义了一个变量，然后测试这个变量的值是否是期望的值。用的是比较断言```equal()```，期望第一个参数的值与第二个参数的值相等。同时也使用```ok()```, 测试functions或者变量是布尔值。

提示：在测试用例的任何地方，都可以给```test()```传递我们期望运行的定义的断言个数。通过: `test( name, [expected], test );` 或者在测试方法头部手动设置期望的值，像这样：`expect( 1 )`。推荐你养成这种习惯，定义期望的断言个数。后面我们提到更多。

测试一个静态变量没啥意思，接下来我们来测试一个实际的函数。下面这个例子我们使用```equal()```和```notEqual()```来测试reverseString函数的输出：

####比较一个函数的输出是否与期望的输出相符合：

```javascript
function reverseString( str ){
    return str.split("").reverse().join("");
}

test( 'reverseString()', function() {
    expect( 5 );
    equal( reverseString('hello'), 'olleh', 'The value expected was olleh' );
    equal( reverseString('foobar'), 'raboof', 'The value expected was raboof' );
    equal( reverseString('world'), 'dlrow', 'The value expected was dlrow' );
    notEqual( reverseString('world'), 'dlroo', 'The value was expected to not be dlroo' );
    equal( reverseString('bubble'), 'double', 'The value expected was elbbub' );
})
```

在QUnit test runner(HTML测试页面载入时就可以看到了)中运行这些测试，会发现4个通过，最后一个失败。与`'double'`比较失败是有意编写的。如果在你的项目中有失败的断言可能是找到一个bug了！


##给断言中添加结构

把所有断言都放到一个测试用例中很快就会变得难以维护，不过QUnit可以支持更加清晰的组织断言块。可以使用```module()```——这个方法可以把测试分组在一起。一个典型的分组方法就是把测试同一个方法的多个测试分为一个组(module)。

####简单的QUnit模块:
```javascript
module( 'Module One' );
test( 'first test', function() {} );
test( 'another test', function() {} );

module( 'Module Two' );
test( 'second test', function() {} );
test( 'another test', function() {} );

module( 'Module Three' );
test( 'third test', function() {} );
test( 'another test', function() {} );
```

We can take this further by introducing ```setup()``` and ```teardown()``` callbacks to our modules, where ```setup()``` is run before each test whilst ```teardown()``` is run after each test.

####Using setup() and teardown() :
```javascript
module( "Module One", {
    setup: function() {
        // run before
    },
    teardown: function() {
        // run after
    }
});

test("first test", function() {
    // run the first test
});
```

These callbacks can be used to define (or clear) any components we wish to instantiate for use in one or more of our tests. As we'll see shortly, this is ideal for defining new instances of views, collections, models or routers from a project that we can then reference across multiple tests.

####Using setup() and teardown() for instantiation and clean-up:
```javascript
// Define a simple model and collection modeling a store and
// list of stores

var Store = Backbone.Model.extend({});

var StoreList = Backbone.Collection.extend({
    model: store,
    comparator: function( store ) { return store.get('name') }
});

// Define a group for our tests
module( "StoreList sanity check", {
    setup: function() {
        this.list = new StoreList;
        this.list.add(new Store({ name: "Costcutter" }));
        this.list.add(new Store({ name: "Target" }));
        this.list.add(new Store({ name: "Walmart" }));
        this.list.add(new Store({ name: "Barnes & Noble" });
    },
    teardown: function() {
        window.errors = null;
    }
});

// Test the order of items added
test( "test ordering", function() {
    expect( 1 );
    var expected = ["Barnes & Noble", "Costcutter", "Target", "Walmart"];
    var actual = this.list.pluck("name");
    deepEqual( actual, expected, "is maintained by comparator" );
});

```

Here, a list of stores is created and stored on ```setup()```. A ```teardown()``` callback is used to simply clear our a list of errors we might be storing within the window scope, but is otherwise not needed.


##Assertion examples

Before we continue any further, let's review some more examples of how QUnits various assertions can be correctly used when writing tests:

###equal - a comparison assertion. It passes if actual == expected

```javascript
test( "equal", 2, function() {
  var actual = 6 - 5;
  equal( actual, true,  "passes as 1 == true" );
  equal( actual, 1,     "passes as 1 == 1" );
});
```


###notEqual - a comparison assertion. It passes if actual != expected

```javascript
test( "notEqual", 2, function() {
  var actual = 6 - 5;
  notEqual( actual, false, "passes as 1 != false" );
  notEqual( actual, 0,     "passes as 1 != 0" );
});
```

###strictEqual - a comparison assertion. It passes if actual === expected.

```javascript
test( "strictEqual", 2, function() {
  var actual = 6 - 5;
  strictEqual( actual, true,  "fails as 1 !== true" );
  strictEqual( actual, 1,     "passes as 1 === 1" );
});
```

###notStrictEqual - a comparison assertion. It passes if actual !== expected.

```javascript
test("notStrictEqual", 2, function() {
  var actual = 6 - 5;
  notStrictEqual( actual, true,  "passes as 1 !== true" );
  notStrictEqual( actual, 1,     "fails as 1 === 1" );
});
```

###deepEqual - a recursive comparison assertion. Unlike strictEqual(), it works on objects, arrays and primitives.

```javascript
test("deepEqual", 4, function() {
  var actual = {q: 'foo', t: 'bar'};
  var el =  $('div');
  var children = $('div').children();

  equal( actual, {q: 'foo', t: 'bar'},   "fails - objects are not equal using equal()" );
  deepEqual( actual, {q: 'foo', t: 'bar'},   "passes - objects are equal" );
  equal( el, children, "fails - jQuery objects are not the same" );
  deepEqual(el, children, "fails - objects not equivalent" );

});
```

###notDeepEqual - a comparison assertion. This returns the opposite of deepEqual

```javascript
test("notDeepEqual", 2, function() {
  var actual = {q: 'foo', t: 'bar'};
  notEqual( actual, {q: 'foo', t: 'bar'},   "passes - objects are not equal" );
  notDeepEqual( actual, {q: 'foo', t: 'bar'},   "fails - objects are equivalent" );
});
```

###raises - an assertion which tests if a callback throws any exceptions

```javascript
test("raises", 1, function() {
  raises(function() {
    throw new Error( "Oh no! It's an error!" );
  }, "passes - an error was thrown inside our callback");
});
```

##Fixtures


From time to time we may need to write tests that modify the DOM. Managing the clean-up of such operations between tests can be a genuine pain, but thankfully QUnit has a solution to this problem in the form of the `#qunit-fixture` element, seen below.

####Fixture markup:
```html
<!DOCTYPE html>
<html>
<head>
    <title>QUnit Test</title>
    <link rel="stylesheet" href="qunit.css">
    <script src="qunit.js"></script>
    <script src="app.js"></script>
    <script src="tests.js"></script>
</head>
<body>
    <h1 id="qunit-header">QUnit Test</h1>
    <h2 id="qunit-banner"></h2>
    <div id="qunit-testrunner-toolbar"></div>
    <h2 id="qunit-userAgent"></h2>
    <ol id="qunit-tests"></ol>
    <div id="qunit-fixture"></div>
</body>
</html>
```

We can either opt to place static markup in the fixture or just insert/append any DOM elements we may need to it. QUnit will automatically reset the `innerHTML` of the fixture after each test to its original value. In case you're using jQuery, it's useful to know that QUnit checks for its availability and will opt to use ```$(el).html()``` instead, which will cleanup any jQuery event handlers too.


###Fixtures example:

Let us now go through a more complete example of using fixtures. One thing that most of us are used to doing in jQuery is working with lists - they're often used to define the markup for menus, grids and a number of other components. You may have used jQuery plugins before that manipulated a given list in a particular way and it can be useful to test that the final (manipulated) output of the plugin is what was expected.

For the purposes of our next example, we're going to use Ben Alman's `$.enumerate()` plugin, which can prepend each item in a list by its index, optionally allowing us to set what the first number in the list is. The code snippet for the plugin can be found below, followed by an example of the output is generates:

```javascript
$.fn.enumerate = function( start ) {
      if ( typeof start !== "undefined" ) {
        // Since `start` value was provided, enumerate and return
        // the initial jQuery object to allow chaining.

        return this.each(function(i){
          $(this).prepend( "<b>" + ( i + start ) + "</b> " );
        });

      } else {
        // Since no `start` value was provided, function as a
        // getter, returing the appropriate value from the first
        // selected element.

        var val = this.eq( 0 ).children( "b" ).eq( 0 ).text();
        return Number( val );
      }
    };

/*
    <ul>
      <li>1. hello</li>
      <li>2. world</li>
      <li>3. i</li>
      <li>4. am</li>
      <li>5. foo</li>
    </ul>
*/
```

Let's now write some specs for the plugin. First, we define the markup for a list containing some sample items inside our ```qunit-fixture``` element:

```html
&lt;div id=&quot;qunit-fixture&quot;&gt;
    &lt;ul&gt;
      &lt;li&gt;hello&lt;/li&gt;
      &lt;li&gt;world&lt;/li&gt;
      &lt;li&gt;i&lt;/li&gt;
      &lt;li&gt;am&lt;/li&gt;
      &lt;li&gt;foo&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/div&gt;
```

Next, we need to think about what should be tested. `$.enumerate()` supports a few different use cases, including:

* **No arguments passed** - i.e ```$(el).enumerate()```
* **0 passed as an argument** - i.e ```$(el).enumerate(0)```
* **1 passed as an argument** - i.e ```$(el).enumerate(1)```

As the text value for each list item is of the form "n. item-text" and we only require this to test against the expected output, we can simply access the content using ```$(el).eq(index).text()``` (for more information on .eq() see [here](http://api.jquery.com/eq/)).

and finally, here are our test cases:

```javascript
module("jQuery#enumerate");

test( "No arguments passed", 5, function() {
  var items = $("#qunit-fixture li").enumerate();
  equal( items.eq(0).text(), "1. hello", "first item should have index 1" );
  equal( items.eq(1).text(), "2. world", "second item should have index 2" );
  equal( items.eq(2).text(), "3. i", "third item should have index 3" );
  equal( items.eq(3).text(), "4. am", "fourth item should have index 4" );
  equal( items.eq(4).text(), "5. foo", "fifth item should have index 5" );
});

test( "0 passed as an argument", 5, function() {
  var items = $("#qunit-fixture li").enumerate( 0 );
  equal( items.eq(0).text(), "0. hello", "first item should have index 0" );
  equal( items.eq(1).text(), "1. world", "second item should have index 1" );
  equal( items.eq(2).text(), "2. i", "third item should have index 2" );
  equal( items.eq(3).text(), "3. am", "fourth item should have index 3" );
  equal( items.eq(4).text(), "4. foo", "fifth item should have index 4" );
});

test( "1 passed as an argument", 3, function() {
  var items = $("#qunit-fixture li").enumerate( 1 );
  equal( items.eq(0).text(), "1. hello", "first item should have index 1" );
  equal( items.eq(1).text(), "2. world", "second item should have index 2" );
  equal( items.eq(2).text(), "3. i", "third item should have index 3" );
  equal( items.eq(3).text(), "4. am", "fourth item should have index 4" );
  equal( items.eq(4).text(), "5. foo", "fifth item should have index 5" );
});

```

##Asynchronous code

As with Jasmine, the effort required to run synchronous tests with QUnit is fairly straight-forward. That said, what about tests that require asynchronous callbacks (such as expensive processes, Ajax requests and so on)? When we're dealing with asynchronous code, rather than letting QUnit control when the next test runs, we can inform that we need it to stop running and wait until it's okay to continue once again.

Remember: running asynchronous code without any special considerations can cause incorrect assertions to appear in other tests, so we want to make sure we get it right.

Writing QUnit tests for asynchronous code is made possible using the ```start()``` and ```stop()``` methods, which programmatically set the start and stop points during such tests. Here's a simple example:

```javascript
test("An async test", function(){
   stop();
   expect( 1 );
   $.ajax({
        url: "/test",
        dataType: 'json',
        success: function( data ){
            deepEqual(data, {
               topic: "hello",
               message: "hi there!"
            });
            start();
        }
    });
});
```

A jQuery ```$.ajax()``` request is used to connect to a test resource and assert that the data returned is correct. ```deepEqual()``` is used here as it allows us to compare different data types (e.g objects, arrays) and ensures that what is returned is exactly what we're expecting. We know that our Ajax request is asynchronous and so we first call ```stop()```, run the code making the request and finally at the very end of our callback, inform QUnit that it is okay to continue running other tests.

Note: rather than including ```stop()```, we can simply exclude it and substitute ```test()``` with ```asyncTest()``` if we prefer. This improves readability when dealing with a mixture of asynchronous and synchronous tests in your suite. Whilst this setup should work fine for many use-cases, there is no guarantee that the callback in our ```$.ajax()``` request will actually get called. To factor this into our tests, we can use ```expect()``` once again to define how many assertions we expect to see within our test. This is a healthy safety blanket as it ensures that if a test completes with an insufficient number of assertions, we know something went wrong and fix it.



#SinonJS

Similar to the section on testing Backbone.js apps using the Jasmine BDD framework, we're nearly ready to take what we've learned and write a number of QUnit tests for our Todo application.

Before we start though, you may have noticed that QUnit doesn't support test spies. Test spies are functions which record arguments, exceptions and return values for any of their calls. They're typically used to test callbacks and how functions may be used in the application being tested. In testing frameworks, spies can usually be either anonymous functions or wrap functions which already exist.


##What is SinonJS?

In order for us to substitute support for spies in QUnit, we will be taking advantage of a mocking framework called [SinonJS](http://sinonjs.org/) by Christian Johansen. We will also be using the [SinonJS-QUnit adapter](http://sinonjs.org/qunit/) which provides seamless integration with QUnit (meaning setup is minimal). Sinon.JS is completely test-framework agnostic and should be easy to use with any testing framework, so it's ideal for our needs.

The framework supports three features we'll be taking advantage of for unit testing our application:

* **Anonymous spies**
* **Spying on existing methods**
* **A rich inspection interface**

Using ```this.spy()``` without any arguments creates an anonymous spy. This is comparable to ```jasmine.createSpy()``` and we can observe basic usage of a SinonJS spy in the following example:

####Basic Spies:
```javascript
test("should call all subscribers for a message exactly once", function () {
    var message = getUniqueString();
    var spy = this.spy();

    PubSub.subscribe( message, spy );
    PubSub.publishSync( message, "Hello World" );

    ok( spy1.calledOnce, "the subscriber was called once" );
});
```

We can also use ```this.spy()``` to spy on existing functions (like jQuery's ```$.ajax```) in the example below. When spying on a function which already exists, the function behaves normally but we get access to data about its calls which can be very useful for testing purposes.

####Spying On Existing Functions:
```javascript
test( "should inspect jQuery.getJSON's usage of jQuery.ajax", function () {
    this.spy( jQuery, "ajax" );

    jQuery.getJSON( "/todos/completed" );

    ok( jQuery.ajax.calledOnce );
    equals( jQuery.ajax.getCall(0).args[0].url, "/todos/completed" );
    equals( jQuery.ajax.getCall(0).args[0].dataType, "json" );
});
```

SinonJS comes with a rich spy interface which allows us to test whether a spy was called with a specific argument, if it was called a specific number of times and test against the values of arguments. A complete list of features supported in the interface can be found here (http://sinonjs.org/docs/), but let's take a look at some examples demonstrating some of the most commonly used ones:


####Matching arguments: test a spy was called with a specific set of arguments:

```javascript
test( "Should call a subscriber with standard matching": function () {
    var spy = sinon.spy();

    PubSub.subscribe( "message", spy );
    PubSub.publishSync( "message", { id: 45 } );

    assertTrue( spy.calledWith( { id: 45 } ) );
});
```

####Stricter argument matching: test a spy was called at least once with specific arguments and no others:

```javascript
test( "Should call a subscriber with strict matching": function () {
    var spy = sinon.spy();

    PubSub.subscribe( "message", spy );
    PubSub.publishSync( "message", "many", "arguments" );
    PubSub.publishSync( "message", 12, 34 );

    // This passes
    assertTrue( spy.calledWith("many") );

    // This however, fails
    assertTrue( spy.calledWithExactly( "many" ) );
});
```

####Testing call order: testing if a spy was called before or after another spy:

```javascript
test( "Should call a subscriber and maintain call order": function () {
    var a = sinon.spy();
    var b = sinon.spy();

    PubSub.subscribe( "message", a );
    PubSub.subscribe( "event", b );

    PubSub.publishSync( "message", { id: 45 } );
    PubSub.publishSync( "event", [1, 2, 3] );

    assertTrue( a.calledBefore(b) );
    assertTrue( b.calledAfter(a) );
});
```

####Match execution counts: test a spy was called a specific number of times:

```javascript
test( "Should call a subscriber and check call counts", function () {
    var message = getUniqueString();
    var spy = this.spy();

    PubSub.subscribe( message, spy );
    PubSub.publishSync( message, "some payload" );


    // Passes if spy was called once and only once.
    ok( spy.calledOnce ); // calledTwice and calledThrice are also supported

    // The number of recorded calls.
    equal( spy.callCount, 1 );

    // Directly checking the arguments of the call
    equals( spy.getCall(0).args[0], message );
});
```


##Stubs and mocks

SinonJS also supports two other powerful features which are useful to be aware of: stubs and mocks. Both stubs and mocks implement all of the features of the spy API, but have some added functionality.

###Stubs

A stub allows us to replace any existing behaviour for a specific method with something else. They can be very useful for simulating exceptions and are most often used to write test cases when certain dependencies of your code-base may not yet be written.

Let us briefly re-explore our Backbone Todo application, which contained a Todo model and a TodoList collection. For the purpose of this walkthrough, we want to isolate our TodoList collection and fake the Todo model to test how adding new models might behave.

We can pretend that the models have yet to be written just to demonstrate how stubbing might be carried out. A shell collection just containing a reference to the model to be used might look like this:

```javascript
var TodoList = Backbone.Collection.extend({
    model: Todo
});

// Let's assume our instance of this collection is
this.todoList;
```

Assuming our collection is instantiating new models itself, it's necessary for us to stub the models constructor function for the the test. This can be done by creating a simple stub as follows:

```javascript
this.todoStub = sinon.stub( window, "Todo" );
```

The above creates a stub of the Todo method on the window object. When stubbing a persistent object, it's necessary to restore it to its original state. This can be done in a ```teardown()``` as follows:

```javascript
this.todoStub.restore();
```

After this, we need to alter what the constructor returns, which can be efficiently done using a plain ```Backbone.Model``` constructor. Whilst this isn't a Todo model, it does still provide us an actual Backbone model.


```javascript
teardown: function() {
    this.model = new Backbone.Model({
      id: 2,
      title: "Hello world"
    });
    this.todoStub.returns( this.model );
});
```

The expectation here might be that this snippet would ensure our TodoList collection always instantiates a stubbed Todo model, but because a reference to the model in the collection is already present, we need to reset the model property of our collection as follows:

```javascript
this.todoList.model = Todo;
```

The result of this is that when our TodoList collection instantiates new Todo models, it will return our plain Backbone model instance as desired. This allows us to write a spec for testing the addition of new model literals as follows:

```javascript
module( "Should function when instantiated with model literals", {

  setup:function() {

    this.todoStub = sinon.stub(window, "Todo");
    this.model = new Backbone.Model({
      id: 2,
      title: "Hello world"
    });

    this.todoStub.returns(this.model);
    this.todos = new TodoList();

    // Let's reset the relationship to use a stub
    this.todos.model = Todo;
    this.todos.add({
      id: 2,
      title: "Hello world"
    });
  },

  teardown: function() {
    this.todoStub.restore();
  }

});

test("should add a model", function() {
    equal( this.todos.length, 1 );
});

test("should find a model by id", function() {
    equal( this.todos.get(5).get("id"), 5 );
  });
});
```


###Mocks

Mocks are effectively the same as stubs, however they mock a complete API out and have some built-in expectations for how they should be used. The difference between a mock and a spy is that as the expectations for their use are pre-defined, it will fail if any of these are not met.

Here's a snippet with sample usage of a mock based on PubSubJS. Here, we have a `clearTodo()` method as a callback and use mocks to verify its behavior.

```javascript
test("should call all subscribers when exceptions", function () {
    var myAPI = { clearTodo: function () {} };

    var spy = this.spy();
    var mock = this.mock( myAPI );
    mock.expects( "clearTodo" ).once().throws();

    PubSub.subscribe( "message", myAPI.clearTodo );
    PubSub.subscribe( "message", spy );
    PubSub.publishSync( "message", undefined );

    mock.verify();
    ok( spy.calledOnce );
});
```



Practical
====================

We can now begin writing test specs for our Todo application, which are listed and separated by component (e.g Models, Collections etc.). It's useful to pay attention to the name of the test, the logic being tested and most importantly the assertions being made as this will give you some insight into how what we've learned can be applied to a complete application.

To get the most out of this section, I recommend looking at the QUnit Koans included in the `practicals\qunit-koans` folder - this is a port of the Backbone.js Jasmine Koans over to QUnit that I converted for this post.

*In case you haven't had a chance to try out one of the Koans kits as yet, they are a set of unit tests using a specific testing framework that both demonstrate how a set of specs for an application may be written, but also leave some tests unfilled so that you can complete them as an exercise.*

###Models

For our models we want to at minimum test that:

* New instances can be created with the expected default values
* Attributes can be set and retrieved correctly
* Changes to state correctly fire off custom events where needed
* Validation rules are correctly enforced

```javascript
module( 'About Backbone.Model');

test('Can be created with default values for its attributes.', function() {
    expect( 1 );

    var todo = new Todo();

    equal( todo.get('text'), "" );
});

test('Will set attributes on the model instance when created.', function() {
    expect( 3 );

    var todo = new Todo( { text: 'Get oil change for car.' } );

    equal( todo.get('text'), "Get oil change for car." );
    equal( todo.get('done'), false );
    equal( todo.get('order'), 0 );
});

test('Will call a custom initialize function on the model instance when created.', function() {
    expect( 1 );

    var toot = new Todo({ text: 'Stop monkeys from throwing their own crap!' });
    equal( toot.get('text'), 'Stop monkeys from throwing their own rainbows!' );
});

test('Fires a custom event when the state changes.', function() {
    expect( 1 );

    var spy = this.spy();
    var todo = new Todo();

    todo.on( 'change', spy );
    // How would you update a property on the todo here?
    // Hint: http://documentcloud.github.com/backbone/#Model-set
    todo.set( { text: "new text" } );

    ok( spy.calledOnce, "A change event callback was correctly triggered" );
});


test('Can contain custom validation rules, and will trigger an error event on failed validation.', function() {
    expect( 3 );

    var errorCallback = this.spy();
    var todo = new Todo();

    todo.on('error', errorCallback);
    // What would you need to set on the todo properties to cause validation to fail?
    todo.set( { done: "not a boolean" } );

    ok( errorCallback.called, 'A failed validation correctly triggered an error' );
    notEqual( errorCallback.getCall(0), undefined );
    equal( errorCallback.getCall(0).args[1], 'Todo.done must be a boolean value.' );

});
```


###Collections

For our collection we'll want to test that:

* New model instances can be added as both objects and arrays
* Changes to models result in any necessary custom events being fired
* A `url` property for defining the URL structure for models is correctly defined


```javascript
module( 'About Backbone.Collection');

test( 'Can add Model instances as objects and arrays.', function() {
    expect( 3 );

    var todos = new TodoList();
    equal( todos.length, 0 );

    todos.add( { text: 'Clean the kitchen' } );
    equal( todos.length, 1 );

    todos.add([
        { text: 'Do the laundry', done: true },
        { text: 'Go to the gym' }
    ]);

    equal( todos.length, 3 );
});

test( 'Can have a url property to define the basic url structure for all contained models.', function() {
    expect( 1 );
    var todos = new TodoList();
    equal( todos.url, '/todos/' );
});

test('Fires custom named events when the models change.', function() {
    expect(2);

    var todos = new TodoList();
    var addModelCallback = this.spy();
    var removeModelCallback = this.spy();

    todos.on( 'add', addModelCallback );
    todos.on( 'remove', removeModelCallback );

    // How would you get the 'add' event to trigger?
    todos.add( {text:"New todo"} );

    ok( addModelCallback.called );

    // How would you get the 'remove' callback to trigger?
    todos.remove( todos.last() );

    ok( removeModelCallback.called );
});
```



###Views

For our views we want to ensure:

* They are being correctly tied to a DOM element when created
* They can render, after which the DOM representation of the view should be visible
* They support wiring up view methods to DOM elements

One could also take this further and test that user interactions with the view correctly result in any models that need to be changed being updated correctly.


```javascript
module( 'About Backbone.View', {
    setup: function() {
        $('body').append('<ul id="todoList"></ul>');
        this.todoView = new TodoView({ model: new Todo() });
    },
    teardown: function() {
        this.todoView.remove();
        $('#todoList').remove();
    }
});

test('Should be tied to a DOM element when created, based off the property provided.', function() {
    expect( 1 );
    equal( this.todoView.el.tagName.toLowerCase(), 'li' );
});

test('Is backed by a model instance, which provides the data.', function() {
    expect( 2 );
    notEqual( this.todoView.model, undefined );
    equal( this.todoView.model.get('done'), false );
});

test('Can render, after which the DOM representation of the view will be visible.', function() {
   this.todoView.render();

    // Hint: render() just builds the DOM representation of the view, but doesn't insert it into the DOM.
    //       How would you append it to the ul#todoList?
    //       How do you access the view's DOM representation?
    //
    // Hint: http://documentcloud.github.com/backbone/#View-el

    $('ul#todoList').append(this.todoView.el);
    equal($('#todoList').find('li').length, 1);
});

asyncTest('Can wire up view methods to DOM elements.', function() {
    expect( 2 );
    var viewElt;

    $('#todoList').append( this.todoView.render().el );

    setTimeout(function() {
        viewElt = $('#todoList li input.check').filter(':first');

        equal(viewElt.length > 0, true);

        // Make sure that QUnit knows we can continue
        start();
    }, 1000, 'Expected DOM Elt to exist');


    // Hint: How would you trigger the view, via a DOM Event, to toggle the 'done' status.
    //       (See todos.js line 70, where the events hash is defined.)
    //
    // Hint: http://api.jquery.com/click

    $('#todoList li input.check').click();
    expect( this.todoView.model.get('done'), true );
});
```

###Events

For events, we may want to test a few different use cases:

* Extending plain objects to support custom events
* Binding and triggering custom events on objects
* Passing along arguments to callbacks when events are triggered
* Binding a passed context to an event callback
* Removing custom events

and a few others that will be detailed in our module below:

```javascript
module( 'About Backbone.Events', {
    setup: function() {
        this.obj = {};
        _.extend( this.obj, Backbone.Events );
        this.obj.off(); // remove all custom events before each spec is run.
    }
});

test('Can extend JavaScript objects to support custom events.', function() {
    expect(3);

    var basicObject = {};

    // How would you give basicObject these functions?
    // Hint: http://documentcloud.github.com/backbone/#Events
    _.extend( basicObject, Backbone.Events );

    equal( typeof basicObject.on, 'function' );
    equal( typeof basicObject.off, 'function' );
    equal( typeof basicObject.trigger, 'function' );
});

test('Allows us to bind and trigger custom named events on an object.', function() {
    expect( 1 );

    var callback = this.spy();

    this.obj.on( 'basic event', callback );
    this.obj.trigger( 'basic event' );

    // How would you cause the callback for this custom event to be called?
    ok( callback.called );
});

test('Also passes along any arguments to the callback when an event is triggered.', function() {
    expect( 1 );

    var passedArgs = [];

    this.obj.on('some event', function() {
        for (var i = 0; i < arguments.length; i++) {
            passedArgs.push( arguments[i] );
        }
    });

    this.obj.trigger( 'some event', 'arg1', 'arg2' );

    deepEqual( passedArgs, ['arg1', 'arg2'] );
});


test('Can also bind the passed context to the event callback.', function() {
    expect( 1 );

    var foo = { color: 'blue' };
    var changeColor = function() {
        this.color = 'red';
    };

    // How would you get 'this.color' to refer to 'foo' in the changeColor function?
    this.obj.on( 'an event', changeColor, foo );
    this.obj.trigger( 'an event' );

    equal( foo.color, 'red' );
});

test( "Uses 'all' as a special event name to capture all events bound to the object." , function() {
    expect( 2 );

    var callback = this.spy();

    this.obj.on( 'all', callback );
    this.obj.trigger( "custom event 1" );
    this.obj.trigger( "custom event 2" );

    equal( callback.callCount, 2 );
    equal( callback.getCall(0).args[0], 'custom event 1' );
});

test('Also can remove custom events from objects.', function() {
    expect( 5 );

    var spy1 = this.spy();
    var spy2 = this.spy();
    var spy3 = this.spy();

    this.obj.on( 'foo', spy1 );
    this.obj.on( 'bar', spy1 );
    this.obj.on( 'foo', spy2 );
    this.obj.on( 'foo', spy3 );

    // How do you unbind just a single callback for the event?
    this.obj.off( 'foo', spy1 );
    this.obj.trigger( 'foo' );

    ok( spy2.called );

    // How do you unbind all callbacks tied to the event with a single method
    this.obj.off( 'foo' );
    this.obj.trigger( 'foo' );

    ok( spy2.callCount, 1 );
    ok( spy2.calledOnce, "Spy 2 called once" );
    ok( spy3.calledOnce, "Spy 3 called once" );

    // How do you unbind all callbacks and events tied to the object with a single method?
    this.obj.off( 'bar' );
    this.obj.trigger( 'bar' );

    equal( spy1.callCount, 0 );
});
```

###App

It can also be useful to write specs for any application bootstrap you may have in place. For the following module, our setup initiates and appends a TodoApp view and we can test anything from local instances of views being correctly defined to application interactions correctly resulting in changes to instances of local collections.

```javascript
module( 'About Backbone Applications' , {
    setup: function() {
        Backbone.localStorageDB = new Store('testTodos');
        $('#qunit-fixture').append('<div id="app"></div>');
        this.App = new TodoApp({ appendTo: $('#app') });
    },

    teardown: function() {
        this.App.todos.reset();
        $('#app').remove();
    }
});

test('Should bootstrap the application by initializing the Collection.', function() {
    expect( 2 );

    notEqual( this.App.todos, undefined );
    equal( this.App.todos.length, 0 );
});

test( 'Should bind Collection events to View creation.' , function() {
      $('#new-todo').val( 'Foo' );
      $('#new-todo').trigger(new $.Event( 'keypress', { keyCode: 13 } ));

      equal( this.App.todos.length, 1 );
 });
```

##Further Reading & Resources

That's it for this section on testing applications with QUnit and SinonJS. I encourage you to try out the [QUnit Backbone.js Koans](https://github.com/addyosmani/backbone-koans-qunit) and see if you can extend some of the examples. For further reading consider looking at some of the additional resources below:

* **[Test-driven JavaScript Development (book)](http://tddjs.com/)**
* **[SinonJS/QUnit Adapter](http://sinonjs.org/qunit/)**
* **[SinonJS and QUnit](http://cjohansen.no/en/javascript/using_sinon_js_with_qunit)**
* **[Automating JavaScript Testing With QUnit](http://msdn.microsoft.com/en-us/scriptjunkie/gg749824)**
* **[Ben Alman's Unit Testing With QUnit](http://benalman.com/talks/unit-testing-qunit.html)**
* **[Another QUnit/Backbone.js demo project](https://github.com/jc00ke/qunit-backbone)**
* **[SinonJS helpers for Backbone](http://devblog.supportbee.com/2012/02/10/helpers-for-testing-backbone-js-apps-using-jasmine-and-sinon-js/)**




# <a name="resources">Resources</a>


Whilst what we get with Backbone out of the box can be terribly useful, there are some equally beneficial add-ons that can help simplify our development process. These include:

* [Backbone Marionette](http://marionettejs.com)
* [Backbone Layout Manager](https://github.com/tbranyen/backbone.layoutmanager)
* [Backbone Boilerplate](https://github.com/backbone-boilerplate/backbone-boilerplate)
* [Backbone Model Binding](https://github.com/derickbailey/backbone.modelbinding)
* [Backbone Relational - for model relationships](https://github.com/PaulUithol/Backbone-relational)
* [Backbone CouchDB](https://github.com/janmonschke/backbone-couchdb)
* [Backbone Validations - HTML5 inspired validations](https://github.com/n-time/backbone.validations)

In time, there will be tutorials in the book covering some of these resources but until then, please feel free to check them out.


# <a name="conclusions">Conclusions</a>


That's it for 'Developing Backbone.js Applications'. I hope you found this book both useful, enlightening and a good start for your journey into exploring Backbone.js.

If there are other topics or areas of this book you feel could be expanded further, please feel free to let me know, or better yet, send a pull request upstream. I'm always interested in making this title as comprehensive as possible.

Until next time, the very best of luck with the rest of your journey!

## Notes

I would like to thank the Backbone.js, Stack Overflow, DailyJS (Alex Young) and JavaScript communities for their help, references and contributions to this book. This project would not be possible without you so thank you! :)


---
Where relevant, copyright Addy Osmani, 2012.

