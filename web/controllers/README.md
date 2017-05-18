# API Documentation

* [Cyanometer.EnvironmentalDataController](#cyanometerenvironmentaldatacontroller)
  * [create](#cyanometerenvironmentaldatacontrollercreate)
  * [delete](#cyanometerenvironmentaldatacontrollerdelete)
  * [index](#cyanometerenvironmentaldatacontrollerindex)
  * [show](#cyanometerenvironmentaldatacontrollershow)
  * [update](#cyanometerenvironmentaldatacontrollerupdate)
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
#### authenticated endpoints with a valid JWT: POST /api/locations/:id/environmental_data - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/1261/environmental_data
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
    "icon": "invalid-icon"
  }
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: f0ur8gkdr303jregrd3jbbbpja6eumsn
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "errors": {
    "taken_at": [
      "can't be blank"
    ],
    "location_id": [
      "can't be blank"
    ],
    "icon": [
      "is invalid"
    ],
    "air_pollution_index": [
      "can't be blank"
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: POST /api/locations/:id/environmental_data - creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/1267/environmental_data
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
    "location_id": 1267,
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
x-request-id: s8n7mongtkrlm645h7gmqq1ikjob8638
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
location: /api/environmental_data/1521
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "location_id": 1267,
  "id": 1521,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

### Cyanometer.EnvironmentalDataController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id/environmental_data/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/1263/environmental_data/1467
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
x-request-id: bf0k7vqu60n3v8fdceovfa6jaab68j9s
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json

```

### Cyanometer.EnvironmentalDataController.index
#### public endpoints: GET /api/locations/:id/environmental_data - defaults to 24 records, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1265/environmental_data
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: tisi376nnqhdlbgvhe41llit55vevvtc
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-06-07T10:00:26",
    "location_id": 1265,
    "id": 1494,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:25",
    "location_id": 1265,
    "id": 1493,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "location_id": 1265,
    "id": 1492,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "location_id": 1265,
    "id": 1491,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "location_id": 1265,
    "id": 1490,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "location_id": 1265,
    "id": 1489,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "location_id": 1265,
    "id": 1488,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "location_id": 1265,
    "id": 1487,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "location_id": 1265,
    "id": 1486,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "location_id": 1265,
    "id": 1485,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "location_id": 1265,
    "id": 1484,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "location_id": 1265,
    "id": 1483,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "location_id": 1265,
    "id": 1482,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "location_id": 1265,
    "id": 1481,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "location_id": 1265,
    "id": 1480,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "location_id": 1265,
    "id": 1479,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "location_id": 1265,
    "id": 1478,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "location_id": 1265,
    "id": 1477,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "location_id": 1265,
    "id": 1476,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "location_id": 1265,
    "id": 1475,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "location_id": 1265,
    "id": 1474,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "location_id": 1265,
    "id": 1473,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "location_id": 1265,
    "id": 1472,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "location_id": 1265,
    "id": 1471,
    "icon": "sun",
    "air_pollution_index": "20"
  }
]
```

### Cyanometer.EnvironmentalDataController.show
#### public endpoints: GET /api/locations/:id/environmental_data/:id - shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1264/environmental_data/1468
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 0apk1nk5pg4naon2vjbu94unrl27nu1j
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "location_id": 1264,
  "id": 1468,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

### Cyanometer.EnvironmentalDataController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id/environmental_data/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/1260/environmental_data/1465
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
    "icon": "invalid-icon"
  }
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 7f49pp1b92g4thn1b29shuk0n4ovrjma
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "errors": {
    "icon": [
      "is invalid"
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: PUT /api/locations/:id/environmental_data/:id - updates and renders chosen resource when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/1262/environmental_data/1466
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
    "air_pollution_index": "99"
  }
}
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 9sc234kn7lcgvlamihnh5dtiqfc29fa4
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "location_id": 1262,
  "id": 1466,
  "icon": "sun",
  "air_pollution_index": "99"
}
```

## Cyanometer.ImageController
### Cyanometer.ImageController.create
#### authenticated endpoints with a valid JWT: POST /api/locations/:id/image - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/1227/images
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
x-request-id: iphoqogs15aocco5oc4mdbvvdc36fdpm
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
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
* __Path:__ /api/locations/1237/images
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
    "location_id": 1237,
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
x-request-id: uvaf3anr5ldm67ehimcmnpfaod3k8ovq
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
location: /api/images/1778
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 1237,
  "id": 1778,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id/images/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/1230/images/1739
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
x-request-id: 83tbq446oo05gjll0hf7bocujo3dkkus
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json

```

### Cyanometer.ImageController.index
#### public endpoints: GET /api/locations/:id/images - returns requested records, defaulting TO date to NOW
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1234/images?syear=2016&smonth=02&sday=01
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 5ucuupls920f44sp2nrss1n0j760ppca
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-05-01T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/C9CBA7CF9EA304A8.jpg",
    "location_id": 1234,
    "id": 1741,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-04-07T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/58564CFC3E5641DF.jpg",
    "location_id": 1234,
    "id": 1742,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-03-01T09:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/E351ABDD934FA2EB.jpg",
    "location_id": 1234,
    "id": 1743,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-02-01T08:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/9D06572A863AEC83.jpg",
    "location_id": 1234,
    "id": 1744,
    "blueness_index": "3"
  }
]
```

#### public endpoints: GET /api/locations/:id/images - returns requested records, defaulting FROM date to before project started (1/1/16)
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1226/images?year=2017&month=02&day=28
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: egmn4pemepe5k5aq3v73uj5ljoinfa9m
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "taken_at": "2017-02-01T08:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/2B57463320FF25BE.jpg",
    "location_id": 1226,
    "id": 1737,
    "blueness_index": "3"
  }
]
```

#### public endpoints: GET /api/locations/:id/images - returns requested records in date range, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1225/images?syear=2017&smonth=03&sday=01&year=2017&month=04&day=30
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: eo013gi305kisr2k2gobq81cj9s4j42i
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "taken_at": "2017-04-07T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/84AF3EA1F9D180C9.jpg",
    "location_id": 1225,
    "id": 1731,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-03-01T09:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/9D7FB6912156AEB7.jpg",
    "location_id": 1225,
    "id": 1732,
    "blueness_index": "3"
  }
]
```

#### public endpoints: GET /api/locations/:id/images - returns number of requested records, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1235/images?count=4
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: boi8roobpgs8avfr76phknf5h6e7cet2
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-06-07T10:00:07",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/F995CCC41C9EDBA9.jpg",
    "location_id": 1235,
    "id": 1751,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/81A92446C82A66C9.jpg",
    "location_id": 1235,
    "id": 1750,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/12154604AC0F4B84.jpg",
    "location_id": 1235,
    "id": 1749,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/F8DB326D0EE07C5A.jpg",
    "location_id": 1235,
    "id": 1748,
    "blueness_index": "3"
  }
]
```

#### public endpoints: GET /api/locations/:id/images - defaults to 24 records, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1236/images
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 9dv0fgjgr3ti7675nd9ige8vsmfe0kds
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-06-07T10:00:26",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/461EA741CDB8F0A9.jpg",
    "location_id": 1236,
    "id": 1777,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:25",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/4F2E33EF55037D39.jpg",
    "location_id": 1236,
    "id": 1776,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/6069E60CA4A69308.jpg",
    "location_id": 1236,
    "id": 1775,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/6D7F6D9DE9E6864E.jpg",
    "location_id": 1236,
    "id": 1774,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/A9F914B20D21E2DD.jpg",
    "location_id": 1236,
    "id": 1773,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/A81CD3088C896A15.jpg",
    "location_id": 1236,
    "id": 1772,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/C95D375426BDA6AF.jpg",
    "location_id": 1236,
    "id": 1771,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/887804C26EC2A042.jpg",
    "location_id": 1236,
    "id": 1770,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/81C20175E0A48AC5.jpg",
    "location_id": 1236,
    "id": 1769,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5BA586C30C0DF642.jpg",
    "location_id": 1236,
    "id": 1768,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/350C8DA9A8000BC7.jpg",
    "location_id": 1236,
    "id": 1767,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/6AC9E76D9410A089.jpg",
    "location_id": 1236,
    "id": 1766,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/615C93570CBF56A8.jpg",
    "location_id": 1236,
    "id": 1765,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/7F0648F0B63DBE14.jpg",
    "location_id": 1236,
    "id": 1764,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/85ABA1E24A0813E9.jpg",
    "location_id": 1236,
    "id": 1763,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/F5419F0E51E50BA9.jpg",
    "location_id": 1236,
    "id": 1762,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/D3AADB1756B3040B.jpg",
    "location_id": 1236,
    "id": 1761,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/4A52D232612F5A8E.jpg",
    "location_id": 1236,
    "id": 1760,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/9AEEA4202DAC3DEE.jpg",
    "location_id": 1236,
    "id": 1759,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/047AECA7A1A97D7E.jpg",
    "location_id": 1236,
    "id": 1758,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/1A7EDA2CCBA36A1D.jpg",
    "location_id": 1236,
    "id": 1757,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/A9ACBFC8C9BC4C56.jpg",
    "location_id": 1236,
    "id": 1756,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/9F9A2528FD7ACBFC.jpg",
    "location_id": 1236,
    "id": 1755,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5B19559633E5D799.jpg",
    "location_id": 1236,
    "id": 1754,
    "blueness_index": "3"
  }
]
```

### Cyanometer.ImageController.landing
#### public endpoints: GET /landing - returns latest image per location from multi locations, staggered dates
##### Request
* __Method:__ GET
* __Path:__ /api/landing/3
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 8tj809s6a409noms2na7q29714i5tbv2
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "taken_at": "2017-04-04T10:30:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/8C325239C0980CB2.jpg",
    "location_id": 1246,
    "location": "London, UK",
    "id": 1791,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-01-04T10:15:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/56799DB6E9A4DB6C.jpg",
    "location_id": 1247,
    "location": "Ljubljana, Slovenia",
    "id": 1794,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-01-04T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/80FCE2234E25D7B3.jpg",
    "location_id": 1248,
    "location": "Moscow, Russia",
    "id": 1796,
    "blueness_index": "3"
  }
]
```

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
x-request-id: 6gbvcgvrvplqr4au9vdrp9k5jdfp937f
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "taken_at": "2017-04-04T10:30:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5DBCABB2AE33144A.jpg",
    "location_id": 1240,
    "location": "London, UK",
    "id": 1781,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-04-04T10:15:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/192491A85C1FA1D9.jpg",
    "location_id": 1241,
    "location": "Ljubljana, Slovenia",
    "id": 1782,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-04-04T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/37FD08EAD12CACAF.jpg",
    "location_id": 1242,
    "location": "Moscow, Russia",
    "id": 1783,
    "blueness_index": "3"
  }
]
```

### Cyanometer.ImageController.show
#### public endpoints: GET /api/locations/:id/image/:id - shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1233/images/1740
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: f6lc42od24nr3ar9q338lhfn87u5iba9
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 1232,
  "id": 1740,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id/images/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/1223/images/1729
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
x-request-id: 9jps50tqmipfudsknk1s8tu3ev8ta0ai
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
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
* __Path:__ /api/locations/1228/images/1738
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
x-request-id: ao6fca4d5bi6t1d9tk3rsh7ki3uonbrv
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 1229,
  "id": 1738,
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
  "location": {
    "air_quality_source": ""
  }
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: s4k61ao8t1mlen76i5j0h0p1oklmtn6v
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
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
    ],
    "air_quality_source": [
      "can't be blank"
    ],
    "air_quality_link": [
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
    "city": "Ljubjana",
    "air_quality_source": "ARSO",
    "air_quality_link": "http://somewhere.com"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: a0q7cr4kg1vr63vlvmfuu7qptm1m22ui
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
location: /api/locations/1258
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 1258,
  "country": "Slovenia",
  "city": "Ljubjana",
  "air_quality_source": "ARSO",
  "air_quality_link": "http://somewhere.com"
}
```

