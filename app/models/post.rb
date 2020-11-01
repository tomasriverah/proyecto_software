class Post < ApplicationRecord

	has_many :comentarios,:dependent => :destroy
	# attr_accessor :comentarios
	validates :author, :title, :tipo, :comment, presence: true

	def author_and_title_and_tipo
		"#{author} #{title} #{tipo}"
	end

end
