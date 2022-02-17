def _tox_test_impl(ctx):
    ctx.actions.write(
        output = ctx.outputs.executable,
        content = "\n".join(
        [
        "set -e",
        "python3 ./{tox_bin} -c ./{tox_ini}".format(tox_bin = ctx.executable._tox_bin.short_path, tox_ini = ctx.file.tox_ini.short_path)
        ]
    )
    )

    runfiles = ctx.runfiles(files = ctx.files.srcs + ctx.files.tox_ini + ctx.files.requirements).merge(ctx.attr._tox_bin[DefaultInfo].default_runfiles)
    return [DefaultInfo(runfiles = runfiles)]


tox_test = rule(
    implementation = _tox_test_impl,
    test = True,
    attrs = {
        "srcs" : attr.label_list(allow_files = [".py"]),
        "tox_ini" : attr.label(allow_single_file = [".ini"], mandatory = True),
        "requirements" : attr.label(allow_single_file = [".txt"]),
        "_tox_bin" : attr.label(
            cfg = "host",
            executable = True,
            default = "//third_party:tox_bin",
        )
    },
)