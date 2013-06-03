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

