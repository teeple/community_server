module ApisHelper
		def get_imsi_ecgi(ip_address)
      url = ENV['API_SERVER_HOST'] + ':' + ENV['API_SERVER_PORT']
      url += '/Management/IMSI'
      RestClient.get url, {:params => {'IP' => ip_address},:content_type => :xml, :accept => :xml}
		end

		def activate_tracking
		end
end
