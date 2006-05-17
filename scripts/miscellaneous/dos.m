## Copyright (C) 2004 John W. Eaton
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, write to the Free
## Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.

## -*- texinfo -*-
## @deftypefn {Function File} {[@var{status}, @var{text}] =} dos (@var{command})
## @deftypefnx {Function File} {[@var{status}, @var{text}] =} dos (@var{command}, "-echo")
## Execute a system command if running under a Windos-like operating
## system, otherwise do nothing.  Return the exit status of the program
## in @var{status} and any output sent to the standard output in
## @var{text}.  If the optional second argument @code{"-echo"} is given,
## then also send the output from the command to the standard output.
## @seealso{unix, isunix, ispc, system}
## @end deftypefn

## Author: octave-forge ???
## Adapted by: jwe

function [status, text] = dos (cmd, echo_arg)

  if (nargin < 1 || nargin > 2)
    usage ( "[status, text] = dos (cmd, '-echo')");
  elseif (! isunix ())
    [status, text] = system (cmd);
    if (nargin > 1 || nargout == 0)
      printf ("%s\n", text);
    endif
  endif

endfunction
