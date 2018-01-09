require_relative 'test_helper'

class NishisukeBlogSyntaxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NishisukeBlogSyntax::VERSION
  end

  def test_it_return_html
    txt = %Q(hogetarou\nSRC```hoge.rb\ndef hoge\n  p 'tarou'\nend\nSRC```\noshimaikeru.)
    html = NishisukeBlogSyntax.convert_html(txt)
    assert html
  end
end
