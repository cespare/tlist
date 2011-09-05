# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "tlist"
  s.version     = 0.0.1
  s.authors     = ["Caleb Spare"]
  s.email       = ["cespare@gmail.com"]
  s.homepage    = ""
  s.summary     = "A simple todo-list"
  s.description = "tlist is a small todo-list manager with labels for tasks and a highly efficient workflow."

  s.rubyforge_project = "tlist"

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_dependency "trollop"
end
