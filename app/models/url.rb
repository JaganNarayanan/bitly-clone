require 'uri'

class Url < ActiveRecord::Base
  validates :long, presence: true
  validates :long, format: { with: URI.regexp }, if: 'long.present?'
  before_create :shorten
	# This is Sinatra! Remember to create a migration!



  def shorten
    self.short = SecureRandom.hex(10)
  end

end
