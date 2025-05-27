# `Enums`

Enumerations and bit flags used by the Alternative API in OpenDSSDirect.AltDSS.

Although most methods allow using integers directly, prefer to use the enumerations to ensure easier forwards compatibility.

Some DSS properties allow both enumeration/integer values and string values. For example, `OpenDSSDirect.AltDSS.Line.Units`
accepts integers, the `LengthUnit.T` enumeration, and strings. These methods typically have explicit string versions, e.g.
`OpenDSSDirect.AltDSS.Line.Units_str`, that allow only string arguments and, conversely, return the property value as
a string.

```@meta
CurrentModule = OpenDSSDirect.AltDSS
```

```@autodocs
Private = true
Modules = [Enums]
Order   = [:module, :function, :type]
```

```@docs
Enums.SetterFlags
Enums.OCPDevType
Enums.ExtraClassIDs
Enums.VisualizeQuantity
Enums.ReductionStrategy
Enums.EarthModel
Enums.LineType
Enums.LengthUnit
Enums.ScanType
Enums.SequenceType
Enums.Connection
Enums.CoreType
Enums.PhaseSequence
Enums.LoadSolutionModel
Enums.RandomType
Enums.ControlMode
Enums.InverterControlMode
Enums.SolutionMode
Enums.SolutionAlgorithm
Enums.CircuitModel
Enums.AutoAddDeviceType
Enums.LoadShapeClass
Enums.MonitoredPhase
Enums.PlotProfilePhases
Enums.LoadShapeAction
Enums.LoadShapeInterpolation
Enums.TShapeAction
Enums.PriceShapeAction
Enums.VSourceModel
Enums.LoadModel
Enums.LoadStatus
Enums.CapControlType
Enums.DynamicExpDomain
Enums.GeneratorModel
Enums.GeneratorDispatchMode
Enums.GeneratorStatus
Enums.WindGenModel
Enums.WindGenQMode
Enums.StorageState
Enums.StorageDispatchMode
Enums.StorageControllerDischargeMode
Enums.StorageControllerChargeMode
Enums.RelayType
Enums.RelayAction
Enums.RelayState
Enums.RecloserAction
Enums.RecloserState
Enums.FuseAction
Enums.FuseState
Enums.SwtControlAction
Enums.SwtControlState
Enums.PVSystemModel
Enums.UPFCMode
Enums.ESPVLControlType
Enums.IndMach012SlipOption
Enums.AutoTransConnection
Enums.RegControlPhaseSelection
Enums.InvControlControlMode
Enums.InvControlCombiMode
Enums.InvControlVoltageCurveXRef
Enums.InvControlVoltWattYAxis
Enums.InvControlRateOfChangeMode
Enums.InvControlReactivePowerReference
Enums.InvControlControlModel
Enums.GICTransformerType
Enums.VSConverterControlMode
Enums.MonitorAction
Enums.EnergyMeterAction
Enums.FMonitorAction
```
