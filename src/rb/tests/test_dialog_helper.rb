require "minitest/autorun"
require "minitest/mock"
require_relative "test_helper"
require_relative "../dialog_helper"

class TestDialogHelper < Minitest::Test
  def setup
    @title = "Test Dialog"
    @width = 800
    @height = 600

    # Create a mock dialog
    @mock_dialog = Minitest::Mock.new
  end

  def test_create_dialog
    dialog_params = {
      dialog_title: @title,
      preferences_key: "com.example.myextension",
      resizable: true,
      width: @width,
      height: @height,
      min_width: 50,
      min_height: 50,
      style: UI::HtmlDialog::STYLE_DIALOG
    }

    @mock_dialog.expect(:set_file, nil, [String])
    @mock_dialog.expect(:==, true, [@mock_dialog])

    File.stub :exist?, true do
      UI::HtmlDialog.stub :new, @mock_dialog, [dialog_params] do
        dialog = MyExtension::DialogHelper.create_dialog(@title, @width, @height)
        assert_equal @mock_dialog, dialog
        @mock_dialog.verify
      end
    end
  end

  def test_returns_nil_when_html_file_missing
    File.stub :exist?, false do
      dialog = MyExtension::DialogHelper.create_dialog(@title, @width, @height)
      assert_nil dialog
    end
  end
end
