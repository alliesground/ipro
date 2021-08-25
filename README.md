# README

Running the application locally

* Install Docker with Docker Compose

* Clone the project

* export current host user's id as environment variable
  `export UID=$(id -u)`

* From inside the project root folder run `docker-compose up --build`

* Run `docker-compose exec web rake db:migrate`

---

## Using the Application Api

#### `POST localhost:3000/signup` to signup a new user

* No arguments needed.
* When you sign up you will receive a token in response.
* Pass that token as a Bearer Token Authorization Header in the subsequent requests.


#### `GET localhost:3000/products` to list all products(no need for authentication for this api)
* This will list all the seeded products.
* Select the products id and prices id to which you would like to subscribe.


#### `POST localhost:3000/subscriptions` to subscribe to the product price
* pass the above selected products id and price id as json body
* Include Berer Authorization Token


#### `GET localhost:3000/profile` to get current users subscribed products
