require 'uri'

class Url < ActiveRecord::Base
  # validate :validate_url?
  before_save :shorten
	# # This is Sinatra! Remember to create a migration!
  # def valid_url?(uri)
  #   uri = URI.parse(uri) && !uri.host.nil?
  # rescue URI::InvalidURIError
  #   false
  # end

  def shorten
    self.short = SecureRandom.hex(10)
  end

end
