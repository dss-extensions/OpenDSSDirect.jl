# OpenDSSDirect.jl

[![GitHub Actions: Tests](https://github.com/dss-extensions/OpenDSSDirect.jl/workflows/CI/badge.svg)](https://github.com/dss-extensions/OpenDSSDirect.jl/actions/workflows/ci.yml)

OpenDSSDirect.jl is a cross-platform Julia package implements a "direct" library interface to [OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) using [DSS C-API](https://github.com/dss-extensions/dss_capi/), an alternative implementation.

OpenDSS is an open-source distribution system simulator.

Originally, the package used the OpenDSSDirect library from the official OpenDSS repository. Since OpenDSS is officially Windows-only, this package was migrated to use DSS C-API in 2019. The DSS C-API library is a community implementation of the OpenDSS engine built with the Free Pascal compiler, targeting cross-platform compatibility and an extended API. See its repository [here](https://github.com/dss-extensions/dss_capi) for the full Pascal/Delphi code, or https://dss-extensions.org/ for an overview of the projects around it.

For a general FAQ and many other links, see https://github.com/dss-extensions/dss-extensions#readme

See also [OpenDSSDirect.py](https://github.com/dss-extensions/OpenDSSDirect.py) for a package in Python with similar calling style, or [DSS-Python](https://github.com/dss-extensions/dss_python), [DSS_MATLAB](https://github.com/dss-extensions/dss_matlab) and [dss_sharp](https://github.com/dss-extensions/dss_sharp) for packages that mimic the OpenDSS COM API organization and style.

**This package is available for Windows, macOS (x86 and ARM processors), and Linux (x86 and ARM processors).**

### Documentation

* **[Current released package documentation](https://dss-extensions.github.io/OpenDSSDirect.jl/stable/)**

The documentation for the development version of this package is [here](https://dss-extensions.github.io/OpenDSSDirect.jl/latest/).

We also recommend reading the [known differences](https://github.com/dss-extensions/dss_capi/blob/master/docs/known_differences.md) document from DSS C-API, which lists the notable behavior differences versus the official OpenDSS engine.

An up-to-date reference of the properties on the level of the DSS language [is also available](https://github.com/dss-extensions/dss_capi/blob/master/docs/dss_properties.md).

### Installation

Use the Julia package manager to install OpenDSSDirect

```julia
julia> ]
(v1.1)> add OpenDSSDirect
```

### Troubleshooting

This package interfaces with the OpenDSS engine using a library interface, so a good understanding of OpenDSS will help troubleshooting.
There are plenty of useful resources located [here](https://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/Version8/Doc/). If you
have experience with the official OpenDSS COM implementation, the following document compares our two Python modules, DSS-Python 
(same structure as the OpenDSS COM module) and OpenDSSDirect.py (similar structure to OpenDSSDirect.jl): 
[DSS-Extensions — OpenDSS: Overview of Python APIs](https://dss-extensions.org/python_apis.html).

If you are having issues using this Julia interface, feel free to open an Issue on GitHub [here](https://github.com/dss-extensions/OpenDSSDirect.jl/issues/new) or
post at our [general Discussions page](https://github.com/orgs/dss-extensions/discussions/categories/general).

### Thanks

Thanks to @tshort for the original package.  
Thanks to @kdheepak, @PMeira and @GordStephen for their contributions.
