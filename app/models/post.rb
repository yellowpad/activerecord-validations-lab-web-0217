class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates_inclusion_of :category, :in => ["Fiction", "Non-Fiction"]	
	validate :is_clickbait?


	CLICKY = [
		/Won't Believe/i, 
		/Secret/i, 
		/Top [number]/i, 
		/Guess/i
	]

	def is_clickbait?
		if CLICKY.none? {|pat| pat.match title}
			errors.add(:title, "Title must be clickbait.")
		end
	end
end
