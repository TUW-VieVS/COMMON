# VieVS COMMON

includes some common files used by various different packages of VieVS 

# How to use it in MATLAB?

add the folder to your path:

    addpath(genpath('insert_path_to_common'))

assuming  `insert_path_to_common` is the path from your working directory to the COMMON directory.

It is sufficient to add this line of code at the start of your program. 

## Example 


If your current directory is in `someFolder/MyProject/main.m` and common is stored in `someFolder/COMMON` then use:

    addpath(genpath('../COMMON'))
    