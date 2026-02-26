"""
This module packages various enums in submodules similar to [EnumX.jl](https://github.com/fredrikekre/EnumX.jl)
in order to keep the enum values out of scope and simplify the value names.
"""
module Enums

# Global enumerations

"""
Setter flags customize how the update of DSS properties are handled by the
engine and parts of the API.

- `ImplicitSizes`: Most array properties depend on sizes defined by other properties.
  Using this flag, many properties allow users to skip setting the other property
  directly, allowing the engine to use the size of the provided array to
  initialize the other property.

- `AvoidFullRecalc`: Some components like Loads don't need to update YPrim for every change, e.g. setting
  "`load.a_load.kW=1`" if was "kW" previously 2 should not force a YPrim update, but it does
  force an update by default.
  Using this flag will reproduce what the classic OpenDSS API for Loads (DSS.ActiveCircuit.Loads)
  does, but removes a lot of duplicated code. Besides that, we can extend the feature
  for other components if we think it fits.

- `SkipNA`: For batch operations with arrays, skip NA values. Currently, NA values are interpreted as:
  - NaN for `float64`
  - INT32_MAX (0x7fffffff) for `int32`
  - Null pointers for strings (in this case, use a `"\0"` string for empty strings)
"""
module SetterFlags

using BitFlags: @bitflag

@bitflag SetterFlagsT::UInt32 begin
    Empty = 0
    ImplicitSizes = 0x00000001
    AvoidFullRecalc = 0x00000002
    SkipNA = 0x00000004
    AllowAllConductors = 0x40000000
end
end #module SetterFlags

"""Overcurrent Protection Device Type (DSS enumeration)"""
module OCPDevType

@enum T::Int32 begin
    none = 0
    Fuse = 1
    Recloser = 2
    Relay = 3
end
end # module OCPDevType

"""
A very limited set of functions accept the numbers from this enumeration
as shortcuts to the internal prepared element lists of the engine.
"""
module ExtraClassIDs

@enum ExtraClassIDsT::Int32 begin
    DSSObjs = -1
    CktElements = -2
    PCElements = -3
    PDElements = -4
end

end #module ExtraClassIDs

"""
VisualizeQuantity (DSS enumeration)

Visualize: Quantity

Enumerated values:
- `Currents` = 1
- `Voltages` = 2
- `Powers` = 3

"""
module VisualizeQuantity
@enum T::Int32 begin
    Currents = 1 # Currents
    Voltages = 2 # Voltages
    Powers = 3 # Powers
end
end # module VisualizeQuantity

"""
ReductionStrategy (DSS enumeration)

Reduction Strategy

Enumerated values:
- `Default` = 0
- `ShortLines` = 1
- `MergeParallel` = 2
- `BreakLoop` = 3
- `Dangling` = 4
- `Switches` = 5
- `Laterals` = 6

"""
module ReductionStrategy
@enum T::Int32 begin
    Default = 0 # Default
    ShortLines = 1 # ShortLines
    MergeParallel = 2 # MergeParallel
    BreakLoop = 3 # BreakLoop
    Dangling = 4 # Dangling
    Switches = 5 # Switches
    Laterals = 6 # Laterals
end
end # module ReductionStrategy

"""
EarthModel (DSS enumeration)

Earth Model

Enumerated values:
- `Carson` = 1
- `FullCarson` = 2
- `Deri` = 3

"""
module EarthModel
@enum T::Int32 begin
    Carson = 1 # Carson
    FullCarson = 2 # FullCarson
    Deri = 3 # Deri
end
end # module EarthModel

"""
LineType (DSS enumeration)

Line Type

Enumerated values:
- `oh` = 1
- `ug` = 2
- `ug_ts` = 3
- `ug_cn` = 4
- `swt_ldbrk` = 5
- `swt_fuse` = 6
- `swt_sect` = 7
- `swt_rec` = 8
- `swt_disc` = 9
- `swt_brk` = 10
- `swt_elbow` = 11
- `busbar` = 12

"""
module LineType
@enum T::Int32 begin
    oh = 1 # oh
    ug = 2 # ug
    ug_ts = 3 # ug_ts
    ug_cn = 4 # ug_cn
    swt_ldbrk = 5 # swt_ldbrk
    swt_fuse = 6 # swt_fuse
    swt_sect = 7 # swt_sect
    swt_rec = 8 # swt_rec
    swt_disc = 9 # swt_disc
    swt_brk = 10 # swt_brk
    swt_elbow = 11 # swt_elbow
    busbar = 12 # busbar
