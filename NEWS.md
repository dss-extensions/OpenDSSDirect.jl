**Please also read the [DSS C-API engine changelog](https://github.com/dss-extensions/dss_capi/blob/master/docs/changelog.md) which tracks the engine changes.** Most of the engine changes do not affect the API code on the Julia level.**

For a more complete list of changes, visit the [Git repository and Releases page on GitHub](https://github.com/dss-extensions/OpenDSSDirect.jl).

### OpenDSSDirect v0.9.7 Release Notes

- Fix low-level signature for `Lib.Circuit_FromJSON`.

### OpenDSSDirect v0.9.6 Release Notes

- Update the engine to DSS C-API v0.14.1. There are a few bugfixes but also an extensive list of new features, [please check the AltDSS/DSS C-API changelog](https://github.com/dss-extensions/dss_capi/blob/master/docs/changelog.md#version-0141-2024-02-16).
- Export more modules; while previously accessible with `using OpenDSSDirect`, `import OpenDSSDirect` was missing many modules.
- Enums `DSSJSONFlags` and `DSSCompatFlags` were updated.
- Added enums `EnergyMeterRegisters`, `GeneratorRegisters`, `DSSPropertyNameStyle`, `DSSSaveFlags`.
- Expose new API functions `Circuit.Save` (extended equivalent of `save circuit dir=...`, with several flags for customization), `Circuit.FromJSON`, `Circuit.ToJSON`. The JSON functions are still experimental.

### OpenDSSDirect v0.9.5 Release Notes

- Update the DocStringExtensions dependency to avoid conflicts with other packages.

### OpenDSSDirect v0.9.4 Release Notes

- Update the engine to DSS C-API v0.13.4. This includes a bugfix to CapControl and some other incremental improvements.

### OpenDSSDirect v0.9.3 Release Notes

- Update the engine to DSS C-API v0.13.3. This includes important bugfixes to UPFC, Capacitor, and Reactor components, as well as other small changes.
- Update documentation.
- Add new flag `DSSCompatFlags_SaveCalcVoltageBases`: this flag forces the `save circuit` to always include `CalcVoltageBases` in the saved files. 
Use it with `Basic.CompatFlags()`.

### OpenDSSDirect v0.9.2 Release Notes

- Update the engine to DSS C-API v0.13.2.
- Address Julia 1.9 compatibility issues on Windows.
- Add new flags `DSSJSONFlags_SkipDSSClass` and `DSSJSONFlags_LowercaseKeys` to control JSON output of the engine.

### OpenDSSDirect v0.9.1 Release Notes

- Update the engine to DSS C-API v0.13.1.

### OpenDSSDirect v0.9.0 Release Notes

- Update the engine to DSS C-API v0.13.0.
- Enable creating multiple DSS engines. Each engine instance is thread-safe, so multiple Julia threads can be used. That is, using one thread per engine is safe.

### OpenDSSDirect v0.8.1 Release Notes

- Update the engine to DSS C-API v0.12.1.
- Update modules with new functions and add several modules (CNData, GICSources, LineGeometries, LineSpacings, Parallel, Reactors, ReduceCkt, Storages, TSData, WireData, ZIP).

### OpenDSSDirect v0.8.0 Release Notes

- Update the engine to DSS C-API v0.12.0.

### OpenDSSDirect v0.7.3 Release Notes

- Add more `Idx` functions (several modules).
- Use flags/enums in more functions.

### OpenDSSDirect v0.7.2 Release Notes

- Update the engine to DSS C-API v0.10.7-1, which includes a fix to an issue with energy meter reports.

### OpenDSSDirect v0.7.1 Release Notes

- Update the engine to DSS C-API v0.10.7.

### OpenDSSDirect v0.7.0 Release Notes

- Update the engine to DSS C-API v0.10.6.
- Adjust several modules to add new functions.

### OpenDSSDirect v0.6.1 Release Notes

- Translate OpenDSS Errors to Julia Exceptions
- Change docstringextensions upper bound

### OpenDSSDirect v0.6.0 Release Notes

- Support Julia 1.3.x with 7z fix
- Update DSS C API to latest version
- Change Vector{Float64} to Matrix{Float64}
- Fix CktElement.YPrim function
- Fix Lines.YPrim function

### OpenDSSDirect v0.5.1 Release Notes

- Add Enum support for all functions
- Minor fixes in Error module
- Add `OPENDSSDIRECT_REPL` environment variable to disable REPL mode
- Add download examples function

### OpenDSSDirect v0.5.0 Release Notes

- Rewrite using [dss_capi](https://github.com/PMeira/dss_capi)
- Fixes some issues and cleans up API (See https://github.com/dss-extensions/OpenDSSDirect.jl/pull/26 for more information)

### OpenDSSDirect v0.4.0 Release Notes

- Support Mac that's compiled by Lazarus/FPC

### OpenDSSDirect v0.3.2 Release Notes

- Support Linux that's compiled by Lazarus/FPC

### OpenDSSDirect v0.3.1 Release Notes

- Update to OpenDSS version 7.6.5_18

### OpenDSSDirect v0.3.0 Release Notes

- Update to Julia v0.5

### OpenDSSDirect v0.2.0 Release Notes

- Add Documentation
- Update DLL's

### OpenDSSDirect v0.1.1 Release Notes

- Initial release

