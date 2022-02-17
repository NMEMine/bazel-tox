def _tox_test_impl(ctx):
    ctx.actions.write(
        output = ctx.outputs.executable,
        content = "\n".join(
        [
        "set -e",
        "tox -c ./{tox_ini}".format(tox_ini = ctx.file.tox_ini.short_path)
        ]
    )
    )
    runfiles = ctx.runfiles(files = ctx.files.srcs + ctx.files.tox_ini + ctx.files.requirements)
    return [DefaultInfo(runfiles = runfiles)]


tox_test = rule(
    implementation = _tox_test_impl,
    test = True,
    attrs = {
        "srcs" : attr.label_list(allow_files = [".py"]),
        "tox_ini" : attr.label(allow_single_file = [".ini"], mandatory = True),
        "requirements" : attr.label(allow_single_file = [".txt"])
    }
)