end
end # module LineType

"""
LengthUnit (DSS enumeration)

Length Unit

Enumerated values:
- `none` = 0
- `mi` = 1
- `kft` = 2
- `km` = 3
- `m` = 4
- `ft` = 5
- `in` = 6
- `cm` = 7
- `mm` = 8

"""
module LengthUnit
using CEnum: @cenum

@cenum T::Int32 begin
    none = 0 # none
    mi = 1 # mi
    kft = 2 # kft
    km = 3 # km
    m = 4 # m
    ft = 5 # ft
    in = 6 # in
    cm = 7 # cm
    mm = 8 # mm
end
end # module LengthUnit

"""
ScanType (DSS enumeration)

Scan Type

Enumerated values:
- `None` = -1
- `Zero` = 0
- `Positive` = 1

"""
module ScanType
@enum T::Int32 begin
    None = -1 # None
    Zero = 0 # Zero
    Positive = 1 # Positive
end
end # module ScanType

"""
SequenceType (DSS enumeration)

Sequence Type

Enumerated values:
- `Negative` = -1
- `Zero` = 0
- `Positive` = 1

"""
module SequenceType
@enum T::Int32 begin
    Negative = -1 # Negative
    Zero = 0 # Zero
    Positive = 1 # Positive
end
end # module SequenceType

"""
Connection (DSS enumeration)

Connection

Enumerated values:
- `Wye` = 0 ("wye")
- `Delta` = 1 ("delta")

"""
module Connection
using CEnum: @cenum

@cenum T::Int32 begin
    Wye = 0 # wye
    Delta = 1 # delta
end
end # module Connection

"""
CoreType (DSS enumeration)

Core Type

Enumerated values:
- `Shell` = 0 ("shell")
- `OnePhase` = 1 ("1-phase")
- `ThreeLeg` = 3 ("3-leg")
- `FourLeg` = 4 ("4-leg")
- `FiveLeg` = 5 ("5-leg")
- `CoreOnePhase` = 9 ("core-1-phase")

"""
module CoreType
@enum T::Int32 begin
    Shell = 0 # shell
    OnePhase = 1 # 1-phase
    ThreeLeg = 3 # 3-leg
    FourLeg = 4 # 4-leg
    FiveLeg = 5 # 5-leg
    CoreOnePhase = 9 # core-1-phase
end
end # module CoreType

"""
PhaseSequence (DSS enumeration)

Phase Sequence

Enumerated values:
- `Lag` = 0
- `Lead` = 1

"""
module PhaseSequence
using CEnum: @cenum

@cenum T::Int32 begin
    Lag = 0 # Lag
    Lead = 1 # Lead
end
end # module PhaseSequence

"""
LoadSolutionModel (DSS enumeration)

Load Solution Model

Enumerated values:
- `PowerFlow` = 1
- `Admittance` = 2

"""
module LoadSolutionModel
@enum T::Int32 begin
    PowerFlow = 1 # PowerFlow
    Admittance = 2 # Admittance
end
end # module LoadSolutionModel

"""
RandomType (DSS enumeration)

Random Type

Enumerated values:
- `None` = 0
- `Gaussian` = 1
- `Uniform` = 2
- `LogNormal` = 3

"""
module RandomType
@enum T::Int32 begin
    None = 0 # None
    Gaussian = 1 # Gaussian
    Uniform = 2 # Uniform
    LogNormal = 3 # LogNormal
end
end # module RandomType

"""
ControlMode (DSS enumeration)

Control Mode

Enumerated values:
- `Off` = -1
- `Static` = 0
- `Event` = 1
- `Time` = 2
- `MultiRate` = 3

"""
module ControlMode
@enum T::Int32 begin
    Off = -1 # Off
    Static = 0 # Static
    Event = 1 # Event
    Time = 2 # Time
    MultiRate = 3 # MultiRate
