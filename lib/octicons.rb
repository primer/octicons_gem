require "octicons/version"
require "octicons/octicon"
require "nokogiri"

module Octicons
  OCTICONS_SVG_PATH = File.join(File.dirname(__FILE__), "svg/*.svg")

  OCTICON_SYMBOLS = {}
  Dir[OCTICONS_SVG_PATH].each do |svg_path|
    id = File.basename(svg_path, ".svg")
    svg = Nokogiri::XML(File.read(svg_path))
    OCTICON_SYMBOLS[id] = {
      :path => "<path d=\"#{svg.css("path").first["d"]}\"></path>",
      :height => svg.css("svg").first["height"].to_i,
      :width => svg.css("svg").first["width"].to_i
    }
  end
end
