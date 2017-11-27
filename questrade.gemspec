Gem::Specification.new do |s|
    s.name        = 'questrade_api'
    s.version     = '0.0.1'
    s.date        = '2017-11-27'
    s.summary     = "Ruby library for the Questrade API"
    s.description = "Questrade API Wrapper"
    s.authors     = ["Vaibhav Khaitan"]
    s.email       = 'vkhaitan@uwaterloo.ca'
    s.files       = ["lib/questrade.rb"]
    s.require_paths = ['lib']
    s.homepage    =
      'http://vkhaitan.com'
    s.license       = 'MIT'
    
    s.required_ruby_version  = '>= 2.0.0'
    s.add_development_dependency 'bundler', '~> 1.11'
    s.add_development_dependency 'rake'
    s.add_development_dependency 'rspec', '~> 3.0'
    s.add_development_dependency 'webmock', '~> 1.21.0'
  
end