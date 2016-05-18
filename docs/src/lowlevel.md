
```@meta
CurrentModule = OpenDSSDirect.DSSCore
```

# Low-level API (module DSSCore)

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

```@index
Pages = ["lowlevel.md"]
```

```@docs
getI
getV
getYsparse
ZeroInjCurr
GetSourceInjCurrents
GetPCInjCurr
SystemYChanged
BuildYMatrixD
UseAuxCurrents
AddInAuxCurrents
SolveSystem
```

## Limitations

The functions with input parameters that are Variants are not implemented. An example is `DSSCore.SettingsV(5, arg)` where `arg` is an Array. These variants are normally array inputs. There are not many of these in the direct API, and most can be handled with the text interface or other functions. Functions that retrieve Variants are supported.
