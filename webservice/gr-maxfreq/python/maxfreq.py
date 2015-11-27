#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# Copyright 2015 <+YOU OR YOUR COMPANY+>.
# 
# This is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
# 
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this software; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
# 

import numpy
from gnuradio import gr
import time
from consumidorcinco import sendRaw

class maxfreq(gr.sync_block):
    """
    docstring for block maxfreq
    """
    def __init__(self, span, freqini, vectlen):
	self.span = span
	self.freqini = freqini
	self.vectlen = vectlen
        gr.sync_block.__init__(self,
            name="maxfreq",
            in_sig=[numpy.float32, numpy.short],
            out_sig=None)


    def work(self, input_items, output_items):
        in0 = input_items[0]
	in1 = input_items[1]
	maxvalue = in0[0]
	maxposition = in1[0]
	print type(maxposition)
	freq_max = (self.span * maxposition / self.vectlen) + self.freqini
	Datos = [maxvalue, freq_max]
	date=time.strftime('%d/%m/%Y %H:%M:%S')
        for dato in Datos:
        	sendRaw(date, 1, float(dato), 2, 3, -73.45, 7.87, 27)


        # <+signal processing here+>
        return len(input_items[0])

