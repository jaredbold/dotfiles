# Add pretty printers
set print static off

python
import sys
sys.path.insert(0, '~/.gdb_stl_pretty_print')
sys.path.insert(0, '~/.gdb_stl_pretty_print/libstdcxx/v6')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
