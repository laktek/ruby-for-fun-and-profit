#Ruby for Fun and Profit! - Part 2
# Getting Started with Rails

## Introduction 

First of all, my apologize for the omission of this column in last issue. Anyway, lets continue with our exploration of Ruby land. Today I will introduce you the poster child of Ruby - Rails web framework. Rails was one of the major reasons which made Ruby popular. Most of the developers, like myself first came for Rails and then stayed for Ruby.

![Rails Logo](http://rubyonrails.org/images/rails.png)

Rails is designed to make programming web applications easier by making several assumptions about what every developer needs to get started. It allows you to write less code while accomplishing more than many other languages and frameworks. It actually makes web application development more fun.

Rails is opinionated software. That is, it assumes that there is a best way to do things, and it’s designed to encourage that best way – and in some cases to discourage alternatives. If you learn “The Rails Way” you’ll probably discover a tremendous increase in productivity. If you persist in bringing old habits from other languages to your Rails development, and trying to use patterns you learned elsewhere, you may have a less happy experience.

The Rails philosophy includes several guiding principles:

* DRY – “Don’t Repeat Yourself” – suggests that writing the same code over and over again is a bad thing.
* Convention Over Configuration – means that Rails makes assumptions about what you want to do and how you’re going to do it, rather than letting you tweak every little thing through endless configuration files.
* REST is the best pattern for web applications – organizing your application around resources and standard HTTP verbs is the fastest way to go.

## MVC

Rails is organized around the Model, View, Controller architecture, usually just called MVC. MVC benefits include:

* Isolation of business logic from the user interface
* Ease of keeping code DRY
* Making it clear where different types of code belong for easier maintenance

### Models

A model represents the information (data) of the application and the rules to manipulate that data. In the case of Rails, models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, one table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.

### Views

Views represent the user interface of your application. In Rails, views are often HTML files with embedded Ruby code that performs tasks related solely to the presentation of the data. Views handle the job of providing data to the web browser or other tool that is used to make requests from your application.

### Controllers

Controllers provide the “glue” between models and views. In Rails, controllers are responsible for processing the incoming requests from the web browser, interrogating the models for data, and passing that data on to the views for presentation.

## The Rails Stack

Rails provides a full stack of components for creating web applications, including:

* Action Controller
* Action View
* Active Record
* Action Mailer
* Active Resource
* Railties
* Active Support

### Action Controller

Action Controller is the component that manages the controllers in a Rails application. The Action Controller framework processes incoming requests to a Rails application, extracts parameters, and dispatches them to the intended action. Services provided by Action Controller include session management, template rendering, and redirect management.

### Action View

Action View manages the views of your Rails application. It can create both HTML and XML output by default. Action View manages rendering templates, including nested and partial templates, and includes built-in AJAX support.

### Active Record

Active Record is the base for the models in a Rails application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services.

### Action Mailer

Action Mailer is a framework for building e-mail services. You can use Action Mailer to send emails based on flexible templates, or to receive and process incoming email.

### Active Resource

Active Resource provides a framework for managing the connection between business objects an RESTful web services. It implements a way to map web-based resources to local objects with CRUD semantics.

### Railties

Railties is the core Rails code that builds new Rails applications and glues the various frameworks together in any Rails application.

### Active Support

Active Support is an extensive collection of utility classes and standard Ruby library extensions that are used in the Rails, both by the core code and by your applications.


## REST

The foundation of the RESTful architecture is generally considered to be Roy Fielding’s doctoral thesis, [Architectural Styles and the Design of Network-based Software Architectures](http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm). Fortunately, you need not read this entire document to understand how REST works in Rails. REST, an acronym for Representational State Transfer, boils down to two main principles for our purposes:

* Using resource identifiers (which, for the purposes of discussion, you can think of as URLs) to represent resources
* Transferring representations of the state of that resource between system components.

For example, to a Rails application a request such as this:

DELETE /photos/17

would be understood to refer to a photo resource with the ID of 17, and to indicate a desired action – deleting that resource. REST is a natural style for the architecture of web applications, and Rails makes it even more natural by using conventions to shield you from some of the RESTful complexities and browser quirks.

## Getting on to the Track 

Okay, enough on theoritical stuff, I know you are eagerly waiting to get into the water. Before we get started, you need to make sure that you have Rails itself installed.

### Installing Rails

In most cases, the easiest way to install Rails is to take advantage of RubyGems (I assume you already have installed Ruby, if you need to install Ruby please refer to this column in dGit issue #1 ):

<code>$ gem install rails</code> 

* If you’re working on Windows, you may find it easier to install [Instant Rails](http://instantrails.rubyforge.org/wiki/wiki.pl). Be aware, though, that Instant Rails releases tend to lag seriously behind the actual Rails version. Also, you will find that Rails development on Windows is overall less pleasant than on other operating systems. For best experience I suggest that you install a Linux virtual machine and use that for Rails development, instead of using Windows.

### Creating the Blog 

Open a terminal, navigate to a folder where you have rights to create files, and type:
<code>$ rails blog</code>

This will create a Rails application that uses a SQLite database for data storage. If you prefer to use MySQL, run this command instead:
<code>$ rails blog -d mysql</code>

After you create the blog application, switch to its folder to continue work directly in that application:
<code>$ cd blog </code>

In any case, Rails will create a folder in your working directory called blog. Open up that folder and explore its contents. Most of our work will happen in the app/ folder, but here’s a basic rundown on the function of each folder that Rails creates in a new application by default:

<table>
<tbody><tr>
<th>File/Folder</th>
<th>Purpose</th>
</tr>
<tr>
<td><span class="caps">README</span></td>
<td>This is a brief instruction manual for your application. Use it to tell others what your application does, how to set it up, and so on.</td>
</tr>
<tr>
<td>Rakefile</td>
<td>This file contains batch jobs that can be run from the terminal.</td>
</tr>
<tr>
<td>app/</td>
<td>Contains the controllers, models, and views for the application. Most of our work will happen in here.</td>
</tr>
<tr>
<td>config/</td>
<td>Configures application’s runtime rules, routes, database, and more.</td>
</tr>
<tr>
<td>db/</td>
<td>Shows the current database schema, as well as the database migrations. You’ll learn about migrations later in this tutorial.</td>
</tr>
<tr>
<td>doc/</td>
<td>Rails core API documentation and documentation for plugins and gems you use in the application</td>
</tr>
<tr>
<td>lib/</td>
<td>Extended modules for your application (for most of customizations).</td>
</tr>
<tr>
<td>log/</td>
<td>Application log files.</td>
</tr>
<tr>
<td>public/</td>
<td>The only folder seen to the world as-is.  This is where your images, javascript, stylesheets (<span class="caps">CSS</span>), and other static files go.</td>
</tr>
<tr>
<td>script/</td>
<td>Scripts provided by Rails to do recurring tasks, such as benchmarking, plugin installation, and starting the console or the web server.</td>
</tr>
<tr>
<td>test/</td>
<td>Unit tests, fixtures, and other test apparatus.</td>
</tr>
<tr>
<td>tmp/</td>
<td>Temporary files</td>
</tr>
<tr>
<td>vendor/</td>
<td>A place for third-party code. In a typical Rails application, this includes Ruby Gems, the Rails source code (if you install it into your project) and plugins containing additional prepackaged functionality.</td>
</tr>
</tbody>
</table>


### Configuring a Database

Just about every Rails application will interact with a database. The database to use is specified in a configuration file, _config/database.yml_. If you open this file in a new Rails application, you’ll see a default database configuration using SQLite. The file contains sections for three different environments in which Rails can run by default:

* The _development_ environment is used on your development computer as you interact manually with the application
* The _test_ environment is used to run automated tests
* The _production_ environment is used when you deploy your application for the world to use.

Most of you may already are familar with MySQL. So lets use a MySQL database for our application. Change the _development_ section of your _config/database.yml_ file as follows.

<code>
  development: 
  adapter: mysql 
  encoding: utf8 
  database: blog_development 
  pool: 5 
  username: root 
  password: 
  socket: /tmp/mysql.sock 
</code>

Most of the local installations of MySQL comes with username 'root' and empty password. If your configuration is different please change those fields.

### Creating the Database

Now that you have your database configured, it’s time to have Rails create an empty database for you. You can do this by running a rake command:
<code>$ rake db:create</code> 

**Note** Rake is a general-purpose command-runner that Rails uses for many things. You can see the list of available rake commands in your application by running rake -T.

## Hello, Rails!  

Now lets see how we can get traditional 'Hello World' on the screen with Rails. For that you will to create at minimum a controller and a view. Fortunately, you can do that in a single command. Enter this command in your terminal:

<code>$ script/generate controller home index  </code>

Rails will create several files for you, including _app/views/home/index.html.erb_. This is the template that will be used to display the results of the index action (method) in the home controller. Open this file in your text editor and edit it to contain a single line of code:

<code> <h1>Hello, Rails!</h1> </code> 

### Starting up the Web Server

You actually have a functional Rails application already – after running only two commands! To see it, you need to start a web server on your development machine. You can do this by running another command:
<code>$ script/server</code> 

This will start Rails' web server, WebBrick (or Mongrel, depending on your setup). To see your application in action, open a browser window and navigate to http://localhost:3000. You should see a page with Rails’ default information.

![Rails Default Page](http://guides.rails.info/images/rails_welcome.png)

**TIP**. To stop the web server, hit Ctrl+C in the terminal window where it’s running. In development mode, Rails does not generally require you to stop the server; changes you make in files will be automatically picked up by the server.

The “Welcome Aboard” page is the smoke test for a new Rails application: it makes sure that you have your software configured correctly enough to serve a page. To view the page you just created, navigate to http://localhost:3000/home/index.

### Setting the Application Home Page

You’d probably like to replace the “Welcome Aboard” page with your own application’s home page. The first step to doing this is to delete the default page from your application:
<code>$ rm public/index.html</code>

Now, you have to tell Rails where your actual home page is located. Open the file _config/routes.rb_ in your editor. This is your application’s, routing file, which holds entries in a special DSL (domain-specific language) that tells Rails how to connect incoming requests to controllers and actions. At the bottom of the file you’ll see the default routes:

<code>map.connect ':controller/:action/:id' map.connect ':controller/:action/:id.:format'</code>

The default routes handle simple requests such as _/home/index_: Rails translates that into a call to the index action in the home controller. As another example, _/posts/edit/1_ would run the edit action in the posts controller with an id of 1.

To hook up your home page, you need to add another line to the routing file, above the default routes:
<code>map.root :controller => "home"</code>

This line illustrates one tiny bit of the “convention over configuration” approach: if you don’t specify an action, Rails assumes the index action.

Now if you navigate to <http://localhost:3000> in your browser, you’ll see the _home/index_ view.

Voila! Now you got a Rails app running!

## What's Next? 

We just covered the basics of Rails in this issue. This is just a tip of an ice-berg. There are lot of other cool stuff in Rails and Ruby which I will share with you in the coming months. Next month, we will build a fully fledged, usable web application with Rails. So be sure checkout this column in next month. Until then, _'Happy Hacking!'_  


## Free Resources

Here are some free Rails' resources for you.

* Rails Screencasts & Presentations - <http://rubyonrails.org/screencasts>
* Rails Guides - <http://guides.rubyonrails.org/>
* Rails Complete API - <http://api.rubyonrails.org/>

### Creative Commons License

Ruby for Fun and Profit by Lakshan Perera is licensed under a [Creative Commons Attribution-Share Alike 3.0 United States License](http://creativecommons.org/licenses/by-sa/3.0/us/). 


