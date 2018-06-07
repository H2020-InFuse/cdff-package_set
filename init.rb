#this file is ruby code, evaluated before reading package_sets

#we use Python 3!
Autoproj.create_symlink('/usr/bin/python3', "#{ENV['AUTOPROJ_CURRENT_ROOT']}/install/bin/python")
Autoproj.create_symlink('/usr/bin/pip3', "#{ENV['AUTOPROJ_CURRENT_ROOT']}/install/bin/pip")

python_version = %x{python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'}[0..2]
Autobuild.env_add_path(
    'PYTHONPATH',
    '${AUTOPROJ_CURRENT_ROOT}/install/lib/python' + python_version + '/site-packages/'
)

#setup git server locations (gitlab/github) in case the buildconf does not include them
require 'autoproj/git_server_configuration'
if !Autoproj.has_source_handler? 'github'
    Autoproj.git_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')
end

if !Autoproj.has_source_handler? 'spaceapp'
    Autoproj.git_server_configuration('SPACEAPP', 'gitlab.spaceapplications.com', :fallback_to_http => false, default: 'ssh,ssh', disabled_methods: 'http,git')
end


#create a config value whether all code should be read from source
configuration_option('CDFF_EXTERNAL_SOURCE_INSTALL', 'string',
    :default => 'all',
    :possible_values => ['all', 'required', 'none'],
    :doc => [
                "Which packages should be installed from source?",
                "'all' will install all external packages from source",
                "'required' will only install some packages from source (needed based on ubuntu 16.04)",
                "'none' will not install source dependencies (they can be installed manually using 'amake cdff/external/PACKAGE')"
            ]
    )



