# Save history between runs
set history save on

# Add pretty printers
set print static off

# set record to unlimited
set record instruction-history-size unlimited

# disable autoload checking
set auto-load safe-path /

set print pretty off
set print object on
set print static-members off
set print vtbl off
set print demangle on
set demangle-style gnu-v3

# No longer needed if using a newer version of gcc/gdb
python
import sys
import os
sys.path.append(os.environ['HOME'] + '/.gdb_stl_pretty_print')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
