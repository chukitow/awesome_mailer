# Awesome Mailer

This is an small ruby application to send emails through some email services, you can find this application up and running at http://polar-shore-68006.herokuapp.com/

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
curl -X POST   'http://localhost:4567/email?to=ivan@email.com&to_name=Ivan%20Velasquez&from=ivan@company.com&from_name=Ivan&subject=test&body=%3Ch2%3Ehehetl%3C/h2%3E'
```
