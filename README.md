# OpenDSSDirect.jl

[![Travis Build Status](https://travis-ci.com/dss-extensions/OpenDSSDirect.jl.svg?branch=master)](https://travis-ci.com/dss-extensions/OpenDSSDirect.jl)
[![Appveyor Build Status](https://ci.appveyor.com/api/projects/status/github/dss-extensions/OpenDSSDirect.jl?branch=master&svg=true)](https://ci.appveyor.com/project/PMeira/opendssdirect-jl)

OpenDSSDirect.jl is a cross-platform Julia package implements a "direct" library interface to [OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) using [DSS C-API](https://github.com/dss-extensions/dss_capi/).

OpenDSS is an open-source distribution system simulator.

Originally, the package used the OpenDSSDirect library from the official OpenDSS repository. Since OpenDSS is officially Windows-only, this package was migrated to use DSS C-API in 2019. The DSS C-API library is a community implementation of the OpenDSS engine built with the Free Pascal compiler, targetting cross-platform compatibility and an extended API. See its repository [here](https://github.com/dss-extensions/dss_capi) for the full Pascal/Delphi code, or https://dss-extensions.org/ for an overview of the projects around it.

See also [OpenDSSDirect.py](https://github.com/dss-extensions/OpenDSSDirect.py) for a package in Python with similar calling style, or [DSS_Python](https://github.com/dss-extensions/dss_python) and [DSS_MATLAB](https://github.com/dss-extensions/dss_matlab) for packages that mimic the OpenDSS COM API organization and style.

**This package is now available for Windows, Mac, and Linux.**

### Documentation

* **[Current released package documentation](https://dss-extensions.github.io/OpenDSSDirect.jl/stable/)**

The documentation for the development version of this package is [here](https://dss-extensions.github.io/OpenDSSDirect.jl/latest/).

We also recommend reading the [known differences](https://github.com/dss-extensions/dss_capi/blob/0.10.x/docs/known_differences.md) document from DSS C-API, which lists the notable behavior differences versus the official OpenDSS engine.

An up-to-date reference of the properties on the level of the DSS language [is also available](https://github.com/dss-extensions/dss_capi/blob/0.10.x/docs/dss_properties.md).

### Installation

Use the Julia package manager to install OpenDSSDirect

```julia
julia> ]
(v1.1)> add OpenDSSDirect
```

### Troubleshooting

This package interfaces with the OpenDSS engine using a library interface, so a good understanding of OpenDSS will help troubleshooting.
There are plenty of useful resources located [here](https://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/Version8/Doc/).

If you are having issues using this Julia interface, feel free to open an Issue on GitHub [here](https://github.com/dss-extensions/OpenDSSDirect.jl/issues/new).

### Thanks

Thanks to @tshort for the original package.
Thanks to @kdheepak, @PMeira and @GordStephen for their contributions.
