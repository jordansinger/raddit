class Link < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments
	after_create :set_title

	def set_title
		url = self.url
		title = Mechanize.new.get(url).title
		self.title = title
		self.save
	end
end
