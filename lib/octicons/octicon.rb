module Octicons
  class Octicon

    attr_reader :path, :html_options, :width, :height, :symbol

    def initialize(symbol, options = {})
      @symbol = symbol.to_s
      if octicon = Octicons::OCTICON_SYMBOLS[@symbol]

        @options = options
        @path = octicon[:path]
        @width = octicon[:width]
        @height = octicon[:height]

        # create html_options from options, except for a few
        @html_options = @options.reject { |d| [:size].include? d }
        @html_options.merge!({
          :class   => classes,
          :viewBox => viewbox,
          :version => "1.1"
        })
        @html_options.merge!(size)
        @html_options.merge!(a11y)
      else
        raise "Couldn't find octicon symbol for #{@symbol.inspect}"
      end
    end

    def to_svg
      "<svg #{html_attributes}>#{@path}</svg>"
    end

    private

    def html_attributes
      attrs = ""
      @html_options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end

    # add some accessibility features to svg
    def a11y
      accessible = {}

      if @options[:'aria-label'].nil?
        accessible[:'aria-hidden'] = "true"
      else
        accessible[:role] = "img"
      end

      accessible
    end

    # prepare the octicon class
    def classes
      "octicon octicon-#{@symbol} #{@options[:class]} ".strip
    end

    def viewbox
      "0 0 #{@width} #{@height}"
    end

    # determine the height and width of the octicon based on :size option
    def size
      size = {
        :width => @width,
        :height => @height
      }

      # When size is "large"
      if @options[:size] == "large"
        size[:width] = 2 * @width
        size[:height] = 2 * @height

      # When size is an integer
      elsif @options[:size].is_a?(Integer) || !!(@options[:size] =~ /\A[0-9]+\z/)
        size[:width]  = calculate_width(@options[:size])
        size[:height] = @options[:size]

        # Specific size
      elsif !@options[:width].nil? || !@options[:height].nil?
        size[:width]  = @options[:width].nil?  ? calculate_width(@options[:height]) : @options[:width]
        size[:height] = @options[:height].nil? ? calculate_height(@options[:width]) : @options[:height]
      end

      size
    end

    def calculate_width(height)
      (height.to_i * @width) / @height
    end

    def calculate_height(width)
      (width.to_i * @height) / @width
    end
  end
end
