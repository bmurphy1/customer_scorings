require 'net/http'

class CustomerScorings

  @url = "http://not-real.leapfrogonline.com/customer_scoring"

  # Returns customer scorings from external API based on query
  # @param [Hash] attributes - Hash of attributes sent to query against
  def self.get(attributes)
    response = Net::HTTP.get_response(formatted_uri(attributes))
    response.code == '200' ? response.body : raise_exception(response.code)
  end

  private

  # Returns properly formatted uri with attributes given
  # @param [Hash] attributes - key/value of attributes
  def self.formatted_uri(attributes)
    uri = URI.parse(@url)
    uri.query = URI.encode_www_form attributes
    uri
  end

  def self.raise_exception(status_code)
    raise "Error: #{status_code} status code returned from server"
  end
end