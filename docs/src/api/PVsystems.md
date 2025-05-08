# `PVsystems`

!!! note "Conventions"
    - Every method that requires a `dss::DSSContext` also has a shortcut which binds to the default context. For example, a method `MethodName(dss::DSSContext)` is also exposed as `MethodName()`.
    - Properties from the original COM implementation are exposed as setter and getter pairs of methods, with the same name.
      For instance, `Loads.kV()` reads (gets) the value, while `Loads.kV(2.2)` updates (sets) the value of the kV property to 2.2.
    - Methods marked with **(API Extension)** are always available with the AltDSS engine. Some of those are also implemented for EPRI's OpenDSS distribution through the Oddie layer from DSS-Extensions. 
      Otherwise, the method will raise an error. We might use the type system to catch the errors earlier in a future release (contributions welcome!).

```@meta
CurrentModule = OpenDSSDirect
```

```@autodocs
Private = true
Modules = [PVsystems]
Order   = [:function, :type]
```

