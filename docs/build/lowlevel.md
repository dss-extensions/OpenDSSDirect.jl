
<a id='low-level-api-module-dsscore'></a>
# Low-level API (module DSSCore)


The main API is built on the low-level API documented  [here](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf). The low-level API is implemented in the `DSSCore` module. Here is an example using the low-level API:


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


Integer (I), floating-point (F), string (S), and variant (V) functions are supported. The low-level API functions are not exported. 


This low-level API also includes several functions for directly accessing and  controlling an OpenDSS solution. These functions include 

- [`AddInAuxCurrents`](lowlevel.md#OpenDSSDirect.DSSCore.AddInAuxCurrents)
- [`BuildYMatrixD`](lowlevel.md#OpenDSSDirect.DSSCore.BuildYMatrixD)
- [`GetPCInjCurr`](lowlevel.md#OpenDSSDirect.DSSCore.GetPCInjCurr)
- [`GetSourceInjCurrents`](lowlevel.md#OpenDSSDirect.DSSCore.GetSourceInjCurrents)
- [`SolveSystem`](lowlevel.md#OpenDSSDirect.DSSCore.SolveSystem)
- [`SystemYChanged`](lowlevel.md#OpenDSSDirect.DSSCore.SystemYChanged)
- [`UseAuxCurrents`](lowlevel.md#OpenDSSDirect.DSSCore.UseAuxCurrents)
- [`ZeroInjCurr`](lowlevel.md#OpenDSSDirect.DSSCore.ZeroInjCurr)
- [`getI`](lowlevel.md#OpenDSSDirect.DSSCore.getI)
- [`getV`](lowlevel.md#OpenDSSDirect.DSSCore.getV)
- [`getYsparse`](lowlevel.md#OpenDSSDirect.DSSCore.getYsparse)

...


<a id='OpenDSSDirect.DSSCore.getI' href='#OpenDSSDirect.DSSCore.getI'>#</a>**OpenDSSDirect.DSSCore.getI** &mdash; *Function*.

---

`getI()` – Return the complex vector of current injections. 

The size of the vector is one more than the number of nodes in the system. This is the same current injection array used in OpenDSS internally, so the current injections can be updated for custom solutions. This could be used to implement a custom power control component.



<a id='OpenDSSDirect.DSSCore.getV' href='#OpenDSSDirect.DSSCore.getV'>#</a>**OpenDSSDirect.DSSCore.getV** &mdash; *Function*.

---

`getV()` – Return the complex vector of node voltages. 

The size of the vector is one more than the number of nodes in the system. The first element is ground (zero volts). This is the same voltage array used in OpenDSS internally, so the voltages can be updated for custom solutions. 



<a id='OpenDSSDirect.DSSCore.getYsparse' href='#OpenDSSDirect.DSSCore.getYsparse'>#</a>**OpenDSSDirect.DSSCore.getYsparse** &mdash; *Function*.

---

`getYsparse()` – Return the system sparse Y matrix.



<a id='OpenDSSDirect.DSSCore.ZeroInjCurr' href='#OpenDSSDirect.DSSCore.ZeroInjCurr'>#</a>**OpenDSSDirect.DSSCore.ZeroInjCurr** &mdash; *Function*.

---

`ZeroInjCurr()` – Zero out the current injections vector.



<a id='OpenDSSDirect.DSSCore.GetSourceInjCurrents' href='#OpenDSSDirect.DSSCore.GetSourceInjCurrents'>#</a>**OpenDSSDirect.DSSCore.GetSourceInjCurrents** &mdash; *Function*.

---

`GetSourceInjCurrents()` – Update the current injections vector with source injections.



<a id='OpenDSSDirect.DSSCore.GetPCInjCurr' href='#OpenDSSDirect.DSSCore.GetPCInjCurr'>#</a>**OpenDSSDirect.DSSCore.GetPCInjCurr** &mdash; *Function*.

---

`GetPCInjCurr()` – Update the current injections vector with injections from power control elements like loads.



<a id='OpenDSSDirect.DSSCore.SystemYChanged' href='#OpenDSSDirect.DSSCore.SystemYChanged'>#</a>**OpenDSSDirect.DSSCore.SystemYChanged** &mdash; *Function*.

---

`SystemYChanged(arg)` – Set the status of whether the system Y matrix has changed.

`SystemYChanged()` – Bool indicating whether the system Y matrix has changed.



<a id='OpenDSSDirect.DSSCore.BuildYMatrixD' href='#OpenDSSDirect.DSSCore.BuildYMatrixD'>#</a>**OpenDSSDirect.DSSCore.BuildYMatrixD** &mdash; *Function*.

---

`BuildYMatrixD(buildops::Integer, doallocate)` – Rebuild the system Y matrix. 

  * `buildops::Integer` indicates the type of build. `0 == WHOLEMATRIX` and `1 == SERIESONLY`.
  * `doallocate::Bool` is used to determine whether to allocate the Y matrix.



<a id='OpenDSSDirect.DSSCore.UseAuxCurrents' href='#OpenDSSDirect.DSSCore.UseAuxCurrents'>#</a>**OpenDSSDirect.DSSCore.UseAuxCurrents** &mdash; *Function*.

---

`UseAuxCurrents(arg)` – Set the status of whether to use auxiliary currents.

`UseAuxCurrents()` – Bool indicating whether to use auxiliary currents.



<a id='OpenDSSDirect.DSSCore.AddInAuxCurrents' href='#OpenDSSDirect.DSSCore.AddInAuxCurrents'>#</a>**OpenDSSDirect.DSSCore.AddInAuxCurrents** &mdash; *Function*.

---

`UseAuxCurrents(arg)` – ??



<a id='OpenDSSDirect.DSSCore.SolveSystem' href='#OpenDSSDirect.DSSCore.SolveSystem'>#</a>**OpenDSSDirect.DSSCore.SolveSystem** &mdash; *Function*.

---

`SolveSystem()` – Update the system node voltages based on the vector of current injections.



<a id='limitations'></a>
## Limitations


The functions with input parameters that are Variants are not implemented. An example is `DSSCore.SettingsV(5, arg)` where `arg` is an Array. These variants are normally array inputs. There are not many of these in the direct API, and most can be handled with the text interface or other functions. Functions that retrieve Variants are supported. 

