# Jets Demo Project

In this README you will find instructions to setup a Ruby environment, install dependencies, run the server, and run the tests.

### Ruby Version

This project requires Ruby 2.7.3.

### Installing Ruby

Install the required version of Ruby. It is recommended to use `chruby` to manage Ruby versions and `ruby-install` to install new versions of Ruby. This guide
will provide instructions for installing the recommended tools and how to install and setup the required version of Ruby with these tools. If you are using
other tools for installing and managing Ruby versions (`rbenv`, for example), you may skip this section and ensure that you have the required Ruby version
installed.

The following will install `chruby` and `ruby-install` and then use `ruby-install` to install the required version of Ruby. Note, that for `chruby` to be aware
the newly installed version, you must re-source your `.bash_profile` or `.zshrc` file.

```shell
$ brew install chruby ruby-install
$ ruby-install 2.7.3
$ . ~/.zshrc
$ chruby 2.7.3
```

To view the list of installed Ruby versions and/or see the currently selected version, simply execute `chruby` with no arguments. For example:

```shell
$ chruby
```

#### Optional

You may wish to update your `.bash_profile` or `.zshrc` file to either set a default version for `chruby` to select when starting a new terminal session and/or
automatically switch to the correct Ruby version based on the project's `.ruby-version` file. To do so, add the following to your profile settings:

```shell
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh # Will automatically detect a project's Ruby version and select that version, if installed
chruby 2.7.3 # Sets Ruby 2.7.3 as the default selected Ruby version
```

Note, you must re-source your profile settings for these changes to be picked up. For example:

```shell
$ . ~/.zshrc
```

### Installing Dependencies

To install this project's dependencies, you must install have Bundler installed. If Bundler is not already installed, run the following command to install it:

```shell
$ gem install bundler
```

Once Bundler is installed, you may install the project dependencies:

```shell
$ bundle install
```

### DynamoDB Local

This project uses DynamoDB. To simplify the process of running `dynamodb-local`, we will run the Amazon `dynamodb-local` Docker container. From the project
root directory, run `docker-compose up -d` to run the `dynamodb-local` container. Note, you can run `dynamodb-local` without Docker by installing
`dynamodb-local` using `brew`. However, this is slightly more complicated and requires having a JDK installed, so it is strongly recommended to run using
Docker.

#### Optional

You may want to have an interface for viewing your local DynamoDB and the contents in your tables. For this, it is recommended to install `dynamodb-admin`. The
following will install `dynamodb-admin` and run it.

```shell
$ npm install -g dynamodb-admin
$ dynamodb-admin
```

Once `dynamodb-admin` is running, you can visit `http://localhost:8001` to explore your local DynamoDB store.

### DynamoDB Setup

To run the migrations to setup your local DynamoDB, run the following commands to setup your development and test tables:

```shell
$ jets dynamodb:migrate dynamodb/migrate/*
$ JETS_ENV=test jets dynamodb:migrate dynamodb/migrate/*
```

Note, that this will run all migrations. If for some reason you want to run a specific migration file, modify the above command and specify the filename of the
migration that you wish to run instead of the wildcard (`*`) character.

### Running Locally

In order to run the project locally, run the following command:

```shell
$ jets s
```

This will start a Jets server in development mode and will be listening at `http://localhost:8888`. You can now send API requests to your controller endpoints
using tools like cURL or Postman.

### Testing

The test suite for this project uses `rspec`. To run the test suite, run the following:

```shell
$ rspec
```
