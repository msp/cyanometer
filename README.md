# Cyanometer

Web UI and API for http://cyanometer.net

Various Cyanometer installation locations post image & blueness meta data to the API.
The web front end consumes this information and presents an interface to view and navigate the image archive.


## API

Check out the API docs: [apps/cyanometer/web/controllers/README.md](apps/cyanometer/web/controllers/README.md)


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

Heroku pipeline based deploys.
Assuming origin is Github, master will deploy to staging after successful CI:

### Staging
```bash
$ git push origin master
```

### Production
```bash
$ heroku pipelines:promote -r staging
```

## S3 Migrator

```bash
# locally
$ export AWS_ACCESS_KEY_ID=123 AWS_SECRET_ACCESS_KEY=asdf && mix run -e Cyanometer.Scripts.migrate_s3

# heroku
$ heroku run:detached --remote staging mix do app.start, s3_tasks.list_bucket cyanometer

$ heroku run:detached --remote staging POOL_SIZE=2 mix do app.start, s3_tasks.migrate
```

## Learn more

### Project

  * Cyanometer: https://cyanometer.net/
  * About Cyanometer: http://about.cyanometer.net/

### Tech

  * Elixir: http://elixir-lang.org/install.html
  * Phoenix: http://www.phoenixframework.org/
  * React: https://facebook.github.io/react/
