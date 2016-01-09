# OpenDSSDirect

[OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) is an open-source
distribution system simulation. This Julia package implements a "direct" library
interface to OpenDSS. See [this
documentation](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf)
for detailed information on the direct library interface to OpenDSS. The direct
library interface can be faster than the more traditional COM interface.

**This package is only available for Windows.** OpenDSS is only available for
Windows.

**This package is still in development.**

# Installation

For now, this package is not registered. To install, use the following from
within Julia:

```julia 
Pkg.clone("https://github.com/tshort/OpenDSSDirect.jl.git")
```

This package includes OpenDSS as a library. You do not have to install OpenDSS
separately. In particular, it includes the OpenDSSDEngine.DLL that implements
the direct-access API.

# Features

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
  model iteration.

# Main API

The `dss` function is the main function for passing commands to OpenDSS. You can
pass multi-line commands with `dss`, but continuation lines are not allowed. 
You can also splice in Julia values with string interpolation. Here is an 
example of using `dss`:

```julia
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
```

Several functions are available for setting OpenDSS variables, getting values,
and initiating commands. The first argument is a symbol followed by zero or more
arguments. Here is an example to set the `kW` of the active load element:

```julia 
loads(:kW_set,50.)
``` 

Here is an example setting some loads:

```julia
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
loadnumber = loads(:First)
while loadnumber > 0
    loads(:kW_set,50.)
    loads(:kvar_set,20.)
    loadnumber = loads(:Next)
end
println(loads(:Count)) 
```
 
For tight loops, the methods can be called with the symbol wrapped in `Val{}`.
The previous example is:

```julia 
loads(Val{:kW_set},50.)
``` 
 
This makes the Julia code faster by making types stable.

Here is a list of functions supported:

* activeclass 
* bus 
* capacitors 
* capcontrols 
* circuit 
* cktelement 
* ctrlqueue 
* dss 
* element 
* executive 
* fuses 
* generators 
* isource 
* lines 
* loads 
* loadshape 
* meters 
* monitors 
* parser 
* pdelements 
* progress 
* pvsystems 
* reclosers 
* regcontrols 
* relays 
* sensors 
* settings 
* solution 
* swtcontrols
* topology
* transformers
* vsources
* xycurves

To find the parameters and directives for each function, use `methods(fun)`.

# Low-level API

The main API is built on the low-level API documented 
[here](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf).
Here is an example using the low-level API:

```julia
DSS.DSSPut_Command("clear")
DSS.DSSPut_Command("compile (C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss)")
loadnumber = DSS.DSSLoads(0,0)
while loadnumber > 0
    DSS.DSSLoadsF(1,50.)
    DSS.DSSLoadsF(5,20.)
    loadnumber = DSS.DSSLoads(1,0)
end
println(DSS.DSSLoads(4,0)) 
```

Integer (I), floating-point (F), and string (S) functions are supported. The
variant (V) functions are not available at this time. The low-level API
functions are not exported. These functions are available in the `DSS` module.

# Limitations

The functions with "_set" parameters that use Variants are not implemented. An example is `SettingsV(5, arg)` where `arg` is an Array. Variants are normally array inputs. There are not many of these in the direct API, and most can be handled with the text interface or other functions.  

