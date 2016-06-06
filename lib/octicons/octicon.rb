module Octicons
  class Octicon

    def initialize(options)
      @options = options
      if symbol = Octicons::OCTICON_SYMBOLS[@options[:symbol]]
        @path = symbol[:path]
        @width = symbol[:width]
        @height = symbol[:height]
        @html_options = @options.reject { |d| [:symbol, :tag, :size].include? d }

        css_class
        compute_size
        accessible
      else
        raise "Couldn't find octicon symbol for #{options[:symbol].inspect}"
      end
    end

    def to_svg
      "<svg #{html_attrs}>#{@path}</svg>"
    end

    private

    def html_attrs
      attrs = ""
      @html_options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end

    # add some accessibility features to svg
    def accessible
      @html_options[:version] = "1.1"

      if @html_options[:'aria-label'].nil?
        @html_options[:'aria-hidden'] = "true"
      else
        @html_options[:role] = "img"
      end
    end

    # prepare the octicon class
    def css_class
      @html_options[:class] = "octicon octicon-#{@options[:symbol]} #{@options[:class]} ".strip
    end

    # determine the height and width of the octicon based on :size option
    def compute_size

      @html_options[:viewBox] = "0 0 #{@width} #{@height}"

      if !@options[:width].nil? && !@options[:height].nil?
        @html_options[:width] = @options[:width]
        @html_options[:height] = @options[:height]

      elsif @options[:size] == "large"
        @html_options[:width] = 2 * @width
        @html_options[:height] = 2 * @height

      elsif @options[:size].is_a? Integer
        @html_options[:width] = (@options[:size] * @width) / @height
        @html_options[:height] = @options[:size]

      else
        @html_options[:width] = @width
        @html_options[:height] = @height

      end
    end
  end
end
