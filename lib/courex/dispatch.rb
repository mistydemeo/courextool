require 'nokogiri'

module Courex
  class Dispatch
    attr_accessor :xml

    def initialize tracking_number
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