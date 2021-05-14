require 'httparty'
require 'pry'

# Get the ticket from the API
response = HTTParty.get("https://pamelainc.zendesk.com/api/v2/tickets.json", :headers => {'Authorization': 'Basic cGFtZWxhLmUuZ2xpY2ttYW5AZ21haWwuY29tOlNOTFQxMmhycw=='}).parsed_response["tickets"]

puts "Welcome to the ticket viewer"
puts ""

input = nil

# Prints all tickets. It shows 25 tickets at a time, then asks the user if they want to see more
def show_all_tickets response
  # These indices determine which tickets will be displayed
  first_index = 0
  last_index = 24
  # Selects the first 25 tickets
  tickets = response[first_index..last_index]
  tickets.map do |ticket|
    puts "Ticket: #{ticket["id"]}, Subject: #{ticket["subject"]}"
    puts ""
  end

  input = nil

  until input == 'm'
    puts "Do you want to view more tickets? Select from the following options"
    puts "* Type '1' to view more tickets"
    puts "* Type 'm' to return to the menu"
    puts ""
    print "Enter selection: "
    input = gets.chomp

    case input
    when "1"
      # Cycles through the tickets in groups of 25
      unless first_index + 25 >= response.length
        first_index += 25
        last_index += 25
      # Cycles back to the start of the list once the end is reached
      else
        first_index = 0
        last_index = 24
      end
      # Selects and prints the next set of tickets
      tickets = response[first_index..last_index]
      tickets.map do |ticket|
        puts "Ticket: #{ticket["id"]}, Subject: #{ticket["subject"]}"
        puts ""
      end
    when "m"
      puts "Returning to main menu"
      puts ""
    else
      puts "Invalid input"
    end
  end
end

# Prints all tickets. It shows 25 tickets at a time, then asks the user if they want to see more
def show_one_ticket response
  puts ""
  print "Enter a ticket number: "
  input = gets.chomp.to_i
  ticket = response.find { |ticket| ticket["id"] == input}
  puts ""
  puts "Ticket: #{ticket["id"]}, Subject: #{ticket["subject"]}"
  puts "-------------------------------------------------------"
  puts ticket["description"]
  puts "-------------------------------------------------------"

  input = nil

  until input == "m"
    puts ""
    puts "Do you want to view another ticket? Select from the following options"
    puts "* Enter a ticket number to view another ticket"
    puts "* Type 'm' to return to the menu"
    puts ""
    print "Enter a ticket number or type 'm' to return to the menu: "
    input = gets.chomp

    unless input == "m"
      puts ""
      ticket = response.find { |ticket| ticket["id"] == input.to_i}
      puts "Ticket: #{ticket["id"]}, Subject: #{ticket["subject"]}"
      puts "-------------------------------------------------------"
      puts ticket["description"]
      puts "-------------------------------------------------------"
    else
      puts ""
      puts "Returning to main menu"
    end
  end
end

# Displays the main menu
until input == 'q'
  puts "Select from the following options"
  puts "* Type '1' to view all tickets"
  puts "* Type '2' to view a ticket"
  puts "* Type 'q' to quit"
  puts ""
  print "Enter selection: "
  input = gets.chomp

  case input
  when "1"
    show_all_tickets response
  when "2"
    show_one_ticket response
  when "q"
    puts "Quiting program"
  else
    puts "Invalid input"
  end
  puts ""
end
