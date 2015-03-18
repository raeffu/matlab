require 'rake'
require 'erb'

task :default => :copy

desc "copy html folder to gh-pages branch, commit and push"
task :copy do
  if File.exist?("html/")
    system %Q{gco master}
    system %Q{cp -rf html ../matlab-html/}
    system %Q{rm -rf html}
    Dir.chdir("../matlab-html/")
    system %Q{gco gh-pages}
    system %Q{git add -A}
    system %Q{git commit -m "update html"}
    system %Q{git push}
  else
    puts "no html dir"
  end
end
