Gem::Specification.new do |s|
  s.name        = 'jekyll_image_encode'
  s.version     = '0.0.3'
  s.date        = '2014-09-24'
  s.summary     = "Jekyll Image Encode"
  s.description = "Jekyll tag that renders base64 codes of images fetched from the web"
  s.add_runtime_dependency "mimemagic", [">= 0.2.0"]
  s.authors     = ["GSI"]
  s.email       = 'rubygems.org@groovy-skills.com'
  s.files       = Dir.glob('lib/**/*') # `git ls-files`.split($/)
  s.homepage    = 'https://github.com/GSI/' + s.name
  s.license     = 'MIT'
end
