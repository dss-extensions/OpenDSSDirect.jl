# `XfmrCode`

*Alternative API to access XfmrCode objects.*

!!! note "Conventions"
    - As a reminder, this module is exclusive to the AltDSS engine. See the main API docs for the modules shared across all OpenDSS implementations.
    - Every method that requires a `dss::DSSContext` also has a shortcut which binds to the default context. For example, a method `MethodName(dss::DSSContext)` is also exposed as `MethodName()`.
    - On the alternative API, each DSS property is exposed exposed as setter and getter pairs of methods/functions, with the same name.
    - Properties that represent actions are plain methods.
    - Methods ended with `_str` are convenience methods used for DSS properties that reference DSS object references and part of enumerations.

```@meta
CurrentModule = OpenDSSDirect.AltDSS
```

```@autodocs
Private = true
Modules = [XfmrCode]
Order   = [:function, :type]
```

