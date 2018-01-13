require 'nishisuke_blog_syntax/formatter'

module NishisukeBlogSyntax
  module Formatter
    class SubHeadlineFormatter < FormatterBase
      SUBSTITUTE_REGEXP = /^## .*$/
      PARSE_REGEXP = /^## (.*)$/

      private

      def regexp
        SUBSTITUTE_REGEXP
      end

      def substitute(matched)
        content_str = matched.match(PARSE_REGEXP)[1]
        "<h2>#{content_str}</h2>"
      end
    end
  end
end
