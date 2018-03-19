
require 'autoproj/git_server_configuration'
if !Autoproj.has_source_handler? 'github'
    Autoproj.git_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')
end

if !Autoproj.has_source_handler? 'spaceapp'
    Autoproj.git_server_configuration('SPACEAPP', 'gitlab.spaceapplications.com', :fallback_to_http => false, default: 'ssh,ssh', disabled_methods: 'http,git')
end


