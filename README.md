== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# Hackathon

## API End Point

<strong>https://pre-post-interview.herokuapp.com</strong>

## local development server

<strong>http://brian.t.proxylocal.com</strong>

#Users

##**sign up/create user**
####Request

`POST /users`

```json
{
	"user": {
	 	"email": "testing@testing3.com",
     	"password": "password",
     	"password_confirmation": "password"
    }
}
```
####Response
`Status: 201 Created`

creates a user, returns a success message, email, and authentication token.

```json
{
	"user": {
		 "email": "testing@testing.com",
		 "authentication_token": "xV47wpXmfMB4zMCL3s-k"
		}
}
```
error examples:

```json
{
	"messages": [
		"Email can't be blank"
	]
}
```
##**sign in**

####Request


`POST /users/sign_in`


```json
"user": {
	"email": "testing@testing.com",
	"password": "password",
}
```

allows a user to sign in. optionally, you can pass username or email as `:login `or `:username` to the `users/sign_in` route and get a successful sign in if the parameter matches either the email or username of the user and the passwor d is correct.

####Response

`Status: 200 OK`

```json
{
	"user": {
		"username": null,
		"email": "testing@testing.com",
		"authentication_token": "uvGRGDE4eYe_zoLR95QJ"
	}
}
```


##**log out**

####Request

`DELETE users/sign_out`

```json
{
    "authentication_token": "xV47wpXmfMB4zMCL3s-k"
}
```

####Response
currently, there is no response on sign out because each request handles every api call.


##**create new company**

####Request


`POST /company`


```json
{
    "authentication_token": "xV47wpXmfMB4zMCL3s-k",
    "name": "Delta"
}
```

allows a user to create a new company.

####Response

`Status: 201 Created`

```json
{
  "company": {
    "id": 3,
    "name": "Delta"
  }
}
```