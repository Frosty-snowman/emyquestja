class Quest < ApplicationRecord
  validates :name, presence: true
  
  before_save :trim_whitespace
  
  private
  
  def trim_whitespace
    self.name = name.strip if name.present?
  end
end