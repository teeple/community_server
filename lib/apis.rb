module Apis
	def self.get_imsi_ecgi(ip_address)
		url = ENV['API_SERVER_HOST'] + ':' + ENV['API_SERVER_PORT']
		url += '/Management/IMSI'
		
		# RestClient.get url, {:params => {'IP' => ip_address},:content_type => :xml, :accept => :xml} 
		RestClient.get(url, {:params => {'IP' => ip_address},:content_type => :xml, :accept => :xml} ){|response, request, result| response }
	end

	def self.tracking_on(imsi,ecgi)
		url = ENV['API_SERVER_HOST'] + ':' + ENV['API_SERVER_PORT']
		url += '/Management/Tracking'
		# RestClient.get url, {:params => {'IMSI' => imsi, 'ECGI' => ecgi},:content_type => :xml, :accept => :xml}
		RestClient.get(url, {:params => {'IMSI' => imsi, 'ECGI' => ecgi},:content_type => :xml, :accept => :xml}){|response, request, result| response }
	end

	def self.location_fetch(imsi)
		url = ENV['API_SERVER_HOST'] + ':' + ENV['API_SERVER_PORT']
		url += '/Management/ECGI'
		# RestClient.get url, {:params => {'IMSI' => imsi}, :content_type => :xml, :accept => :xml}
		RestClient.get(url, {:params => {'IMSI' => imsi}, :content_type => :xml, :accept => :xml}){|response, request, result| response }
	
	end

end
