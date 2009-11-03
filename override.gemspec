Gem::Specification.new do |s|
  s.name                = 'override'
  s.version             = '0.5.0'
  s.summary             = "Ruby lib that allows using 'super' in methods of reopened classes."
  s.description         = "Provides a simple and elegant alternative to alias_method_chain for redifining methods, while keeping access to the previous defenition."
  s.author              = "Martin Aumont"
  s.email               = 'mynyml@gmail.com'
  s.homepage            = 'http://github.com/mynyml/override'
  s.rubyforge_project   = "override"
  s.has_rdoc            =  true
  s.require_path        = "lib"
  s.files               =  File.read("Manifest").strip.split("\n")

  s.add_development_dependency 'context'
  s.add_development_dependency 'matchy'
end
