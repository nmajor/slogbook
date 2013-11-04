def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    sudo "apt-get -y update"
    sudo "apt-get -y install python-software-properties"
  end

  desc "Symlink uploads folder"
  task :sym_uploads do
    run "rm -rf #{current_path}/public/uploads"
    run "ln -s #{shared_path}/uploads #{current_path}/public/"  
  end

  after "deploy", "deploy:sym_uploads"
end
