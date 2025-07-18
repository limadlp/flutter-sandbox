# multi_modular_clean_arch_bloc

Multi Modular Clean Architect Bloc Project.

## How to create a module?

1 - create directory
--> mkdir core

2 - --> cd core

3 --> flutter create --template=package enter_module_name_here

========= OR ============

1 --> flutter create --template=package core/data

=========================
1 - dart pub add melos
2 - dart pub global activate melos
3 - export PATH="$PATH":"$HOME/.pub-cache/bin"
4 - dart pub outdated
5 - dart pub upgrade --major-versions
6 - export to ~/.bashrc
7 - melos init
8 - melos analyze
9 - melos bootstrap
