require "octicons/version"
require "octicons/octicon"
require "nokogiri"
require "json"

module Octicons
  OCTICONS_SVG_PATH = File.join(File.dirname(__FILE__), "svg/*.svg")

  KEYWORDS = JSON.parse(File.read(File.join(File.dirname(__FILE__), "keywords.json")))
  CODEPOINTS = JSON.parse(File.read(File.join(File.dirname(__FILE__), "codepoints.json")))

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
