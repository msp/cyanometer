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
* __Path:__ /api/locations/203/environmental_data
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
x-request-id: nnnee2f7hldrptcouuungfq68she2ddg
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
* __Path:__ /api/locations/208/environmental_data
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
    "location_id": 208,
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
x-request-id: qdoec6kravgsjnno422i9g2826ktteq6
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
location: /api/environmental_data/802
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "location_id": 208,
  "id": 802,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

### Cyanometer.EnvironmentalDataController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id/environmental_data/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/206/environmental_data/800
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
x-request-id: dmmju123t4m7a3ks3n2gc2a2oqd3ukto
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
* __Path:__ /api/locations/204/environmental_data
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: gglvgaq9hi1q5no1g1k375353br367tf
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
    "location_id": 204,
    "id": 798,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:25",
    "location_id": 204,
    "id": 797,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "location_id": 204,
    "id": 796,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "location_id": 204,
    "id": 795,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "location_id": 204,
    "id": 794,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "location_id": 204,
    "id": 793,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "location_id": 204,
    "id": 792,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "location_id": 204,
    "id": 791,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "location_id": 204,
    "id": 790,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "location_id": 204,
    "id": 789,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "location_id": 204,
    "id": 788,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "location_id": 204,
    "id": 787,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "location_id": 204,
    "id": 786,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "location_id": 204,
    "id": 785,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "location_id": 204,
    "id": 784,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "location_id": 204,
    "id": 783,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "location_id": 204,
    "id": 782,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "location_id": 204,
    "id": 781,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "location_id": 204,
    "id": 780,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "location_id": 204,
    "id": 779,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "location_id": 204,
    "id": 778,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "location_id": 204,
    "id": 777,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "location_id": 204,
    "id": 776,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "location_id": 204,
    "id": 775,
    "icon": "sun",
    "air_pollution_index": "20"
  }
]
```

### Cyanometer.EnvironmentalDataController.show
#### public endpoints: GET /api/locations/:id/environmental_data/:id - shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/205/environmental_data/799
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: ami62jln9oss8tvuu2c6q98roe8dheme
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "location_id": 205,
  "id": 799,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

### Cyanometer.EnvironmentalDataController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id/environmental_data/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/207/environmental_data/801
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
x-request-id: 49tv3o0vat2usqdkllnml4q4rpopkgtl
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
* __Path:__ /api/locations/209/environmental_data/803
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
x-request-id: 6e963esj90c858sbmvc5t5bm8fqp2bs2
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "location_id": 209,
  "id": 803,
  "icon": "sun",
  "air_pollution_index": "99"
}
```

## Cyanometer.ImageController
### Cyanometer.ImageController.create
#### authenticated endpoints with a valid JWT: POST /api/locations/:id/image - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/169/images
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
x-request-id: k54ruuhhbld2s8p3kf8kjhaounrdisig
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
* __Path:__ /api/locations/179/images
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
    "location_id": 179,
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
x-request-id: jfq0nillrqhrhtmdjhnnti3lpsl1190t
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
location: /api/images/138
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 179,
  "id": 138,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id/images/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/174/images/132
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
x-request-id: mfge4iiovuvu8gotvqkgrkdn4ls7c431
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
* __Path:__ /api/locations/170/images?syear=2016&smonth=02&sday=01
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: esq2293i44qj8etr6q79a5hlhg240o5v
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
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5E77A66A43DBF007.jpg",
    "location_id": 170,
    "id": 123,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-04-07T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/21DE18F5E5DE8A76.jpg",
    "location_id": 170,
    "id": 124,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-03-01T09:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/EE566B9781C444E4.jpg",
    "location_id": 170,
    "id": 125,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-02-01T08:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/B95FE878670EA778.jpg",
    "location_id": 170,
    "id": 126,
    "blueness_index": "3"
  }
]
```

#### public endpoints: GET /api/locations/:id/images - returns requested records, defaulting FROM date to before project started (1/1/16)
##### Request
* __Method:__ GET
* __Path:__ /api/locations/171/images?year=2017&month=02&day=28
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 8t4s86m61j7vua1eluef6l59oe1oe74u
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
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/D0B8F9C8329B164B.jpg",
    "location_id": 171,
    "id": 130,
    "blueness_index": "3"
  }
]
```

#### public endpoints: GET /api/locations/:id/images - returns requested records in date range, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/178/images?syear=2017&smonth=03&sday=01&year=2017&month=04&day=30
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: fs32evtmvhlo6r072dqnlaqlfer8ijec
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
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/7E75F957D09AD137.jpg",
    "location_id": 178,
    "id": 135,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-03-01T09:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/922DE74659DAE88D.jpg",
    "location_id": 178,
    "id": 136,
    "blueness_index": "3"
  }
]
```

#### public endpoints: GET /api/locations/:id/images - returns number of requested records, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/180/images?count=4
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: glincdurigq438kg415h9mtl4l90jn18
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
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/1AC7A5AC74E56A4B.jpg",
    "location_id": 180,
    "id": 145,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/AB1127CE3238A6D0.jpg",
    "location_id": 180,
    "id": 144,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/05C6523E843A1CF5.jpg",
    "location_id": 180,
    "id": 143,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/FE4D6F6535B67D30.jpg",
    "location_id": 180,
    "id": 142,
    "blueness_index": "3"
  }
]
```

