require 'sketchup'

module MyExtension
  module Main
    def self.show_dialog
      dialog = DialogHelper.create_dialog('My Extension Dialog', 400, 600)

      return unless dialog # Handle case where frontend isn't built

      dialog.add_action_callback('callRubyMethod') do
        response = 'Hello from Ruby!'
        UI.messagebox(response)
      end

      dialog.show
    end

    unless file_loaded?(__FILE__)
      menu = UI.menu('Plugins')
      menu.add_item('My Extension') { show_dialog }
      file_loaded(__FILE__)
    end
  end
end
