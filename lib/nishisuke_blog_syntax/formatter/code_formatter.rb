require 'nishisuke_blog_syntax/formatter'
require 'erb'
include ERB::Util

module NishisukeBlogSyntax
  module Formatter
    module CodeFormatter
      REGEXP = /^SRC```(.*)SRC```$/m

      class << self
        def format(txt)
          m = txt.match(REGEXP)
          return txt if m.nil?

          contents = m[1].split("\n")

          file_name = contents.shift

          content_str = contents.map { |l| wrapped_line(l) }.join('<br>')
          html = wrapped_content(content_str, file_name)

          txt.gsub(REGEXP, html)
        end

        private

        def wrapped_line(txt)
          %Q(<span class="shell__code-line">#{h(txt)}</span>)
        end

        def wrapped_content(content, file_name)
          has_file_name = !file_name.gsub(/\s/, '').empty?

          html = <<~HTML
            <div class="shell mdc-elevation--z2">
            #{%Q(<span class="shell__file">#{file_name}</span>) if has_file_name}
            <pre class="shell__container">
            <code class="shell__code">
            #{content}
            </code>
            </pre>
            </div>
          HTML

          html.gsub("\n", '')
        end
      end
    end
  end
end
