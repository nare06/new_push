# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{ec2-54-254-216-93.ap-southeast-1.compute.amazonaws.com}
role :web, %w{ec2-54-254-216-93.ap-southeast-1.compute.amazonaws.com}
role :db,  %w{ec2-54-254-216-93.ap-southeast-1.compute.amazonaws.com}, :primary => true


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'ec2-54-254-216-93.ap-southeast-1.compute.amazonaws.com', user: 'ubuntu', roles: %w{web app db} #my_property: :my_value
#set :user, "ubuntu"
#server "ec2-54-254-216-93.ap-southeast-1.compute.amazonaws.com", :app, :web, :db, :primary => true
ssh_options[:keys] = ["~/.ec2/gsg-keypair"]
# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
