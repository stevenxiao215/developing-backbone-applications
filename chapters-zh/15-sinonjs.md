#SinonJS

跟前面使用Jasmine BDD框架测试Backbone.js app类似，我们通过给Todo应用写一些QUnit测试来学习。

你可能注意到QUnit不支持spies。Test spies记录参数，异常并且返回值给其它的调用。通常用于测试回调，以及函数如何被使用。在测试框架中，spies可以是匿名也可以是包裹已有的函数。


##什么是SinonJS?

在QUnit中我们可以用Christian Johansen编写的模拟框架[SinonJS](http://sinonjs.org/)来支持spies。同时还要使用[SinonJS-QUnit adapter](http://sinonjs.org/qunit/)来与QUnit进行无缝集成。Sinon.JS 是完全与测试框架无关的，而且可以容易的与任何测试框架一同使用，所以对于我们的需求它是非常理想的选择。

这个框架支持三项特性我们会在单元测试中用上：

* **匿名spies**
* **监测(Spying on)已有的方法**
* **丰富的监视接口**

使用```this.spy()```不传入任何参数则创建一个匿名的spy。可以与```jasmine.createSpy()```做比较， 下面是基本的使用SinonJS spy的例子：

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

同样可以使用```this.spy()```来监视下面例子中已有的函数(比如jQuery的```$.ajax```)。当监视了一个已有函数时，它的函数行为跟正常情况一样，但是我们可以访问到调用的相关数据用于测试。

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

SinonJS提供了一套丰富的监视接口，可以测试一个spy是否使用指定的参数调用，是否被调用了指定的次数，以及测试调用时参数的值。接口支持的完整特性可以看这里(http://sinonjs.org/docs/)，我们通过一些例子来看下常用的特性：


####参数匹配：测试一个spy是否使用指定参数调用：

```javascript
test( "Should call a subscriber with standard matching": function () {
    var spy = sinon.spy();

    PubSub.subscribe( "message", spy );
    PubSub.publishSync( "message", { id: 45 } );

    assertTrue( spy.calledWith( { id: 45 } ) );
});
```

####严格的参数匹配：测试一个spy使用指定的参数并且无其它参数，至少被调用一次： 

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

####测试调用顺序：测试一个spy是否在另一个spy之前或之后调用：

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

####匹配执行次数：测试一个是否被调用了指定的次数：

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


##Stubs和mocks

SinonJS还支持另外2个强大的特性：stubs和mocks。stubs和mocks都实现了spy API的所有特性，但是添加写其它功能。

###Stubs

一个stub可以允许我们把指定的方法的行为替换成其它的东西。它可以用于模拟异常，常用于编写当必要依赖项代码还没编写时的测试。

我们重新回到Backbone Todo application，包含一个Todo model和一个TodoList collection。作为演示，我们把TodoList collection单独隔离，仿造Todo model来测试添加新的models会发生什么。

假设models并没有编写好，仅示范stubbing如何进行。一个包含model引用的collection外壳：

```javascript
var TodoList = Backbone.Collection.extend({
    model: Todo
});

// Let's assume our instance of this collection is
this.todoList;
```

假设collection自身可以实例化models，我们需要为这个测试stub models的构造函数。可以像下面这样：

```javascript
this.todoStub = sinon.stub( window, "Todo" );
```

上面在window上创建了一个Todo方法的stub。当stubbing一个持久对象时，可能还需要恢复其原始状态。可以使用```teardown()``` ：

```javascript
this.todoStub.restore();
```

然后，我们需要改变这个构造函数的返回，使用真实的```Backbone.Model```构造器。虽然它不是一个Todo model，但它给我们提供了一个实际的Backbone model。


```javascript
teardown: function() {
    this.model = new Backbone.Model({
      id: 2,
      title: "Hello world"
    });
    this.todoStub.returns( this.model );
});
```

这里的期望可能是这段代码可以确保TodoList collection总是实例化stubbed Todo model，不过collection已经存在一个model的引用，我们需要重新设置下collection的model属性：

```javascript
this.todoList.model = Todo;
```

这样做的结果就是，当TodoList collection实例化新的Todo models时，它会返回给我们一个纯净的Backbone model。下面编写一个spec测试下添加字面的model：

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

Mocks实际上跟stubs一样，不过它们会模仿出完整的API并且如何使用它们有一些内置的期望。 mock也spy的区别就是因为它们使用的expectations是预定义的，如果有任何不符就会失败。

这有个基于PubSubJS使用mock的例子。有一个`clearTodo()` 方法做为回调，使用mocks来校验它的行为。
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



练习
====================

现在我们可以开始给Todo application写测试specs了，根据组件(比如Models, Collections等)来列举和分隔。需要注意测试的名称，被测试的逻辑，以及最重要的断言，这些都可以让你体会到如何将所学到的应用到一个完整的项目中。

另外，建议你看下`practicals\qunit-koans`目录下的QUnit Koans - 这是我为这篇文章将Jasmine Koans转换成了QUnit。

*如果你还没有尝试过Koans kits，它是一组使用特定测试框架的单元测试，展示了如何为一个application编写一组specs，同时也留了一些没有填充的测试作为练习。*

###Models

对于model我们需要测试下面几点：

* 可以使用期望的默认值创建实例
* 属性可以正常的设置和恢复
* 状态的改变在需要时可以正确的触发自定义事件
* 验证规则正确的执行

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

对于collection我们要测试到下面几点：

* 可以添加新的Todo model对象或者对象的数组。
* models的变化会触发必要的自定义事件。
* 定义models结构对应的`url`属性是正确的。


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

对于views我们要确保下面几点：

* 创建时被正确的绑定到DOM元素。
* view的每个DOM可见之后会渲染。
* 支持view方法与DOM元素间的连接。

也可以进一步测试用于与view的交互行为会正确触发models必要的更新。


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

对于事件，我们需要做一些不一样的测试用例：

* 扩展纯对象，支持自定义事件
* 绑定和触发对象的自定义事件
* 当事件触发时让参数经过回调函数
* 把一个传入的上下文绑定到一个事件的回调
* 移除自定义事件

还有一些其它细节将会在面的模块中：

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

编写应用启动程序的测试specs也非常有必要。下面的模块，setup中启动和添加了一个TodoApp view，然后测试application内的view是否被正确的定义，view的交互是否触发collections的正确变化。

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

##更多阅读和资源

使用QUnit和SinonJS来测试应用这一节就这么多了。鼓励你尝试下[QUnit Backbone.js Koans](https://github.com/addyosmani/backbone-koans-qunit) 看是否能扩展里面的一些例子。
可参看下面更多相关阅读资料：

* **[Test-driven JavaScript Development (book)](http://tddjs.com/)**
* **[SinonJS/QUnit Adapter](http://sinonjs.org/qunit/)**
* **[SinonJS and QUnit](http://cjohansen.no/en/javascript/using_sinon_js_with_qunit)**
* **[Automating JavaScript Testing With QUnit](http://msdn.microsoft.com/en-us/scriptjunkie/gg749824)**
* **[Ben Alman's Unit Testing With QUnit](http://benalman.com/talks/unit-testing-qunit.html)**
* **[Another QUnit/Backbone.js demo project](https://github.com/jc00ke/qunit-backbone)**
* **[SinonJS helpers for Backbone](http://devblog.supportbee.com/2012/02/10/helpers-for-testing-backbone-js-apps-using-jasmine-and-sinon-js/)**
