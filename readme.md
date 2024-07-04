## Manual:

1. Clone repo
2. You can checkt the the execution policy via `Get-ExecutionPolicy` and set it to unrestricted via `Set-ExecutionPolicy Unrestricted` -> Reset it to whatever it was or `Set-ExecutionPolicy Restricted`
3. Read \*.ps1! -> change paths if needed
4. Execute \*.ps1 as admin from the repo base
5. After script you have a tasks.json and c_cpp_properties.json in your .vscode folder, the .vscode_base folder is gone
6. Unfortunately someone has to implement dynamic reference to the file that needs to be compiled, default is "main.cpp" -> Dont rename
7. Change bot paths in tasks.json line 10 to the file you want to compile e.g C:/gtk_install/main.cpp
8. Run Task via command pallete `(Shift+Ctrl+P or Type '>' in Search)` -> `Tasks: Run Task` -> `Build GTK Application`
9. If you run into errors check the path in the tasks.json, it should point to the exe you want to compile
10. You should have an .exe now

#ToDo:
- Automatic C++ Extension Installation
- launch.json for Debugging and running