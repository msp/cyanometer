# API Documentation

* [Cyanometer.EnvironmentalDataController](#cyanometerenvironmentaldatacontroller)
  * [create](#cyanometerenvironmentaldatacontrollercreate)
  * [index](#cyanometerenvironmentaldatacontrollerindex)
  * [show](#cyanometerenvironmentaldatacontrollershow)
* [Cyanometer.ImageController](#cyanometerimagecontroller)
  * [create](#cyanometerimagecontrollercreate)
  * [delete](#cyanometerimagecontrollerdelete)
  * [index](#cyanometerimagecontrollerindex)
  * [landing](#cyanometerimagecontrollerlanding)
  * [show](#cyanometerimagecontrollershow)
  * [update](#cyanometerimagecontrollerupdate)
* [Cyanometer.LocationController](#cyanometerlocationcontroller)
  * [create](#cyanometerlocationcontrollercreate)
  * [delete](#cyanometerlocationcontrollerdelete)
  * [index](#cyanometerlocationcontrollerindex)
  * [show](#cyanometerlocationcontrollershow)
  * [update](#cyanometerlocationcontrollerupdate)

## Cyanometer.EnvironmentalDataController
### Cyanometer.EnvironmentalDataController.create
#### authenticated endpoints with a valid JWT: POST /api/environmental_data - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/environmental_data
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "environmental_data": {}
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 8agftjfba2e627v2omu1oopi35jrpjet
```
* __Response body:__
```json
{
  "errors": {
    "taken_at": [
      "can't be blank"
    ],
    "icon": [
      "can't be blank"
    ],
    "air_pollution_index": [
      "can't be blank"
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: POST /api/environmental_data - creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/environmental_data
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "environmental_data": {
    "taken_at": "2016-06-05T16:04:17",
    "icon": "sun",
    "air_pollution_index": "20"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 4tn38opehbbg0a9o90kldr5fo06fu7cm
location: /api/environmental_data/8548
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "id": 8548,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

### Cyanometer.EnvironmentalDataController.index
#### public endpoints: GET /api/environmental_data
##### Request
* __Method:__ GET
* __Path:__ /api/environmental_data
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 6pc64e8segqcjvkp1pvomfmcl1olgcnd
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-06-07T10:00:25",
    "id": 8573,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "id": 8572,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "id": 8571,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "id": 8570,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "id": 8569,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "id": 8568,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "id": 8567,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "id": 8566,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "id": 8565,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "id": 8564,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "id": 8563,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "id": 8562,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "id": 8561,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "id": 8560,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "id": 8559,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "id": 8558,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "id": 8557,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "id": 8556,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "id": 8555,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "id": 8554,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "id": 8553,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "id": 8552,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "id": 8551,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:02",
    "id": 8550,
    "icon": "sun",
    "air_pollution_index": "20"
  }
]
```

### Cyanometer.EnvironmentalDataController.show
#### public endpoints: GET /api/environmental_data/:id - shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/environmental_data/8547
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 5kpk479h9g1lfqn5t9up3gvfvfsptgj1
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "id": 8547,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

## Cyanometer.ImageController
### Cyanometer.ImageController.create
#### authenticated endpoints with a valid JWT: POST /api/locations/:id/image - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/6411/images
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "image": {
    "s3_url": "https://not-our-s3-bucket/foo.jpg"
  }
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: qen5bun4cm4tmlqk0c1fsjppjeb9nk0i
```
* __Response body:__
```json
{
  "errors": {
    "taken_at": [
      "can't be blank"
    ],
    "s3_url": [
      "Not our S3 host: https://not-our-s3-bucket/foo.jpg"
    ],
    "location_id": [
      "can't be blank"
    ],
    "blueness_index": [
      "can't be blank"
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: POST /api/locations/:id/images - creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/6421/images
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "image": {
    "taken_at": "2016-06-05T16:04:17",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
    "location_id": 6421,
    "blueness_index": "4"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: e8u0jvjou2bu4pqemm7jhfofo0hrnua7
location: /api/images/12148
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 6421,
  "id": 12148,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id/images/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/6419/images/12147
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
```
##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
x-request-id: t16p8jc7p1ateatipccqb99pqk4b4l3q
```
* __Response body:__
```json

```

### Cyanometer.ImageController.index
#### public endpoints: GET /api/locations/:id/images - 24 records, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/6414/images
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2o36ep8as1g8bjndn261afitc01gq7av
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-06-07T10:00:25",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/FDBDBCF9D3554F0A.jpg",
    "location_id": 6414,
    "id": 12144,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/313E7DC778B4633E.jpg",
    "location_id": 6414,
    "id": 12143,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/10E67B824989D8F4.jpg",
    "location_id": 6414,
    "id": 12142,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/2D3C3D95C0160818.jpg",
    "location_id": 6414,
    "id": 12141,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/2156CD8CE757A8CB.jpg",
    "location_id": 6414,
    "id": 12140,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/27936070AF2ACC43.jpg",
    "location_id": 6414,
    "id": 12139,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/AB30D58396950393.jpg",
    "location_id": 6414,
    "id": 12138,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/1A7A22FDE4EE91B5.jpg",
    "location_id": 6414,
    "id": 12137,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/0C53D874B8716B21.jpg",
    "location_id": 6414,
    "id": 12136,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/32BA1E6A565709AC.jpg",
    "location_id": 6414,
    "id": 12135,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/C38426935ADDDEE6.jpg",
    "location_id": 6414,
    "id": 12134,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/3E06E21108FDD088.jpg",
    "location_id": 6414,
    "id": 12133,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/B93E098F2C2AF0E8.jpg",
    "location_id": 6414,
    "id": 12132,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5BE650438C7E5148.jpg",
    "location_id": 6414,
    "id": 12131,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/125F361181AA215E.jpg",
    "location_id": 6414,
    "id": 12130,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/D60178CFFAC98105.jpg",
    "location_id": 6414,
    "id": 12129,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/489955954A37555B.jpg",
    "location_id": 6414,
    "id": 12128,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/8B9EA390FDF0FB30.jpg",
    "location_id": 6414,
    "id": 12127,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/293B44816FD8C047.jpg",
    "location_id": 6414,
    "id": 12126,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/93B42ED3A9A8E3B7.jpg",
    "location_id": 6414,
    "id": 12125,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/FADF5007ACF6DF34.jpg",
    "location_id": 6414,
    "id": 12124,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/B2A67534ADE6E1D2.jpg",
    "location_id": 6414,
    "id": 12123,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/D421679E8C53C049.jpg",
    "location_id": 6414,
    "id": 12122,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:02",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/FFE3AB73A0F9D373.jpg",
    "location_id": 6414,
    "id": 12121,
    "blueness_index": "3"
  }
]
```

### Cyanometer.ImageController.landing
#### public endpoints: GET /landing - returns latest image per location from multi locations
##### Request
* __Method:__ GET
* __Path:__ /api/landing/3
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: onmvo6k4ddj28sb40mnt0gv5hqp31mg8
```
* __Response body:__
```json
[
  {
    "taken_at": "2017-04-04T10:30:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/69EB0B008488EACA.jpg",
    "location_id": 6403,
    "location": "London, UK",
    "id": 12107,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-04-04T10:15:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/472F15983187314F.jpg",
    "location_id": 6404,
    "location": "Ljubljana, Slovenia",
    "id": 12108,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-04-04T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/06B657E42D1B37A1.jpg",
    "location_id": 6405,
    "location": "Moscow, Russia",
    "id": 12109,
    "blueness_index": "3"
  }
]
```

### Cyanometer.ImageController.show
#### public endpoints: GET /api/locations/:id/image/:id - shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/6416/images/12145
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: deekpfm152iudcmqpmp3e9olpoohhvhd
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 6415,
  "id": 12145,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id/images/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/6412/images/12119
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "image": {
    "s3_url": "https://not-our-s3-bucket/foo.jpg"
  }
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: d0l17enb15gle72sqk8p60q4sphd9lqe
```
* __Response body:__
```json
{
  "errors": {
    "s3_url": [
      "Not our S3 host: https://not-our-s3-bucket/foo.jpg"
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: PUT /api/locations/:id/images/:id - updates and renders chosen resource when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/6417/images/12146
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "image": {
    "taken_at": "2016-06-05T16:04:17",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
    "blueness_index": "99"
  }
}
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2kf8rjg4gbr4t7q9dajlre5j53uk44hq
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 6418,
  "id": 12146,
  "blueness_index": "99"
}
```

## Cyanometer.LocationController
### Cyanometer.LocationController.create
#### authenticated endpoints with a valid JWT: POST /api/locations - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/locations
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "location": {}
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: mq89qqje6l0l3713u7b79t04cgnbh8er
```
* __Response body:__
```json
{
  "errors": {
    "place": [
      "can't be blank"
    ],
    "country": [
      "can't be blank"
    ],
    "city": [
      "can't be blank"
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: POST /api/locations - creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/locations
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "location": {
    "place": "Town Square",
    "country": "Slovenia",
    "city": "Ljubjana"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 0ua7jr2o2k3e35rktaffuf7aba04joi3
location: /api/locations/6393
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 6393,
  "country": "Slovenia",
  "city": "Ljubjana"
}
```

### Cyanometer.LocationController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/6394
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
```
##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
x-request-id: b9rnqskqema69jjoc143mesb6218ibbb
```
* __Response body:__
```json

```

### Cyanometer.LocationController.index
#### public endpoints: GET /api/locations - lists all entries on index
##### Request
* __Method:__ GET
* __Path:__ /api/locations
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: no7urk4443s9ii1450kfjc5hafrk33mu
```
* __Response body:__
```json
[
  {
    "place": "Place-1",
    "id": 6396,
    "country": "Country-1",
    "city": "City-1"
  },
  {
    "place": "Place-2",
    "id": 6397,
    "country": "Country-2",
    "city": "City-2"
  },
  {
    "place": "Place-3",
    "id": 6398,
    "country": "Country-3",
    "city": "City-3"
  },
  {
    "place": "Place-4",
    "id": 6399,
    "country": "Country-4",
    "city": "City-4"
  },
  {
    "place": "Place-5",
    "id": 6400,
    "country": "Country-5",
    "city": "City-5"
  }
]
```

### Cyanometer.LocationController.show
#### public endpoints: GET /api/locations/:id -shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/6401
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 1m0b98ivgumg5ivl0fik2i0qn6122p15
```
* __Response body:__
```json
{
  "place": null,
  "id": 6401,
  "country": null,
  "city": null
}
```

### Cyanometer.LocationController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/6392
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "location": {}
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: pqdat0e4bh2722covlitvsrlj2313p15
```
* __Response body:__
```json
{
  "errors": {
    "place": [
      "can't be blank"
    ],
    "country": [
      "can't be blank"
    ],
    "city": [
      "can't be blank"
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: PUT /api/locations/:id - updates and renders chosen resource when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/6395
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.8KBNXVJPTRPILjUhMga1Z_ykhqgv3n4DUXegzEacxZs
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "location": {
    "place": "Town Square",
    "country": "Slovenia",
    "city": "Ljubjana"
  }
}
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: nslb11ajnj5crlk7ihrs18ih52bub85m
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 6395,
  "country": "Slovenia",
  "city": "Ljubjana"
}
```

