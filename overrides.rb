Autoproj.add_osdeps_overrides 'boost', :package => 'cdff/external/boost', :force => true
Autoproj.add_osdeps_overrides 'opencv', :package => 'cdff/external/opencv', :force => true
#Autoproj.add_osdeps_overrides 'cmake', :package => 'cdff/external/cmake', :force => true
Autoproj.add_osdeps_overrides 'eigen3', :package => 'cdff/external/eigen', :force => true
#Autoproj.add_osdeps_overrides 'flann', :package => 'cdff/external/flann', :force => true
#Autoproj.add_osdeps_overrides 'qhull', :package => 'cdff/external/qhull', :force => true
#Autoproj.add_osdeps_overrides 'external/tinyxml', :package => 'cdff/external/tinyxml2', :force => true
#Autoproj.add_osdeps_overrides 'yaml-cpp', :package => 'cdff/external/yaml-cpp', :force => true
#Autoproj.add_osdeps_overrides 'vtk', :package => 'cdff/external/vtk', :force => true
Autoproj.add_osdeps_overrides 'slam/pcl', :package => 'cdff/external/pcl', :force => true

#Autobuild::Package['cdff/CDFF'].define "CMAKE_C_COMPILER", "gcc-6"
#Autobuild::Package['cdff/CDFF'].define "CMAKE_CXX_COMPILER", "g++-6"

