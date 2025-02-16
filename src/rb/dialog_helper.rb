module MyExtension
  module DialogHelper
    def self.create_dialog(title, width, height)
      dialog =
        UI::HtmlDialog.new(
          dialog_title: title,
          preferences_key: "com.example.myextension",
          resizable: true,
          width: width,
          height: height,
          min_width: 50,
          min_height: 50,
          style: UI::HtmlDialog::STYLE_DIALOG
        )

      html_path = File.join(__dir__, "..", "..", "dist", "index.html")

      unless File.exist?(html_path)
        UI.messagebox("HTML file not found. Please build the frontend first.")
        return nil
      end

      dialog.set_file(html_path)
      dialog
    end
  end
end
