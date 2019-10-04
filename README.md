# README

## Ruby version
RUBY 2.6.4 working on alpine via Docker

## System dependencies
* docker https://www.docker.com/
* docker-compose https://docs.docker.com/compose/

## Running the project for the first time
1. First build the image

``` $ docker-compose build```

2. Reinstall yarn dependencies, since node_modules were erased by the volume

``` $ docker-compose run --rm app yarn install ```

3. Now create and migrate the database

``` $ docker-compose run --rm app rake db:create db:migrate db:seed```

4. Spin up the containers :)

``` $ docker-compose up ```

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

## License


MIT License

Copyright (c) 2019 RPG Inspire

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
