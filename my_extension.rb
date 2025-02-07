module MyExtension
  ROOT_PATH = File.dirname(__FILE__)
  FILE_NAMESPACE = File.basename(__FILE__, ".*")
  EXTENSION_NAME = "My Extension".freeze
  EXTENSION_DIR = File.join(ROOT_PATH, FILE_NAMESPACE)

  SU = 21
  if Sketchup.version.to_i < SU
    message = "This extension requires SketchUp #{SU} or newer."
    UI.messagebox(message)
    raise message
  end

  unless file_loaded?(__FILE__)
    EXTENSION =
      SketchupExtension.new(EXTENSION_NAME, "#{EXTENSION_DIR}/rb/loader")
    EXTENSION.version = "1.0.0"
    EXTENSION.creator = "Your Name"
    EXTENSION.copyright = "5D Plus © #{Time.new.year}"
    EXTENSION.description = "SketchUp extension with React frontend"
    Sketchup.register_extension(EXTENSION, true)

    file_loaded(__FILE__)
  end
end
