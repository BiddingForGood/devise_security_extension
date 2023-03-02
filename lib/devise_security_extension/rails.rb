module DeviseSecurityExtension
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_controller) do
      include DeviseSecurityExtension::Controllers::Helpers
    end
    
    if Rails.version >= "5.2"
      config.to_prepare do
        DeviseSecurityExtension::Patches.apply
      end
    else
      ActiveSupport::Reloader.to_prepare do
      DeviseSecurityExtension::Patches.apply
  end
end
  end
end
