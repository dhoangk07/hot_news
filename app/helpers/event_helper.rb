module EventHelper
	def host_without_www(url)
	  url = "http://#{url}" if URI.parse(url).scheme.nil?
	  host = URI.parse(url).host.downcase
	  host.start_with?('www.') ? host[4..-1] : host
	end

	def read?(user, event)
		user.present? && Reading.where(:user_id => user.id, :event_id => event.id).present?
	end

	def read_event_class(user, event)
		if read?(user, event)
			'darker_event'
		end
	end


	def hide?(user, event)
		user.present? && Hide.where(:user_id => user.id, :event_id => event.id).present?
	end

	def bookmark?(user, event)
	  user.present? && Bookmark.where(:user_id => user.id, :event_id => event.id).present?
  end

	def liked_by_user?(user, event)
		if user.present?
 			event.likes.where(user_id: user.id).present?
 		end
  end
end
