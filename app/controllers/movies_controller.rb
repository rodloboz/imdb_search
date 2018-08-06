class MoviesController < ApplicationController
  def index
    # if params[:query].present?
    #   sql_query = " \
    #     movies.title @@ :query \
    #     OR movies.syllabus @@ :query \
    #     OR directors.first_name @@ :query \
    #     OR directors.last_name @@ :query \
    #   "
    #   @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @movies = Movie.all
    # end

    # if params[:query].present?
    #   @movies = Movie.global_search(params[:query])
    # else
    #   @movies = Movie.all
    # end

    query = params[:query].presence || "*"
    @movies = MovieSearchService.new.perform(query)
  end
end

