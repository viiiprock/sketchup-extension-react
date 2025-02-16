require "rake/testtask"
require "zip"
require "json"
require "rubocop/rake_task"

Rake::TestTask.new do |t|
  t.libs << "src/rb/tests"
  t.test_files = FileList["src/rb/tests/test_*.rb"]
  t.verbose = true
end

RuboCop::RakeTask.new

task default: :test

desc "Run all tests (Ruby and Frontend)"
task test_all: %i[test test_frontend]

desc "Run frontend tests"
task :test_frontend do
  sh "yarn test"
end

# desc "Build frontend assets"
# task :build_frontend do
#   sh "yarn build"
# end

# desc "Build extension package"
# task build: %i[test_all build_frontend] do
#   package_json = JSON.parse(File.read("package.json"))
#   version = package_json["version"]
#   extension_name = "my_extension_#{version}.rbz"

#   File.delete(extension_name) if File.exist?(extension_name)

#   Zip::File.open(extension_name, create: true) do |zipfile|
#     Dir
#       .glob("src/ruby/**/*.rb")
#       .each { |file| zipfile.add(file.sub("src/", ""), file) }

#     Dir
#       .glob("dist/**/*")
#       .each do |file|
#         next if File.directory?(file)

#         zipfile.add(file, file)
#       end

#     zipfile.add("my_extension.rb", "my_extension.rb")
#   end

#   puts "Extension package created: #{extension_name}"
# end
