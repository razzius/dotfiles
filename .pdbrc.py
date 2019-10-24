from pdb import DefaultConfig

class Config(DefaultConfig):
    prompt = '\033[34;1;4m+pdb>\033[0m '
    sticky_by_default = True
    editor = 'emacsclient -n'
