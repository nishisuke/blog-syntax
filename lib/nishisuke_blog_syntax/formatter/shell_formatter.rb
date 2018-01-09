require 'nishisuke_blog_syntax/formatter'

module NishisukeBlogSyntax
  module Formatter
    module ShellFormatter
      REGEXP = /^SHELL```(.*)SHELL```$/m
      INPUT_REGEXP = /\Ain: /
      OUTPUT_REGEXP = /\Aout: /

      class << self
        def format(txt)
          m = txt.match(REGEXP)
          return txt if m.nil?

          contents = m[1].split("\n")

          file_name = contents.shift

          content_str = contents.reject(&:empty?).map do |l|
            wrapped_line(l)
          end.join('<br>')

          html = wrapped_content(content_str)

          txt.gsub(REGEXP, html)
        end

        private

        def wrapped_line(txt)
          if m = txt.match(INPUT_REGEXP)
            %Q(<kbd class="shell__input">#{m.post_match}</kbd>)
          elsif m = txt.match(OUTPUT_REGEXP)
            %Q(<samp class="shell__output">#{m.post_match}</samp>)
          else
            txt
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
end
