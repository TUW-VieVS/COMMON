# VieVS COMMON

includes some common files used by various different packages of VieVS 

# How to use it in MATLAB?

add the folder to your path:

    addpath(genpath(path_to_common))

assuming  `path_to_common` is the path from your working directory to the COMMON directory.

## Example 


If your current directory is in `someFolder/MyProject/main.m` and common is stored in `someFolder/COMMON` then use:

    addpath(genpath('../COMMON'))
    