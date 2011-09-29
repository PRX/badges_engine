class BadgesEngine::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  desc "Copy the default configuration file to config/initializers/badges_engine.rb"
  def copy_initializer_file
    copy_file "initializer.rb", "config/initializers/badges_engine.rb"
  end
  
  desc "Add the mount for the engine routes"
  def mount_routes
    route("mount BadgesEngine::Engine => '/badges', :as => 'badges'")
  end

end
