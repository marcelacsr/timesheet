# README

#### How to run (Docker Compose)
Prerequisites: 
- Docker
- Docker Compose

With docker we can build the app.
The following command will build 
the application image and MySQL 
instance, and start a container 
for the API, which will run on 
port 3000.
```
docker-compose up
```

#### Tests

Run tests with the following command, coverage can be found inside '../coverage'  
after the test suite has been run and is currently at **??%**.  
Inside container's BASH(`docker-compose run --rm app bash`) run:
```
RAILS_ENV=test rails db:create
rails db:test:prepare
rspec
```

#### WebApp

- Session control by Devise
- Log in / Logout / Sign up
- Timesheet
- Timesheet history

#### TODO


- [ ] Fine adjustments in the layout (Navbar, Forms, Buttons, Cards)
- [ ] Add gem Pagy for paginate in Datatable history
- [ ] Refactor TimeSheetsServices
- [ ] Set up tests config in the Docker
- [ ] Fix LoginHelper for Devise