# Awesome Mailer

This is an small ruby application to send emails through some email services

## Requirements

- ruby 2.6.0

## Installation

```
bundle install
```

## Development
```
rackup -p 4567
```

## Tests

```
rspec
```

## CURL example
```
curl -X POST   'http://localhost:4567/email?to=ivan.velasquez.rios@gmail.com&to_name=Ivan%20Velasquez&from=ivan@densitylabs.io&from_name=Ivan%20Density&subject=test&body=%3Ch2%3Ehehetl%3C/h2%3E'
```
