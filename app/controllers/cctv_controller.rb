class CctvController < ApplicationController

  def index
  end

  def cctv_url
    cctv_url = Cctv.get_cctv_url(params['cctv_name'])
    logger.debug("Retrieving cctv url. URL #{cctv_url}")
    respond_to do |format|
      format.json { render :json => { :success => "success",
	                              :status_code => "200",
				      :cctv_url => cctv_url,
				      :cctv_name => params['cctv_name'] 
                                    }
                  }
    end
  end

end
