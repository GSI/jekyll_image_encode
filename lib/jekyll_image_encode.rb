module ImageEncodeCache
  @@cached_base64_codes = Hash.new
  
  def cached_base64_codes
    @@cached_base64_codes
  end
  
  def cached_base64_codes= val
    @@cached_base64_codes = val
  end
end

module Jekyll
  module Tags
    class ImageEncodeTag < Liquid::Tag
      include ImageEncodeCache
          
      def initialize(tag_name, url, options)
        @url = url.strip
        super
      end

      def render(context)
        encode_image
      end
      
      def encode_image
        require 'open-uri'
        require 'base64'
        
        encoded_image = ''

        if self.cached_base64_codes.has_key? @url
          encoded_image = self.cached_base64_codes[@url]
        else
          # p "Caching #{@url} as local base64 string ..."
          open(@url) do |image|
            encoded_image = Base64.encode64(image.read)
          end
          self.cached_base64_codes.merge!(@url => encoded_image)
        end
        
        "data:image;base64, #{encoded_image}"
      end
    end
  end
end

Liquid::Template.register_tag('base64', Jekyll::Tags::ImageEncodeTag)