#X-PAT | X-CHANGE 

----
## THE PROBLEM & SOLUTION 
>(R7, R8, & R11 )

This marketplace application is aimed at solving a personal problem. When I moved overseas, I tried to be efficient (cheap) and brought a number of appliances with me. I planned to use a converter, however, said converter was over advertised and under powered. After a fried immersion blender, I opted to abandon the hopes of using any other American appliances. Instead, I dreamt I could easily connect with individuals moving to the USA so they could take my appliances with them and I could have theirs that worked in Australia. With such a global population, there must be other individuals in the same situation But, how to connect with them?
 
At present, one could post or peruse gumtree, craigslist, or other community bulletins to find used appliances that fit your needs. But wouldn’t it be great if there was a go to app? I present the solution: *X-Pat | X-Change*. This two-way marketplace app will be a platform to connect buyers and sellers. It caters to their specific needs, with origin country, plug type, voltage, and current location being posted for each item. Not only will this app save those moving abroad a big headache, items that may have been destined for a landfill will have a new lease on life. This is the MVP, there is much room for expansion.

----
## THE LINKS:
>(R9 & R10)

For the app see [X-Pat|X-Change](https://fierce-ridge-01437.herokuapp.com/)

For the Github Repo see [srahooa](https://github.com/srahooa/xpat-xchange)


## AUDIENCE & USER STORIES
----
>(R11 & R12)

I am specifically targeting those individuals who have moved overseas or those who are planning to move overseas. These users are going to be adults with household goods and they are likely trying to decide whether to move with or without appliances. 

There will be buyers, sellers, and an admin for the site. Buyers will be interested in browsing, searching, using a checkout cart, and purchasing products posted on the site. They will want to know what the product is, where it came from, what the voltage and plug specifications are, the condition, current location, and price. Sellers will want to post an item with pictures. At a later date they will want the options to edit or delete listings. Both buyers and sellers may want to contact the admin with enquiries and feedback. The admin will want to watch to the site to make sure the usage is as desired. They will want to have the ability to edit and delete all items.

For full user stories see [Trello](https://trello.com/b/GWwIQGbP/marketplace-app)

<img src="docs/Trello_2.png">

## TECH STACK
----
>(R11)

**Ruby** - an interpreted, object oriented programming language.

**Rails** - a framework for web-applications written in Ruby.

**Git** - a version control system that is a Devs best friend.

**Heroku** - a cloud platform service that does app deployment.


## THIRD PARTY SERVICES
----
>(R16)

**Devise** - Devise is used to create a user log to provide an application with authentication. Users sign up with emails and passwords and can then return to the site and login again using the same credentials. and enable those with users that log in additional options or resources. In development, I have practiced the pattern of foo@bar.com w/ the password of 'foobar'.

**Rolify**	- Rolify aids in generating different roles for users. This is useful for authorisation and making it so that user 'A' can do X but not Y and user 'B' can do Y but not X. An example, and how I used Rolify in this app, is a site administrator. The user "admin@admin.com' has been given the role of 'admin.' Using this role, I wrote logic so that unless a user has the role of admin, they cannot edit or destroy products that are not theirs. All other emails registered are given the default role of 'user'.

**Bulma** - Bulma is a css styling framework that is meant to simplify styling of an app. Based on flexbox, Bulma uses set commands in your HTML to give an element a certain appearance. For this application, when I wanted a very simple and clean UI, Bulma enabled me to easily set up consistent styling across the app. 

**Cloudinary** - Cloudinary is the means by which images are stored, instead of directly within the application. This aides in the efficiency and lightness of an application. Within *X-Pat | X-Change*, any image that is uploaded by a user, will be stored in Cloudinary. While Cloudinary enables image manipulation, I did not use those features for this app. 

**Stripe** - Stripe is a payment processing platform which handles the credit card and financial transactions for an application. By using Stripe or another similar payment API, an app developer avoids worrying about the security of financial details as it will be handled properly by the third party. Within this app, Stripe is called via the "Buy Now" button and a user is redirected to Stripe when they check out. To process test payments one can use 4242 4242 4242 4242.



## FEATURES
----
>(R11)

This two way marketplace connects **buyers** and **sellers** in the expat community. Any user can opt to sell an item on this website by signing up with an email and password set up using **Devise**. However, it is not necessary to log in if one is simply interested in buying. When selling, a user has the option to upload an image to their posting using **Cloudinary**. In addition to user authentication, X-Pat|X-Change also uses authorisation via **Rolify**. Through the creation of roles, the page admin has the ability to edit and destroy all posts. Using logic, sellers only have the option to edit or destroy their own items. At checkout payment is taken via **Stripe**. The checkout button redirects a user to Stripe and upon a successful transaction, the user is redirected back to the store page in hopes they want to buy more. This app is currently hosted live on **Heroku**.

<img src="docs/screenshots/homepage.png">
<img src="docs/screenshots/shop.png">
<img src="docs/screenshots/login.png">
<img src="docs/screenshots/show.png">
<img src="docs/screenshots/about.png">


## GROWTH
----

There is much that  can be improved in this application. I would like for users to be able to better manage their listings with a profile page. Similarly, it would be good if they could upload multiple images to one posting. I would like to implement a search function to facilitate easy use of the application. A messaging feature would be useful for users that might want to swap items instead of selling and for coordination. Additionally, I am interested in include geocoding and mapping of items so that users could find items that are close to them and to minimise shipping. Lastly, in the current set up, security is a concern. Before the payment is truely complete, a user could alter the URL to signal a completed transaction. 


## WIREFRAMES
----
>(R13)
In designing my wireframes and the layout of the site, I tried to keep it as simple and similar to other commerce marketplaces. My end product is slightly different as I utilised the styling elements included in Bulma.

<img src="docs/wireframes-d.png">
<img src="docs/wireframes-m.png">


## SITEMAP
----
>(R11)
I wanted to keep the navigation bar clean. It includes the link to the main shop and a link to sign in. You have the same options in the center of the page so that a user does not have to look too hard. If lost, you to navigate to any page from any page via the footer. 

<img src="docs/XPAT_XCHANGE_SITEMAP.png" width="50%">

[Docs in Docs Folder](https://github.com/srahooa/xpat-xchange/blob/master/docs/XPAT_XCHANGE_SITEMAP.png)

## ABSTRACTIONS, DATABASE MODEL, &  RELATIONSHIPS
----
>(R15, R17 & R18)

X-Pat | X-Change was built in Rails which utilises Model, View, Controller or MVC framework. This structure separates the input, processing, and output of a program, making it not only easier for developers and enabling efficiency. The Model holds the data which is called upon from the Controller and presented to the user via the View.

This application currently has four models or active records; User, Product, Order, and Role. Each model holds data that is relevant to it's file name. With multiple models, the model must specify its relationship to the other models. In this app the User can have many Products, but a Product can only belong to one User. To tie a Product to a User we use a Foreign Key. For example, when a User creates a Product to sell, the data stored includes the Users User_id (the Primary Key for the User object). 

The models determine the relationships of the data, however, the schema.rb file records what fields of data and data types are held within each model. For instance, in the creation of my Product model, I specified six fields as strings, one as an integer, and one as a decimal. The schema also records the foreing keys used in each model or table. 


## ERD
____
>(R14 & R19)
<img src="docs/X-pat_X-change ERD.png" width="50%">

[Image in Docs folder](https://github.com/srahooa/xpat-xchange/blob/master/docs/X-pat_X-change%20ERD.png)

##PROJECT MANAGEMENT
-----
>(R11 & R20)

see [Trello](https://trello.com/b/GWwIQGbP/marketplace-app)
see [Pintrest](https://www.pinterest.com.au/sarahoaldrich/marketplace-app/)

In the planning stages of this project I used Trello to lay out the planning of the MVP. Most useful was writing out the user stories to pinpoint what the project should accomplish. I have three user groups; buyers, sellers, and an admin. I also used Trello to document my inspiration via Pintrest and to take notes for the wireframes. This enabled me to keep my thoughts and plans in one place and to refer to them throughout the project. With Trello I tracked what I had accomplished and what was still left to do.

To find inspiration for styling and layouts, I used Pintrest. I wanted to keep the UI as simple and clean as possible to cater to my target audience. I opted to use one colour for branding and simplicity. Thinking about my target audience, I thought about the moving experience. Depending on if a user had recently moved or are planning a move, they are likely stressed and tired. For this reason I chose yellow for inspiration, happiness, positivity, and clarity. 

By focusing on the planning, ERDs, and Wireframes before I started coding, I was able to solidify the big picture before delving into the details. From there I worked on building the required elements for the app. Each day I implemented a new feature, such as Devise, Rolify, or Cloudinary. While it is tempting to explore new APIs and implement various features, I tried to stay as true to scope to ensure I could accomplish and understand my application to the fullest. Aside from one initial style element to test on Heroku, all of the styling was completed at the end of the project.

<img src="docs/moodboard-colours.png">
<img src="docs/wireframe-ideas.png">

