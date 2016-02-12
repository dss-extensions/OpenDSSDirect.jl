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
  model iteration. See 
  [examples/low-level-solver.jl](https://github.com/tshort/OpenDSSDirect.jl/blob/master/examples/low-level-solver.jl) 
  for an example with a custom solver, including a case with an alternate sparse
  matrix solver.

# Main API

The `dss` function is the main function for passing commands to OpenDSS. You can
pass multi-line commands with `dss`, but continuation lines are not allowed. 
You can also splice in Julia values with string interpolation. Here is an 
example of using `dss`:

```julia
using OpenDSSDirect
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
loadnumber = DSS.loads(:First)
while loadnumber > 0
    DSS.loads(:kW, 50.)
    DSS.loads(:kvar, 20.)
    loadnumber = DSS.loads(:Next)
end
println(DSS.loads(:Count)) 
```
 
For tight loops, the methods can be called with the symbol wrapped in `Val{}`.
The previous example is:

```julia 
DSS.loads(Val{:kW}, 50.)
``` 

This makes the Julia code faster by making types stable.
 
To use this API, you can either use `import OpenDSSDirect` and prepend all of the functions with `DSS.`, or you can `import OpenDSSDirect.DSS` and use the functions directly. The following two are equivalent:

```julia 
using OpenDSSDirect
DSS.circuit(:TotalPower)
``` 
Importing the DSS module:
```julia 
using OpenDSSDirect.DSS
circuit(:TotalPower)
``` 

Many of the functions that return arrays convert to complex numbers where appropriate. Here is an example session:

```julia
julia> using OpenDSSDirect.DSS

julia> filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss");

julia> dss("""
           clear
           compile $filename
       """)

julia> solution(:Solve);

julia> circuit(:Losses)
1.218242333223247e6 + 2.798391857088721e6im

julia> circuit(:TotalPower)
-12004.740450109337 - 1471.1749507157301im

julia> circuit(:SetActiveElement, "Capacitor.CAPBank3")
"6075"

julia> cktelement(:Voltages)
6-element Array{Complex{Float64},1}:
  5390.82-4652.32im
 -6856.89-2274.93im
  1284.62+7285.18im
      0.0+0.0im
      0.0+0.0im
      0.0+0.0im
```

OpenDSSDirect also includes a custom REPL mode for entering OpenDSS commands directly. This is similar to the Help (`?`) and Shell (`;`) modes. Use the right square bracket (`]`) to enter DSS mode. Hit backspace on a blank line to exit. Here is an example:

```julia
julia> using OpenDSSDirect

DSS> compile C:\\portableapps\\home\\.julia\\v0.4\\OpenDSSDirect\\examples\\8500-Node\\Master.dss

DSS> solve

DSS> summary
Status = NOT Solved
Solution Mode = Snap
Number = 100
Load Mult = 1.000
Devices = 6103
Buses = 4876
Nodes = 8541
Control Mode =STATIC
Total Iterations = 23
Control Iterations = 2
Max Sol Iter = 15

 - Circuit Summary -

Year = 0
Hour = 0
Max pu. voltage = 1.0991
Min pu. voltage = 0.91736
Total Active Power:   12.0047 MW
Total Reactive Power: 1.47117 Mvar
Total Active Losses:   1.21824 MW, (10.15 %)
Total Reactive Losses: 2.79839 Mvar
Frequency = 60 Hz
Mode = Snap
Control Mode = STATIC
Load Model = PowerFlow
```

Here is a list of functions supported by this API:

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

To find the parameters and directives for each function, use help for each function. See below for an example. The DSS mode also has help. Hit `?` at the `DSS>` prompt, and enter options or commands you want help on.

```julia
julia> using OpenDSSDirect.DSS

julia> circuit
circuit (generic function with 44 methods)

help?> circuit
search: circuit

  circuit(:YCurrents) – Vector of doubles containing complex injection currents for the present solution.

  circuit(:YNodeOrder) – The names of the nodes in the same order as the Y matrix

  circuit(:YNodeVArray) – Complex array of actual node voltages in same order as SystemY matrix.

  circuit(:AllNodeNamesByPhase) – Returns a variant array of strings in order corresponding to
  AllNodeDistancesByPhase, AllNodeVmagByPhase, AllNodeVmagPUByPhase. Returns only those names whose phase
  designator matches the specified Phase.

  {truncated...}
  
DSS> clear

DSS help?> clear
Clear all circuits currently in memory.

DSS help?> solve
Perform the solution of the present solution mode. You can set any option that you can set with the Set command (see Set). The Solve command is virtually synonymous with the Set command except that a solution is performed after the options are processed.
```

Several flag variables are also defined:

* `MonitorModes`, `SolveModes`, `Options`, `CapControlModes`, `ActionCodes`, 
  `LoadStatus`, `LoadModels`, `LineUnits`

Each of these has multiple entries defined. See the help for each of these for the flags defined and their meaning. For example, here are the flags defined for `CapControlModes`.

* `Current` : Current control, ON and OFF settings on CT secondary
* `Voltage` : Voltage control, ON and OFF settings on the PT secondary base
* `KVAR` : kvar control, ON and OFF settings on PT / CT base
* `Time` : Time control ON and OFF settings are seconds from midnight
* `PF` : ON and OFF settings are power factor, negative for leading

Here is an example of use: 

```julia
capcontrols(:Mode, CapControlModes.KVAR)
```

# Low-level API

The main API is built on the low-level API documented 
[here](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf).
The low-level API is implemented in the `DSSCore` module.
Here is an example using the low-level API:

```julia
DSSCore.DSSPut_Command("clear")
DSSCore.DSSPut_Command("compile (C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss)")
loadnumber = DSSCore.DSSLoads(0, 0)
while loadnumber > 0
    DSSCore.DSSLoadsF(1, 50.)
    DSSCore.DSSLoadsF(5, 20.)
    loadnumber = DSSCore.DSSLoads(1, 0)
end
println(DSSCore.DSSLoads(4, 0)) 
```

Integer (I), floating-point (F), string (S), and variant (V) functions are
supported. The low-level API functions are not exported. 

This low-level API also includes several functions for directly accessing and 
controlling an OpenDSS solution. These functions include 
`getYsparse`, `getI`, `getV`, 
`ZeroInjCurr`, `GetSourceInjCurrents`, `GetPCInjCurr`, `SystemYChanged`, 
`SystemYChanged`, `BuildYMatrixD`, `UseAuxCurrents`, `UseAuxCurrents`, 
`AddInAuxCurrents`, and `SolveSystem`. Each of these have docstrings.

# Limitations

The functions with input parameters that are Variants are not implemented. An example is `SettingsV(5, arg)` where `arg` is an Array. These variants are normally array inputs. There are not many of these in the direct API, and most can be handled with the text interface or other functions. Functions that retrieve Variants are supported. 

