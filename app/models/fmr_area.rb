class FmrArea < ActiveRecord::Base
  belongs_to :transaction

  validates :state, :area_name, :metro_area,
    :metro_code, :year, presence: true
  validates :metro_code, uniqueness: { scope: :year }

  def by_state(state, year = Time.now.year)
    where(state: state, year: year)
  end
end