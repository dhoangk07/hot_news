module EventHelper
	def host_without_www(url)
	  url = "http://#{url}" if URI.parse(url).scheme.nil?
	  host = URI.parse(url).host.downcase
	  host.start_with?('www.') ? host[4..-1] : host
	end
end
