# WebRubyAutomationTest
Ruby Automation for Web Automation test

## Testing Instructions for Web Automation

* Open Terminal

* Run script `bundle install` to install all gem dependencies

* Run script `cucumber --tags @tcc` to run automation test for TCC 

## Docker Setup

* Ensure the .env.localdocker file contains url to testing browser

* Ensure that navigation support file is pointing to ENV url

* Open terminal and run `make build` to build Docker images

* Run `make up` to make up Docker containers

* Open another terminal and run `make shell` 

* In docker bash shell run `cucumber` for full automation run 