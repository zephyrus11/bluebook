class Task < ApplicationRecord
	mount_uploader :images, ImagesUploader


	def self.search(search)
	  where("task iLIKE ? OR detail iLIKE ?", "%#{search}%", "%#{search}%") 
	end

end
