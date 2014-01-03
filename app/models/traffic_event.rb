require 'nokogiri'
require 'net/https'

class TrafficEvent < ActiveRecord::Base

  def get_traffic_events
    uri = URI('https://165.193.215.51/XMLFeeds/createXML.aspx')
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data({'username' => ENV["NY_USER_NAME"],
		       'password' => ENV["NY_PASSWORD"],
		       'dataType' => 'events'})
  end

end
