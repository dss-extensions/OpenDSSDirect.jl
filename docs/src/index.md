# OpenDSSDirect

[OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) is an open-source
distribution system simulator. This Julia package implements a "direct" library
interface to OpenDSS. See [this
documentation](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf)
for detailed information on the direct library interface to OpenDSS. The direct
library interface can be faster than the more traditional COM interface.

## Installation

For now, this package is registered, so you can use the following to install:

Open the package manager REPL (using `]`)

```
(v1.1) pkg> add OpenDSSDirect
```

To install the latest development version, use the following from within Julia:

```julia
(v1.1) pkg> dev OpenDSSDirect
```

This package includes OpenDSS as a library. You do not have to install OpenDSS
separately. In particular, it includes the OpenDSSDirect dynamically linked
library using [dss_capi](https://github.com/dss-extensions/dss_capi) that implements the direct-access API.

Note that this should work on 32- and 64-bit Windows systems and 64-bit Linux
and Mac systems. The Windows, Mac and Linux libraries are taken from the
[dss_capi releases](https://github.com/dss-extensions/dss_capi/releases) page.

## Features

[Julia](http://julialang.org/) is a fast, flexible numerical language with
Matlab-like syntax. Like Python or Matlab, scripting OpenDSS can be used for
Monte-Carlo batch runs, parameter sweeps, post processing and plotting of
results, and more.

Julia has several key features for advanced operations with OpenDSS:

* **Parallel operations** -- Julia supports several ways to process data in
  parallel. This includes parallel operations on multiple CPU cores and
  parallel operations on processes in a cluster. See
  [examples/8760_pmap.jl](https://github.com/dss-extensions/OpenDSSDirect.jl/blob/master/examples/8760_pmap.jl)
  for an example of an annual simulation split among local CPU cores.

* **Optimization** -- Julia has strong support for optimization.

* **Custom solutions and custom models** -- Because Julia compiles to codes
  that run as quickly as C programs, it is possible to implement custom
  solutions, and these custom solutions can contain custom models implemented
  in Julia. The basic idea is to run a custom solution as described in
  [OpenDSS Solution Interface.pdf](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS%20Solution%20Interface.pdf).
  Custom control or power control elements can be implemented between each
  model iteration. See
  [examples/low-level-solver.jl](https://github.com/dss-extensions/OpenDSSDirect.jl/blob/master/examples/low-level-solver.jl)
  for an example with a custom solver, including a case with an alternate sparse
  matrix solver.

## Example

The `dss` function is the main function for passing commands to OpenDSS.
After that, a number of modules are available to access different data structures
in OpenDSS. Here is an example summing the kW and kvar from loads using the
`Loads` module:

```julia
using OpenDSSDirect
filename = Pkg.dir("OpenDSSDirect", "examples", "8500-Node", "Master.dss")
dss("""
    clear
    compile $filename
    solve
""")

loadnumber = Loads.First()
kWsum = 0.0
kvarsum = 0.0
while loadnumber > 0
    kWsum += Loads.kW()
    kvarsum += Loads.kvar()
    loadnumber = Loads.Next()
end
```


## Contents

```@contents
Pages = [
    "api.md",
    "flags.md",
    "dssmode.md",
    "lowlevel.md",
    "docindex.md"
]
Depth = 1
```
