require 'crass'
require './modules/loader.rb'
require './modules/agents.rb'
require 'pry'

file = File.read('/home/chris/Documents/Projects/Personal/stylistic/dist/css/stylistic.css')
css = Crass.parse(file)

CSS2SUPPORTED = %w(azimuth background-attachment background-color background-image background-position background-repeat background border-collapse border-color border-spacing border-style border-top border-right border-bottom border-left border-top-color border-right-color border-bottom-color border-left-color border-top-style border-right-style border-bottom-style border-left-style border-width border bottom box-sizing caption-side clear clip color content counter-increment counter-reset cue-after cue-before cue cursor direction display elevation empty-cells float font-family font-size font-style font-weight font-variant font height left letter-spacing line-height list-style-image list-style-type list-style margin-right margin-left margin-top margin-bottom margin max-height max-width min-height min-width orphans outline-color outline-style outline-width outline overflow padding-top padding-right padding-bottom padding-left padding page-break-after page-break-before page-break-inside pause-after pause-before pause pitch-range pitch play-during position quotes richness right speak-header speak-numeral speak-punctuation speak speech-rate stress table-layout text-align text-decoration text-indent text-transform top unicode-bidi vertical-align visibility voice-family volume white-space widows width word-spacing z-index)

properties = []

css.each do |node|
  if node[:children]
    node[:children].each do |child|
      if child[:node] == :property
        properties.push(child[:name])
      end
    end
  end
end

# Remove duplicates and all CSS 2 supported properties
properties = properties.uniq - CSS2SUPPORTED

# Remove all browser prefixed properties
properties.each do |property|
  if /((?<!\w)\-[a-z-]+)/.match(property)
    properties = properties - [property]
  end
end

binding.pry
