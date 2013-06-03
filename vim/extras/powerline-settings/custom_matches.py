# vim:fileencoding=utf-8:noet

from __future__ import absolute_import

import os
from powerline.bindings.vim import getbufvar


def selectbuf(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == '[Select Buf]'

def fuzyfind(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == '[fuf]'

def tagbar(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == '__Tagbar__'

def nerdtree(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == 'NERD_tree_1'

def voom(matcher_info):
    name = matcher_info['buffer'].name
    return name and 'VOOM' in name

def gundo(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == '__Gundo__'

def gundo_preview(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == '__Gundo_Preview__'

def java_locate(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == '[Locate in workspace]'

def java_locate_result(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == '[Locate Results]'

def git_status(matcher_info):
    name = matcher_info['buffer'].name
    return name and '.git/index' in name

def git_commit(matcher_info):
    name = matcher_info['buffer'].name
    return name and os.path.basename(name) == 'COMMIT_EDITMSG'

def git_blame(matcher_info):
    name = matcher_info['buffer'].name
    return name and 'fugitiveblame' in name

