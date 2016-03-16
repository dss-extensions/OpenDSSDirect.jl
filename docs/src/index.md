# OpenDSSDirect

[OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) is an open-source
distribution system simulator. This Julia package implements a "direct" library
interface to OpenDSS. See [this
documentation](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf)
for detailed information on the direct library interface to OpenDSS. The direct
library interface can be faster than the more traditional COM interface.

**This package is only available for Windows.** OpenDSS is only available for
Windows.

## Contents

    {contents}
    Pages = [
        "introduction.md",
        "api.md",
        "flags.md",
        "dssmode.md",
        "lowlevel.md"
    ]
    Depth = 2

## Documentation Index

    {index}
    Pages = ["api.md", "flags.md", "lowlevel.md"]
