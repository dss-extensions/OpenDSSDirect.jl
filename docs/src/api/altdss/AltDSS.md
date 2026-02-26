# `AltDSS`: the alternative API

```@meta
CurrentModule = OpenDSSDirect
```

```@autodocs
Private = true
Modules = [AltDSS]
Order   = [:module, :function, :type]
```

## Submodules

Besides some extra modules with shared methods, each OpenDSS/AltDSS object has a dedicated
module that exposes all (or most) of DSS properties. With few exceptions where the
names do not fit common expectations (e.g. `%LoadLoss` becomes `pctLoadLoss`), the 
property names match what is used in .DSS scripts. This should make it easier

If you cannot find a property, it most likely is marked as deprecated or removed,
redundant, or exposed in a slight different form. For example, for
`LineGeometry` objects, properties like `Wire` and `Wires` are ommited in favour
of the `Conductors` property, which accepts all conductor types and can be used
to read and write a list of objects more easily. Some properties that expose
items in arrays but require a separate index (e.g. `Transformer.Winding`, `LineGeometry.Cond`)
when writing DSS scripts are exposed as arrays.

For more info on the DSS format and a reference list of properties, please see
our companion documentation at [DSS Language](https://dss-extensions.org/dss_language).

```@contents
Pages = [
    "CircuitElement.md",
    "PCElement.md",
    "PDElement.md",
    "AutoTrans.md",
    "Capacitor.md",
    "CapControl.md",
    "CNData.md",
    "DynamicExp.md",
    "EnergyMeter.md",
    "Enums.md",
    "ESPVLControl.md",
    "ExpControl.md",
    "Fault.md",
    "FMonitor.md",
    "Fuse.md",
    "GenDispatcher.md",
    "Generator.md",
    "Generic5.md",
    "GICLine.md",
    "GICsource.md",
    "GICTransformer.md",
    "GrowthShape.md",
    "IndMach012.md",
    "InvControl.md",
    "Isource.md",
    "LineCode.md",
    "LineGeometry.md",
    "Line.md",
    "LineSpacing.md",
    "Load.md",
    "LoadShape.md",
    "Monitor.md",
    "PriceShape.md",
    "PVSystem.md",
    "Reactor.md",
    "Recloser.md",
    "RegControl.md",
    "Relay.md",
    "Sensor.md",
    "Spectrum.md",
    "StorageController.md",
    "Storage.md",
    "SwtControl.md",
    "TCC_Curve.md",
    "Transformer.md",
    "TSData.md",
    "TShape.md",
    "UPFCControl.md",
    "UPFC.md",
    "VCCS.md",
    "VSConverter.md",
    "Vsource.md",
    "WindGen.md",
    "WireData.md",
    "XfmrCode.md",
    "XYcurve.md"
]
```
