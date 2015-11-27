#!/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/radiogis/Dokumente/webservice/gr-maxfreq/python
export GR_CONF_CONTROLPORT_ON=False
export PATH=/home/radiogis/Dokumente/webservice/gr-maxfreq/build/python:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export PYTHONPATH=/home/radiogis/Dokumente/webservice/gr-maxfreq/build/swig:$PYTHONPATH
/usr/bin/python2 /home/radiogis/Dokumente/webservice/gr-maxfreq/python/qa_maxfreq.py 
