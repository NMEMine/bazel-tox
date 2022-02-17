load("//tox_test_rule:tox_test_rule.bzl", "tox_test")

tox_test(
    name = "foo_test",
    srcs = [":foo.py", ":test/test_foo.py"],
    tox_ini = ":tox.ini",
    requirements = ":requirements.txt"
)