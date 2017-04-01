# Cyanometer

Web UI and API for http://cyanometer.net

Various Cyanometer installation locations post image & blueness meta data to the API.
The web front end consumes this information and presents an interface to view and navigate the image archive.


## API

Check out the API docs: [web/controllers/README.md](web/controllers/README.md)


## Local setup

```bash
# get src & libs
$ git clone https://github.com/msp/cyanometer.git
$ cd cyanometer && mix deps.get

# create and migrate your database
$ mix ecto.create && mix ecto.migrate

# install Node.js dependencies for UI
$ npm install

# start Phoenix endpoint
$ mix phoenix.server
```
Visit [`localhost:4000`](http://localhost:4000) in your browser.

## Test / Develop

```bash
# local test guard
$ mix test.watch

# start the server
$ iex -S mix phoenix.server

```

## Deployment

Heroku based deploys:

### Staging
```bash
$ git remote add staging https://git.heroku.com/cyanometer-staging.git

$ git push staging master
```

### Production
```bash
$ git remote add production https://git.heroku.com/cyanometer.git

$ git push production master
```

## Learn more

### Project

  * Cyanometer: https://cyanometer.net/
  * About Cyanometer: http://about.cyanometer.net/

### Tech

  * Elixir: http://elixir-lang.org/install.html
  * Phoenix: http://www.phoenixframework.org/
  * React: https://facebook.github.io/react/