end
end # module ControlMode

"""
InverterControlMode (DSS enumeration)

Inverter Control Mode

Enumerated values:
- `GFL` = 0
- `GFM` = 1

"""
module InverterControlMode
@enum T::Int32 begin
    GFL = 0 # GFL
    GFM = 1 # GFM
end
end # module InverterControlMode

"""
SolutionMode (DSS enumeration)

Solution Mode

Enumerated values:
- `Snapshot` = 0 ("Snap")
- `Daily` = 1
- `Yearly` = 2
- `M1` = 3
- `LD1` = 4
- `PeakDay` = 5
- `DutyCycle` = 6
- `Direct` = 7
- `MF` = 8
- `FaultStudy` = 9
- `M2` = 10
- `M3` = 11
- `LD2` = 12
- `AutoAdd` = 13
- `Dynamic` = 14
- `Harmonic` = 15
- `Time` = 16
- `HarmonicT` = 17

"""
module SolutionMode
using CEnum: @cenum

@cenum T::Int32 begin
    Snapshot = 0 # Snap
    Daily = 1 # Daily
    Yearly = 2 # Yearly
    M1 = 3 # M1
    LD1 = 4 # LD1
    PeakDay = 5 # PeakDay
    DutyCycle = 6 # DutyCycle
    Direct = 7 # Direct
    MF = 8 # MF
    FaultStudy = 9 # FaultStudy
    M2 = 10 # M2
    M3 = 11 # M3
    LD2 = 12 # LD2
    AutoAdd = 13 # AutoAdd
    Dynamic = 14 # Dynamic
    Harmonic = 15 # Harmonic
    Time = 16 # Time
    HarmonicT = 17 # HarmonicT
end
end # module SolutionMode

"""
SolutionAlgorithm (DSS enumeration)

Solution Algorithm

Enumerated values:
- `Normal` = 0
- `Newton` = 1
- `NCIM` = 2

"""
module SolutionAlgorithm
@enum T::Int32 begin
    Normal = 0 # Normal
    Newton = 1 # Newton
    NCIM = 2 # NCIM
end
end # module SolutionAlgorithm

"""
CircuitModel (DSS enumeration)

Circuit Model

Enumerated values:
- `Multiphase` = 0
- `Positive` = 1

"""
module CircuitModel
@enum T::Int32 begin
    Multiphase = 0 # Multiphase
    Positive = 1 # Positive
end
end # module CircuitModel

"""
AutoAddDeviceType (DSS enumeration)

AutoAdd Device Type

Enumerated values:
- `Generator` = 1
- `Capacitor` = 2

"""
module AutoAddDeviceType
@enum T::Int32 begin
    Generator = 1 # Generator
    Capacitor = 2 # Capacitor
end
end # module AutoAddDeviceType

"""
LoadShapeClass (DSS enumeration)

Load Shape Class

Enumerated values:
- `None` = -1
- `Daily` = 0
- `Yearly` = 1
- `Duty` = 2

"""
module LoadShapeClass
@enum T::Int32 begin
    None = -1 # None
    Daily = 0 # Daily
    Yearly = 1 # Yearly
    Duty = 2 # Duty
end
end # module LoadShapeClass

"""
MonitoredPhase (DSS enumeration)

Monitored Phase

Enumerated values:
- `min` = -3
- `max` = -2
- `avg` = -1

"""
module MonitoredPhase
@enum T::Int32 begin
    min = -3 # min
    max = -2 # max
    avg = -1 # avg
end
end # module MonitoredPhase

"""
PlotProfilePhases (DSS enumeration)

Plot: Profile Phases

Enumerated values:
- `Default` = -1
- `All` = -2
- `Primary` = -3
- `LL3Ph` = -4
- `LLAll` = -5
- `LLPrimary` = -6

"""
module PlotProfilePhases
@enum T::Int32 begin
    Default = -1 # Default
    All = -2 # All
    Primary = -3 # Primary
    LL3Ph = -4 # LL3Ph
    LLAll = -5 # LLAll
    LLPrimary = -6 # LLPrimary
end
end # module PlotProfilePhases


# Class-specific enumerations

