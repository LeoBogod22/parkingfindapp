![alt text](app/assets/images/SmartPark.png)
This tool accepts a parking spot address from a user, geocodes the  address to latitude longitude, displays it on the map  and converts the Latitude and Longitude to a real address. 



<h1> About </h1>


SmartPark helps users find and rent public parking spots around the city. Users provide the phonenumber and address of the parking spot.At the end users can give each other reviews.. Was created with Rails Gmaps4Rail + the geocoder gem.



<h1>Getting Started</h1>

To start using this app, you only have to do the typical Rails things:

Install Ruby version 2.2.2 (using RVM or RBenv or whatever).

Clone the repo and do the bundle install thing:
```
user@computer:~$ git clone git@github.com:LeoBogod22/parkingfindapp.git
user@computer:~$ cd parkingfindapp
user@computer:/parkingfindapp$ bundle install
user@computer:/parkingfindapp$ rake db:migrate
When all this finish, you're ready to launch the app!
user@computer:/parkingfindapp$ rails s
```
Open your web browser and go to http://localhost:3000 like in all the regular Rails apps.
