#!/usr/local/python26/bin/python

sbDir = '/usr/local/couchpotato/var/'
try :
    pid  = int (open (sbDir  + 'couchpotato.pid', 'rt').readline ())
except IOError, ValueError :
    pass
else :
    from os import path, environ
    if path.isdir ('/proc/%d' % pid) :
        from ConfigParser import RawConfigParser
        sbCfg = RawConfigParser ()
        sbCfg.add_section ('core')
        sbCfg.set ('core', 'port', '8200')
        sbCfg.read (sbDir  + 'config.ini')
        host = $ENV{SERVER_NAME}
        response = 'Location: http://%s:%s/\n' % (host, sbCfg.get ('core', 'port'))
        print (response)