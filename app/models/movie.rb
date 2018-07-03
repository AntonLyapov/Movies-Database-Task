class Movie < ApplicationRecord
	has_many :comments

	validates :title, uniqueness: { scope: :year }
	# validates :year, date: { after: Proc.new { Date.current }, message: 'must be after today' },

	scope :by_name_asc, -> { Movie.order(name: "asc") }
	scope :by_name_desc, -> { Movie.order(name: "desc") }
	scope :by_year_asc, -> { Movie.order(year: "asc") }
	scope :by_year_desc, -> { Movie.order(year: "desc") }

	has_attached_file :picture,
	styles: { medium: "600x1050#", thumb: "200x350#" },
	default_url: ":style/missing.png"

	validates_attachment :picture,
	content_type: { content_type: ["image/jpeg", "image/png"] },
	size: { in: 100.kilobytes..2.megabytes }
end
