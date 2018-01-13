require_relative 'test_helper'

class NishisukeBlogSyntaxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NishisukeBlogSyntax::VERSION
  end

  def test_it_converts_src
    txt = %Q(hoge\nSRC```hoge.rb\ndef hoge\n  p '<p>tarou</p>'\nend\nSRC```\noshi.\n)
    html = NishisukeBlogSyntax.convert_html(txt)
    assert_equal <<~EXPECTED, html
      hoge
      <div class="shell mdc-elevation--z2"><span class="shell__file">hoge.rb</span><pre class="shell__container"><code class="shell__code"><span class="shell__code-line">def hoge</span><br><span class="shell__code-line">  p &#39;&lt;p&gt;tarou&lt;/p&gt;&#39;</span><br><span class="shell__code-line">end</span></code></pre></div>
      oshi.
    EXPECTED
  end

  def test_it_converts_shell
    txt = %Q(hoge\nSHELL```\nin: echo "zukudan"\nout: "zukudan"\nSHELL```\noshi.\n)
    html = NishisukeBlogSyntax.convert_html(txt)
    assert_equal <<~EXPECTED, html
      hoge
      <div class="shell mdc-elevation--z2"><pre class="shell__container"><span class="shell__std"><kbd class="shell__input">echo &quot;zukudan&quot;</kbd><br><samp class="shell__output">&quot;zukudan&quot;</samp></span></pre></div>
      oshi.
    EXPECTED
  end

  def test_it_converts_paragraph
    txt = %Q(hogehoge\n>>>hoaaa\nfasdk\nfasdk\n<<<\nhoge\n)
    html = NishisukeBlogSyntax.convert_html(txt)
    assert_equal <<~EXPECTED, html
      hogehoge
      <p>hoaaa<br>fasdk<br>fasdk</p>
      hoge
    EXPECTED
  end
end
