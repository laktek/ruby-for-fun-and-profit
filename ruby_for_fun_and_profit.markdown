#Ruby for Fun and Profit! 

## Preamble

_I believe people want to express themselves when they program. They don't want to fight with the language. Programming languages must feel natural to programmers. - [Yukihiro Matsumoto (Matz)](http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html) _

Unless you are a hardcore geek who can see the curves in a bit pattern, Programming sounds painful and boring for rest of us. However my attitude towards programming was changed after I stumbled upon this beautiful language. Her name is Ruby. She is simple, yet smart and sounded very human. Ruby has changed programming, from mere act of problem solving to powerful art of expression.
  
Whether you are a seasoned hacker who wants a productive companion or a novice looking for some cool-aid, learning Ruby is a perfect choice.  In this series of articles, I hope to take you through Ruby, showing you all her beauty, wit and power. 

## Made in Japan

 Most of us loves the stuff from Japan. We hunt for the tag **Made in Japan** when we are going for auto mobiles or electronic gadgets.  If you have the same nostalgia, you may be excited to know that Ruby also comes with the same tag.  Inspiring Japanese programmer named [Yukihiro "Matz" Matsumoto](http://en.wikipedia.org/wiki/Yukihiro_Matsumoto) was the brainchild behind Ruby. He felt the need of a flexible scripting language which built with the power of Object Oriented programming. He went on to blend parts of his favourite languages (Perl, Smalltalk, Eiffel, Ada, and Lisp) to come up with an unique new language.   

He started his work on February 24, 1993. Matz wrote Ruby with the philosophy of "Principle of least surprise". After 2 years Ruby was released to public as an Open Source project and slowly it started to gain traction from the global community.

However, Ruby language really came to its limelight with **Ruby on Rails** (it has a popular buzzword in the web 2.0 circus). It is a web application development framework written in Ruby [David Heinemeier Hansson](http://en.wikipedia.org/wiki/David_Heinemeier_Hansson). With the ever increasing popularity of Rails, Ruby started to grow beyond leaps and bounds. Today there are more than 2 million [**Citation Needed**] active Ruby developers worldwide and this number is still on the rise. 

## What makes Ruby so special?

Ruby is built on several key concepts which make it shine among the rest of programming languages. Basic understanding of these key concepts and metaphors will help you to get a better start. If any of these sounds puzzling don't worry we will be exploring each of them in more depth later in this series.

### Everything is an Object

In Ruby everything is treated as an object. That means you can have properties and methods for every piece of information and code in Ruby (even Nil is an Object). Compare this with language like Java or C++, where they have primitive data types and every statement will not return an object. 

### Duck Typing

Ruby determines the type of an Object from its capabilities (to what properties and methods that Object can respond) rather than its inheritance. This form of behaviour is known as [Duck Typing](http://en.wikipedia.org/wiki/Duck_typing) or more generically dynamic typing. This means you don't have to define data type for objects, the Ruby Interpreter will take care of that.

### Bottom Up Programming

Ruby embraces the principle of [_bottom-up design_](http://www.paulgraham.com/progbot.html). It means changing the language to suit your problem. Every class in Ruby (including the Standard Library classes) is an open class, where you could change its behaviour by overriding its current methods or by adding your own methods. Further you could attach a code block with any method call, which could be used to modify the behaviour of the method during the run time.

### Rich Eco-System

Ruby has very strong eco-system around it. There are great resources to help you to learn Ruby, including books, blogs, screencasts, IRC channels and etc. Though Rails is Ruby's poster child, there are lots of other interesting stuff you could done with Ruby. For example you could [create music](http://goruco2008.confreaks.com/02_bowkett.html) or [control electronics](http://rubyconf2007.confreaks.com/d1t2p1_ruby_and_electronics.html) with Ruby. You will find lot of awesome Ruby libraries and modules, in the form of [RubyGems](http://www.rubygems.org). You could easily plug and play with these gems in your own applications.   
     
## Warm Up

Knowing the background of Ruby, now it's time to get into the water. First of all will cover some basic prerequisites.

### Installing Ruby

Installing Ruby on any platform is simple and easy. For Windows you could use the [one-click installer](http://rubyinstaller.rubyforge.org/wiki/wiki.pl?RubyInstaller) and if you are on Linux based such as Debian or Fedora you could install it via the default package manager (apt-get or yum). Also you have the option of compiling it from the source. For more comprehensive details on installation please visit - <http://www.ruby-lang.org/en/downloads/>  

After you have installed Ruby, open the command-line and type: 

<code>  
  $ ruby -v
</code>
  
If all went well, you should see an output similar to following.

<code>  
  $ ruby -v
  ruby 1.8.7 (2008-08-11 patchlevel 72) [i486-linux]
</code>

In this series of tutorials we will be using the Ruby version 1.8.7, most of the examples will be applicable for all Ruby 1.8.X versions.

### Interactive Ruby

Ruby comes with an interactive console, which we could use to get a quick taste of Ruby. You could start the console by typing `irb` on the command line or by running the program `fxri`(on Windows).

So how do we start? I personally dislike to start off with Hello World, which sounds very insane. However, for the sake of conventional language users (for those who knows how to say Hello World in 400 languages and very little beyond that ;)) will start of with it. So on your consoles just type this line:

<code>
  puts "Hello World"
</code>
  
If all goes well you should see your obedient machine greeting you back with a nice "Hello World". Okay, that was actually a pretty much obvious, so let's move on to something bit more exciting. 

How about giving three hearty cheers for Ruby? Lets drop this line on the console.

<code>
  3.times { puts "Hip Hip Hooray!" }
</code>

You should see "Hip Hip Hooray" printed on 3 lines. What exactly we did here? we called the method `times` on integer 3 and along with the method call we attached a code block( which was enclosed within curly brackets). The `times` method iterates through the given code block for specified number of times.

## Lets do some REAL stuff

I feel there is no point of learning a programming language if we cannot use it to scratch our itch. So without without wasting any superficial examples, we are going to build something that will be useful on everyday. A To Do List manager. Open up your favourite text editor (remember you don't need a bulky IDE to write Ruby) and pull up your socks, we are going to start hacking!

We will be building our ToDo manager in the agile way. Starting from the very basic features and enhancing them in each iteration.

The most preliminary version will have the following functionality.
1. Add a task.
2. Edit a task.
3. Remove tasks
4. Listing the available tasks
5. Marking Tasks as completed.

### Classes and Objects

First, we will need to identify the classes we should build. In Object Oriented principles classes acts as the blueprint or cookie cutter for the real objects. That means object's behaviour is defined in the class. 
 
We will have a main `TodoList` class which will implement all the methods related to the todo list and also a `Task` class which will be used to hold the individual task objects.

Here is how we define a class in Ruby. 

<code>
  class TodoList
    #here goes the methods and properties
  end
</code>

In Ruby, it is customary to define the class name in camel case. We start the each word with a capital letter and leave no spaces between the words. We are closing the class with the keyword `end`. One more thing, in Ruby you could leave a comment with a `#`(hash) symbol.

Now we are going to add a method to the class. In Ruby method is defined with `def` keyword. You can pass accept arguments to the method, these arguments goes along with the method name enclosed with parenthesis.  

<code>
  def initialize(name)
    @list_name = name  
    @tasks = Array.new
  end
</code>
  
The method we defined above, `initialize` holds a special meaning. As the name implies `initialize` method will be executed when you create a new instance(object) of the given class. For example following code will create a new TodoList object.
  
<code>
  my_tasks = TodoList.new("My Tasks")
</code>

Inside the initialize method we have assigned values to two variables. In Ruby variables started with a `@` symbol is known as instance variables. Instance variables will reside and only available within the scope of the instance. So every method in that object will have access to those variables but they will not be accessible to the outside methods. 

### Getters and Setters




## Free Resources

Here are some free awesome Ruby books if you are nostalgic for more.
  * Why's (Poignant) Guide to Ruby (**My Personal Favourite**) - <http://poignantguide.net/ruby/index.html>
  * Mr. Neighborly's Humble Little Ruby Book - <http://humblelittlerubybook.com/>
  * Programming Ruby (aka. The Pickaxe) - <http://www.whytheluckystiff.net/ruby/pickaxe/>
  

**PLEASE NOTE : This is still a working draft. Contents are subject to change.

 


