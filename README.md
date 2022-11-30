# Putting it All Together: Client-Server Communication

## Learning Goals

- Understand how to communicate between client and server using fetch, and how
  the server will process the request based on the URL, HTTP verb, and request
  body
- Debug common problems that occur as part of the request-response cycle

## Introduction

Just like the last lesson, we've got code for a React frontend and Rails API
backend set up. This time though, it's up to you to use your debugging skills to
find and fix the errors!

To get the backend set up, run:

```console
$ bundle install
$ rails db:migrate db:seed
$ rails s
```

Then, in a new terminal, run the frontend:

```console
$ npm install --prefix client
$ npm start --prefix client
```

Confirm both applications are up and running by visiting
[`localhost:4000`](http://localhost:4000) and viewing the list of toys in your
React application.

## Deliverables

In this application, we have the following features:

- Display a list of all the toys
- Add a new toy when the toy form is submitted
- Update the number of likes for a toy
- Donate a toy to Goodwill (and delete it from our database)

The code is in place for all these features on our frontend, but there are some
problems with our API! We're able to display all the toys, but the other three
features are broken.

Use your debugging tools to find and fix these issues.

There are no tests for this lesson, so you'll need to do your debugging in the
browser and using the Rails server logs and `byebug`.

**Note**: You shouldn't need to modify any of the React code to get the
application working. You should only need to change the code for the Rails API.

As you work on debugging these issues, use the space in this README file to take
notes about your debugging process. Being a strong debugger is all about
developing a process, and it's helpful to document your steps as part of
developing your own process.

## Your Notes Here

- Add a new toy when the toy form is submitted

  - How I debugged:
  - I first checked whether the method is really broken by adding a new toy.
  - I checked the console for any errors that might be logged. The console displayed several errors pertaining the ToyContainer and the ToyCard, but this was not enough. So I checked the network tab which documented an internal server error with a status: 500. Also, the preview details the error very well, i.e. 
  <!-- - <NameError: uninitialized constant ToysController::Toys>" -->
  -I think this is enough guidance to decipher what I will do at this point. i.e., initialize a ToysController to handle the logic pertaining the toys.
  -On checking the controllers folder. There's already a controller to handle that, so I think I'll look more closely to see if I'm missing something.
  -I can now post my toys after adding ! on the createbut I still get an error: 500. Not sure where this is coming from but I can bet it's still from the toys controller.
  -Next, I put a byebug on the create method and confirmed that our params hash has the right values.
  -I try to implement a rescue for whatever errors I might not be getting. I change the wrap_parameters value to false and do a ActiveRecord rescue. I still get the same error tho.
  -I think at this point I'll move on to the next problem since this one is partially solved.


- Update the number of likes for a toy

  - How I debugged:
  - When I click on the like button on a particular toy, I get <!-- - "#<NoMethodError: undefined method `update' for nil:NilClass>" --
  - At this point, I decide to test the API using postman. I realize that I cannot view one toy. I think I should add the show method in the resources.

.........../ I take a break ......../

  - I implement rescue_from  ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  - -I also restore the wrap parameters array
  - -I test the API using Postman
  - -Same error from before
  - I write the show method, Now I can find each toy by its id
  - Test out other methods and they seem to be working fine exept the create method
  - Realize I've a typo in my code. Change Toys.create to Toy.create
  - I can now create a toy
  - Build the increment likes functionality
  - Everything working fine now

- Donate a toy to Goodwill (and delete it from our database)

  - How I debugged:
  - I had built out this method previously.
