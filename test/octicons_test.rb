require_relative "./helper"

describe Octicons do
  it "loads all icons on initialization" do
    refute_equal 0, Octicons::OCTICON_SYMBOLS.length
  end
end
