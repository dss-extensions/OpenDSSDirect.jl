
<a id='flag-objects'></a>
# Flag objects


Several flag variables are also defined, each with multiple entries defined. 


Here is an example of use of `CapControlModes.KVAR`: 


```julia
CapControls.Mode(CapControlModes.KVAR)
```

- [`ActionCodes`](flags.md#OpenDSSDirect.DSS.ActionCodes)
- [`CapControlModes`](flags.md#OpenDSSDirect.DSS.CapControlModes)
- [`LineUnits`](flags.md#OpenDSSDirect.DSS.LineUnits)
- [`LoadModels`](flags.md#OpenDSSDirect.DSS.LoadModels)
- [`LoadStatus`](flags.md#OpenDSSDirect.DSS.LoadStatus)
- [`MonitorModes`](flags.md#OpenDSSDirect.DSS.MonitorModes)
- [`Options`](flags.md#OpenDSSDirect.DSS.Options)
- [`SolveModes`](flags.md#OpenDSSDirect.DSS.SolveModes)

...


<a id='OpenDSSDirect.DSS.ActionCodes' href='#OpenDSSDirect.DSS.ActionCodes'>#</a>**OpenDSSDirect.DSS.ActionCodes** &mdash; *Module*.

---

ActionCodes flags - options include:

  * `None` :  No action
  * `Open` :  Open a switch
  * `Close` :  Close a switch
  * `Reset` :  Reset to the shelf state (unlocked, closed for a switch
  * `Lock` :  Lock a switch, prventing both manual and automatic operation
  * `Unlock` :  Unlock a switch, permitting both manual and automatic operation
  * `TapUp` :  Move a regulator tap up
  * `TapDown` : Move a regulator tap down



<a id='OpenDSSDirect.DSS.CapControlModes' href='#OpenDSSDirect.DSS.CapControlModes'>#</a>**OpenDSSDirect.DSS.CapControlModes** &mdash; *Module*.

---

CapControlModes flags - options include:

  * `Current` : Current control, ON and OFF settings on CT secondary
  * `Voltage` : Voltage control, ON and OFF settings on the PT secondary base
  * `KVAR` : kvar control, ON and OFF settings on PT / CT base
  * `Time` : Time control ON and OFF settings are seconds from midnight
  * `PF` : ON and OFF settings are power factor, negative for leading

Example: 

```
capcontrols.Mode(CapControlModes.KVAR)
```



<a id='OpenDSSDirect.DSS.LineUnits' href='#OpenDSSDirect.DSS.LineUnits'>#</a>**OpenDSSDirect.DSS.LineUnits** &mdash; *Module*.

---

LineUnits flags - options include:

  * `None` :  No line length unit.
  * `Miles` :  Line length units in miles.
  * `kFt` :  Line length units are in thousand feet.
  * `km` :  Line length units are km.
  * `meter` :  Line length units are Meters.
  * `ft` :  Line units in feet.
  * `inch` :  Line length units are inches.
  * `cm` :  Line units are cm.
  * `mm` :  Line length units are mm.
  * `Maxnum` : Maximum number of line units constants.



<a id='OpenDSSDirect.DSS.LoadModels' href='#OpenDSSDirect.DSS.LoadModels'>#</a>**OpenDSSDirect.DSS.LoadModels** &mdash; *Module*.

---

LoadModels flags - options include:

  * `ConstPQ`
  * `ConstZ`
  * `Motor`
  * `CVR`
  * `ConstI`
  * `ConstPFixedQ`
  * `ConstPFixedX`
  * `ZIPV`



<a id='OpenDSSDirect.DSS.LoadStatus' href='#OpenDSSDirect.DSS.LoadStatus'>#</a>**OpenDSSDirect.DSS.LoadStatus** &mdash; *Module*.

---

LoadStatus flags - options include:

  * `Variable`
  * `Fixed`
  * `Exempt`



<a id='OpenDSSDirect.DSS.Options' href='#OpenDSSDirect.DSS.Options'>#</a>**OpenDSSDirect.DSS.Options** &mdash; *Module*.

---

Options flags - options include:

  * `PowerFlow` :  Power Flow load model option
  * `Admittance` :  Admittance load model option
  * `NormalSolve` :  Solution algorithm option ‐ Normal solution mode
  * `NewtonSolve` :  Solution algorithm option ‐ Newton solution
  * `Static` :  Control Mode option ‐ Static
  * `Event` :  Control Mode Option ‐ Event driven solution mode
  * `Time` :  Control mode option ‐ Time driven mode
  * `Multiphase` :  Circuit model is multiphase (default)
  * `PositiveSeq` :  Circuit model is positive sequence model only
  * `Gaussian` :  Random mode = Gaussian
  * `Uniform` :  Random mode = Uniform
  * `LogNormal` :  Random Mode = Log normal
  * `AddGen` :  Add generators in AutoAdd mode
  * `AddCap` :  Add capacitors in AutoAdd mode
  * `ControlOFF` :  Control Mode OFF = ‐1



<a id='OpenDSSDirect.DSS.MonitorModes' href='#OpenDSSDirect.DSS.MonitorModes'>#</a>**OpenDSSDirect.DSS.MonitorModes** &mdash; *Module*.

---

MonitorModes flags - options include:

  * `VI` : Monitor records Voltage and Current at the terminal (Default)
  * `Power` : Monitor records kW, kvar or kVA, angle values, etc. at the terminal to which it is connected
  * `Taps` : For monitoring Regulator and Transformer taps
  * `States` : For monitoring State Variables (for PC Elements only)
  * `Sequence` : Reports the monitored quantities as sequence quantities
  * `Magnitude` : Reports the monitored quantities in Magnitude Only
  * `PosOnly` : Reports the Positive Seq only or avg of all phases

`Sequence`, `Magnitude`, and `PosOnly` are bit-level flags that can be combined with other flags. It's best to use `&` to test for one of these flags. Use `|` to  combine flags.

Examples: 

```
Monitors.Mode() & MonitorModes.Power
Monitors.Mode(MonitorModes.Magnitude | MonitorModes.Power)
```



<a id='OpenDSSDirect.DSS.SolveModes' href='#OpenDSSDirect.DSS.SolveModes'>#</a>**OpenDSSDirect.DSS.SolveModes** &mdash; *Module*.

---

SolveModes flags - options include:

  * `SnapShot` : Solve a single snapshot power flow
  * `DutyCycle` : Solve following Duty Cycle load shapes
  * `Direct` : Solve direct (forced admittance model
  * `Daily` : Solve following Daily load shapes
  * `Monte1` : Monte Carlo Mode 1
  * `Monte2` :  Monte Carlo Mode 2
  * `Monte3` :  Monte Carlo Mode 3
  * `FaultStudy` : Fault study at all buses
  * `Yearly` : Solve following Yearly load shapes
  * `MonteFault` : Monte carlo Fault Study
  * `PeakDay` : Solves for Peak Day using Daily load curve
  * `LD1` : Load‐duration Mode 1
  * `LD2` :  Load‐Duration Mode 2
  * `AutoAdd` :  Auto add generators or capacitors
  * `Harmonic` :   (no Help string available)
  * `Dynamic`


