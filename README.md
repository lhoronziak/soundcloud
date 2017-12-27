# Hi, welcome to the development team!
## Just follow this instructions to get started!

### Project structure
* Whole project is dockerized, which means each service is contained within a Docker container.
    1. Rails application
        * Ruby version: 2.4.1
        * Rails version: 5.1.4
    2. Postgresql
        * Postgres version: 9.4

### Setup:
1. clone repository:
    * git clone [repository address]
2. checkout master branch:
    * git fetch && git checkout master
3. Install docker and docker-compose
4. run application
    * cd /path/to/procject/app/root
    * docker-compose build
    * docker-compose up dev
5. Stop application
    * docker-compose stop
6. Remove old/stopped containers
    * docker-compose rm
7. Login to container
    * docker ps // to get information about container id
    * docker exec -it $(container_id) bash -l
8. Run container without running server - good for debugging
    * docker-compose run --rm --service-ports dev bash -l

### Tests:
* To run whole test suite
    * docker-compose run --rm test
* To run ad-hoc tests
    * docker-compose run --rm test bash -l
    * rake db:create db:migrate
    * rspec spec/path/to_spec.rb
* If you want to debug tests:
    * inside failing test insert "binding.pry"
    * run test again
