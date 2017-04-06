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
#### authenticated endpoints with a valid JWT: POST /api/environmental_datas - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/environmental_datas
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
x-request-id: alkhap67d79c5r0bfj7istd5hofq003j
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

#### authenticated endpoints with a valid JWT: POST /api/environmental_datas - creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/environmental_datas
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
x-request-id: me5t7oiml2iapabq78ovrd188vie7lpm
location: /api/environmental_datas/7470
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "id": 7470,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

### Cyanometer.EnvironmentalDataController.index
#### public endpoints: GET /api/environmental_datas
##### Request
* __Method:__ GET
* __Path:__ /api/environmental_datas
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: fto1b72fnvur0vrjnr3mqitg6a7kq8qr
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-06-07T10:00:25",
    "id": 7495,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "id": 7494,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "id": 7493,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "id": 7492,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "id": 7491,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "id": 7490,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "id": 7489,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "id": 7488,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "id": 7487,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "id": 7486,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "id": 7485,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "id": 7484,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "id": 7483,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "id": 7482,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "id": 7481,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "id": 7480,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "id": 7479,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "id": 7478,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "id": 7477,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "id": 7476,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "id": 7475,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "id": 7474,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "id": 7473,
    "icon": "sun",
    "air_pollution_index": "20"
  },
  {
    "taken_at": "2016-06-07T10:00:02",
    "id": 7472,
    "icon": "sun",
    "air_pollution_index": "20"
  }
]
```

### Cyanometer.EnvironmentalDataController.show
#### public endpoints: GET /api/environmental_datas/:id - shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/environmental_datas/7469
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: li2unmdv9rlvusgrta11k08dgthp7pok
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "id": 7469,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

## Cyanometer.ImageController
### Cyanometer.ImageController.create
#### authenticated endpoints with a valid JWT: POST /api/locations/:id/image - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/5154/images
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
x-request-id: kujp13k8vj4ndosn89kbaphpjl67qvhe
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
* __Path:__ /api/locations/5161/images
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
    "location_id": 5161,
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
x-request-id: ohj6nb0mn585phbg1plib2rqijveahjd
location: /api/images/10375
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 5161,
  "id": 10375,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id/images/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/5152/images/10371
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
x-request-id: 7vlc7hd83jfo71e40775ja2vjbopqjf9
```
* __Response body:__
```json

```

