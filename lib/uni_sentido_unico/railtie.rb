require 'rails'

module UniSentidoUnico
  class Railtie < ::Rails::Railtie #:nodoc:
    config.after_initialize do
      Uni::Application.config.uni_broker.register(UniSentidoUnico::UniPlugin.new)
    end

    config.to_prepare do
      CurriculumStudent.class_eval do
        has_many :payments
      end
    end
  end
end
