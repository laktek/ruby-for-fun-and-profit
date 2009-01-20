#Ruby for Fun and Profit! 

## Preamble

_I believe people want to express themselves when they program. They don't want to fight with the language. Programming languages must feel natural to programmers. - [Yukihiro Matsumoto (Matz)](http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html) _

Unless you are a hardcore geek who can see the curves in a bit pattern, Programming sounds painful and boring for rest of us. However my attitude towards programming was changed after I stumbled upon this beautiful language. Her name is Ruby. She is simple, yet smart and sounded very human. Ruby has changed programming, from mere act of problem solving to powerful art of expression.
  
Whether you are a seasoned hacker who wants a productive companion or a novice looking for some cool-aid, learning Ruby is a perfect choice.  In this series of articles, we will be riding through Ruby, exploring all her beauty, wit and power. 

## Made in Japan

Most of us loves the stuff from Japan. The tag **Made in Japan** holds a unique value, especially for thier engineering marvels and design excellence.  If you feels the same, you may be excited to know that Ruby also bears with the same tag.  Smart Japanese programmer, [Yukihiro "Matz" Matsumoto](http://en.wikipedia.org/wiki/Yukihiro_Matsumoto) was the brainchild behind Ruby. He felt the need of a flexible scripting language which built with the power of Object Oriented programming. He went on to blend parts of his favourite languages (Perl, Smalltalk, Eiffel, Ada, and Lisp) to come up with an unique new language.   

He started his work on February 24, 1993. Matz wrote Ruby with the philosophy of "Principle of least surprise". After 2 years Ruby was released to public as an Open Source project and slowly it started to gain traction from the global community.

However, Ruby language really came to its limelight with **Ruby on Rails** (you must've heard this buzzword so many times in the web 2.0 circus). It is a web application framework written in Ruby by [David Heinemeier Hansson](http://en.wikipedia.org/wiki/David_Heinemeier_Hansson). With the ever increasing popularity of Rails, Ruby started to grow beyond leaps and bounds. Today there are more than 2 million [**Citation Needed**] active Ruby developers worldwide and this number is still on the rise. 

## What makes Ruby so special?

Ruby is built on several key concepts which make it shine among the rest of programming languages. Basic understanding of these key concepts and metaphors will help you to get a better start. Don't worry if any of these sounds puzzling, we will covering each of them in depth later.

### Everything is an Object

In Ruby everything is treated as an object. That means you can have properties, methods and return values for each and every data type in Ruby (even Nil is an Object). Compare this with language like Java or C++, where they have primitive data types and every statement will not return an object. 

### Duck Typing

Ruby determines the type of an object from its capabilities (to what properties and methods that Object can respond) rather than from its inheritance. This form of behaviour is known as [Duck Typing](http://en.wikipedia.org/wiki/Duck_typing) or more generically dynamic typing. This means you don't have to define data type for objects, the Ruby Interpreter will handle that for you.

### Bottom Up Programming

Ruby embraces the principle of [_bottom-up design_](http://www.paulgraham.com/progbot.html). It means changing the language to suit your problem. Every class in Ruby (including the Standard Library classes) is an open class, where you could change its behaviour by overriding its current methods or by adding your own methods. Further you could attach a code block with any method call, which could be used to modify the behaviour of the method during the run time.

### Rich Eco-System

Ruby has very strong eco-system around it. There are great resources to help you to learn Ruby, including books, blogs, screencasts, IRC channels and etc. Though Rails is Ruby's poster child, there are lots of other interesting stuff you could do with Ruby. For example try [creating music](http://goruco2008.confreaks.com/02_bowkett.html) or [controlling electronics](http://rubyconf2007.confreaks.com/d1t2p1_ruby_and_electronics.html) with Ruby. You will find lot of awesome Ruby libraries and modules, in the form of [RubyGems](http://www.rubygems.org). You could easily plug and play these gems to your own applications.   
     
## Hello World (sucks!)

Knowing the background of Ruby, now it's time to get into the water. First of all will cover some basic prerequisites.

### Installing Ruby

Installing Ruby on any platform is simple and easy. For Windows you could use the [one-click installer](http://rubyinstaller.rubyforge.org/wiki/wiki.pl?RubyInstaller) and if you are on Linux based such as Debian or Fedora you could install it via the default package manager (apt-get or yum). Also you have the option of compiling it from the source. For more comprehensive details on installation please visit - <http://www.ruby-lang.org/en/downloads/>  

After you have installed Ruby, open the command-line terminal and type: 

<code>  
  $ ruby -v
</code>
  
If all went well, you should see an output similar to following.

<code>  
  $ ruby -v
  ruby 1.8.7 (2008-08-11 patchlevel 72) [i486-linux]
</code>

In this series of tutorials we will be using the Ruby version 1.8.7, most of the examples discussed here will be applicable for all Ruby 1.8.X versions.

### Interactive Ruby

Ruby comes with an interactive console, which we could use to get a quick taste of Ruby. You could start the console by typing `irb` on the command line or by running the program `fxri`(on Windows).

I personally dislike to start off with Hello World, which sounds insane. However, for the sake of conventional language users (for those who knows how to say Hello World in 400 languages and very little beyond that ;)) will start of with it. So on your consoles just type this line:

<code>
  puts "Hello World"
</code>
  
You should see your obedient machine greeting you back with a nice "Hello World". Okay, that was actually a pretty much obvious, so let's move on to something bit more exciting. 

Drop this line on the console and Ruby will greet you with three hearty cheers! Hip Hip Hooray!

<code>
  3.times { puts "Hip Hip Hooray!" }
</code>

What exactly we did here? we called the method `times` on integer 3 and along with the method call we attached a code block( which was enclosed within curly brackets). The `times` method will iterate through the given code block for specified number of times.

## Lets do some REAL stuff

I feel there is no point of learning a programming language if we cannot use it to scratch our itch. So without without wasting any superficial examples, we are going to build something that we could use everyday. A simple To Do List manager. Open up your favourite text editor (remember you don't need a bulky <abbr title="Integrated Development Environment">IDE</abbr> to write Ruby) and pull up your socks, we are going to start hacking!

We will be building our ToDo manager in the agile way. Starting from the very basic features and enhancing them in each iteration.

The most preliminary version will have the following functionality.
1. Add a task.
2. Listing the available tasks

### Building Blocks

First, we will need to identify the classes we should build. In Object Oriented principles classes acts as the blueprint or cookie cutter for the real objects. The way object should behave is defined in the class. 
 
We will have a main `TodoList` class which will implement all the methods related to the todo list and also a `Task` class which will be used to hold the individual task objects.

Here is how we define a class in Ruby. 

<code>
  class TodoList
    #here goes the methods and properties
  end
</code>

In Ruby, it is customary to define the class name in camel case. We start the each word with a capital letter and leave no spaces between the words. We are closing the class with the keyword `end`. One more thing, in Ruby you could leave a comment with a `#`(hash) symbol.

Now we are going to add a method to the class. A method is defined with `def` keyword. You can accept arguments to the method, these arguments goes along with the method name enclosed with parenthesis.  

    def initialize(name)
      @list_name = name  
      @tasks = Array.new
    end

The method we defined above, `initialize` holds a special meaning. As the name implies `initialize` method will be executed when you create a new instance(object) of the given class. For example following code will create a new TodoList object.
  
<code>
  my_tasks = TodoList.new("My Tasks")
</code>

Each `TodoList` instance will have a name and an array to hold the tasks. Every time we create a new `TodoList` object, we will assign it a name and reserve an empty array for tasks. We call such variables as instance variable as they are specific to a particular instance. In Ruby, instance variable names are notated with a `@` symbol. Since instance variables are scoped within object life cycle, they will not be accessible to outside methods. 

So how do we make these instance variables accessible to outside methods? Common design pattern is to use two methods to read and write the instance variable. These methods are known as **attribute accessors**. However it would be pretty annoying to write such methods for each and every instance variable we want to expose. Ruby makes our life easy by introducing handy shortcuts to implement attribute accessors. There are 3 such shortcuts, `attr_reader`, `attr_writer` and `attr_accessor`. `attr_reader` will generate the read method for the instance variable, similarly `attr_writer` will generate the write method and `attr_accessor` will generate both read and write methods. Lets add attribute accessors in our `TodoList` class.

    class TodoList
      
      attr_accessor :list_name
      attr_reader :tasks
      
      def initialize(name)
        @list_name = name  
        @tasks = Array.new
      end
         
    end

After defining the `TodoList` class, lets move to the `Task` class. In the initial stage we shall have only a name for our tasks.
    
    class Task
      attr_accessor :name
      
      def initialize(name)
        @name = name
      end
    end
    
### Adding Meat

We have the barebone classes ready, now lets move on to add some meat. Lets see how are we going to add a new task to the task list. All we have to do here is create a new task object and then push it to the tasks array. We also have to pass the name of the task to be added, as a parameter.

  def add(name)
    task = Task.new(name)
    @tasks.push(task)
  end

Since we can add tasks to our task list, next there should be a way to display the added tasks. This is also very simple thing to do. All we have to do here is iterate through our tasks array and print each one of them on the screen. Further we are adding a condition to display a nice message when there are no tasks on the list.

     def list
        puts "Your Tasks:"
        return "This Task List is empty" if @tasks.empty?
        
        @tasks.each do |task|
          puts "- #{task.name} [#{task.status}]"
        end
      end

In this method we have used several ruby idioms. Remember we said a method in Ruby will always return a value? But if you did notice we didn't explicitly specified a return value for any of our previous methods. That's because Ruby automatically return the value of the last line executed as the return value. However if you look carefully in the above method we have defined a return value. That is a conditional statement which will be executed if only the tasks are blank. So if the method come across an empty tasks array it will gracefully return from the method. 

Another spiffy option in Ruby syntax is the flexibility in placing the conditions(`if` clause). In most of the programming languages we define the conditional clause first and then the predicate. But in Ruby if you prefer you could define the conditional clause after the predicate. This could make the code really readable in some cases, as plain English. Read the line 3 of above `list` method. Can you understand what it means? It can be read as "Say(return) 'This Task List is empty' if task list is empty".

Rather than using a traditional `for` loop for iterating through the tasks array, we have used a method called `each` which can be applied to any enumerable object (such as arrays, hashes). `each` method will execute a given code block for each iteration. It also passes the current item in array to the code block. We have defined the code block to be executed inside keyword `do..end`(alternatively, a code block can be defined inside curly braces - {})

### DIY challenge

I think we covered mouthful of Ruby for the day. So it's time to call it a day and go for a walk :) However we are not yet done with our app endeavour. We will be revisiting it in the next issue, with bunch of other cool stuff. So stay tuned!

Oh! wait why should you wait till the next tutorial? You could try to build the rest of the features yourself. I know you are a big hacker at heart! Here are some enhancements you could try by your own.
* Ability to set the status of a task
* Option of setting the deadline of a task
* Removing an added task
* Editing a task.

Below I have specified some handy ebooks you could refer, also there are lots of other Ruby resources online. Google is your friend ;) If you have any questions, suggestions, or critics please feel free to contact me via lakshan [at] web2media [dot] net 


## Free Resources

Here are some free and awesome Ruby books if you are craving for more.

* Why's (Poignant) Guide to Ruby (**My Personal Favourite**) - <http://poignantguide.net/ruby/index.html>
* Mr. Neighborly's Humble Little Ruby Book - <http://humblelittlerubybook.com/>
* Programming Ruby (aka. The Pickaxe) - <http://www.whytheluckystiff.net/ruby/pickaxe/>
  
## Source Code

You can find the source code for the examples used in this article at <http://github.com/laktek/ruby-for-fun-and-profit>

**PLEASE NOTE : This is still a working draft. Contents are subject to change.

###Creative Commons License

Ruby for Fun and Profit by Lakshan Perera is licensed under a [Creative Commons Attribution-Share Alike 3.0 United States License](http://creativecommons.org/licenses/by-sa/3.0/us/). 


