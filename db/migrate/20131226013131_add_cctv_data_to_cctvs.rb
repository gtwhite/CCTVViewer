require 'nokogiri'
require 'net/https'

class AddCctvDataToCctvs < ActiveRecord::Migration
  def self.up
    uri = URI("https://165.193.215.51/XMLFeeds/createXML.aspx")
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data({'username' => ENV['NY_USER_NAME'], 'password' => ENV['NY_PASSWORD'], 'dataType' => 'cctv'})

    sock = Net::HTTP.new(uri.host, uri.port)
    sock.use_ssl = true
    sock.ssl_version = "SSLv3"
    sock.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = sock.start { |http| http.request(req) }

    xml_doc = Nokogiri::XML(res.body)

    cctvs = xml_doc.xpath("/cctvs/cctv")

    cctvs.each do |cctv|
      lat = cctv.xpath("Latitude").inner_text
      long = cctv.xpath("Longitude").inner_text
      name = cctv.xpath("CCTV_Name").inner_text
      url = cctv.xpath("URL").inner_text 
      new_cctv = Cctv.new(name: name, latitude: lat, longitude: long, url: url)
      new_cctv.save
    end
  end

  def self.down
    Cctv.delete_all
  end
end
