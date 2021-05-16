require_relative 'spec_helper'
require 'httparty'
require 'stringio'

response = HTTParty.get("https://pamelainc.zendesk.com/api/v2/tickets.json", :headers => {'Authorization': 'Basic cGFtZWxhLmUuZ2xpY2ttYW5AZ21haWwuY29tOlNOTFQxMmhycw=='}).parsed_response["tickets"]

describe Functions do
  functions = Functions.new()
  describe "#display_menu" do
    let(:input) { "q" }

    it "quits when q is entered on the main menu" do
      functions.display_menu(response, input)
    end
  end
end
