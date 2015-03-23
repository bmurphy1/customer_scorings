## Customer Scorings
#### About
Library to interface with a single given HTTP endpoint, returning customer scorings based on given attributes.

#### Requirements

#### Setup
- From within the project directory, bundle install:

```
$ bundle install
```

#### Tests
- Run tests

```
$ rspec
```

#### How to use as a library
- Within your code:

```
CustomerScorings.get({zipcode: 11111, income: 50000 age:, 25})
```

#### How to use interactively
- From the command line:

```
$ gem install customer_scorings
$ ruby ./bin/customer-scorings <key1>:<value1> <key2>:<value2> etc
```
Example:

```
$ ruby ./bin/customer-scorings zipcode:11111 income:50000 age:25
```