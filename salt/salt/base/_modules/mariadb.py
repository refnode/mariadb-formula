# -*- coding: utf-8 -*-
'''
Module for MariaDB helper functions
'''

# Import python libs
from __future__ import absolute_import
import logging
import socket

# Import salt libs
import salt.utils
from salt.grains.core import ip4_interfaces
from salt.utils.network import ip_addrs, interface_ip
from salt.exceptions import CommandExecutionError

# Import 3rd-party libs


log = logging.getLogger(__name__)


def __virtual__():
    '''
    Only work on POSIX-like systems
    '''
    # Disable on Windows, a specific file module exists:
    if salt.utils.is_windows():
        return False
    return True


def server_id():
    ip_list = ip_addrs()
    main_ip = ip_list[0]
    return int(socket.inet_aton(main_ip).encode('hex'), 16)
