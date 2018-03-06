module EventHelper
	def host_without_www(url)
	  url = "http://#{url}" if URI.parse(url).scheme.nil?
	  host = URI.parse(url).host.downcase
	  host.start_with?('www.') ? host[4..-1] : host
	end

	def read?(user, event)
		user && Reading.where(:user_id => user.id, :event_id => event.id).present?
	end

	def read_event_class(user, event)
		if read?(user, event)
			'darker_event'
		end
	end
end
