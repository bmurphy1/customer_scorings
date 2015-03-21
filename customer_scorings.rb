require 'net/http'

class CustomerScorings

  @url = "http://not-real.leapfrogonline.com/customer_scoring"

  # Returns customer scorings from external API based on query
  # @param [Hash] attributes - Hash of attributes sent to query against
  def self.get(attributes)
    uri = formatted_uri(attributes)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  private

  # Returns properly formatted uri with attributes given
  # @param [Hash] attributes - key/value of attributes
  def self.formatted_uri(attributes)
    uri = URI.parse(@url)
    uri.query = URI.encode_www_form attributes
    uri
  end