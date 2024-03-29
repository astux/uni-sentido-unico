require 'rails'

module UniSentidoUnico
  class Railtie < ::Rails::Railtie #:nodoc:
    config.after_initialize do
      Uni::Application.config.uni_broker.register(UniSentidoUnico::UniPlugin.new)
    end
    
    rake_tasks do
      load "tasks/uni_sentido_unico.rake"
    end

    initializer "UniSentidoUnico.asset_pipeline" do |app|
      app.config.assets.precompile << 'uni_sentido_unico/uni_sentido_unico.css'
    end

    config.to_prepare do
      CurriculumStudent.class_eval do
        has_many :payments
      end
    end
  end
end
