require 'uri'

class Link < ActiveRecord::Base
  before_create :valid?
  validates :title, presence: true
  validates :url,   presence: true
end


private

def valid?
  uri = URI.parse(self.url)
  uri.kind_of?(URI::HTTP)
rescue URI::InvalidURIError
  false
end
