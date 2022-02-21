# bazel-tox

This is a minimal example of how to hermetically use `tox` in `bazel` to run `pytest`s.

### Running ###
After cloning the repo, call
```bash
bazel test //foo_module:foo_test
```
This will download `tox==3.24.4` and its dependencies, make it available as as `py_binary` and use that to run the equivalent of `tox .` in the `runfiles` folder of the `foo_module` example module.


### Notes ###
 * This is not fully hermetic. For example, the host system has to have a Python 3 interpreter installed and available. A `py_runtime_pair` could be used to get around this.
 * Probably, a lot of features of `tox` do not work out of the box.