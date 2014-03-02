module AdsHelper
	def state_link(state_method, ads)
    	if can?(state_method, ads) && ads.send("can_#{state_method}?")
      		link_to(state_method.to_s,
              	transfer_state_ad_path(transfer_method: state_method, 
              		id: ads.id), method: :post, remote: true)
    	end
  	end
end