### Cyanometer.ImageController.index
#### public endpoints: GET /api/locations/:id/images - 24 records, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/5151/images
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: f7lu0642e1blm7p37gc3q1isjq1cc0sg
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-06-07T10:00:25",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/97B37FAC9A3FD097.jpg",
    "location_id": 5151,
    "id": 10370,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/4B46D82281AE71F3.jpg",
    "location_id": 5151,
    "id": 10369,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/3F198C759C8C2F15.jpg",
    "location_id": 5151,
    "id": 10368,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/20A62D037065E01D.jpg",
    "location_id": 5151,
    "id": 10367,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/A673750E03AA4DDC.jpg",
    "location_id": 5151,
    "id": 10366,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5BA179B400688665.jpg",
    "location_id": 5151,
    "id": 10365,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/7E855CF14B9C410F.jpg",
    "location_id": 5151,
    "id": 10364,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/8F6BD4D32DAA805D.jpg",
    "location_id": 5151,
    "id": 10363,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/35B30577B5CE89CA.jpg",
    "location_id": 5151,
    "id": 10362,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/C457BAD2939FEADA.jpg",
    "location_id": 5151,
    "id": 10361,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/D1C16145B0A40567.jpg",
    "location_id": 5151,
    "id": 10360,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/8FD8B818BD51E158.jpg",
    "location_id": 5151,
    "id": 10359,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/71E50D0BE7802921.jpg",
    "location_id": 5151,
    "id": 10358,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/F2AF8B15FD231597.jpg",
    "location_id": 5151,
    "id": 10357,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/2B6A24A743FE08EB.jpg",
    "location_id": 5151,
    "id": 10356,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/25D114E89C831E4F.jpg",
    "location_id": 5151,
    "id": 10355,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/74F3F1787C9C5CA2.jpg",
    "location_id": 5151,
    "id": 10354,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/11B615CD5E61CF26.jpg",
    "location_id": 5151,
    "id": 10353,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/7C198D09AC23717F.jpg",
    "location_id": 5151,
    "id": 10352,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/15CCC4AE24DFAB92.jpg",
    "location_id": 5151,
    "id": 10351,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/F3F57F14924818A0.jpg",
    "location_id": 5151,
    "id": 10350,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/0C0DE04AF58569A2.jpg",
    "location_id": 5151,
    "id": 10349,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/739D8E0C91ED87CB.jpg",
    "location_id": 5151,
    "id": 10348,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:02",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/3693BB5A921AE084.jpg",
    "location_id": 5151,
    "id": 10347,
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
x-request-id: 5p7n8lttelaen529iudbfsr42kg3cpma
```
* __Response body:__
```json
[
  {
    "taken_at": "2017-04-04T10:30:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/DEA1EA3B913BE1F5.jpg",
    "location_id": 5142,
    "id": 10333,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-04-04T10:15:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/2A33CF9B94313B85.jpg",
    "location_id": 5143,
    "id": 10334,
    "blueness_index": "3"
  },
  {
    "taken_at": "2017-04-04T10:00:00",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/15A522D9FDB7E23B.jpg",
    "location_id": 5144,
    "id": 10335,
    "blueness_index": "3"
  }
]
```

### Cyanometer.ImageController.show
#### public endpoints: GET /api/locations/:id/image/:id - shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/5160/images/10374
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: bhq2cgec2145urf0on6cfeoc8c6k6e10
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 5159,
  "id": 10374,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id/images/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/5155/images/10372
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
x-request-id: mbmovcp71heiskc9qfvsck6gsnbmdcqn
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
* __Path:__ /api/locations/5157/images/10373
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
x-request-id: pr01cr35fb61cvt1jbphn6o3qtotr14v
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 5158,
  "id": 10373,
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
x-request-id: v7ffrddil2nndmctodts83oht0h0dkck
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
x-request-id: hjsn96pm31cid2sjmu2eq4mqvgoped7d
location: /api/locations/5140
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 5140,
  "country": "Slovenia",
  "city": "Ljubjana"
}
```

### Cyanometer.LocationController.delete
#### authenticated endpoints with a valid JWT: DELETE /api/locations/:id - deletes chosen resource
##### Request
* __Method:__ DELETE
* __Path:__ /api/locations/5139
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
x-request-id: p1hvhh85gu19h8qv0rojlvu58anom69h
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
x-request-id: vruji5gaa0u51ch6m8g3o2glgcpgv1ks
```
* __Response body:__
```json
[
  {
    "place": "Place-1",
    "id": 5132,
    "country": "Country-1",
    "city": "City-1"
  },
  {
    "place": "Place-2",
    "id": 5133,
    "country": "Country-2",
    "city": "City-2"
  },
  {
    "place": "Place-3",
    "id": 5134,
    "country": "Country-3",
    "city": "City-3"
  },
  {
    "place": "Place-4",
    "id": 5135,
    "country": "Country-4",
    "city": "City-4"
  },
  {
    "place": "Place-5",
    "id": 5136,
    "country": "Country-5",
    "city": "City-5"
  }
]
```

### Cyanometer.LocationController.show
#### public endpoints: GET /api/locations/:id -shows chosen resource
##### Request
* __Method:__ GET
* __Path:__ /api/locations/5137
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: q33vjalk49fi95cbk7v9dg3r0ef817n5
```
* __Response body:__
```json
{
  "place": null,
  "id": 5137,
  "country": null,
  "city": null
}
```

### Cyanometer.LocationController.update
#### authenticated endpoints with a valid JWT: PUT /api/locations/:id - does not update chosen resource and renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/5138
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
x-request-id: 9kssks9d6cfv3c2nelbacg8q9avp004e
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
* __Path:__ /api/locations/5141
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
x-request-id: o0juc1pa2aof2ga0jipba74j0uge30gs
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 5141,
  "country": "Slovenia",
  "city": "Ljubjana"
}
```

