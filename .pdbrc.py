import atexit
import os
import readline

from pdb import DefaultConfig


class Config(DefaultConfig):
    prompt = '\x1b[34m' + '+pdb> ' + '\x1b[0m'
    sticky_by_default = True
    editor = 'emacsclient -n'


historyPath = os.path.expanduser("~/.pyhistory")


def save_history(historyPath=historyPath):
    readline.write_history_file(historyPath)


if os.path.exists(historyPath):
    readline.read_history_file(historyPath)


atexit.register(save_history, historyPath=historyPath)
