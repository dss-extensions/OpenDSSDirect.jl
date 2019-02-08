
```@meta
CurrentModule = OpenDSSDirect
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
Loads.kW(50.)
```

Here is an example setting some loads:

```julia
using OpenDSSDirect
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
loadnumber = Loads.First()
while loadnumber > 0
    Loads.kW(50.)
    Loads.kvar(20.)
    loadnumber = Loads.Next()
end
println(Loads.Count())
```

To use this API, you can either use `import OpenDSSDirect` and prepend all calls with `OpenDSSDirect`, or you can run `using OpenDSSDirect` and use the functions within each module directly. The following two are equivalent:

```julia
import OpenDSSDirect
OpenDSSDirect.Circuit.TotalPower()
```
Importing the DSS module:
```julia
using OpenDSSDirect
Circuit.TotalPower()
```

Many of the functions that return arrays convert to complex numbers where appropriate. Here is an example session:

```julia
julia> using OpenDSSDirect

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
6075

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
julia> using OpenDSSDirect

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

## `dss`

```@docs
OpenDSSDirect.dss
```

## `ActiveClass`

```@autodocs
Modules = [ActiveClass]
Order   = [:function, :type]
```

## `Basic`

```@autodocs
Modules = [Basic]
Order   = [:function, :type]
```

## `Bus`

```@autodocs
Modules = [Bus]
Order   = [:function, :type]
```

## `Capacitors`

```@autodocs
Modules = [Capacitors]
Order   = [:function, :type]
```

## `CapControls`

```@autodocs
Modules = [CapControls]
Order   = [:function, :type]
```

## `Circuit`

```@autodocs
Modules = [Circuit]
Order   = [:function, :type]
```

## `CktElement`

```@autodocs
Modules = [CktElement]
Order   = [:function, :type]
```

## `CtrlQueue`

```@autodocs
Modules = [CtrlQueue]
Order   = [:function, :type]
```

## `Element`

```@autodocs
Modules = [Element]
Order   = [:function, :type]
```

## `Error`

```@autodocs
Modules = [Error]
Order   = [:function, :type]
```

## `Executive`

```@autodocs
Modules = [Executive]
Order   = [:function, :type]
```

## `Fuses`

```@autodocs
Modules = [Fuses]
Order   = [:function, :type]
```

## `Generators`

```@autodocs
Modules = [Generators]
Order   = [:function, :type]
```

## `Isource`

```@autodocs
Modules = [Isource]
Order   = [:function, :type]
```

## `LineCodes`

```@autodocs
Modules = [LineCodes]
Order   = [:function, :type]
```

## `Lines`

```@autodocs
Modules = [Lines]
Order   = [:function, :type]
```

## `Loads`

```@autodocs
Modules = [Loads]
Order   = [:function, :type]
```

## `LoadShape`

```@autodocs
Modules = [LoadShape]
Order   = [:function, :type]
```

## `Meters`

```@autodocs
Modules = [Meters]
Order   = [:function, :type]
```

## `Monitors`

```@autodocs
Modules = [Monitors]
Order   = [:function, :type]
```

## `Parser`

```@autodocs
Modules = [Parser]
Order   = [:function, :type]
```

## `PDElements`

```@autodocs
Modules = [PDElements]
Order   = [:function, :type]
```

## `Progress`

```@autodocs
Modules = [Progress]
Order   = [:function, :type]
```

## `Properties`

```@autodocs
Modules = [Properties]
Order   = [:function, :type]
```

## `PVsystems`

```@autodocs
Modules = [PVsystems]
Order   = [:function, :type]
```

## `Reclosers`

```@autodocs
Modules = [Reclosers]
Order   = [:function, :type]
```

## `RegControls`

```@autodocs
Modules = [RegControls]
Order   = [:function, :type]
```

## `Relays`

```@autodocs
Modules = [Relays]
Order   = [:function, :type]
```

## `Sensors`

```@autodocs
Modules = [Sensors]
Order   = [:function, :type]
```

## `Settings`

```@autodocs
Modules = [Settings]
Order   = [:function, :type]
```

## `Solution`

```@autodocs
Modules = [Solution]
Order   = [:function, :type]
```

## `SwtControls`

```@autodocs
Modules = [SwtControls]
Order   = [:function, :type]
```

## `Text`

```@autodocs
Modules = [Text]
Order   = [:function, :type]
```

## `Topology`

```@autodocs
Modules = [Topology]
Order   = [:function, :type]
```

## `Transformers`

```@autodocs
Modules = [Transformers]
Order   = [:function, :type]
```

## `Vsources`

```@autodocs
Modules = [Vsources]
Order   = [:function, :type]
```

## `XYCurves`

```@autodocs
Modules = [XYCurves]
Order   = [:function, :type]
```

## `YMatrix`

```@autodocs
Modules = [YMatrix]
Order   = [:function, :type]
```

