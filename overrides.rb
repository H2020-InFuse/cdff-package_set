#this file is ruby code, evaluated after reading package_sets
# it can be used to override specific settings 

# Override OS package manager packages with source installation

#dependent packages
if (Autoproj.user_config('CDFF_EXTERNAL_SOURCE_INSTALL') == 'all') then
#    Autoproj.add_osdeps_overrides 'cmake', :package => 'cdff/external/cmake', :force => true
    Autoproj.add_osdeps_overrides 'qhull', :package => 'cdff/external/qhull', :force => true
#    Autoproj.add_osdeps_overrides 'external/tinyxml', :package => 'cdff/external/tinyxml2', :force => true
    Autoproj.add_osdeps_overrides 'yaml-cpp', :package => 'cdff/external/yaml-cpp', :force => true
    Autoproj.add_osdeps_overrides 'flann', :package => 'cdff/external/flann', :force => true
    Autoproj.add_osdeps_overrides 'vtk', :package => 'cdff/external/vtk', :force => true    
    Autoproj.add_osdeps_overrides 'eigen3', :package => 'cdff/external/eigen', :force => true
    Autoproj.add_osdeps_overrides 'boost', :package => 'cdff/external/boost', :force => true
end

#required packages (newer versions than Ubuntu 16.04 needed), ubuntu 17.10 needs none
if (Autoproj.user_config('CDFF_EXTERNAL_SOURCE_INSTALL') == 'all') || (Autoproj.user_config('CDFF_EXTERNAL_SOURCE_INSTALL') == 'required') then
     Autoproj.add_osdeps_overrides 'opencv', :package => 'cdff/external/opencv', :force => true
     Autoproj.add_osdeps_overrides 'slam/pcl', :package => 'cdff/external/pcl', :force => true   
end

asn_compiler = "#{ENV['AUTOPROJ_CURRENT_ROOT']}/tools/asn1scc/asn1.exe"

Autobuild::Package['types/base'].define "ASN1_COMPILER", asn_compiler
Autobuild::Package['types/base'].depends_on "tools/asn1scc"
Autobuild::Package['types/sensor_samples'].define "ASN1_COMPILER", asn_compiler
Autobuild::Package['types/sensor_samples'].depends_on "tools/asn1scc"
Autobuild::Package['types/base_support'].define "ASN1_COMPILER", asn_compiler
Autobuild::Package['types/sensor_samples_support'].define "ASN1_COMPILER", asn_compiler
Autobuild::Package['types/fused'].define "ASN1_COMPILER", asn_compiler

# NOTE: workaround for missing dependency
Autobuild::Package['types/sensor_samples_support'].depends_on "types/sensor_samples"
Autobuild::Package['infuse/ASN_Viz'].define "ASN1_COMPILER", asn_compiler

Autobuild::Package['infuse/asn1_types'].define "ASN1_COMPILER", asn_compiler
Autobuild::Package['infuse/asn1_types'].depends_on "tools/asn1scc"

Autobuild::Package['base/types'].define "BINDINGS_RUBY", "OFF"
