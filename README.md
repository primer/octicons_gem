# Octicons gem

[![Gem version](https://img.shields.io/gem/v/octicons.svg)](https://rubygems.org/gems/octicons)
[![Build Status](https://travis-ci.org/primer/octicons_gem.svg?branch=master)](https://travis-ci.org/primer/octicons_gem)

> Octicons gem to distribute octicons svg

## Install

Add this to your `Gemfile`

```rb
gem 'octicons'
```

Then `bundle install`.

## Usage

```rb
require 'octicons'
icon = Octicons::Octicon.new( :symbol => "x" )
icon.to_svg
# <svg class="octicon octicon-x" viewBox="0 0 16 16" width="16" height="16" version="1.1" "aria-hidden"="true"><path d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"></path></svg>
```

## Documentation



## License

_Code License:_ [MIT](./LICENSE) &copy; [GitHub](https://github.com/)

_Font License:_ [SIL OFL 1.1](./LICENSE) &copy; [GitHub](https://github.com/)

[octicons]: https://github.com/primer/octicons
[octicons-docs]: https://octicons.github.com/
