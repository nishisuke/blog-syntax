require 'nishisuke_blog_syntax/version'
require 'nishisuke_blog_syntax/raw_text'

module NishisukeBlogSyntax
  class << self
    def convert_html(txt)
      raw = RawText.new(txt)
      raw.to_html
    end
  end
end
