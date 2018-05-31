class Task < ApplicationRecord
	mount_uploader :images, ImagesUploader
	belongs_to :user
	validates :task, presence: true
	validates :detail, presence: true

	def self.search(search)
	  where("task iLIKE ? OR detail iLIKE ?", "%#{search}%", "%#{search}%") 
	end

end
