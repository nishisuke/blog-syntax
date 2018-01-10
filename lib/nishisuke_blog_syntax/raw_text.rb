require 'nishisuke_blog_syntax/formatter/code_formatter'
require 'nishisuke_blog_syntax/formatter/shell_formatter'

module NishisukeBlogSyntax
  class RawText
    def initialize(text)
      @text = text
    end

    def to_html
      self.class.html_formatters.inject(text.gsub(/\R/, "\n")) do |html, formatter|
       formatter.format(html)
      end
    end

    private

    def self.html_formatters
      # order is important!
      # Each formatter should be commutative.
      # But be careful order for the future.
      @@formatters ||= [
        Formatter::ShellFormatter.new,
        Formatter::CodeFormatter.new,
      ]
    end

    attr_reader :text
  end
end
