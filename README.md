# OpenDSSDirect.jl

[![Travis Build Status](https://travis-ci.org/NREL/OpenDSSDirect.jl.svg?branch=master)](https://travis-ci.org/NREL/OpenDSSDirect.jl)
[![Appveyor Build Status](https://ci.appveyor.com/api/projects/status/github/NREL/OpenDSSDirect.jl?branch=master&svg=true)](https://ci.appveyor.com/project/kdheepak/opendssdirect-jl)

OpenDSSDirect.jl is a cross-platform Julia package implements a "direct" library interface to [OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) using [dss_capi](https://github.com/PMeira/dss_capi/).
OpenDSS is an open-source distribution system simulator. See [OpenDSSDirect.py](https://github.com/NREL/OpenDSSDirect.py) for a similar package in Julia.

**This package is now available for Windows, Mac, and Linux.**

### Documentation

* **[Current released package documentation](https://nrel.github.io/OpenDSSDirect.jl/stable/)**

The documentation for the development version of this package is [here](https://nrel.github.io/OpenDSSDirect.jl/latest/).

### Installation

Use the Julia package manager to install OpenDSSDirect

```julia
julia> ]
(v1.1)> add OpenDSSDirect
```

### Troubleshooting

This package interfaces with OpenDSS using the "direct" library interface, so a good understanding of OpenDSS will help troubleshooting.
There are plenty of useful resources located [here](https://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/Doc/).

If you are having issues using this Julia interface, feel free to open an Issue on GitHub [here](https://github.com/NREL/OpenDSSDirect.jl/issues/new).

### Thanks

Thanks to @tshort for the original package.
Thanks to @kdheepak, @PMeira and @GordStephen for their contributions.

See @PMeira's repo [here](https://github.com/PMeira/electricdss-src) for changes to OpenDSS for maintaining cross platform compatibility.

