require_relative "./helper"

describe Octicons do

  def setup
    @icons_total = Dir[Octicons::OCTICONS_SVG_PATH].length
  end

  it "loads all icons on initialization" do
    refute_equal 0, Octicons::OCTICON_SYMBOLS.length
    assert_equal @icons_total, Octicons::OCTICON_SYMBOLS.length
  end

  it "loads all keywords" do
    refute_equal 0, Octicons::KEYWORDS.length
    assert_equal @icons_total, Octicons::KEYWORDS.length
  end

  it "loads all codepoints" do
    refute_equal 0, Octicons::CODEPOINTS.length
    assert_equal @icons_total, Octicons::CODEPOINTS.length
  end
end
