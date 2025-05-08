
```@meta
CurrentModule = OpenDSSDirect
```

# Main API (module OpenDSSDirect)

The `dss` function is the main function for passing commands to OpenDSS. You can
pass multi-line commands with `dss`. You can also splice in Julia values with
string interpolation. Here is an  example of using `dss`:

```julia
using OpenDSSDirect
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile "$filename"
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
    compile "$filename"
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
           compile "$filename"
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

Besides that, the [`methods` function](https://docs.julialang.org/en/v1.10/base/base/#Base.methods)
can be helpful to list the alternatives. Besides the getter (no value arguments) and setter 
(when a value argument provided), most functions allow passing a `dss::DSSContext` argument. 
For example:

```julia
julia> using OpenDSSDirect

julia> methods(OpenDSSDirect.Loads.Name)
# 4 methods for generic function "Name":
[1] Name() in OpenDSSDirect.Loads at /home/user/.julia/packages/OpenDSSDirect/5wwHs/src/loads.jl:144
[2] Name(dss::DSSContext) in OpenDSSDirect.Loads at /home/user/.julia/packages/OpenDSSDirect/5wwHs/src/loads.jl:141
[3] Name(dss::DSSContext, Value::String) in OpenDSSDirect.Loads at /home/user/.julia/packages/OpenDSSDirect/5wwHs/src/loads.jl:147
[4] Name(Value::String) in OpenDSSDirect.Loads at /home/user/.julia/packages/OpenDSSDirect/5wwHs/src/loads.jl:150
```

For typical usage with a single circuit, users can use the variations without this argument. 
For using multiple DSS circuits and potentially multiple circuits, provide the context explicitly.

Here is a list of modules supported by this API. Each module has several functions.

Functions or modules that are not present on EPRI's OpenDSS implementation are marked "**(API Extension)**".
The official engine on DSS-Extensions, AltDSS, implements those natively. For EPRI's distribution, some of
the functions are still implemented for convenience of the users, but may incurr in some overhead. The rest
of the function should raise "Not implemented" errors.

On DSS-Extensions, the following API is now called the *classic* API. For new OpenDSS or AltDSS users, 
the document [OpenDSS COM/classic APIs](https://dss-extensions.org/classic_api.html) is a recommended read.
Although OpenDSSDirect.jl **does not** use COM on its implementation, the API implements most of the concepts
and basic organization from the original OpenDSS COM (Component Object Model) API.

## `dss`

```@docs
OpenDSSDirect.dss
```

## Module documentation

```@index
Pages = [
    "api/ActiveClass.md",
    "api/Basic.md",
    "api/Bus.md",
    "api/Capacitors.md",
    "api/CapControls.md",
    "api/Circuit.md",
    "api/CktElement.md",
    "api/CNData.md",
    "api/CtrlQueue.md",
    "api/Element.md",
    "api/Error.md",
    "api/Executive.md",
    "api/Fuses.md",
    "api/Generators.md",
    "api/GICSources.md",
    "api/Isource.md",
    "api/LineCodes.md",
    "api/LineGeometries.md",
    "api/Lines.md",
    "api/LineSpacings.md",
    "api/LoadShape.md",
    "api/Loads.md",
    "api/Meters.md",
    "api/Monitors.md",
    "api/Parallel.md",
    "api/Parser.md",
    "api/PDElements.md",
    "api/Progress.md",
    "api/Properties.md",
    "api/PVsystems.md",
    "api/Reactors.md",
    "api/Reclosers.md",
    "api/ReduceCkt.md",
    "api/RegControls.md",
    "api/Relays.md",
    "api/Sensors.md",
    "api/Settings.md",
    "api/Solution.md",
    "api/Storages.md",
    "api/SwtControls.md",
    "api/Text.md",
    "api/Topology.md",
    "api/Transformers.md",
    "api/TSData.md",
    "api/Vsources.md",
    "api/WindGens.md",
    "api/WireData.md",
    "api/XYCurves.md",
    "api/YMatrix.md",
    "api/ZIP.md",
]
```



