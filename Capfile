load 'deploy' if respond_to?(:namespace) # cap2 differentiator
load 'deploy/assets'

require 'bundler/capistrano'

Dir['lib/capistrano/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks