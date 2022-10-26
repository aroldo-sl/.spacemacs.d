# -*- mode: snippet -*-
# name: Python  test module
# key  test
# -- 
#!/usr/bin/env python3
"""
Module docstring.
"""
import os, sys, logging, time, random
def _make_slog():
    logging.basicConfig()
    _random_hex_string=hex(int(str(random.random())[2:]))[2:]
    slog = logging.getLogger(__name__ + "-" + _random_hex_string)
    slog.setLevel(logging.WARNING)
    return slog
_slog = _make_slog()
_slog.info("Running {script}".format(script=sys.argv[0]))


