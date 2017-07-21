# Measurements

Service to collect and store data from environmental data APIs.

## Usage

```bash
$ iex -S mix

# init Gen Server
iex(3)> Measurements.start_link(%{})

iex(3)> Measurements.ljubljana
%{nitrogen: "14", ozone: "136", particles: "24", sulphite: "4"}
```
