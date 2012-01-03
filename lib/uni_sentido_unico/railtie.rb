require 'rails'

module UniSentidoUnico
  class Railtie < ::Rails::Railtie #:nodoc:
    config.after_initialize do
      Uni::Application.config.uni_broker.register(UniSentidoUnico::UniPlugin.new)
    end
    
    rake_tasks do
      load "tasks/uni_sentido_unico.rake"
    end
  end
end