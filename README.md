# Zendesk Ticket Viewer  

## Prerequisites
Ruby 2.6.1 needs to be installed before installing this application.  
<br>
## Installation instructions

Open the terminal, and clone this repository:

```
git clone https://github.com/landonkoo0207/zendesk-ticket-viewer/
```

Go to the installed directory, then install the required gems:

```
bundle install
```

Copy master.key to the /config directory.

You need this key to use the encrypted credentials for the Zendesk API access. This file will have been delivered to you via email.

(<i>Please NOTE: I will make sure the master.key file to be delievered in the submission email, but I will also have the hash key (the contents of master.key) of the master.key file included in the contents of the submission email as plain text, just in case the file is corrupted in transit. 

If master.key file was corrupted, please do the following:
  
  - Open the terminal and go to the root (zendesk-ticket-viewer) directory of the application. 
  - Go to /config directory and create
```
master.key
```
file, and open the file in the text editor
  - Copy the hash key included in the submission email, and save it.
</i>)


## How to run the application

Once you have sorted the master.key file, open your terminal app and

Go to the root directory (zendesk-ticket-viewer) then run:

```
rails s
```
 
to run the development server.

Open your web browser, enter localhost:3000 in the address window of the browser.

Now you can try out and test the application!  

## How to run tests within the application

The tests of this application have been completed by RSpec tests.

There are 3 spec files for testing:

1. spec/features/ticket\_list_spec.rb
   - This tests the feature displaying all the tickets as a list. 

2. spec/features/individual\_ticket_spec.rb
   - This tests the feature displaying the details of an individual ticket.

3. spec/features/error\_handling_spec.rb
   - This tests the basic error handling capabilities of the application

To run the tests, execute the RSpec commands like the following:

```
bundle exec rspec spec/features/ticket_list_spec.rb
```
Please make sure to run each test individually. As the application always make an API call whenever need any data, running all of the three tests simulteneously seems to cause unexpected results in the tests, even when all the tests are happy path tests. 

## Design Choices for the Application
In this section, the design choices that were made, and the reasoning begind them will be explained. 

### 1. No database was used
The ticket viewer application relies entirely on the data from the Zendesk API. Whenever any data needs to be used or displayed, the application needs to make an API call to retrieve relevant data. Therefore, using local database to store data is not necessary and would make the data in the local database redundant. I still used Rails models, but only to interact with the Zendesk API. 

### 2. Flexirest gem
Flexirest gem allows you to use Rails models without database. This gem allows Rails models to interact with the external API directly, and acts as the models interacting with regular local database. For example, with appropriate implementation, you can run:
```
Ticket.all
```
 then it returns all the data from an API call, just like you would in a regular database. When you call 
 ```
 Ticket.find(1)
 ```
 then it returns the data entry with id:1 from an API call, again, just like retrieving data from local database.
 
 This made this ticket viewer application's codes a lot cleaner, and well aligned with a proper Model-View-Controller(MVC) architecture. Having explored a number of other gems for API interaction, most gems allowing API calls made the code quite messy and unreadable, as they usually make an API call directly from the controller. 
 
 This gem has allowed me to retain Rails' MVC structure, and made my codes much cleaner and readable.
 
### 3. Error handling in ApplicationController
All the error handlings were done within ApplicationController rather than letting individual controllers deal with them. Handling errors within an individual controller was straightfoward, but made numerous duplications of the same error handling codes far too often. 

I have implemented a separate ErrorsController for error handling. Whenever error raises within the application, ApplicationController catches it and send it to ErrorsController to handle the errors. 

I have used StandardError to catch errors and exceptions rather than specific exceptions, so even when unexpected error or exception happens, the application will not crash with the default Rails error page. 

By doing these, it has achieved two things:

1) Separated error handling from the tickets controller. Now the TicketsController solely deals with the data from the Ticket API, and ErrorsContoller only deals with the errors raising within the application. Single purpose or conern for each controller.

2) The codes in the controllers are much more straightforward, concise and readable.

### 4. Storing Credentails (Login Details) for the Zendesk API access

I have used the credentials feature of Rails, which was first introduce in Rails 5. With this feature, Rails encrypts the credential data and store it. Only with master.key file from the application owner can use the credentials. Without the master.key file, no one can actually use the credentials. 

This is far much more secure than simply storing it in Rails environmental variables, as those environment variables are merely plain text. This is why I chose Rails' new credential feature over conventional environment variables. 


      