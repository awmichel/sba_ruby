require ::File.expand_path('../client/connection', __FILE__)
require ::File.expand_path('../client/request', __FILE__)
require ::File.expand_path('../client/loans.rb', __FILE__)
require ::File.expand_path('../client/licenses.rb', __FILE__)
require ::File.expand_path('../client/sites.rb', __FILE__)
require ::File.expand_path('../client/urls.rb', __FILE__)

module SBA
  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options={})
      options = SBA.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include SBA::Client::Connection
    include SBA::Client::Request
    include SBA::Client::Urls
    include SBA::Client::Loans
    include SBA::Client::Licenses
    include SBA::Client::Sites  
    
    
              
  end
end
