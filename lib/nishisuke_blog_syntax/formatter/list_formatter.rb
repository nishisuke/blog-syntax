require 'nishisuke_blog_syntax/formatter'

module NishisukeBlogSyntax
  module Formatter
    class ListFormatter < FormatterBase
      SUBSTITUTE_REGEXP = /^- .*$/
      PARSE_REGEXP = /^- (.*)$/

      private

      def regexp
        SUBSTITUTE_REGEXP
      end

      def substitute(matched)
        content_str = matched.match(PARSE_REGEXP)[1]
        "<li>#{content_str}</li>"
      end
    end
  end
end
