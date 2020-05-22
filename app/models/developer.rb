class Developer < ApplicationRecord
  validates :name, uniqueness: true
  has_many :game_developers

  def self.get_or_create_steam_developer(name)    
    dev = Developer.find_by(name: name)

    if dev.nil?
      dev = Developer.new(name: name)
      dev.save
    end

    dev
  end
end
