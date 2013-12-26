require 'clockwork'

module Clockwork

  handler do |job|
    logger.debug("Running #{job}")
  end

  every(11.seconds, "Refreshing CCTV URLs") {
    `rake refresh_cctvs_urls`
  }

end
