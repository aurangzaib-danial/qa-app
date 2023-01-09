This is a Q&A web application similar to Stack Overflow that I built as one of my portfolio projects.

This application has been built with latest and greatest tools that come with Rails 7. The front-end makes use of Rails new approach for building modern web applications i.e Hotwire.

## Video Walk-through
https://www.youtube.com/watch?v=72m6syG2vxI

## Features
- Users can surprise surprise ask questions and receive answers to their questions.
- Apart from normal authentication, users can also use Facebook login.
- A question can be posted under a specific subject.
- Questions and answers bodies can be formatted with various style options and images can also be added. All of this is powered using **ActionText**.
- Users can vote on questions.
- Users can add comments to questions and answers.
- Users can search for specific questions.
- Information can be scoped for almost everything e.g. displaying questions for a specific subject.
- Real-time notifications e.g. a user will be notified if they receive an answer to their question while they are using the website. This functionaliy is powered through **ActionCable**.
- The entire application is responsive and works great on modern devices.

## Development Setup
Make sure you have **postgresql**, **vips** and **imagemagick** installed.

For using the Facebook login, please add your **api_key** and **api_secret** to the rails credentials.

Run the following command for setting up the database and some initial test data.

```
rails db:create && rails db:schema:load && rails db:seed
```

Install node packages

```
yarn install
```

Start up javascript bundling with esbuild

```
./bin/dev
```

Start up the rails server and have a look around!

```
rails server
```

## License
This project is released under the MIT License.

