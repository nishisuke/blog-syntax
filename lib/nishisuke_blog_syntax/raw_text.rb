require 'nishisuke_blog_syntax/formatter'

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
      @@formatters ||= [
        Formatter::CodeFormatter,
        Formatter::ShellFormatter,
      ]
    end

    attr_reader :text
  end
end
