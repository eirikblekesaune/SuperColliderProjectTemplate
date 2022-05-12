# SuperColliderProjectTemplate
A project template for my SuperCollider projects.
This is a solution that is in between a standalone solution and a purely host defined setup.


## Directory structure
- `bin`: The activation and deactivation scripts are stored here. 
- `data`: The file `sclang_conf.yaml.template` lists the directories where my SuperCollider classes stored. I also use this directory for various data and settings that are globally applicable for the project.
- `lib`: This is where I put my dependencies in the form of submodules. Classes local to this project is usually stored in a `Classes` directory in here as well.
  - `Classes`: The SuperCollider class files that are local for this project are stored here.
- `src`: If I need a startup script for the system, I would put it here, and possibly symlink it to the host PATH variable if needed. The startup script could also activate and deactivate the sclang environment if needed.
  - `Definitions`: When I use `VTM` in my project I store my `ContextDefinition`-files here.
  - `dev`: I usually have a directory for sketches here. This directory is per default ignored from `.gitignore`.


