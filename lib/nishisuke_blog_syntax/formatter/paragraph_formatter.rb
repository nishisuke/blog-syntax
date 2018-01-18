require 'nishisuke_blog_syntax/formatter'

module NishisukeBlogSyntax
  module Formatter
    class ParagraphFormatter < FormatterBase
      SUBSTITUTE_REGEXP = /^>>>(.*?)<<<$/m
      PARSE_REGEXP = /^>>>(.*)<<<$/m

      private

      def regexp
        SUBSTITUTE_REGEXP
      end

      def substitute(matched)
        content_str = matched.match(PARSE_REGEXP)[1]
        content_str.gsub!(/\R|\s+/, ' ')
        "<p>#{content_str.chop}</p>"
      end
    end
  end
end
