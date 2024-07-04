## Manual:

1. Clone repo
2. Read \*.ps1! -> change paths if needed
3. Execute \*.ps1 as admin from the repo base
4. After script you have a tasks.json and c_cpp_properties.json in your .vscode folder, the .vscode_base folder is gone
5. Unfortunately someone has to implement dynamic reference to the file that needs to be compiled, default is "main.cpp" -> Dont rename
6. Change bot paths in tasks.json line 10 to the file you want to compile e.g C:/gtk_install/main.cpp
7. Run Task via command pallete `(Shift+Ctrl+P or Type '>' in Search)` -> `Tasks: Run Task` -> `Build GTK Application`
8. If you run into errors check the path in the tasks.json, it should point to the exe you want to compile
9. You should have an .exe now
