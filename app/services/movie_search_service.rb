class MovieSearchService
  def initialize
    @options = { includes: :director }
  end

  def perform(query)
    Movie.search(query, @options)
  end
end
