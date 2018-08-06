 class Movie < ApplicationRecord
  # include PgSearch
  # pg_search_scope :search_by_title_and_syllabus,
  #   against: [ :title, :syllabus ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
  # pg_search_scope :global_search,
  #   against: [ :title, :syllabus ],
  #   associated_against: {
  #     meals: [ :first_name, :last_name ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }
  # multisearchable against: [ :title, :syllabus ]
  searchkick

  def search_data
    attributes.merge(
      director_first_name: director(&:first_name),
      director_last_name: director(&:last_name)
    )
  end

  belongs_to :director
end
