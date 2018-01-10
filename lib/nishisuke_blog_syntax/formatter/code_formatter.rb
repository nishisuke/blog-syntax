require 'nishisuke_blog_syntax/formatter'
require 'erb'
include ERB::Util

module NishisukeBlogSyntax
  module Formatter
    class CodeFormatter < FormatterBase
      SUBSTITUTE_REGEXP = /^SRC```(.*?)SRC```$/m
      PARSE_REGEXP = /^SRC```(.*)SRC```$/m

      private

      def regexp
        SUBSTITUTE_REGEXP
      end

      def substitute(matched)
        content_str = matched.match(PARSE_REGEXP)[1]
        contents = content_str.split("\n")
        file_name = contents.shift
        contents.map! { |l| wrapped_line(l) }
        wrapped_content(contents.join('<br>'), file_name)
      end

      def wrapped_line(txt)
        %Q(<span class="shell__code-line">#{h(txt)}</span>)
      end

      def wrapped_content(content, file_name)
        has_file_name = !file_name.gsub(/\s/, '').empty?

        html = <<~HTML.gsub("\n", '')
          <div class="shell mdc-elevation--z2">
          #{%Q(<span class="shell__file">#{file_name}</span>) if has_file_name}
          <pre class="shell__container">
          <code class="shell__code">
          #{content}
          </code>
          </pre>
          </div>
        HTML
      end
    end
  end
end