"""
`LoadShapeAction` (DSS enumeration)

LoadShape: Action

Enumerated values:
- `Normalize` = 0
- `DblSave` = 1
- `SngSave` = 2

"""
module LoadShapeAction
@enum T::Int32 begin
    Normalize = 0 # Normalize
    DblSave = 1 # DblSave
    SngSave = 2 # SngSave
end
end # module LoadShapeAction

"""
`LoadShapeInterpolation` (DSS enumeration)

LoadShape: Interpolation

Enumerated values:
- `Avg` = 0
- `Edge` = 1

"""
module LoadShapeInterpolation
@enum T::Int32 begin
    Avg = 0 # Avg
    Edge = 1 # Edge
end
end # module LoadShapeInterpolation

"""
`TShapeAction` (DSS enumeration)

TShape: Action

Enumerated values:
- `DblSave` = 0
- `SngSave` = 1

"""
module TShapeAction
@enum T::Int32 begin
    DblSave = 0 # DblSave
    SngSave = 1 # SngSave
end
end # module TShapeAction

"""
`PriceShapeAction` (DSS enumeration)

PriceShape: Action

Enumerated values:
- `DblSave` = 0
- `SngSave` = 1

"""
module PriceShapeAction
@enum T::Int32 begin
    DblSave = 0 # DblSave
    SngSave = 1 # SngSave
end
end # module PriceShapeAction

"""
`VSourceModel` (DSS enumeration)

VSource: Model

Enumerated values:
- `Thevenin` = 0
- `Ideal` = 1

"""
module VSourceModel
@enum T::Int32 begin
    Thevenin = 0 # Thevenin
    Ideal = 1 # Ideal
end
end # module VSourceModel

"""
`LoadModel` (DSS enumeration)

Load: Model

Enumerated values:
- `ConstantPQ` = 1 ("Constant PQ")
- `ConstantZ` = 2 ("Constant Z")
- `Motor` = 3 ("Motor (constant P, quadratic Q)")
- `CVR` = 4 ("CVR (linear P, quadratic Q)")
- `ConstantI` = 5 ("Constant I")
- `ConstantP_FixedQ` = 6 ("Constant P, fixed Q")
- `ConstantP_FixedX` = 7 ("Constant P, fixed X")
- `ZIPV` = 8

"""
module LoadModel
@enum T::Int32 begin
    ConstantPQ = 1 # Constant PQ
    ConstantZ = 2 # Constant Z
    Motor = 3 # Motor (constant P, quadratic Q)
    CVR = 4 # CVR (linear P, quadratic Q)
    ConstantI = 5 # Constant I
    ConstantP_FixedQ = 6 # Constant P, fixed Q
    ConstantP_FixedX = 7 # Constant P, fixed X
    ZIPV = 8 # ZIPV
end
end # module LoadModel

"""
`LoadStatus` (DSS enumeration)

Load: Status

Enumerated values:
- `Variable` = 0
- `Fixed` = 1
- `Exempt` = 2

"""
module LoadStatus
@enum T::Int32 begin
    Variable = 0 # Variable
    Fixed = 1 # Fixed
    Exempt = 2 # Exempt
end
end # module LoadStatus

"""
`CapControlType` (DSS enumeration)

CapControl: Type

Enumerated values:
- `Current` = 0
- `Voltage` = 1
- `kvar` = 2
- `Time` = 3
- `PowerFactor` = 4
- `Follow` = 5

"""
module CapControlType
@enum T::Int32 begin
    Current = 0 # Current
    Voltage = 1 # Voltage
    kvar = 2 # kvar
    Time = 3 # Time
    PowerFactor = 4 # PowerFactor
    Follow = 5 # Follow
end
end # module CapControlType

"""
`DynamicExpDomain` (DSS enumeration)

DynamicExp: Domain

Enumerated values:
- `Time` = 0
- `dq` = 1

"""
module DynamicExpDomain
@enum T::Int32 begin
    Time = 0 # Time
    dq = 1 # dq
end
end # module DynamicExpDomain

