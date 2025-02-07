require 'rake/testtask'
require 'zip'
require 'json'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.libs << 'src/ruby/tests'
  t.test_files = FileList['src/ruby/tests/test_*.rb']
  t.verbose = true
end

RuboCop::RakeTask.new

desc 'Run all tests (Ruby and Frontend)'
task :test_all => [:test, :test_frontend]

desc 'Run frontend tests'
task :test_frontend do
  sh 'yarn test'
end

desc 'Build extension package'
task :build => [:test_all, :build_frontend] do
  package_json = JSON.parse(File.read('package.json'))
  version = package_json['version']
  extension_name = "my_extension_#{version}.rbz"

  File.delete(extension_name) if File.exist?(extension_name)

  Zip::File.open(extension_name, create: true) do |zipfile|
    Dir.glob('src/ruby/**/*.rb').each do |file|
      zipfile.add(file.sub('src/', ''), file)
    end

    Dir.glob('dist/**/*').each do |file|
      next if File.directory?(file)

      zipfile.add(file, file)
    end

    zipfile.add('my_extension.rb', 'my_extension.rb')
  end
  
  puts "Extension package created: #{extension_name}"
end

desc 'Build frontend assets'
task :build_frontend do
  sh 'yarn build'
end
