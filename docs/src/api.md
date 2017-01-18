
```@meta
CurrentModule = OpenDSSDirect.DSS
```

# Main API (module DSS)

The `dss` function is the main function for passing commands to OpenDSS. You can
pass multi-line commands with `dss`. You can also splice in Julia values with
string interpolation. Here is an  example of using `dss`:

```julia
using OpenDSSDirect
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
```

Several functions are available for setting OpenDSS variables, getting values,
and initiating commands. Each of these is in one of several modules. Here is an
example to set the `kW` of the active load element:

```julia
DSS.Loads.kW(50.)
```

Here is an example setting some loads:

```julia
using OpenDSSDirect
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
loadnumber = DSS.Loads.First()
while loadnumber > 0
    DSS.Loads.kW(50.)
    DSS.Loads.kvar(20.)
    loadnumber = DSS.Loads.Next()
end
println(DSS.Loads.Count())
```

To use this API, you can either use `import OpenDSSDirect` and prepend all of the functions with `DSS.`, or you can `import OpenDSSDirect.DSS` and use the functions directly. The following two are equivalent:

```julia
using OpenDSSDirect
DSS.Circuit.TotalPower()
```
Importing the DSS module:
```julia
using OpenDSSDirect.DSS
Circuit.TotalPower()
```

Many of the functions that return arrays convert to complex numbers where appropriate. Here is an example session:

```julia
julia> using OpenDSSDirect.DSS

julia> filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss");

julia> dss("""
           clear
           compile $filename
       """)

julia> Solution.Solve();

julia> Circuit.Losses()
1.218242333223247e6 + 2.798391857088721e6im

julia> Circuit.TotalPower()
-12004.740450109337 - 1471.1749507157301im

julia> Circuit.SetActiveElement("Capacitor.CAPBank3")
"6075"

julia> CktElement.Voltages()
6-element Array{Complex{Float64},1}:
  5390.82-4652.32im
 -6856.89-2274.93im
  1284.62+7285.18im
      0.0+0.0im
      0.0+0.0im
      0.0+0.0im
```

To find the functions available in each module, use Julia's help for each module (initiated by hitting `?`). See below for an example.

```julia
julia> using OpenDSSDirect.DSS

help?> Circuit
search: Circuit

  module Circuit – Functions for interfacing with the active OpenDSS circuit.

  Circuit.NumCktElements() – Number of CktElements in the circuit

  Circuit.NumBuses() – Total number of Buses in the circuit

  Circuit.NumNodes() – Total number of Nodes in the circuit

  Circuit.FirstPCElement() – Sets the first enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0

  Circuit.NextPCElement() – Sets the next enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0

  Circuit.FirstPDElement() – Sets the first enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0

  Circuit.NextPDElement() – Sets the next enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0

  {truncated...}
```

Here is a list of modules supported by this API. Each module has several functions.

```@index
Pages = ["api.md"]
```

## `dss`

```@docs
dss
```

## `ActiveClass`

```@docs
ActiveClass
```

## `Basic`

```@docs
Basic
```

## `Bus`

```@docs
Bus
```

## `Capacitors`

```@docs
Capacitors
```

## `CapControls`

```@docs
CapControls
```

## `Circuit`

```@docs
Circuit
```

## `CktElement`

```@docs
CktElement
```

## `CtrlQueue`

```@docs
CtrlQueue
```

## `Element`

```@docs
Element
```

## `Executive`

```@docs
Executive
```

## `Fuses`

```@docs
Fuses
```

## `Generators`

```@docs
Generators
```

## `Isource`

```@docs
Isource
```

## `Lines`

```@docs
Lines
```

## `Loads`

```@docs
Loads
```

## `LoadShape`

```@docs
LoadShape
```

## `Meters`

```@docs
Meters
```

## `Monitors`

```@docs
Monitors
```

## `Parser`

```@docs
Parser
```

## `PDElements`

```@docs
PDElements
```

## `Progress`

```@docs
Progress
```

## `Properties`

```@docs
Properties
```

## `PVsystems`

```@docs
PVsystems
```

## `Reclosers`

```@docs
Reclosers
```

## `RegControls`

```@docs
RegControls
```

## `Relays`

```@docs
Relays
```

## `Sensors`

```@docs
Sensors
```

## `Settings`

```@docs
Settings
```

## `Solution`

```@docs
Solution
```

## `SwtControls`

```@docs
SwtControls
```

## `Topology`

```@docs
Topology
```

## `Transformers`

```@docs
Transformers
```

## `Vsources`

```@docs
Vsources
```

## `XYCurves`

```@docs
XYCurves
```
