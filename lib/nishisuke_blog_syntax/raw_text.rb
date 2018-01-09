module NishisukeBlogSyntax
  class RawText
    def initialize(text)
      @text = text
    end

    private

    attr_reader :text
  end
end
