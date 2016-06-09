require_relative "./helper"

describe Octicons do
  it "loads all icons on initialization" do
    refute_equal 0, Octicons::OCTICON_SYMBOLS.length
    assert_equal Dir[Octicons::OCTICONS_SVG_PATH].length, Octicons::OCTICON_SYMBOLS.length
  end
end
