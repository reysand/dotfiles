#!/bin/bash
rm -rf html
/Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=On --build /Users/fhelena/Projects/ft_ls
echo "==================="
make
echo "==================="
pvs-studio-analyzer credentials a97k572@gmail.com JHAG-59AK-1Q7G-YF07
echo "==================="
pvs-studio-analyzer analyze -l ~/.config/PVS-Studio/PVS-Studio.lic --incremental -e libft
echo "==================="
plog-converter -a GA:1,2 -t fullhtml -o html PVS-Studio.log