"""
`GeneratorModel` (DSS enumeration)

Generator: Model

Enumerated values:
- `ConstantPQ` = 1 ("Constant PQ")
- `ConstantZ` = 2 ("Constant Z")
- `ConstantPV` = 3 ("Constant P|V|")
- `ConstantP_FixedQ` = 4 ("Constant P, Fixed Q")
- `ConstantP_FixedX` = 5 ("Constant P, Fixed X")
- `UserModel` = 6 ("User Model")
- `ApproxInverter` = 7 ("Approximate Inverter Model")

"""
module GeneratorModel
@enum T::Int32 begin
    ConstantPQ = 1 # Constant PQ
    ConstantZ = 2 # Constant Z
    ConstantPV = 3 # Constant P|V|
    ConstantP_FixedQ = 4 # Constant P, Fixed Q
    ConstantP_FixedX = 5 # Constant P, Fixed X
    UserModel = 6 # User Model
    ApproxInverter = 7 # Approximate Inverter Model
end
end # module GeneratorModel

"""
`GeneratorDispatchMode` (DSS enumeration)

Generator: Dispatch Mode

Enumerated values:
- `Default` = 0
- `LoadLevel` = 1
- `Price` = 2

"""
module GeneratorDispatchMode
@enum T::Int32 begin
    Default = 0 # Default
    LoadLevel = 1 # LoadLevel
    Price = 2 # Price
end
end # module GeneratorDispatchMode

"""
`GeneratorStatus` (DSS enumeration)

Generator: Status

Enumerated values:
- `Variable` = 0
- `Fixed` = 1

"""
module GeneratorStatus
@enum T::Int32 begin
    Variable = 0 # Variable
    Fixed = 1 # Fixed
end
end # module GeneratorStatus

"""
`WindGenModel` (DSS enumeration)

WindGen: Model

Enumerated values:
- `ConstantPQ` = 1 ("Constant PQ")
- `ConstantZ` = 2 ("Constant Z")
- `ConstantP_FixedQ` = 4 ("Constant P, fixed Q")
- `ConstantP_FixedX` = 5 ("Constant P, fixed X")

"""
module WindGenModel
@enum T::Int32 begin
    ConstantPQ = 1 # Constant PQ
    ConstantZ = 2 # Constant Z
    ConstantP_FixedQ = 4 # Constant P, fixed Q
    ConstantP_FixedX = 5 # Constant P, fixed X
end
end # module WindGenModel

"""
`WindGenQMode` (DSS enumeration)

WindGen: Q Mode

Enumerated values:
- `Q` = 0
- `PF` = 1
- `VoltVar` = 2

"""
module WindGenQMode
@enum T::Int32 begin
    Q = 0 # Q
    PF = 1 # PF
    VoltVar = 2 # VoltVar
end
end # module WindGenQMode

"""
`StorageState` (DSS enumeration)

Storage: State

Enumerated values:
- `Charging` = -1
- `Idling` = 0
- `Discharging` = 1

"""
module StorageState
@enum T::Int32 begin
    Charging = -1 # Charging
    Idling = 0 # Idling
    Discharging = 1 # Discharging
end
end # module StorageState

"""
`StorageDispatchMode` (DSS enumeration)

Storage: Dispatch Mode

Enumerated values:
- `Default` = 0
- `LoadLevel` = 1
- `Price` = 2
- `External` = 3
- `Follow` = 4

"""
module StorageDispatchMode
@enum T::Int32 begin
    Default = 0 # Default
    LoadLevel = 1 # LoadLevel
    Price = 2 # Price
    External = 3 # External
    Follow = 4 # Follow
end
end # module StorageDispatchMode

"""
`StorageControllerDischargeMode` (DSS enumeration)

StorageController: Discharge Mode

Enumerated values:
- `PeakShave` = 5
- `Follow` = 1
- `Support` = 3
- `LoadShape` = 2
- `Time` = 4
- `Schedule` = 6
- `IPeakShave` = 8 ("I-PeakShave")

"""
module StorageControllerDischargeMode
@enum T::Int32 begin
    PeakShave = 5 # PeakShave
    Follow = 1 # Follow
    Support = 3 # Support
    LoadShape = 2 # LoadShape
    Time = 4 # Time
    Schedule = 6 # Schedule
    IPeakShave = 8 # I-PeakShave
end
end # module StorageControllerDischargeMode

