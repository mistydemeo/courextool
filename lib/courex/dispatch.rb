require 'net/http'
require 'nokogiri'

module Courex
  class Dispatch
    attr_accessor :xml
    attr_reader   :tracking_number

    def initialize tracking_number
      @tracking_number = tracking_number

      @xml = Nokogiri::XML::Builder.new do |xml|
        xml.RequestCall {
          xml.AppType 'Tracking'

          xml.UserName Courex.username
          xml.Password Courex.password

          xml.Parameters {
            xml.TrackNo tracking_number
          }
        }
      end
    end

    def to_xml; @xml.to_xml; end

    def dispatch
      uri = URI('http://www.courex.com.sg/xml/index.php')
      post = Net::HTTP::Post.new uri.path

      post.content_type = 'application/x-www-form-urlencoded'
      post['user-Agent'] = 'CourexGateway_socket/1.0'
      post['Accept'] = '*/*'
      post.body = @xml.to_xml

      response = Net::HTTP.start(uri.host, uri.port) {|http| http.request(post)}
    end
  end

  def self.username= name
    @username = name
  end

  def self.username; @username; end

  def self.password= pass
    @password = pass
  end

  def self.password; @password; end
end