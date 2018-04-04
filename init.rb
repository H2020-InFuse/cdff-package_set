
require 'autoproj/git_server_configuration'
if !Autoproj.has_source_handler? 'github'
    Autoproj.git_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')
end

if !Autoproj.has_source_handler? 'spaceapp'
    Autoproj.git_server_configuration('SPACEAPP', 'gitlab.spaceapplications.com', :fallback_to_http => false, default: 'ssh,ssh', disabled_methods: 'http,git')
end


configuration_option('CDFF_EXTERNAL_SOURCE_INSTALL', 'string',
    :default => 'all',
    :possible_values => ['all', 'required', 'none'],
    :doc => [
        "Which packages should be installed from source?",
        "'all' will install all external packages from source",
        "'required' will only install some packages from source (needed based on ubuntu 16.04)",
        "'none' will not install source dependencies (they can be installed manually using 'amake cdff/external/PACKAGE')"])



