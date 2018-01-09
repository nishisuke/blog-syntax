require_relative 'test_helper'

class NishisukeBlogSyntaxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NishisukeBlogSyntax::VERSION
  end

  def test_it_converts_src
    txt = %Q(hoge\nSRC```hoge.rb\ndef hoge\n  p 'tarou'\nend\nSRC```\noshi.\n)
    html = NishisukeBlogSyntax.convert_html(txt)
    assert_equal <<~EXPECTED, html
      hoge
      <div class="shell mdc-elevation--z2"><span class="shell__file">hoge.rb</span><pre class="shell__container"><code class="shell__code"><span class="shell__code-line">def hoge</span><br><span class="shell__code-line">  p 'tarou'</span><br><span class="shell__code-line">end</span></code></pre></div>
      oshi.
    EXPECTED
  end
end