"""
`StorageControllerChargeMode` (DSS enumeration)

StorageController: Charge Mode

Enumerated values:
- `LoadShape` = 2
- `Time` = 4
- `PeakShaveLow` = 7
- `IPeakShaveLow` = 9 ("I-PeakShaveLow")

"""
module StorageControllerChargeMode
@enum T::Int32 begin
    LoadShape = 2 # LoadShape
    Time = 4 # Time
    PeakShaveLow = 7 # PeakShaveLow
    IPeakShaveLow = 9 # I-PeakShaveLow
end
end # module StorageControllerChargeMode

"""
`RelayType` (DSS enumeration)

Relay: Type

Enumerated values:
- `Current` = 0
- `Voltage` = 1
- `ReversePower` = 3
- `F46` = 4 ("46")
- `F47` = 5 ("47")
- `Generic` = 6
- `Distance` = 7
- `TD21` = 8
- `DOC` = 9

"""
module RelayType
@enum T::Int32 begin
    Current = 0 # Current
    Voltage = 1 # Voltage
    ReversePower = 3 # ReversePower
    F46 = 4 # 46
    F47 = 5 # 47
    Generic = 6 # Generic
    Distance = 7 # Distance
    TD21 = 8 # TD21
    DOC = 9 # DOC
end
end # module RelayType

"""
`RelayAction` (DSS enumeration)

Relay: Action

Enumerated values:
- `Current` = 0
- `Voltage` = 1
- `ReversePower` = 3
- `relay46` = 4 (`46` in OpenDSS)
- `relay47` = 5 (`47` in OpenDSS)
- `Generic` = 6
- `Distance` = 7
- `TD21` = 8
- `DOC` = 9

"""
module RelayAction
using CEnum

@cenum T::Int32 begin
    Current = 0 # Current
    Voltage = 1 # Voltage
    ReversePower = 3 # ReversePower
    relay46 = 4 # 46
    relay47 = 5 # 47
    Generic = 6 # Generic
    Distance = 7 # Distance
    TD21 = 8 # TD21
    DOC = 9 # DOC
end
end # module RelayAction

"""
`RelayState` (DSS enumeration)

Relay: State

Enumerated values:
- `closed` = 2
- `open` = 1
- `trip` = 1

"""
module RelayState
using CEnum

@cenum T::Int32 begin
    closed = 2 # closed
    open = 1 # open
    trip = 1 # trip
end
end # module RelayState

"""
`RecloserAction` (DSS enumeration)

Recloser: Action

Enumerated values:

"""
module RecloserAction
using CEnum

@cenum T::Int32 begin
end
end # module RecloserAction

"""
`RecloserState` (DSS enumeration)

Recloser: State

Enumerated values:
- `closed` = 2
- `open` = 1
- `trip` = 1

"""
module RecloserState
using CEnum

@cenum T::Int32 begin
    closed = 2 # closed
    open = 1 # open
    trip = 1 # trip
end
end # module RecloserState

"""
`FuseAction` (DSS enumeration)

Fuse: Action

Enumerated values:
- `close` = 2
- `open` = 1

"""
module FuseAction
@enum T::Int32 begin
    close = 2 # close
    open = 1 # open
end
end # module FuseAction

"""
`FuseState` (DSS enumeration)

Fuse: State

Enumerated values:
- `closed` = 2
- `open` = 1

"""
module FuseState
@enum T::Int32 begin
    closed = 2 # closed
    open = 1 # open
end
end # module FuseState

"""
`SwtControlAction` (DSS enumeration)

SwtControl: Action

Enumerated values:
- `close` = 2
- `open` = 1

"""
module SwtControlAction
@enum T::Int32 begin
    close = 2 # close
    open = 1 # open
end
end # module SwtControlAction

"""
`SwtControlState` (DSS enumeration)

SwtControl: State

Enumerated values:
- `closed` = 2
- `open` = 1

"""
module SwtControlState
@enum T::Int32 begin
    closed = 2 # closed
    open = 1 # open
end
end # module SwtControlState

