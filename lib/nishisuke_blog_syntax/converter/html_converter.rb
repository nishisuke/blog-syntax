module NishisukeBlogSyntax
  module Converter
    class HtmlConverter
      def initialize
        @formatters = [
        ]
      end

      def convert(raw)
        '<p>hogehoge</p>'
      end
    end
  end
end
