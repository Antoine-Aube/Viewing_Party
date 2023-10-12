class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview

  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime] # will need to accounr for formatting
    @genres = data[:genres] # will need to create format method, also account for sad path as some movies may not have explicit genres
    @overview = data[:overview]
  end
end