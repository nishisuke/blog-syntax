require 'nishisuke_blog_syntax/formatter'
require 'erb'
include ERB::Util

module NishisukeBlogSyntax
  module Formatter
    class ShellFormatter < FormatterBase
      SUBSTITUTE_REGEXP = /^SHELL```(.*?)SHELL```$/m
      PARSE_REGEXP = /^SHELL```(.*)SHELL```$/m
      INPUT_REGEXP = /\Ain: /
      OUTPUT_REGEXP = /\Aout: /

      private

      def regexp
        SUBSTITUTE_REGEXP
      end

      def substitute(matched)
        content_str = matched.match(PARSE_REGEXP)[1]
        contents = content_str.split("\n")
        contents.shift # drop first line, this is SRC```xxxxx <-
        contents.map! { |l| wrapped_line(l) }
        wrapped_content(contents.join('<br>'))
      end

      def wrapped_line(txt)
        if m = txt.match(INPUT_REGEXP)
          %Q(<kbd class="shell__input">#{h(m.post_match)}</kbd>)
        elsif m = txt.match(OUTPUT_REGEXP)
          %Q(<samp class="shell__output">#{h(m.post_match)}</samp>)
        else
          '' # this means <br><br> finaly.
        end
      end

      def wrapped_content(content)
        html = <<~HTML
          <div class="shell mdc-elevation--z2">
          <pre class="shell__container">
          <span class="shell__std">
          #{content}
          </span>
          </pre>
          </div>
        HTML
        html.gsub("\n", '')
      end
    end
  end
end
