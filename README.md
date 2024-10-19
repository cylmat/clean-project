# Clean installation project
Clean installed directory for a new development project

Clone project in project dir
```
mkdir my_project && cd my_project
git clone https://github.com/cylmat/clean-project .
rm -r .git
```

Then run install script to help creating project:
```
Usage:
  run [command]
HELP
  help            h         show list of commands
DOCKER COMMAND
  build_container   build
  run_container     run
  build_and_run     bnr
  connect_container co
  stop_container    stop
  remove_container  rm
  stop_and_remove   snr
INSTALLING COMMAND
  install <script>  i       install specific script from '$INSTALL_DIR' directory";
```
