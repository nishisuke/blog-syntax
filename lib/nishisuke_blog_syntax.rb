require 'nishisuke_blog_syntax/version'
require 'nishisuke_blog_syntax/raw_text'
require 'nishisuke_blog_syntax/converter'

module NishisukeBlogSyntax
  class << self
    def convert_html(txt)
      raw = RawText.new(txt)
      Converter::HtmlConverter.new.convert(raw)
    end
  end
end
