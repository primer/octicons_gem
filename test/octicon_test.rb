require 'minitest/autorun'
require 'octicons'

class OcticonTest < Minitest::Test
  def test_octicons_loaded
    assert_operator 0, :<, Octicons::OCTICON_SYMBOLS.length
  end
end
