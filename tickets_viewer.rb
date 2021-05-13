require 'httparty'

response = HTTParty.get("https://pamelainc.zendesk.com/api/v2/tickets.json", :headers => {'Authorization': 'Basic cGFtZWxhLmUuZ2xpY2ttYW5AZ21haWwuY29tOlNOTFQxMmhycw=='}).parsed_response["tickets"]

puts "Welcome to the ticket viewer"
puts ""

input = nil

# Prints all tickets. It shows 25 tickets at a time, then asks the user if they want to see more
def show_all_tickets response
  # Add Pagination
  response.map do |ticket|
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
      puts "Showing the next 25 tickets"
      puts ""
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
  input = gets.chomp
  # Show Ticket
  puts "Showing ticket #{input}"
  puts ""

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
      puts "Showing ticket #{input}"
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
