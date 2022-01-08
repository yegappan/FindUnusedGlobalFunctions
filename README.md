# FindUnusedGlobalFunctions

Bash shell script to find global functions in C files that can be converted to
file-local static functions (used only locally within the file).

Relies on universal or exuberant ctags (https://github.com/universal-ctags/ctags) to get the list of functions with scope.

Usage:

    find_unused_global_functions.sh <C filename(s)>

Assumes that all the relevant source files are in a single directory.
