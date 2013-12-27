require 'nokogiri'
require 'net/https'

task :refresh_cctvs_urls => :environment do 
  uri = URI('https://165.193.215.51/XMLFeeds/createXML.aspx')
  req = Net::HTTP::Post.new(uri.path)
  req.set_form_data({'username' => ENV["NY_USER_NAME"], 
		     'password' => ENV["NY_PASSWORD"], 
		     'dataType' => 'cctv'})

  sock = Net::HTTP.new(uri.host, uri.port)
  sock.use_ssl = true
  sock.ssl_version = "SSLv3"
  sock.verify_mode = OpenSSL::SSL::VERIFY_NONE

  res = sock.start{ |http| http.request(req) }

  xml_doc = Nokogiri::XML(res.body)

  cctvs = xml_doc.xpath("/cctvs/cctv")
  cctvs.each do |cctv|
    cctv_name = cctv.xpath("CCTV_Name").inner_text
    cctv_url = cctv.xpath("URL").inner_text
    cctv_model = Cctv.find_by(name: cctv_name)
    Rails.logger.debug("Updating CCTV #{cctv_name} with url: #{cctv_url}") 
    Cctv.update(cctv_model.id, url: cctv_url) 
  end
end
