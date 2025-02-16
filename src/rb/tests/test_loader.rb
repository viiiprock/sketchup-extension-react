require "minitest/autorun"
require "minitest/mock"
require_relative "test_helper"
require_relative "../dialog_helper"
require_relative "../loader"

class TestLoader < Minitest::Test
  def setup
    @mock_dialog = Minitest::Mock.new
    @dialog_width = 400
    @dialog_height = 600
    @dialog_title = "My Extension Dialog"
  end

  def test_show_dialog_creates_and_shows_dialog
    # Mock the dialog creation
    @mock_dialog.expect(:add_action_callback, nil, ["callRubyMethod"])
    @mock_dialog.expect(:show, nil)

    # Mock DialogHelper
    MyExtension::DialogHelper.stub :create_dialog, @mock_dialog do
      MyExtension::Main.show_dialog
      @mock_dialog.verify
    end
  end

  def test_menu_item_creation
    mock_menu = Minitest::Mock.new
    mock_menu.expect(:add_item, nil, ["My Extension"])

    # Mock UI.menu
    UI.stub :menu, mock_menu do
      # Reload the module to trigger the menu creation code
      load File.join(__dir__, "..", "loader.rb")
      mock_menu.verify
    end
  end
end