"""
`PVSystemModel` (DSS enumeration)

PVSystem: Model

Enumerated values:
- `ConstantP_PF` = 1 ("Constant P, PF")
- `ConstantY` = 2 ("Constant Y")
- `UserModel` = 3 ("User model")

"""
module PVSystemModel
@enum T::Int32 begin
    ConstantP_PF = 1 # Constant P, PF
    ConstantY = 2 # Constant Y
    UserModel = 3 # User model
end
end # module PVSystemModel

"""
`UPFCMode` (DSS enumeration)

UPFC: Mode

Enumerated values:
- `Off` = 0
- `VoltageRegulator` = 1 ("Voltage Regulator")
- `PhaseAngleRegulator` = 2 ("Phase Angle Regulator")
- `DualRegulator` = 3 ("Dual Regulator")
- `DoubleReference_Voltage` = 4 ("Double Reference (Voltage)")
- `DoubleReference_Dual` = 5 ("Double Reference (Dual)")

"""
module UPFCMode
@enum T::Int32 begin
    Off = 0 # Off
    VoltageRegulator = 1 # Voltage Regulator
    PhaseAngleRegulator = 2 # Phase Angle Regulator
    DualRegulator = 3 # Dual Regulator
    DoubleReference_Voltage = 4 # Double Reference (Voltage)
    DoubleReference_Dual = 5 # Double Reference (Dual)
end
end # module UPFCMode

"""
`ESPVLControlType` (DSS enumeration)

ESPVLControl: Type

Enumerated values:
- `SystemController` = 1
- `LocalController` = 2

"""
module ESPVLControlType
@enum T::Int32 begin
    SystemController = 1 # SystemController
    LocalController = 2 # LocalController
end
end # module ESPVLControlType

"""
`IndMach012SlipOption` (DSS enumeration)

IndMach012: Slip Option

Enumerated values:
- `VariableSlip` = 0
- `FixedSlip` = 1

"""
module IndMach012SlipOption
@enum T::Int32 begin
    VariableSlip = 0 # VariableSlip
    FixedSlip = 1 # FixedSlip
end
end # module IndMach012SlipOption

"""
`AutoTransConnection` (DSS enumeration)

AutoTrans: Connection

Enumerated values:
- `Wye` = 0 ("wye")
- `Delta` = 1 ("delta")
- `Series` = 2 ("series")

"""
module AutoTransConnection
using CEnum

@cenum T::Int32 begin
    Wye = 0 # wye
    Delta = 1 # delta
    Series = 2 # series
end
end # module AutoTransConnection

"""
`RegControlPhaseSelection` (DSS enumeration)

RegControl: Phase Selection

Enumerated values:
- `min` = -3
- `max` = -2

"""
module RegControlPhaseSelection
@enum T::Int32 begin
    min = -3 # min
    max = -2 # max
end
end # module RegControlPhaseSelection

"""
`InvControlControlMode` (DSS enumeration)

InvControl: Control Mode

Enumerated values:
- `Voltvar` = 1
- `VoltWatt` = 2
- `DynamicReaccurr` = 3
- `WattPF` = 4
- `Wattvar` = 5
- `AVR` = 6
- `GFM` = 7

"""
module InvControlControlMode
@enum T::Int32 begin
    Voltvar = 1 # Voltvar
    VoltWatt = 2 # VoltWatt
    DynamicReaccurr = 3 # DynamicReaccurr
    WattPF = 4 # WattPF
    Wattvar = 5 # Wattvar
    AVR = 6 # AVR
    GFM = 7 # GFM
end
end # module InvControlControlMode

"""
`InvControlCombiMode` (DSS enumeration)

InvControl: Combi Mode

Enumerated values:
- `VV_VW` = 1
- `VV_DRC` = 2

"""
module InvControlCombiMode
@enum T::Int32 begin
    VV_VW = 1 # VV_VW
    VV_DRC = 2 # VV_DRC
end
end # module InvControlCombiMode

"""
`InvControlVoltageCurveXRef` (DSS enumeration)

InvControl: Voltage Curve X Ref

Enumerated values:
- `Rated` = 0
- `Avg` = 1
- `RAvg` = 2

"""
module InvControlVoltageCurveXRef
@enum T::Int32 begin
    Rated = 0 # Rated
    Avg = 1 # Avg
    RAvg = 2 # RAvg
