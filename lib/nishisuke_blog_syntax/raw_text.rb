require 'nishisuke_blog_syntax/formatter/code_formatter'
require 'nishisuke_blog_syntax/formatter/shell_formatter'
require 'nishisuke_blog_syntax/formatter/paragraph_formatter'
require 'nishisuke_blog_syntax/formatter/sub_headline_formatter'
require 'nishisuke_blog_syntax/formatter/head_three_formatter'
require 'nishisuke_blog_syntax/formatter/list_formatter'

module NishisukeBlogSyntax
  class RawText
    def initialize(text)
      @text = text.gsub(/\R/, "\n")
    end

    def to_html
      self.class.html_formatters.inject(text) do |html, f|
        f.format(html)
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
        Formatter::ParagraphFormatter.new,
        Formatter::SubHeadlineFormatter.new,
        Formatter::HeadThreeFormatter.new,
        Formatter::ListFormatter.new,
      ]
    end

    attr_reader :text
  end
end