#### public endpoints: GET /api/locations/:id/images - defaults to 24 records, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/183/images
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: c98au4l4b4j2b7krao53l6s063rfbrlh
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
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/587E079A0DA9139B.jpg",
    "location_id": 183,
    "id": 172,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:25",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5AC828D77F760619.jpg",
    "location_id": 183,
    "id": 171,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/23D6FDDB36BD842E.jpg",
    "location_id": 183,
    "id": 170,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/A64738F126CE53B6.jpg",
    "location_id": 183,
    "id": 169,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/DAF1A25405931D7C.jpg",
    "location_id": 183,
    "id": 168,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/CCF7D4CCF05C5632.jpg",
    "location_id": 183,
    "id": 167,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/66B359C780FA65C2.jpg",
    "location_id": 183,
    "id": 166,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/3641C8C4FE6E7F11.jpg",
    "location_id": 183,
    "id": 165,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/7A66867177A903EA.jpg",
    "location_id": 183,
    "id": 164,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/3C86189AD48270EC.jpg",
    "location_id": 183,
    "id": 163,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/59B7E8B9CB02E2E0.jpg",
    "location_id": 183,
    "id": 162,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/2FF7736057ECEBC8.jpg",
    "location_id": 183,
    "id": 161,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/07C11217DEFA8170.jpg",
    "location_id": 183,
    "id": 160,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/1071D68469883BFB.jpg",
    "location_id": 183,
    "id": 159,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/E2E0452616E48249.jpg",
    "location_id": 183,
    "id": 158,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/891712568F2BD1AD.jpg",
    "location_id": 183,
    "id": 157,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/6A1A4D034BA9C436.jpg",
    "location_id": 183,
    "id": 156,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/EAD4C9FD2C997638.jpg",
    "location_id": 183,
    "id": 155,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/FAE72DDEC124BB24.jpg",
    "location_id": 183,
    "id": 154,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/53A12DD8EC4A7735.jpg",
    "location_id": 183,
    "id": 153,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/71B7CA4BC3192086.jpg",
    "location_id": 183,
    "id": 152,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/652A0606EBB57059.jpg",
    "location_id": 183,
    "id": 151,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/8ECC7CDB4ABCB5F9.jpg",
    "location_id": 183,
    "id": 150,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/15B857A9FC5D1AEA.jpg",
    "location_id": 183,
    "id": 149,
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
x-request-id: p344ijfc0ub88umu50mtggb4a4ovqpbb
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
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/74BDA2276034FEA8.jpg",
    "location_id": 194,
    "location": "London, UK",
    "id": 173,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-04-04T10:15:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/AA7CA2404A83DAA9.jpg",
    "location_id": 195,
    "location": "Ljubljana, Slovenia",
    "id": 174,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-04-04T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/37A1106B17EEC541.jpg",
    "location_id": 196,
    "location": "Moscow, Russia",
    "id": 175,
    "blueness_index": "3"
  }
]
```

### Cyanometer.ImageController.show
#### public endpoints: GET /api/locations/:id/image/:id - shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/173/images/131
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: mh80jqsgjs8bhim9s4hoc0q36ie7m94k
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
  "location_id": 172,
  "id": 131,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id/images/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/176/images/133
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
x-request-id: bla1gouub9lqm5p0kh04a7itaah8g88u
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
* __Path:__ /api/locations/181/images/146
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
x-request-id: 4liekdjeom6gtg8ekmlbi68gsdeos1ml
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
  "location_id": 182,
  "id": 146,
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
x-request-id: 793cfulvul08l863n07r64kc5jv0qpq7
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
x-request-id: 5iqkeo9au54op44ar05h0nvc26276s72
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
location: /api/locations/186
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 186,
  "country": "Slovenia",
  "city": "Ljubjana"
}
```

### Cyanometer.LocationController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/193
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
x-request-id: 3baeeu49c77pe9i3d3kplrv8cohddkv2
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
x-request-id: knrvhf7s8m3hrq8j49lb4jbethbqmthd
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
    "id": 187,
    "country": "Country-1",
    "city": "City-1"
  },
  {
    "place": "Place-2",
    "id": 188,
    "country": "Country-2",
    "city": "City-2"
  },
  {
    "place": "Place-3",
    "id": 189,
    "country": "Country-3",
    "city": "City-3"
  },
  {
    "place": "Place-4",
    "id": 190,
    "country": "Country-4",
    "city": "City-4"
  },
  {
    "place": "Place-5",
    "id": 191,
    "country": "Country-5",
    "city": "City-5"
  }
]
```

### Cyanometer.LocationController.show
#### public endpoints: GET /api/locations/:id -shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/185
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 6fgbkmo24mdt4dhmveohf1845nc4ag78
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "place": null,
  "id": 185,
  "country": null,
  "city": null
}
```

### Cyanometer.LocationController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/184
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
x-request-id: 8i6r4aq7fk2655ptohlpo61g1nt0dluu
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
    ]
  }
}
```

#### authenticated endpoints with a valid JWT: PUT /api/locations/:id - updates and renders chosen resource when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/192
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
x-request-id: rlll8fnt4busq9tknre7lgt81ptthpn7
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
vary: 
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 192,
  "country": "Slovenia",
  "city": "Ljubjana"
}
```

