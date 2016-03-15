
# OpenDSSDirect

[OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) is an open-source
distribution system simulation. This Julia package implements a "direct" library
interface to OpenDSS. See [this
documentation](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf)
for detailed information on the direct library interface to OpenDSS. The direct
library interface can be faster than the more traditional COM interface.

**This package is only available for Windows.** OpenDSS is only available for
Windows.

## Installation

For now, this package is registered, so you can use the following to install:

```julia 
Pkg.add("OpenDSSDirect")
```

To install the latest development version, use the following from within Julia:

```julia 
Pkg.clone("https://github.com/tshort/OpenDSSDirect.jl.git")
```

This package includes OpenDSS as a library. You do not have to install OpenDSS
separately. In particular, it includes the OpenDSSDirect.DLL that implements
the direct-access API.

## Features

[Julia](http://julialang.org/) is a fast, flexible numerical language with
Matlab-like syntax. Like Python or Matlab, scripting OpenDSS can be used for 
Monte-Carlo batch runs, parameter sweeps, post processing and plotting of 
results, and more. 

Julia has several key features for advanced operations with OpenDSS:

* **Parallel operations** -- Julia supports several ways to process data in 
  parallel. This includes parallel operations on multiple CPU cores and 
  parallel operations on processes in a cluster. See 
  [examples/8760_parallel.jl](https://github.com/tshort/OpenDSSDirect.jl/blob/master/examples/8760_parallel.jl) 
  for an example of an annual simulation split among local CPU cores.

* **Optimization** -- Julia has strong support for optimization.

* **Custom solutions and custom models** -- Because Julia compiles to codes 
  that run as quickly as C programs, it is possible to implement custom
  solutions, and these custom solutions can contain custom models implemented
  in Julia. The basic idea is to run a custom solution as described in 
  [OpenDSS Solution Interface.pdf](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS%20Solution%20Interface.pdf).
  Custom control or power control elements can be implemented between each
  model iteration. See 
  [examples/low-level-solver.jl](https://github.com/tshort/OpenDSSDirect.jl/blob/master/examples/low-level-solver.jl) 
  for an example with a custom solver, including a case with an alternate sparse
  matrix solver.