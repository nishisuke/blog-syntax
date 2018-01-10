module NishisukeBlogSyntax
  module Formatter
    class FormatterBase
      def format(txt)
        txt.gsub(regexp) { |matched| substitute(matched) }
      end

      private

      def regexp
        raise NotImplementedError
      end

      def substitute
        raise NotImplementedError
      end
    end
  end
end
