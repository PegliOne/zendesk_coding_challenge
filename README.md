# Zendesk Coding Challenge - API Ticket Viewer

## Improvements Needed

* More happy path tests need to be added. Currently only one is available, since I started adding tests too late and couldn't work out how to run tests with multiple inputs. If I could redo the challenge I would include test from the start

* The code needs to be refactored to use shorter functions and more classes (improve separation of concerns)

## Usage Instructions

* This solution runs in the command line using Ruby 2.7.2

* Make sure Ruby 2.7.2 or later is installed before running the program

* Access the zendesk_coding_challenge folder via the command line.

* Once inside the zendesk_coding_challenge folder enter "ruby tickets_viewer.rb" to run the program

* Further instructions will then be printed to the command line (also see the program commands list below)

## Program commands

* 1 (in main menu): Enter "1" in the main menu to print all tickets (25 tickets are printed at a time)

* 1 (in "all tickets" menu): Enter "1" in the "all tickets" sub-menu to print the next set of tickets (once the last ticket has been printed, the program will cycle back to the first set of tickets)

* 2: Enter "2" in the main menu to select a specific ticket (then select the ticket by entering its id number)

* m: Enter "m" when not in the main menu to return to the main menu

* q: Enter "q" in the program's main menu to quit

## Testing Instructions

* Inside the zendesk_coding_challenge folder, run "bundle exec rspec" to run the tests

* Currently the only test available tests that the program quits when "q" is typed

## Production Plan

* 1. Access the Zendesk Tickets API (completed 10:30pm 11/05/21)

* 2. Create an interactive user menu, with options to show all tickets (25 at a time) and select a single ticket (completed 10:30pm 13/05/21)

* 3. Make the menu options behave correctly (pagination and specific ticket selection included) (completed 4:00pm 14/05/21)

* 4. Make the ticket viewer able to handle the API being unavailable and will display a friendly error message (completed 8:45pm 15/05/21)

* 5. Include at least a few happy path tests and tells the user something is wrong if there's a program error (only one test completed at 11:00pm 16/05/21)

* 6. Refactor code to separate concerns (optional)

* 7. Include installation and usage instructions in README.md