### Cyanometer.LocationController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/1257
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
x-request-id: omc67tjlh3hje227matcd3i7sfs9cm2a
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
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
x-request-id: smsed7bbrhsfgb474462n7eoj6ns2qt5
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
[
  {
    "place": "Place-1",
    "id": 1250,
    "country": "Country-1",
    "city": "City-1",
    "air_quality_source": "Air-1",
    "air_quality_link": "http://somewhere-1.com"
  },
  {
    "place": "Place-2",
    "id": 1251,
    "country": "Country-2",
    "city": "City-2",
    "air_quality_source": "Air-2",
    "air_quality_link": "http://somewhere-2.com"
  },
  {
    "place": "Place-3",
    "id": 1252,
    "country": "Country-3",
    "city": "City-3",
    "air_quality_source": "Air-3",
    "air_quality_link": "http://somewhere-3.com"
  },
  {
    "place": "Place-4",
    "id": 1253,
    "country": "Country-4",
    "city": "City-4",
    "air_quality_source": "Air-4",
    "air_quality_link": "http://somewhere-4.com"
  },
  {
    "place": "Place-5",
    "id": 1254,
    "country": "Country-5",
    "city": "City-5",
    "air_quality_source": "Air-5",
    "air_quality_link": "http://somewhere-5.com"
  }
]
```

### Cyanometer.LocationController.show
#### public endpoints: GET /api/locations/:id -shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1255
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: sdcn30hg9llt3ee6tif3ii3v29aaidm6
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "place": "Test place",
  "id": 1255,
  "country": "Test country",
  "city": "Test city",
  "air_quality_source": "Test air quality source",
  "air_quality_link": "http://somewhere.com"
}
```

### Cyanometer.LocationController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/1256
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
    "air_quality_source": ""
  }
}
```
##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 1odpq0j4p9epuva6dfns38mbl3a8q2od
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "errors": {
    "air_quality_source": [
      "can't be blank"
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: PUT /api/locations/:id - updates and renders chosen resource when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/1259
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
    "city": "Ljubjana",
    "air_quality_source": "ARSO",
    "air_quality_link": "http://somewhere.com"
  }
}
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: omlpge4rn30pd87ahr4kp73udhba428e
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 1259,
  "country": "Slovenia",
  "city": "Ljubjana",
  "air_quality_source": "ARSO",
  "air_quality_link": "http://somewhere.com"
}
```

