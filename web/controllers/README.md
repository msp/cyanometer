# API Documentation

* [Cyanometer.EnvironmentalDataController](#cyanometerenvironmentaldatacontroller)
  * [create](#cyanometerenvironmentaldatacontrollercreate)
* [Cyanometer.ImageController](#cyanometerimagecontroller)
  * [create](#cyanometerimagecontrollercreate)
  * [index](#cyanometerimagecontrollerindex)
* [Cyanometer.LocationController](#cyanometerlocationcontroller)
  * [create](#cyanometerlocationcontrollercreate)
  * [index](#cyanometerlocationcontrollerindex)
  * [update](#cyanometerlocationcontrollerupdate)

## Cyanometer.EnvironmentalDataController
### Cyanometer.EnvironmentalDataController.create
#### POST /api/environmental_datas - creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/environmental_datas
* __Request headers:__
```
accept: application/json
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
x-request-id: rt6q3lbf0pt16f3gkpdupr8lmkeocq7i
location: /api/environmental_datas/4579
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "id": 4579,
  "icon": "sun",
  "air_pollution_index": "20"
}
```

## Cyanometer.ImageController
### Cyanometer.ImageController.create
#### POST /api/locations/:id/image - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/1511/images
* __Request headers:__
```
accept: application/json
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
x-request-id: ofikh52iamkd2c98o4gvk9desm64nf0h
```
* __Response body:__
```json
{
  "errors": {
    "taken_at": [
      "can't be blank"
    ],
    "s3_url": [
      "Not our S3 host (invalid bucket): https://not-our-s3-bucket/foo.jpg [\"\", \"foo.jpg\"]",
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

#### POST /api/locations/:id/images - creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/locations/1508/images
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "image": {
    "taken_at": "2016-06-05T16:04:17",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
    "location_id": 1508,
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
x-request-id: g6aiouc5ljbdfn9ikehsag7hr281gaaq
location: /api/images/5755
```
* __Response body:__
```json
{
  "taken_at": "2016-06-05T16:04:17",
  "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
  "location_id": 1508,
  "id": 5755,
  "blueness_index": "4"
}
```

### Cyanometer.ImageController.index
#### GET /api/locations/:id/images - 24 records, latest first
##### Request
* __Method:__ GET
* __Path:__ /api/locations/1507/images
* __Request headers:__
```
accept: application/json
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: mv7grl6t77qtedj1su8olo3ssecs4ca0
```
* __Response body:__
```json
[
  {
    "taken_at": "2016-06-07T10:00:25",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/825CF5C5C8C6EA44.jpg",
    "location_id": 1507,
    "id": 5754,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:24",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/08189EBC9BF1ED3F.jpg",
    "location_id": 1507,
    "id": 5753,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:23",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/E7A4A71CD36B8026.jpg",
    "location_id": 1507,
    "id": 5752,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:22",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/37D430489F6E810A.jpg",
    "location_id": 1507,
    "id": 5751,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:21",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/B388D7E09AA44861.jpg",
    "location_id": 1507,
    "id": 5750,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:20",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/93DC518DE3D290CA.jpg",
    "location_id": 1507,
    "id": 5749,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:19",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/7DFC2AD523ADAF44.jpg",
    "location_id": 1507,
    "id": 5748,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:18",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/EAD6077459AE6636.jpg",
    "location_id": 1507,
    "id": 5747,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:17",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/489533DF0D6E94E8.jpg",
    "location_id": 1507,
    "id": 5746,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:16",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/6F4E9E9E4C051E8D.jpg",
    "location_id": 1507,
    "id": 5745,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:15",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/F23D9E1812A55DA7.jpg",
    "location_id": 1507,
    "id": 5744,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:14",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/EC5918D693B8D668.jpg",
    "location_id": 1507,
    "id": 5743,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:13",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/13AD6D172912A3FC.jpg",
    "location_id": 1507,
    "id": 5742,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:12",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/B369FB58865B0F20.jpg",
    "location_id": 1507,
    "id": 5741,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:11",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/EE2CD0E838B95E0D.jpg",
    "location_id": 1507,
    "id": 5740,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:10",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/496E443F736A9BC4.jpg",
    "location_id": 1507,
    "id": 5739,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:09",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5FA4D23B876BC327.jpg",
    "location_id": 1507,
    "id": 5738,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:08",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/E9ACE61D60860A70.jpg",
    "location_id": 1507,
    "id": 5737,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:07",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/3E7D1F7C518C215C.jpg",
    "location_id": 1507,
    "id": 5736,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:06",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/5A1A1DAB34E196B4.jpg",
    "location_id": 1507,
    "id": 5735,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:05",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/E64D18F2B513AF0A.jpg",
    "location_id": 1507,
    "id": 5734,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:04",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/FDD2C66B8FBC834B.jpg",
    "location_id": 1507,
    "id": 5733,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:03",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/988BD826F01D7867.jpg",
    "location_id": 1507,
    "id": 5732,
    "blueness_index": "3"
  },
  {
    "taken_at": "2016-06-07T10:00:02",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/E18A561D85732202.jpg",
    "location_id": 1507,
    "id": 5731,
    "blueness_index": "3"
  }
]
```

## Cyanometer.LocationController
### Cyanometer.LocationController.create
#### POST /api/locations - does not create resource and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/locations
* __Request headers:__
```
accept: application/json
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
x-request-id: hg9574jqpb97eov66452kc5t02ofd2jq
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

#### POST /api/locations - creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/locations
* __Request headers:__
```
accept: application/json
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
x-request-id: q8jtn9jm3lq05vr59ujeacjdu70acau7
location: /api/locations/1522
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 1522,
  "country": "Slovenia",
  "city": "Ljubjana"
}
```

### Cyanometer.LocationController.index
#### GET /api/locations - lists all entries on index
##### Request
* __Method:__ GET
* __Path:__ /api/locations
* __Request headers:__
```
accept: application/json
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: brs6vkq9tapidks9ufakpumou27bhc3c
```
* __Response body:__
```json
[
  {
    "place": "Place-1",
    "id": 1517,
    "country": "Test country",
    "city": "City-1"
  },
  {
    "place": "Place-2",
    "id": 1518,
    "country": "Test country",
    "city": "City-2"
  },
  {
    "place": "Place-3",
    "id": 1519,
    "country": "Test country",
    "city": "City-3"
  },
  {
    "place": "Place-4",
    "id": 1520,
    "country": "Test country",
    "city": "City-4"
  },
  {
    "place": "Place-5",
    "id": 1521,
    "country": "Test country",
    "city": "City-5"
  }
]
```

### Cyanometer.LocationController.update
#### PUT /api/locations/:id - updates and renders chosen resource when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/locations/1516
* __Request headers:__
```
accept: application/json
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
x-request-id: 6ochi9bodils0fsp54o41ejo95e19a0e
```
* __Response body:__
```json
{
  "place": "Town Square",
  "id": 1516,
  "country": "Slovenia",
  "city": "Ljubjana"
}
```

