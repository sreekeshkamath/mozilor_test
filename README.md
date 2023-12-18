
# Prerequisites

Please make sure you have `docker` and `docker-compose` installed in your system. Futhermore, please ensure you are running the latest version of Ubuntu on your system.
1) Docker: 20.0.7
2) Docker Compose: 1.25.0

# Run the following commands

```
git clone https://github.com/sreekeshkamath/mozilor_test.git
sudo chown 1000:1000 mozilor_test -R
cd mozilor_test
sudo docker compose pull
sudo docker compose up -d
```
Once your docker is up and running, please access the following to verify if the configurations are correct:

To access the website: http://localhost:8000/

To access phpmyadmin: http://localhost:8080/

# API's

The following API's are created:

**Signup API:** 

Method: POST

Route: http://localhost:8000/api/signup

Body: JSON

```
{
	"name": "sreekesh",
	"email":"sreekesh@gmail.com",
	"password":"sreekesh1"
}
```
Response: 201 Created
```
{
	"message": "User successfully registered",
	"user": {
		"name": "sreekesh",
		"email": "sreekesh6@gmail.com",
		"updated_at": "2023-12-18T12:27:21.000000Z",
		"created_at": "2023-12-18T12:27:21.000000Z",
		"id": 7
	}
}
```

***

**Sigin API**

Method: POST

Route: http://localhost:8000/api/login

Body: JSON

```
{
	"email":"sreekesh@gmail.com",
	"password": "sreekesh1"
}
```
Response: 200 OK
```
{
	"message": "Successful login",
	"token": "5|4h8AaoOPkt2jaNjcWCWeVuRCdcjLUi0FoqfqYSpR"
}
```

***

**Products Import API**
Method: POST

Route: http://localhost:8000/api/products/import

Body: Multipart Form

```
file: Mozilor Products Test Data.csv(you can find it in the repository itself).
```
Response: 201 Created
```
{
	"message": "Products imported successfully."
}
```
***
**Get Products API**

Method: GET

Route: http://localhost:8000/api/products

Body: No Body

Response: 200 OK

```
[
	{
		"id": 7,
		"name": "Colgate",
		"sku": "SKU004",
		"description": "paste",
		"price": "25.55",
		"created_at": "2023-12-18T12:24:10.000000Z",
		"updated_at": "2023-12-18T12:24:10.000000Z"
	},
	{
		"id": 8,
		"name": "Brush",
		"sku": "SKU005",
		"description": "brush",
		"price": "10.00",
		"created_at": "2023-12-18T12:24:10.000000Z",
		"updated_at": "2023-12-18T12:24:10.000000Z"
	},
	{
		"id": 9,
		"name": "Hat",
		"sku": "SKU995",
		"description": "clothing",
		"price": "100.00",
		"created_at": "2023-12-18T12:24:10.000000Z",
		"updated_at": "2023-12-18T12:24:10.000000Z"
	}
]
```
***