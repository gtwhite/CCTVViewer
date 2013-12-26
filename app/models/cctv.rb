class Cctv < ActiveRecord::Base

  def self.get_cctv_url(name)
    cctv = Cctv.find_by(name: name)
    return cctv.url
  end
end
