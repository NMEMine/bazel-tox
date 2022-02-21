load("@rules_python//python:defs.bzl", "py_binary")
load("@tox_deps//:requirements.bzl", "requirement")

py_binary(
    name = "tox_bin",
    srcs = glob(["**/*.py"]),
    main = "main.py",
    visibility = ["//visibility:public"],
    deps = [
        requirement("tox"),
    ],
)