end
end # module InvControlVoltageCurveXRef

"""
`InvControlVoltWattYAxis` (DSS enumeration)

InvControl: Volt-Watt Y-Axis

Enumerated values:
- `PAvailablePU` = 0
- `PMPPPU` = 1
- `PctPMPPPU` = 2
- `KVARatingPU` = 3

"""
module InvControlVoltWattYAxis
@enum T::Int32 begin
    PAvailablePU = 0 # PAvailablePU
    PMPPPU = 1 # PMPPPU
    PctPMPPPU = 2 # PctPMPPPU
    KVARatingPU = 3 # KVARatingPU
end
end # module InvControlVoltWattYAxis

"""
`InvControlRateOfChangeMode` (DSS enumeration)

InvControl: Rate-of-change Mode

Enumerated values:
- `Inactive` = 0
- `LPF` = 1
- `RiseFall` = 2

"""
module InvControlRateOfChangeMode
@enum T::Int32 begin
    Inactive = 0 # Inactive
    LPF = 1 # LPF
    RiseFall = 2 # RiseFall
end
end # module InvControlRateOfChangeMode

"""
`InvControlReactivePowerReference` (DSS enumeration)

InvControl: Reactive Power Reference

Enumerated values:
- `VARAVAL` = 0
- `VARMAX` = 1

"""
module InvControlReactivePowerReference
@enum T::Int32 begin
    VARAVAL = 0 # VARAVAL
    VARMAX = 1 # VARMAX
end
end # module InvControlReactivePowerReference

"""
`InvControlControlModel` (DSS enumeration)

InvControl: Control Model

Enumerated values:
- `Linear` = 0
- `Exponential` = 1

"""
module InvControlControlModel
@enum T::Int32 begin
    Linear = 0 # Linear
    Exponential = 1 # Exponential
end
end # module InvControlControlModel

"""
`GICTransformerType` (DSS enumeration)

GICTransformer: Type

Enumerated values:
- `GSU` = 1
- `Auto` = 2
- `YY` = 3

"""
module GICTransformerType
@enum T::Int32 begin
    GSU = 1 # GSU
    Auto = 2 # Auto
    YY = 3 # YY
end
end # module GICTransformerType

"""
`VSConverterControlMode` (DSS enumeration)

VSConverter: Control Mode

Enumerated values:
- `Fixed` = 0
- `PacVac` = 1
- `PacQac` = 2
- `VdcVac` = 3
- `VdcQac` = 4

"""
module VSConverterControlMode
@enum T::Int32 begin
    Fixed = 0 # Fixed
    PacVac = 1 # PacVac
    PacQac = 2 # PacQac
    VdcVac = 3 # VdcVac
    VdcQac = 4 # VdcQac
end
end # module VSConverterControlMode

"""
`MonitorAction` (DSS enumeration)

Monitor: Action

Enumerated values:
- `Clear` = 0
- `Save` = 1
- `TakeSample` = 2
- `Process` = 3
- `Reset` = 0

"""
module MonitorAction
using CEnum

@cenum T::Int32 begin
    Clear = 0 # Clear
    Save = 1 # Save
    TakeSample = 2 # TakeSample
    Process = 3 # Process
    Reset = 0 # Reset
end
end # module MonitorAction

"""
`EnergyMeterAction` (DSS enumeration)

EnergyMeter: Action

Enumerated values:
- `Allocate` = 0
- `Clear` = 1
- `Reduce` = 2
- `Save` = 3
- `TakeSample` = 4
- `ZoneDump` = 5

"""
module EnergyMeterAction
@enum T::Int32 begin
    Allocate = 0 # Allocate
    Clear = 1 # Clear
    Reduce = 2 # Reduce
    Save = 3 # Save
    TakeSample = 4 # TakeSample
    ZoneDump = 5 # ZoneDump
end
end # module EnergyMeterAction

"""
`FMonitorAction` (DSS enumeration)

FMonitor: Action

Enumerated values:
- `Clear` = 0
- `Reset` = 0

"""
module FMonitorAction
using CEnum

@cenum T::Int32 begin
    Clear = 0 # Clear
    Reset = 0 # Reset
end
end # module FMonitorAction

end # module Enums
