# Save history between runs
set history save on

# Add pretty printers
set print static off

python
import sys
import os
sys.path.append(os.environ['HOME'] + '/.gdb_stl_pretty_print')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
