require "minitest/autorun"
require "minitest/pride"

# Mock Sketchup API
module UI
  class HtmlDialog
    STYLE_DIALOG = 0
    attr_reader :options, :dialog_title, :url, :file_path
    attr_accessor :callbacks

    def initialize(options)
      @options = options
      @dialog_title = options[:dialog_title]
      @callbacks = {}
    end

    def set_url(url)
      @url = url
    end

    def set_file(path)
      @file_path = path
    end

    def add_action_callback(name, &block)
      @callbacks[name] = block
    end

    def show
      true
    end
  end

  def self.messagebox(message)
    message
  end

  def self.menu(name)
    Menu.new(name)
  end

  class Menu
    def initialize(name)
      @name = name
      @items = []
    end

    def add_item(name, &block)
      @items << [name, block]
    end
  end
end

module Sketchup
  def self.register_extension(_extension, _load_now: false)
    true
  end

  def self.debug?
    false
  end

  def self.version
    "21"
  end
end

# Helper method for extension loading
def file_loaded(_filename)
  true
end

def file_loaded?(_filename)
  false
end
