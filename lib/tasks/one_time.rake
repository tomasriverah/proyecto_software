desc "populate roles"
task :populate_roles => :environment do
    Role.where(code: 'default').first_or_create.update(name: 'Default')
    Role.where(code: 'admin').first_or_create.update(name: 'Admin')
    Role.where(code: 'servicio').first_or_create.update(name: 'Servicio')
end 

desc "set default role"
task :default_roles => :environment do
    default = Role.where(code: 'default')
    admin = Role.where(code: 'admin')
    servicio = Role.where(code: 'servicio')

    User.update_all(role_id: default.ids)
end

desc "role tasks"
task :roles_all => [ :populate_roles, :default_roles] do
    puts "Finsihed Role Tasks"
end 
