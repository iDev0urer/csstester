require 'json'
require 'open-uri'
require 'pry'

module CSSTest
  class Loader

    def initialize
      @json_uri = 'https://raw.githubusercontent.com/Fyrd/caniuse/master/data.json'
    end

    def load_data
      return JSON.parse open(@json_uri).read
    end

  end
end
