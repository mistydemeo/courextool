require 'nokogiri'

module Courex
  class Dispatch
    attr_accessor :xml

    def initialize tracking_number
      @xml = Nokogiri::XML::Builder.new do |xml|
        xml.RequestCall {
          xml.AppType 'Tracking'

          xml.UserName 'username'
          xml.Password 'password'

          xml.Parameters {
            xml.TrackNo tracking_number
          }
        }
      end
    end

    def to_xml; @xml.to_xml; end
  end
end