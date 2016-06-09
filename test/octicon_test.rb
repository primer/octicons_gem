require_relative "./helper"

describe Octicons::Octicon do
  it "fails when the octicon doesn't exist" do
    assert_raises(RuntimeError) do
      octicon(:symbol => "octicon")
    end
  end

  describe "viewBox" do
    it "always has a viewBox" do
      icon = octicon(:symbol => "x")
      assert_includes icon.to_svg, "viewBox=\"0 0 12 16\""
    end
  end

  describe "html_attributes" do
    it "includes other html attributes" do
      icon = octicon(:symbol => "x", :foo => "bar", :disabled => "true")
      assert_includes icon.to_svg, "disabled=\"true\""
      assert_includes icon.to_svg, "foo=\"bar\""
    end
  end

  describe "classes" do
    it "includes classes passed in" do
      icon = octicon(:symbol => "x", :class => "text-closed")
      assert_includes icon.to_svg, "class=\"octicon octicon-x text-closed\""
    end
  end

  describe "size" do
    it "always has width and height" do
      icon = octicon(:symbol => "x")
      assert_includes icon.to_svg, "height=\"16\""
      assert_includes icon.to_svg, "width=\"12\""
    end

    it "correctly using the word large" do
      icon = octicon(:symbol => "x", :size => "large")
      assert_includes icon.to_svg, "height=\"32\""
    end

    it "calculated with Integer" do
      icon = octicon(:symbol => "x", :size => 60)
      assert_includes icon.to_svg, "height=\"60\""
      assert_includes icon.to_svg, "width=\"45\""
    end

    it "converts number string size to integer" do
      icon = octicon(:symbol => "x", :size => "60")
      assert_includes icon.to_svg, "height=\"60\""
      assert_includes icon.to_svg, "width=\"45\""
    end

    it "converts number string height to integer" do
      icon = octicon(:symbol => "x", :height => "60")
      assert_includes icon.to_svg, "height=\"60\""
      assert_includes icon.to_svg, "width=\"45\""
    end

    it "converts number height to integer" do
      icon = octicon(:symbol => "x", :height => 60)
      assert_includes icon.to_svg, "height=\"60\""
      assert_includes icon.to_svg, "width=\"45\""
    end

    it "converts number string width to integer" do
      icon = octicon(:symbol => "x", :width => "45")
      assert_includes icon.to_svg, "height=\"60\""
      assert_includes icon.to_svg, "width=\"45\""
    end

    it "converts number width to integer" do
      icon = octicon(:symbol => "x", :width => 45)
      assert_includes icon.to_svg, "height=\"60\""
      assert_includes icon.to_svg, "width=\"45\""
    end

    it "with height and width passed in" do
      icon = octicon(:symbol => "x", :width => 60, :height => 60)
      assert_includes icon.to_svg, "width=\"60\""
      assert_includes icon.to_svg, "height=\"60\""
    end
  end

  describe "a11y" do
    it "includes attributes" do
      icon = octicon(:symbol => "x", :'aria-label' => "Close")
      assert_includes icon.to_svg, "role=\"img\""
      assert_includes icon.to_svg, "aria-label=\"Close\""
    end

    it "has aria-hidden when no label is passed in" do
      icon = octicon(:symbol => "x")
      assert_includes icon.to_svg, "aria-hidden=\"true\""
    end
  end
end
