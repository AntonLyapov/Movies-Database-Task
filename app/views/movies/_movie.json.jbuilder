json.extract! movie, :id, :title, :year, :description, :genre, :created_at, :updated_at
json.url movie_url(movie, format: :json)
