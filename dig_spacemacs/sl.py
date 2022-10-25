#!/usr/bin/env python3
# @file: sl.py
# @date: Di Oct 25 2022
# @description: a simple logger
"""
Defines Formatter and Handler classes
for a simple logger for local usage.
"""
import os, sys
import logging, random, string
from datetime import datetime
from pathlib import Path
__level__ = logging.INFO

class SLogFormatter(logging.Formatter):
    "A log formatter for SLogHandler"
    fmt = "%(levelname)s:%(name)s:%(module)s.%(funcName)s:%(lineno)s\n%(message)s"
    def __init__(self, fmt = None):
        if fmt is None:
            fmt = SLogFormatter.fmt
        super().__init__(fmt = fmt)

class SLogHandler(logging.StreamHandler):
    "Simple logging handler."
    def __init__(self, stream = sys.stderr, level = __level__):
        super().__init__(stream = stream)
        self.setLevel(level)
        self.setFormatter(SLogFormatter())

def get_slog(handler = None, level = __level__):
    "Make a simple logger"
    if handler is None:
        handler = SLogHandler()
    handler.setLevel(level)
    random_string = "".join(random.sample(string.ascii_letters, 4))
    log_name  = random_string
    slog = logging.getLogger(log_name)
    slog.addHandler(handler)
    slog.setLevel(level)
    return slog

slog = get_slog()

def _script():
    """
    Runs if this module is called as a
    Python script.
    """
    slog.info("Perfect!")

if __name__ == "__main__":
   _script()



