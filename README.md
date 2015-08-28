# predictingemail



### Steps to Use predictingemail

(these assume that you have ruby and bundler installed on your computer)

1.  unzip the file in a location that you remember
2.  open your terminal and move ('cd') into the predicting email directory and run 'bundle install'

    `$ bundle install`
    
3.  create, migrate and seed the database. run this:

    `$ bundle exec rake db:create db:migrate db:seed`
    
4.  start your server. Warning, this will run a server on port 9393 by default.

    `$ bundle exec shotgun`
    
5.  now open up a browser (preferably chrome) and go to this link [http://localhost:9393/](http://localhost:9393/)
6.  Here, you can enter in a name in the name field (ie ""Peter Wong") and a company url (ie "alphasights.com") and click the predict button.
7.  This will generate the predicted emails. If you're using a browser that's enabled for javascript, you'll see the response below the prediction form. If not, you'll move to a new page to see the response (to go back to the main page, you can click the 'home' link).
8.  If you get one email that means that everyone in our database with that company url follows a specific pattern. if you get multiple emails that means there are multiple patters for people in our database with that company url. Finally, if you don't get an email pattern that means we don't have any email patterns yet for people with that company url. 

### Steps to Test
1.  Go back in the terminal and into the predictingemail directory
2.  from here prepare the test database:

    `$ be rake db:test:prepare`
    
3.  now you should be able to run the tests with:

    `$ be rspec`
    
  
### Design Decisions
1.  I decided to make this a web app, since it would be easy for users to use (especially if it is hosted).
2.  I decided to add the sample data to the database in case we would want to add, update, or delete it in the future.
3.  That said, I made the schema very simple given since the actual challenge isn't requiring much in the way to CRUD.
4.  I chose to use sinatra since this would be a simple web app with one form and a couple routes.



### To Dos
1.  Currently, there is no way for a user to create, updated, or delete data from the database. Moving forward, it would be ncie to allow users to add more folks to our data sample.
2.  If you only enter one name the app currently blows up, so it would be nice to account for that on the front end and back end.
3.  Based on what data would be added in the future, it would make sense to have more models. With more data it would make sense to add a company model and other table for data that we may need to find. 
