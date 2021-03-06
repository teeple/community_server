module Apis
	def self.get_imsi_ecgi(ip_address)
		url = ENV['API_SERVER_HOST'] + ':' + ENV['API_SERVER_PORT']
		url += '/Management/IMSI'
		
		# RestClient.get url, {:params => {'IP' => ip_address},:content_type => :xml, :accept => :xml} 
		ComDev::Application.config.logger.error '### API SERVER URL ' + url
		ComDev::Application.config.logger.error '### Client IP ' + ip_address
		result = RestClient.get(url, {:params => {'IP' => ip_address},:content_type => :xml, :accept => :xml} ){|response, request, result| response }
		ComDev::Application.config.logger.error '### ' + result
		result
	end

	def self.tracking_on(imsi,ecgi)
		url = ENV['API_SERVER_HOST'] + ':' + ENV['API_SERVER_PORT']
		url += '/Management/Tracking'
		# RestClient.get url, {:params => {'IMSI' => imsi, 'ECGI' => ecgi},:content_type => :xml, :accept => :xml}
		result = RestClient.get(url, {:params => {'IMSI' => imsi, 'ECGI' => ecgi},:content_type => :xml, :accept => :xml}){|response, request, result| response }
		ComDev::Application.config.logger.error '### ' + result
		result
	end

	def self.location_fetch(imsi)
		url = ENV['API_SERVER_HOST'] + ':' + ENV['API_SERVER_PORT']
		url += '/Management/ECGI'
		# RestClient.get url, {:params => {'IMSI' => imsi}, :content_type => :xml, :accept => :xml}
		ComDev::Application.config.logger.error '### API SERVER URL ' + url

		result = RestClient.get(url, {:params => {'IMSI' => imsi}, :content_type => :xml, :accept => :xml}){|response, request, result| response }
		ComDev::Application.config.logger.error '### ' + result
		result
	
	end

end
