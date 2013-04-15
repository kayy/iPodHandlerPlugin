#!/bin/bash
# set -vx

my_unity_dir=/Users/kay/Development/dev381/rrrunner/trunk/rrrunner/Assets/Plugins/iOS
my_project_dir=/Users/kay/Development/git/iPodHandlerPlugin
my_lib_file=libiPodHandlerPlugin

my_source_debug=$my_project_dir/DerivedData/build/Products/Debug-iphoneos/${my_lib_file}.a
my_source_release=$my_project_dir/DerivedData/build/Products/Release-iphoneos/${my_lib_file}.a

if [ -f $my_source_debug ]; then 
    # echo debug
	cp -p $my_source_debug $my_project_dir/${my_lib_file}Debug.a
	cp -p $my_project_dir/${my_lib_file}Debug.a ${my_unity_dir}/${my_lib_file}Debug.a
	fi
if [ -f $my_source_release ]; then 
    # echo release
	cp -p $my_source_release $my_project_dir/${my_lib_file}Release.a
	cp -p $my_project_dir/${my_lib_file}Release.a ${my_unity_dir}/${my_lib_file}Release.a
fi
