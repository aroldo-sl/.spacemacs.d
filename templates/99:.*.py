#!/usr/bin/env python3
# @file: `(current-buffer)`
# @date: `(current-time-string)`
# @description: 
"""
Module docstring.
"""
import logging
__level__ = logging.INFO
import os, sys
def _make_slog():
    strfmt = """%(levelname)s:%(name)s:%(module)s.%(funcName)s:%(lineno)s
%(message)s"""
    import random, string
    logfmt = logging.Formatter(strfmt)
    handler = logging.StreamHandler(stream=sys.stderr)
    handler.setLevel(__level__)
    handler.setFormatter(logfmt)
    fmt_string = "".join(random.sample(string.ascii_letters, 4))
    slog = logging.getLogger(__name__ + "-" + fmt_string)
    slog.addHandler(handler)
    slog.setLevel(__level__)
    return slog
_slog = _make_slog()


def _script():
    """
    Runs if this module is called as a
    Python script.
    """
    _slog.info("Running {script}".format(script=sys.argv[0]))

if __name__ == "__main__":
   _script()

del _slog
