
<a id='main-api-module-dss'></a>
# Main API (module DSS)


The `dss` function is the main function for passing commands to OpenDSS. You can pass multi-line commands with `dss`. You can also splice in Julia values with string interpolation. Here is an  example of using `dss`:


```julia
using OpenDSSDirect
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
```


Several functions are available for setting OpenDSS variables, getting values, and initiating commands. Each of these is in one of several modules. Here is an  example to set the `kW` of the active load element:


```julia
Loads.kW(50.)
```


Here is an example setting some loads:


```julia
using OpenDSSDirect
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
loadnumber = DSS.Loads.First()
while loadnumber > 0
    DSS.Loads.kW(50.)
    DSS.Loads.kvar(20.)
    loadnumber = DSS.Loads.Next()
end
println(DSS.Loads.Count()) 
```


To use this API, you can either use `import OpenDSSDirect` and prepend all of the functions with `DSS.`, or you can `import OpenDSSDirect.DSS` and use the functions directly. The following two are equivalent:


```julia
using OpenDSSDirect
DSS.Circuit.TotalPower()
```


Importing the DSS module:


```julia
using OpenDSSDirect.DSS
Circuit.TotalPower()
```


Many of the functions that return arrays convert to complex numbers where appropriate. Here is an example session:


```julia
julia> using OpenDSSDirect.DSS

julia> filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss");

julia> dss("""
           clear
           compile $filename
       """)

julia> Solution.Solve();

julia> Circuit.Losses()
1.218242333223247e6 + 2.798391857088721e6im

julia> Circuit.TotalPower()
-12004.740450109337 - 1471.1749507157301im

julia> Circuit.SetActiveElement("Capacitor.CAPBank3")
"6075"

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
julia> using OpenDSSDirect.DSS

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


Here is a list of modules supported by this API. Each module has several functions.

- [`ActiveClass`](api.md#OpenDSSDirect.DSS.ActiveClass)
- [`Basic`](api.md#OpenDSSDirect.DSS.Basic)
- [`Bus`](api.md#OpenDSSDirect.DSS.Bus)
- [`CapControls`](api.md#OpenDSSDirect.DSS.CapControls)
- [`Capacitors`](api.md#OpenDSSDirect.DSS.Capacitors)
- [`Circuit`](api.md#OpenDSSDirect.DSS.Circuit)
- [`CktElement`](api.md#OpenDSSDirect.DSS.CktElement)
- [`CtrlQueue`](api.md#OpenDSSDirect.DSS.CtrlQueue)
- [`Element`](api.md#OpenDSSDirect.DSS.Element)
- [`Executive`](api.md#OpenDSSDirect.DSS.Executive)
- [`Fuses`](api.md#OpenDSSDirect.DSS.Fuses)
- [`Generators`](api.md#OpenDSSDirect.DSS.Generators)
- [`Isource`](api.md#OpenDSSDirect.DSS.Isource)
- [`Lines`](api.md#OpenDSSDirect.DSS.Lines)
- [`LoadShape`](api.md#OpenDSSDirect.DSS.LoadShape)
- [`Loads`](api.md#OpenDSSDirect.DSS.Loads)
- [`Meters`](api.md#OpenDSSDirect.DSS.Meters)
- [`Monitors`](api.md#OpenDSSDirect.DSS.Monitors)
- [`PDElements`](api.md#OpenDSSDirect.DSS.PDElements)
- [`PVsystems`](api.md#OpenDSSDirect.DSS.PVsystems)
- [`Parser`](api.md#OpenDSSDirect.DSS.Parser)
- [`Progress`](api.md#OpenDSSDirect.DSS.Progress)
- [`Reclosers`](api.md#OpenDSSDirect.DSS.Reclosers)
- [`RegControls`](api.md#OpenDSSDirect.DSS.RegControls)
- [`Relays`](api.md#OpenDSSDirect.DSS.Relays)
- [`Sensors`](api.md#OpenDSSDirect.DSS.Sensors)
- [`Settings`](api.md#OpenDSSDirect.DSS.Settings)
- [`Solution`](api.md#OpenDSSDirect.DSS.Solution)
- [`SwtControls`](api.md#OpenDSSDirect.DSS.SwtControls)
- [`Topology`](api.md#OpenDSSDirect.DSS.Topology)
- [`Transformers`](api.md#OpenDSSDirect.DSS.Transformers)
- [`Vsources`](api.md#OpenDSSDirect.DSS.Vsources)
- [`XYCurves`](api.md#OpenDSSDirect.DSS.XYCurves)

<a id='activeclass'></a>
## `ActiveClass`


<a id='OpenDSSDirect.DSS.ActiveClass' href='#OpenDSSDirect.DSS.ActiveClass'>#</a>**OpenDSSDirect.DSS.ActiveClass** &mdash; *Module*.

---

**module ActiveClass** – Functions for interfacing with the active OpenDSS class.

`ActiveClass.First()` – Sets the first element in the active class to be the active object; if object is a CktElement, ActiveCktElement also points to this element; returns 0 if none

`ActiveClass.Next()` – Sets the next element in the active class to be the active object; if object is a CktElement, ActiveCktElement also points to this element; returns 0 if no more

`ActiveClass.NumElements()` – Number of elements in the active class

`ActiveClass.Count()` – Number of elements in the active class; same as NumElements

`ActiveClass.Name()` – Name of the active element of the active class

`ActiveClass.Name(arg)` – Set the name of the active element of the active class

`ActiveClass.ActiveClassName()` – Name of the active class

`ActiveClass.AllNames()` – All element names in the active class



<a id='basic'></a>
## `Basic`


<a id='OpenDSSDirect.DSS.Basic' href='#OpenDSSDirect.DSS.Basic'>#</a>**OpenDSSDirect.DSS.Basic** &mdash; *Module*.

---

**module Basic** – Includes methods for basic OpenDSS information.

`Basic.NumCircuits()` – Number of Circuits currently defined

`Basic.ClearAll()` – Clears all circuit definitions

`Basic.ShowPanel()` – Shows non‐MDI child form of the Main DSS Edit Form

`Basic.Start()` – Validate the user and start OpenDSS; returns true if successful

`Basic.NumClasses()` – Number of DSS intrinsic classes

`Basic.NumUserClasses()` – Number of user‐defined classes

`Basic.Reset()` – Resets DSS Initialization for restarts

`Basic.AllowForms()` – Bool flag on the status of allowing forms

`Basic.AllowForms(arg)` – Bool flag to disable forms (once disabled, can’t be enabled again)

`Basic.NewCircuit()` – Make a new circuit

`Basic.Version()` – Get version string for OpenDSS

`Basic.DataPath()` – Default file path for reports, etc.

`Basic.DataPath(arg)` – Set the default file path for reports, etc.

`Basic.DefaultEditor()` – The path name for the default text editor

`Basic.Classes()` – List of the names of intrinsic classes

`Basic.UserClasses()` – List of the names of user-defined classes



<a id='bus'></a>
## `Bus`


<a id='OpenDSSDirect.DSS.Bus' href='#OpenDSSDirect.DSS.Bus'>#</a>**OpenDSSDirect.DSS.Bus** &mdash; *Module*.

---

**module Bus** – Functions for interfacing with the active OpenDSS bus.

`Bus.NumNodes()` – Number of nodes

`Bus.ZscRefresh()` – Refresh Zsc and Ysc values; execute after a major change in the circuit

`Bus.Coorddefined()` – Returns true if the X-Y coordinates are defined for the active bus

`Bus.GetUniqueNodeNumber()` – Returns a unique node number at the active bus to avoid node collisions and adds it to the node list for the bus

`Bus.N_Customers()` – Returns the total number of customers downline from the active bus after reliability calcs

`Bus.SectionID()` – Integer ID of the feeder section in which this bus is located

`Bus.kVBase()` – Base voltage

`Bus.X()` – X coordinate of the bus

`Bus.X(arg)` – Set the X coordinate of the bus

`Bus.Y()` – Y coordinate of the bus

`Bus.Y(arg)` – Set the Y coordinate of the bus

`Bus.Distance()` – Distance in km that this bus isfrom the parent EnergyMeter

`Bus.Lambda()` – Total annual failure rate for active bus after reliability calcs

`Bus.N_interrupts()` – Number of interruptions this bus per year

`Bus.Int_Duration()` – Average interruption duration, hours

`Bus.Cust_Interrupts()` – Annual number of customer-interruptions from this bus

`Bus.Cust_Duration()` – Accumulated customer outage durations, hours

`Bus.TotalMiles()` – Total length of line downline from this bus, miles

`Bus.Name()` – Active bus name; set the active bus by name with `circuit.SetActiveBus(name)`

`Bus.Voltages()` – Bus voltages, complex

`Bus.SeqVoltages()` – Sequence voltages in order of 0, 1, then 2

`Bus.Nodes()` – Vector of node numbers defined at the bus in the same order as the voltages

`Bus.Voc()` – Open-circuit voltage vector, complex

`Bus.Isc()` – Short-circuit current vector, complex

`Bus.PuVoltage()` – Per-unit voltages at the bus, complex

`Bus.ZscMatrix()` – Short-circuit impedance matrix, complex

`Bus.Zsc1()` – Positive-sequence short-circuit impedance looking into the bus, complex

`Bus.Zsc0()` – Zero-sequence short-circuit impedance looking into the bus, complex

`Bus.YscMatrix()` – Short-circuit admittance matrix, complex

`Bus.CplxSeqVoltages()` – All complex sequence voltages

`Bus.VLL()` – Complex vector of line-to-line voltages for 2- and 3-phase buses; returns -1. for a 1-phase bus; for more than 3 phases, only returns 3 phases

`Bus.puVLL()` – Complex vector of per-unit line-to-line voltages for 2- and 3-phase buses; returns -1. for a 1-phase bus; for more than 3 phases, only returns 3 phases

`Bus.VMagAngle()` – Bus voltage magnitudes with angles

`Bus.puVmagAngle()` – Bus voltage magnitudes (per unit) with angles



<a id='capacitors'></a>
## `Capacitors`


<a id='OpenDSSDirect.DSS.Capacitors' href='#OpenDSSDirect.DSS.Capacitors'>#</a>**OpenDSSDirect.DSS.Capacitors** &mdash; *Module*.

---

**module Capacitors** – Functions for interfacing with the active OpenDSS capacitor.

`Capacitors.NumSteps()` – Number of steps

`Capacitors.NumSteps(arg)` – Set the number of steps

`Capacitors.IsDelta()` – Is the connection a delta

`Capacitors.IsDelta(arg)` – Set connection type; use `arg==true` for delta and `arg==false` for wye

`Capacitors.First()` – Sets the first Capacitor active; returns 0 if none

`Capacitors.Next()` – Sets the next Capacitor active; returns 0 if no more

`Capacitors.Count()` – Number of capacitor objects in the active circuit

`Capacitors.AddStep()` – Adds one step of the capacitor if available; if successful, returns 1

`Capacitors.SubtractStep()` – Subtracts one step of the capacitor; if no more steps, returns 0

`Capacitors.AvailableSteps()` – Number of steps available in the cap bank to be switched ON

`Capacitors.Open()` – Open all steps, all phases of the capacitor

`Capacitors.Close()` – Close all steps of all phases of the capacitor

`Capacitors.kV()` – Bank kV rating; use LL for 2 or 3 phases, or actual can rating for 1 phase

`Capacitors.kV(arg)` – Set the bank kV rating; use LL for 2 or 3 phases, or actual can rating for 1 phase

`Capacitors.kvar()` – Total bank kvar, distributed equally among phases and steps

`Capacitors.kvar(arg)` – Set the total bank kvar, distributed equally among phases and steps

`Capacitors.Name()` – The name of the active capacitor

`Capacitors.Name(arg)` – Sets the active capacitor by name

`Capacitors.AllNames()` – All capacitor names in the circuit

`Capacitors.States()` – A vector of  integers [0..numsteps‐1] indicating state of each step; if value is ‐1 an error has occurred.



<a id='capcontrols'></a>
## `CapControls`


<a id='OpenDSSDirect.DSS.CapControls' href='#OpenDSSDirect.DSS.CapControls'>#</a>**OpenDSSDirect.DSS.CapControls** &mdash; *Module*.

---

**module CapControls** – Functions for interfacing with the active OpenDSS CapControl.

`CapControls.First()` – Sets the first CapControl active; returns 0 if none

`CapControls.Next()` – Sets the next CapControl active; returns 0 if no more

`CapControls.Mode()` – Type of automatic controller; for meaning, see CapControlModes

`CapControls.Mode(arg)` – Set the type of automatic controller; for choices, see CapControlModes

`CapControls.MonitoredTerm()` – Terminal number on the element that PT and CT are connected to

`CapControls.MonitoredTerm(arg)` – Set the terminal number on the element that PT and CT are connected to

`CapControls.UseVoltOverride()` – Bool flag that enables Vmin and Vmax to override the control mode

`CapControls.UseVoltOverride(arg)` – Set the Bool flag that enables Vmin and Vmax to override the control mode

`CapControls.Count()` – Number of CapControls in the active circuit

`CapControls.CTRatio()` – Transducer ratio from primary current to control current

`CapControls.CTRatio(arg)` – Set the transducer ratio from primary current to control current

`CapControls.PTRatio()` – Transducer ratio from primary voltage to control voltage

`CapControls.PTRatio(arg)` – Set the transducer ratio from primary voltage to control voltage

`CapControls.ONSetting()` – Threshold to arm or switch on a step; see Mode for units

`CapControls.ONSetting(arg)` – Set the threshold to arm or switch on a step; see Mode for units

`CapControls.OFFSetting()` – Threshold to switch off a step; see the particular CapControlModes option for units

`CapControls.OFFSetting(arg)` – Set the threshold to switch off a step; see the particular CapControlModes option for units

`CapControls.Vmax()` – With VoltOverride, switch off whenever PT voltage exceeds this level

`CapControls.Vmax(arg)` – Set Vmax; with VoltOverride, switch off whenever PT voltage exceeds this level

`CapControls.Vmin()` – With VoltOverride, switch on whenever PT voltage drops below this level

`CapControls.Vmin(arg)` – Set Vmin; with VoltOverride, switch on whenever PT voltage drops below this level

`CapControls.Delay()` – Time delay [s] to switch on after arming; control may reset before actuallyswitching

`CapControls.Delay(arg)` – Set the time delay [s] to switch on after arming; control may reset before actuallyswitching

`CapControls.DelayOff()` – Time delay [s] before switching off a step; control may reset before actuallyswitching

`CapControls.DelayOff(arg)` – Set the time delay [s] before switching off a step; control may reset before actually switching

`CapControls.Name()` – The name of the active CapControl

`CapControls.Name(arg)` – Set the active CapControl by name

`CapControls.Capacitor()` – Name of the Capacitor that is controlled

`CapControls.Capacitor(arg)` – Set the Capacitor (by name) that is controlled

`CapControls.MonitoredObj()` – Full name of the element that PT and CT are connected to

`CapControls.MonitoredObj(arg)` – Set the element (by full name) that PT and CT are connected to

`CapControls.AllNames()` – Names of all CapControls in the circuit



<a id='circuit'></a>
## `Circuit`


<a id='OpenDSSDirect.DSS.Circuit' href='#OpenDSSDirect.DSS.Circuit'>#</a>**OpenDSSDirect.DSS.Circuit** &mdash; *Module*.

---

**module Circuit** – Functions for interfacing with the active OpenDSS circuit.

`Circuit.NumCktElements()` – Number of CktElements in the circuit

`Circuit.NumBuses()` – Total number of Buses in the circuit

`Circuit.NumNodes()` – Total number of Nodes in the circuit

`Circuit.FirstPCElement()` – Sets the first enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0

`Circuit.NextPCElement()` – Sets the next enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0

`Circuit.FirstPDElement()` – Sets the first enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0

`Circuit.NextPDElement()` – Sets the next enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0

`Circuit.Sample()` – Force all Meters and Monitors to take a sample

`Circuit.SaveSample()` – Force all Meters and Monitors to save their current buffers

`Circuit.SetActiveBusi(arg)` – Sets the active bus by integer index. The index is 0 based. That is, the first bus has an index of 0. Returns -1 if an error occurs.

`Circuit.FirstElement()` – Sets First element of active class to be the Active element in the active circuit. Returns 0 if none.

`Circuit.NextElement()` – Sets the next element of the active class to be the active element in the active circuit. Returns 0 if no more elements.

`Circuit.UpdateStorage()` – Forces update to all storage classes. Typically done after a solution. Done automatically in intrinsic solution modes.

`Circuit.ParentPDElement()` – Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable.

`Circuit.EndOfTimeStepUpdate()` – Calls EndOfTimeStepCleanup in SolutionAlgs

`Circuit.Capacity(arg1, arg2)` – Executes the DSS capacity function. Start is the per unit load multiplier for the current year at which to start the search. Increment is the per unit value by which the load increments for each step of the analysis. The program sets the load at the Start value the PRESENT YEAR (including growth) and increments the load until something in thecircuit reports an overload or undervoltage violation. The function returns the total load at which the violation occurs or the peak load for the present year if no violations.

`Circuit.Name()` – Name of the active circuit

`Circuit.Disable(arg)` – Disable a circuit element by name (full name).

`Circuit.Enable(arg)` – Enable a circuit element by name (full name).

`Circuit.SetActiveElement(arg)` – Activate an element of the active circuit by name. Returns a string with the index of the active element.

`Circuit.SetActiveBus(arg)` – Sets the active bus by name. Returns a 0 based index of the bus to use for future direct indexing of bus values returned in arrays. Returns -1 if an error occurs.

`Circuit.SetActiveClass(arg)` – Sets the active class by name.  Use FirstElement, NextElement to iterate through the class. Returns ‐1 if fails.

`Circuit.Losses()` – Watt and var losses in the entire circuit, complex

`Circuit.LineLosses()` – Watt and var losses in all the Line elements in the circuit, complex

`Circuit.SubstationLosses()` – Watt and var losses in all the Transformer elements in the circuit that are designated as substations

`Circuit.TotalPower()` – Returns the total power in kW and kvar supplied to the circuit by all Vsource and Isource objects. Does not include Generator objects. Complex.

`Circuit.AllBusVolts()` – Returns the voltage (complex) for every node in the circuit as a complex vector. The order of the array is the same as AllNodeNames property. The array is constructed bus-by-bus and then by node at each bus. Thus, all nodes from each bus are grouped together.

`Circuit.AllBusVMag()` – Similar to AllBusVolts except magnitude only (in actual volts). Returns the voltage (magnitude) for every node in the circuit as a complex vector.

`Circuit.AllElementNames()` – The names of all elements

`Circuit.AllBusNames()` – The names of all buses in the system. See `:AllNodeNames`.

`Circuit.AllElementLosses()` – Returns the watt and var losses in each element of the system as a complex vector. Order is the same as AllElementNames.

`Circuit.AllBusMagPu()` – Similar to AllBusVmag except that the magnitudes are reported in per unit for all buses with kVBase defined.

`Circuit.AllNodeNames()` – Returns the names of all nodes (busname.nodenumber) in the same order as AllBusVolts, AllBusVmag, and AllBusVMagPu

`Circuit.SystemY()` – Return the System Y matrix as a complex (dense) matrix

`Circuit.AllBusDistances()` – Returns all distances from a bus to its parent EnergyMeter element, which is generally in the substation, as a variant array of doubles. Order corresponds to that of all bus properties.

`Circuit.AllNodeDistances()` – Returns the distance from all nodes to the parent energy meter that match the designated phase number. Returns a vector of doubles. Matches the order of AllNodeNamesByPhase, AllNodeVmagByPhase, AllNodeVmagPUByPhase.

`Circuit.YNodeVArray()` – Complex array of actual node voltages in same order as SystemY matrix.

`Circuit.YNodeOrder()` – The names of the nodes in the same order as the Y matrix

`Circuit.YCurrents()` – Vector of doubles containing complex injection currents for the present solution.



<a id='cktelement'></a>
## `CktElement`


<a id='OpenDSSDirect.DSS.CktElement' href='#OpenDSSDirect.DSS.CktElement'>#</a>**OpenDSSDirect.DSS.CktElement** &mdash; *Module*.

---

**module CktElement** – Functions for interfacing with the active OpenDSS CktElement.

`CktElement.NumTerminals()` – Number of Terminals on this Circuit Element

`CktElement.NumConductors()` – Number of Conductors per Terminal

`CktElement.NumPhases()` – Number of phases

`CktElement.Open()` – Open the specified terminal and phase, if non‐zero.  Else all conductors at terminal.

`CktElement.Close()` – Close the specified terminal and phase, if non‐zero.  Else all conductors at terminal.

`CktElement.IsOpen()` – Bool indicating if the specified terminal and, optionally, phase is open.

`CktElement.NumProperties()` – Number of Properties this Circuit Element.

`CktElement.HasSwitchControl()` – Bool indicating whether this element has a SwtControl attached.

`CktElement.HasVoltControl()` – This element has a CapControl or RegControl attached.

`CktElement.NumControls()` – Number of controls connected to this device. Use to determine valid range for index into Controller array.

`CktElement.OCPDevIndex()` – Index into Controller list of OCP Device controlling this CktElement

`CktElement.OCPDevType()` – 0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device

`CktElement.Enabled()` – Element is enabled

`CktElement.Enabled(arg)` – Enable the active circuit element

`CktElement.NormalAmps()` – Normal ampere rating for PD Elements

`CktElement.NormalAmps(arg)` – Set the normal ampere rating for PD Elements

`CktElement.EmergAmps()` – Emergency Ampere Rating for PD elements

`CktElement.EmergAmps(arg)` – Set the emergency Ampere Rating for PD elements

`CktElement.Variablei()` – For PCElement, get the value of a variable by integer index.

`CktElement.Name()` – Full Name of Active Circuit Element

`CktElement.DisplayName()` – Display name of the object (not necessarily unique)

`CktElement.DisplayName(arg)` – Set the display name of the object (not necessarily unique)

`CktElement.GUID()` – Globally unique identifier for this object

`CktElement.EnergyMeter()` – Name of the Energy Meter this element is assigned to

`CktElement.Controller()` – Full name of the i‐th controller attached to this element. Ex: str = Controller

`CktElement.BusNames()` – Get  Bus definitions to which each terminal is connected. 0‐based array.

`CktElement.Voltages()` – Complex array of voltages at terminals

`CktElement.Currents()` – Complex array of currents into each conductor of each terminal

`CktElement.Powers()` – Complex array of powers into each conductor of each terminal

`CktElement.Losses()` – Total losses in the element: two‐element complex array

`CktElement.PhaseLosses()` – Complex array of losses by phase

`CktElement.SeqVoltages()` – Double array of symmetrical component voltages at each 3‐phase terminal

`CktElement.SeqCurrents()` – Double array of symmetrical component currents into each 3‐phase terminal

`CktElement.SeqPowers()` – Double array of sequence powers into each 3‐phase teminal

`CktElement.AllPropertyNames()` – All property names of the active device.

`CktElement.Residuals()` – Residual currents for each terminal: (mag, angle)

`CktElement.YPrim()` – YPrim matrix, column order, complex numbers

`CktElement.CplxSeqVoltages()` – Complex double array of Sequence Voltage for all terminals of active circuit element.

`CktElement.CplxSeqCurrents()` – Complex double array of Sequence Currents for all conductors of all terminals of active circuit element.

`CktElement.AllVariableNames()` – Variant array of strings listing all the published variable names, if a PCElement. Otherwise, null string.

`CktElement.AllVariableValues()` – Values of state variables of active element if PC element.

`CktElement.NodeOrder()` – Node numbers (representing phases, for example)

`CktElement.CurrentsMagAng()` – Currents in magnitude, angle format as a variant array of doubles.

`CktElement.VoltagesMagAng()` – Voltages at each conductor in magnitude, angle form as variant array of doubles.



<a id='ctrlqueue'></a>
## `CtrlQueue`


<a id='OpenDSSDirect.DSS.CtrlQueue' href='#OpenDSSDirect.DSS.CtrlQueue'>#</a>**OpenDSSDirect.DSS.CtrlQueue** &mdash; *Module*.

---

**module CtrlQueue** – Functions for interfacing with the OpenDSS CtrlQueue.

`CtrlQueue.ClearQueue()` – Clear the control queue.

`CtrlQueue.Delete()` – Delete a control action from the DSS control queue by referencing the handle of the action

`CtrlQueue.NumActions()` – Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions

`CtrlQueue.Action(arg)` – Set the active action by index

`CtrlQueue.ActionCode()` – Code for the active action. Long integer code to tell the control device what to do.

`CtrlQueue.DeviceHandle()` – Handle (User defined)

`CtrlQueue.Push()` – Push a control action onto the DSS control queue by time, action code, and device handle (user defined).

`CtrlQueue.Show()` – Show the entire control queue in CSV format

`CtrlQueue.ClearActions()` – Clear the Action list.

`CtrlQueue.PopAction()` – Pops next action off the action list and makes it the active action. Returns zero if none.



<a id='element'></a>
## `Element`


<a id='OpenDSSDirect.DSS.Element' href='#OpenDSSDirect.DSS.Element'>#</a>**OpenDSSDirect.DSS.Element** &mdash; *Module*.

---

**module Element** – Functions for interfacing with the OpenDSS Elements.

`Element.NumProperties()` – Number of Properties for the active DSS object.

`Element.Name()` – Full Name of Active DSS Object (general element or circuit element)

`Element.AllPropertyNames()` – The names of all properties for the active DSS object.



<a id='executive'></a>
## `Executive`


<a id='OpenDSSDirect.DSS.Executive' href='#OpenDSSDirect.DSS.Executive'>#</a>**OpenDSSDirect.DSS.Executive** &mdash; *Module*.

---

**module Executive** – Functions for accessing DSSExecutive.

`Executive.NumCommands()` – Number of DSS Executive Commands

`Executive.NumOptions()` – Number of DSS Executive Options

`Executive.Command(arg)` – Get i‐th command (with i as a string)

`Executive.Option(arg)` – Get i‐th option (with i as a string)

`Executive.CommandHelp(arg)` – Get help string for i‐th command (with i as a string)

`Executive.OptionHelp(arg)` – Get help string for i‐th option (with i as a string)

`Executive.OptionValue(arg)` – Get present value of i‐th option (with i as a string)



<a id='fuses'></a>
## `Fuses`


<a id='OpenDSSDirect.DSS.Fuses' href='#OpenDSSDirect.DSS.Fuses'>#</a>**OpenDSSDirect.DSS.Fuses** &mdash; *Module*.

---

**module Fuses** – Functions for interfacing with the active OpenDSS Fuse.

`Fuses.Count()` – Number of Fuse elements in the circuit

`Fuses.First()` – Set the first Fuse to be the active fuse. Returns 0 if none.

`Fuses.Next()` – Advance the active Fuse element pointer to the next fuse. Returns 0 if no more fuses.

`Fuses.MonitoredTerm()` – Terminal number to which the fuse is connected.

`Fuses.MonitoredTerm(arg)` – Set the terminal number to which the fuse is connected.

`Fuses.Open()` – Manual opening of fuse

`Fuses.Close()` – Close the fuse back in and reset.

`Fuses.IsBlown()` – Current state of the fuses. TRUE if any fuse on any phase is blown. Else FALSE.

`Fuses.Idx()` – Get/set active fuse by index into the list of fuses. 1 based: 1..count

`Fuses.Idx(arg)` – Set Fuse active by index into the list of fuses. 1..count

`Fuses.NumPhases()` – Number of phases, this fuse.

`Fuses.RatedCurrent()` – Multiplier or actual amps for the TCCcurve object. Defaults to 1.0. Multipliy current values of TCC curve by this to get actual amps.

`Fuses.RatedCurrent(arg)` – Set the multiplier or actual amps for the TCCcurve object. Defaults to 1.0. Multipliy current values of TCC curve by this to get actual amps.

`Fuses.Name()` – Get the name of the active Fuse element

`Fuses.Name(arg)` – Set the name of the active Fuse element

`Fuses.MonitoredObj()` – Full name of the circuit element to which the fuse is connected.

`Fuses.MonitoredObj(arg)` – Set the full name of the circuit element to which the fuse is connected.

`Fuses.SwitchedObj()` – Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj.

`Fuses.SwitchedObj(arg)` – Set the full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj.

`Fuses.TCCCurve()` – Name of the TCCcurve object that determines fuse blowing.

`Fuses.TCCCurve(arg)` – Set the name of the TCCcurve object that determines fuse blowing.

`Fuses.AllNames()` –  Names of all Fuses in the circuit



<a id='generators'></a>
## `Generators`


<a id='OpenDSSDirect.DSS.Generators' href='#OpenDSSDirect.DSS.Generators'>#</a>**OpenDSSDirect.DSS.Generators** &mdash; *Module*.

---

**module Generators** – Functions for interfacing with the active OpenDSS Generator.

`Generators.First()` – Sets first Generator to be active.  Returns 0 if none.

`Generators.Next()` – Sets next Generator to be active.  Returns 0 if no more.

`Generators.ForcedON()` – Indicates whether the generator is forced ON regardles of other dispatch criteria.

`Generators.ForcedON(arg)` – Sets indication whether the generator is forced ON regardles of other dispatch criteria.

`Generators.Phases()` – Number of phases

`Generators.Phases(arg)` – Set the number of phases

`Generators.Count()` – Number of Generator Objects in Active Circuit

`Generators.Idx()` – Get/Set active Generator by index into generators list.  1..Count

`Generators.Idx(arg)` – Set active Generator by index into generators list.  1..Count

`Generators.Model()` – Generator model

`Generators.Model(arg)` – Set the Generator model

`Generators.kV()` – Voltage base for the active generator, kV

`Generators.kV(arg)` – Set the voltage base for the active generator, kV

`Generators.kW()` – kW output for the active generator. kvar is updated for current power factor.

`Generators.kW(arg)` – Set the kW output for the active generator. kvar is updated for current power factor.

`Generators.kvar()` – kvar output for the active generator. Updates power factor based on present kW value.

`Generators.kvar(arg)` – Set the kvar output for the active generator. Updates power factor based on present kW value.

`Generators.PF()` – Power factor (pos. = producing vars)

`Generators.PF(arg)` – Set the power factor (pos. = producing vars)

`Generators.kVARated()` – Get the KVA rating of the generator.

`Generators.kVARated(arg)` – Set the KVA rating of the generator.

`Generators.Vmaxpu()` – Get the Vmaxpu for Generator Model.

`Generators.Vmaxpu(arg)` – Set the Vmaxpu for Generator Model.

`Generators.Vminpu()` – Get the Vminpu for Generator Model.

`Generators.Vminpu(arg)` – Set the Vminpu for Generator Model.

`Generators.Name()` – Active generator name.

`Generators.Name(arg)` – Sets a generator active by name.

`Generators.AllNames()` – All generator names

`Generators.RegisterNames()` – Array of Names of all generator energy meter registers

`Generators.RegisterValues()` – Array of valus in generator energy meter registers.



<a id='isource'></a>
## `Isource`


<a id='OpenDSSDirect.DSS.Isource' href='#OpenDSSDirect.DSS.Isource'>#</a>**OpenDSSDirect.DSS.Isource** &mdash; *Module*.

---

**module Isource** – Functions for interfacing with the active OpenDSS current source.

`Isource.Count()` – Returns the number of Isource objects currently defined in the active circuit.

`Isource.First()` – Set the first ISource to be active; returns 0 if none.

`Isource.Next()` – Set the next ISource to be active; returns 0 if none.

`Isource.Amps()` – Get the magnitude of the Isource in Amps.

`Isource.Amps(arg)` – Set the magnitude of the Isource in Amps.

`Isource.AngleDeg()` – Get the phase angle of the Isource in degrees.

`Isource.AngleDeg(arg)` – Set the phase angle of the Isource in degrees.

`Isource.Frequency()` – Get the frequency of the Isource in Hz.

`Isource.Frequency(arg)` – Set the frequency of the Isource in Hz.

`Isource.Name()` – Get the name of the active Isource object.

`Isource.Name(arg)` – Set the name of the active Isource object.

`Isource.AllNames()` – Names of all Isources in the circuit.



<a id='lines'></a>
## `Lines`


<a id='OpenDSSDirect.DSS.Lines' href='#OpenDSSDirect.DSS.Lines'>#</a>**OpenDSSDirect.DSS.Lines** &mdash; *Module*.

---

**module Lines** – Functions for interfacing with the active OpenDSS Line.

`Lines.First()` – Set the first element active. Returns 0 if no Lines. Otherwise, index of the line element.

`Lines.Next()` – Set the next element active. Returns 0 if no Lines. Otherwise, index of the line element.

`Lines.Phases()` – Get the number of phases of the active line object.

`Lines.Phases(arg)` – Set the number of phases of the active line object.

`Lines.NumCust()` – Get the number of customers on this line section.

`Lines.Parent()` – Get the parents of the active Line to be the active Line. Return 0 if no parent or action fails.

`Lines.Count()` – Get the number of Line Objects in Active Circuit.

`Lines.Units()` – Get the units of the line (distance, check manual for details).

`Lines.Units(arg)` – Set the units of the line (distance, check manual for details).

`Lines.Length()` – Get the length of line section in units compatible with the LineCode definition.

`Lines.Length(arg)` – Set the length of line section in units compatible with the LineCode definition.

`Lines.R1()` – Get the positive sequence resistance, ohm per unit length.

`Lines.R1(arg)` – Set the positive sequence resistance, ohm per unit length.

`Lines.X1()` – Get the positive sequence reactance, ohm per unit length.

`Lines.X1(arg)` – Set the positive sequence reactance, ohm per unit length.

`Lines.R0()` – Get the zero sequence resistance, ohm per unit length.

`Lines.R0(arg)` – Set the zero sequence resistance, ohm per unit length.

`Lines.X0()` – Get the zero sequence reactance, ohm per unit length.

`Lines.X0(arg)` – Set the zero sequence reactance, ohm per unit length.

`Lines.C1()` – Get the positive sequence capacitance, nanofarads per unit length.

`Lines.C1(arg)` – Set the positive sequence capacitance, nanofarads per unit length.

`Lines.C0()` – Get the zero sequence capacitance, nanofarads per unit length.

`Lines.C0(arg)` – Set the zero sequence capacitance, nanofarads per unit length.

`Lines.NormAmps()` – Get the normal ampere rating of Line.

`Lines.NormAmps(arg)` – Set the normal ampere rating of Line.

`Lines.EmergAmps()` – Get the emergency (maximum) ampere rating of Line.

`Lines.EmergAmps(arg)` – Set the emergency (maximum) ampere rating of Line.

`Lines.Rg()` – Get the earth return value used to compute line impedances at power frequency.

`Lines.Rg(arg)` – Set the earth return value used to compute line impedances at power frequency.

`Lines.Xg()` – Get the earth return reactance value used to compute line impedances at power frequency.

`Lines.Xg(arg)` – Set the earth return reactance value used to compute line impedances at power frequency.

`Lines.Rho()` – Get the earth resistivity, m-ohms.

`Lines.Rho(arg)` – Set the earth resistivity, m-ohms.

`Lines.Name()` – Get the name of the active Line element.

`Lines.Name(arg)` – Set the name of the Line element to set it active.

`Lines.Bus1()` – Get the name of bus for terminal 1.

`Lines.Bus1(arg)` – Set the name of bus for terminal 1.

`Lines.Bus2()` – Get the name of bus for terminal 2.

`Lines.Bus2(arg)` – Set the name of bus for terminal 2.

`Lines.LineCode()` – Get the name of LineCode object that defines the impedances.

`Lines.LineCode(arg)` – Set the name of LineCode object that defines the impedances.

`Lines.Geometry()` – Get the name of the Line geometry code.

`Lines.Geometry(arg)` – Set the name of the Line geometry code.

`Lines.Spacing()` – Get the name of the Line spacing code.

`Lines.Spacing(arg)` – Set the name of the Line spacing code.

`Lines.AllNames()` – Get the name of all Line Objects.

`Lines.RMatrix()` – Get the resistance matrix (full), ohms per unit length. Variant array of doubles.

`Lines.XMatrix()` – Get the reactance matrix (full), ohms per unit length. Variant array of doubles.

`Lines.CMatrix()` – Get the capacitance matrix (full), nanofarads per unit length. Variant array of doubles.

`Lines.Yprim()` – Get the YPrimitive of the active Line.



<a id='loads'></a>
## `Loads`


<a id='OpenDSSDirect.DSS.Loads' href='#OpenDSSDirect.DSS.Loads'>#</a>**OpenDSSDirect.DSS.Loads** &mdash; *Module*.

---

**module Loads** – Functions for interfacing with the active OpenDSS load.

`Loads.First()` – Allows to set the active load into the first load registered in the active circuit. As a result, this property will return the number 1. The parameter argument can be filled with a 0.

`Loads.Next()` – Set the active load into the next load registered in the active circuit. As a result, this property will set the index of the active load. The parameter argument can be filled with a 0.

`Loads.Idx()` – The index of the active load. The parameter argument can be filled with a 0.

`Loads.Idx(arg)` – Set the index of the active load. The parameter argument must contain the index of the desired active load. The return value will be equal to 0.

`Loads.Count()` – Returns the number of load elements within the active circuit. The parameter argument can be filled with a 0.

`Loads.Class()` – The code number used to separate Loads by class or group. The parameter argument can be filled with a 0.

`Loads.Class(arg)` – The code number used to separate loads by class or group. The parameter argument can be filled with a 0.

`Loads.Model()` – The model of the active load. The parameter argument can be filled with a 0.

`Loads.Model(arg)` – Set the model of the active load using the parameter argument. return a 0.

`Loads.NumCust()` – The number of customer of the active load. The parameter argument can be filled with a 0.

`Loads.NumCust(arg)` – Set the number of customers of the active load using the parameter argument. return a 0.

`Loads.Status()` – 

`Loads.Status(arg)` – 

`Loads.IsDelta()` – If true, loads are line to line.

`Loads.IsDelta(arg)` – Set whether loads are delta (line to line).

`Loads.kW()` – The kW property of the active load. The parameter argument can be filled with a 0.

`Loads.kW(arg)` – Set the kW property of the active load. The parameter argument must contain the new value in kW for the desired active load. The return value will be equal to 0.

`Loads.kV()` – The kV property of the active load. The parameter argument can be filled with a 0.

`Loads.kV(arg)` – Set the kV property of the active load. The parameter argument must contain the new value in kV for the desired active load. The return value will be equal to 0.

`Loads.kvar()` – The kvar property of the active load. The parameter argument can be filled with a 0.

`Loads.kvar(arg)` – Set the kvar property of the active load. The parameter argument must contain the new value in kvar for the desired active load. The return value will be equal to 0.

`Loads.PF()` – The pf property of the active load. The parameter argument can be filled with a 0.

`Loads.PF(arg)` – Set the pf property of the active load. The parameter argument must contain the new value in pf for the desired active load. The return value will be equal to 0.

`Loads.PctMean()` – The PctMean property of the active load. The parameter argument can be filled with a 0.

`Loads.PctMean(arg)` – Set the PctMean property of the active load. The parameter argument must contain the new value in PctMean for the desired active load. The return value will be equal to 0.

`Loads.PctStdDev()` – The PctStdDev property of the active load. The parameter argument can be filled with a 0.

`Loads.PctStdDev(arg)` – Set the PctStdDev property of the active load. The parameter argument must contain the new value in PctStdDev for the desired active load. The return value will be equal to 0.

`Loads.AllocationFactor()` – The AllocationFactor property of the active load. The parameter argument can be filled with a 0.

`Loads.AllocationFactor(arg)` – Set the AllocationFactor property of the active load. The parameter argument must contain the new value in AllocationFactor for the desired active load. The return value will be equal to 0.

`Loads.CFactor()` – The CFactor property of the active load. The parameter argument can be filled with a 0.

`Loads.CFactor(arg)` – Set the CFactor property of the active load. The parameter argument must contain the new value in CFactor for the desired active load. The return value will be equal to 0.

`Loads.CVRwatts()` – The CVRWatts property of the active load. The parameter argument can be filled with a 0.

`Loads.CVRwatts(arg)` – Set the CVRWatts property of the active load. The parameter argument must contain the new value in CVRWatts for the desired active load. The return value will be equal to 0.

`Loads.CVRvars()` – The CVRvars property of the active load. The parameter argument can be filled with a 0.

`Loads.CVRvars(arg)` – Set the CVRvars property of the active load. The parameter argument must contain the new value in CVRvars for the desired active load. The return value will be equal to 0.

`Loads.kVABase()` – The kva property of the active load. The parameter argument can be filled with a 0.

`Loads.kVABase(arg)` – Set the kva property of the active load. The parameter argument must contain the new value in kva for the desired active load. The return value will be equal to 0.

`Loads.kWh()` – The kWh property of the active load. The parameter argument can be filled with a 0.

`Loads.kWh(arg)` – Set the kWh property of the active load. The parameter argument must contain the new value in kWh for the desired active load. The return value will be equal to 0.

`Loads.kWhDays()` – The kWhdays property of the active load. The parameter argument can be filled with a 0.

`Loads.kWhDays(arg)` – Set the kWhdays property of the active load. The parameter argument must contain the new value in kWhdays for the desired active load. The return value will be equal to 0.

`Loads.Rneut()` – The RNeut (neutral resistance for wye connected loads) property of the active load. The parameter argument can be filled with a 0.

`Loads.Rneut(arg)` – Set the RNeut (neutral resistance for wye connected loads) property of the active load. The parameter argument must contain the new value in RNeut for the desired active load. The return value will be equal to 0.

`Loads.Vmaxpu()` – The VMaxpu property of the active load. The parameter argument can be filled with a 0.

`Loads.Vmaxpu(arg)` – Set the VMaxpu property of the active load. The parameter argument must contain the new value in VMaxpu for the desired active load. The return value will be equal to 0.

`Loads.VminEmerg()` – The VMinemerg property of the active load. The parameter argument can be filled with a 0.

`Loads.VminEmerg(arg)` – Set the VMinemerg property of the active load. The parameter argument must contain the new value in VMinemerg for the desired active load. The return value will be equal to 0.

`Loads.VminNorm()` – The VMinnorm property of the active load. The parameter argument can be filled with a 0.

`Loads.VminNorm(arg)` – Set the VMinnorm property of the active load. The parameter argument must contain the new value in VMinnorm for the desired active load. The return value will be equal to 0.

`Loads.Vminpu()` – The VMinpu property of the active load. The parameter argument can be filled with a 0.

`Loads.Vminpu(arg)` – Set the VMinpu property of the active load. The parameter argument must contain the new value in VMinpu for the desired active load. The return value will be equal to 0.

`Loads.XfkVA()` – The xfKVA (Rated service transformer KVA for load allocation, using Allocationfactor. Affects kW, kvar and pf.) property of the active load. The parameter argument can be filled with a 0.

`Loads.XfkVA(arg)` – Set the xfKVA (Rated service transformer KVA for load allocation, using Allocationfactor. Affects kW, kvar and pf.) property of the active load. The parameter argument must contain the new value in xfKVA for the desired active load. The return value will be equal to 0.

`Loads.Xneut()` – The Xneut property of the active load. The parameter argument can be filled with a 0.

`Loads.Xneut(arg)` – Set the Xneut property of the active load. The parameter argument must contain the new value in Xneut for the desired active load. The return value will be equal to 0.

`Loads.puSeriesRL()` – The PctSeriesRL (Percent of Load that is modeled as series R-L for harmonic studies) property of the active load. The parameter argument can be filled with a 0.

`Loads.puSeriesRL(arg)` – Set the PctSeriesRL (Percent of Load that is modeled as series R-L for harmonic studies) property of the active load. The parameter argument must contain the new value in PctSeriesRL for the desired active load. The return value will be equal to 0.

`Loads.RelWeighting()` – The RelWeight (relative weighting factor) property of the active load. The parameter argument can be filled with a 0.

`Loads.RelWeighting(arg)` – Set the RelWeight (relative weighting factor) property of the active load. The parameter argument must contain the new value in RelWeight for the desired active load. The return value will be equal to 0.

`Loads.Name()` – The Name property of the active load. The parameter argument can be filled with an empty string.

`Loads.Name(arg)` – Set the active load by specifying the Name load. The parameter argument must contain the Name of the load to activate. The return value will be equal to empty.

`Loads.CVRCurve()` – The CVRCUrve property of the active load. The parameter argument can be filled with an empty string.

`Loads.CVRCurve(arg)` – Set the CVRCurve property for the active load. The parameter argument must contain the Name of the new CVRCurve to be linked to the active load. The return value will be equal to empty.

`Loads.Daily()` – The daily property of the active load. The parameter argument can be filled with an empty string.

`Loads.Daily(arg)` – Set the daily property for the active load. The parameter argument must contain the Name of the new daily to be linked to the active load. The return value will be equal to empty.

`Loads.Duty()` – The duty property of the active load. The parameter argument can be filled with an empty string.

`Loads.Duty(arg)` – Set the duty property for the active load. The parameter argument must contain the Name of the new duty to be linked to the active load. The return value will be equal to empty.

`Loads.Spectrum()` – The Spectrum property of the active load. The parameter argument can be filled with an empty string.

`Loads.Spectrum(arg)` – Set the Spectrum property for the active load. The parameter argument must contain the Name of the new Spectrum to be linked to the active load. The return value will be equal to empty.

`Loads.Yearly()` – The Yearly property of the active load. The parameter argument can be filled with an empty string.

`Loads.Yearly(arg)` – Set the Yearly property for the active load. The parameter argument must contain the Name of the new Yearly to be linked to the active load. The return value will be equal to empty.

`Loads.Growth()` – The Growth property of the active load. The parameter argument can be filled with an empty string.

`Loads.Growth(arg)` – Set the Growth property for the active load. The parameter argument must contain the Name of the new Growth to be linked to the active load. The return value will be equal to empty.

`Loads.AllNames()` – The names of all the loads present in the active circuit. The result is delivered as variant, however, the content of this variant is an array of strings.

`Loads.ZipV()` – The array of 7 elements (doubles) for ZIP property of the active Load object.



<a id='loadshape'></a>
## `LoadShape`


<a id='OpenDSSDirect.DSS.LoadShape' href='#OpenDSSDirect.DSS.LoadShape'>#</a>**OpenDSSDirect.DSS.LoadShape** &mdash; *Module*.

---

**module LoadShape** – Functions for interfacing with the active OpenDSS LoadShape.

`LoadShape.Count()` – The number of LoadShape objects currently defined in LoadShape collection.

`LoadShape.First()` – Set the first LoadShape active and return integer index of the LoadShape. Returns 0 if no more.

`LoadShape.Next()` – Set the next LoadShape active and return integer index of the LoadShape. Returns 0 if no more.

`LoadShape.Npts()` – Get the number of points in active LoadShape.

`LoadShape.Npts(arg)` – Set the number of points in active LoadShape.

`LoadShape.Normalize()` – normalizes the P and Q curves based on either Pbase, Qbase or simply the peak value of the curve.

`LoadShape.UseActual()` – Get a TRUE/FALSE (1/0) to let Loads know to use the actual value in the curve rather than use the value as a multiplier.

`LoadShape.UseActual(arg)` – Set a TRUE/FALSE (1/0 - Argument) to let Loads know to use the actual value in the curve rather than use the value as a multiplier.

`LoadShape.HrInterval()` – Get the fixed interval time value, hours.

`LoadShape.HrInterval(arg)` – Set the fixed interval time value, hours.

`LoadShape.MinInterval()` – Get the fixed interval time value, in minutes.

`LoadShape.MinInterval(arg)` – Set the fixed interval time value, in minutes.

`LoadShape.PBase()` – Get the base for normalizing P curve. If left at zero, the peak value is used.

`LoadShape.PBase(arg)` – Set the base for normalizing P curve. If left at zero, the peak value is used.

`LoadShape.QBase()` – Get the base for normalizing Q curve. If left at zero, the peak value is used.

`LoadShape.QBase(arg)` – Set the base for normalizing Q curve. If left at zero, the peak value is used.

`LoadShape.SInterval()` – Get the fixed interval data time interval, seconds.

`LoadShape.SInterval(arg)` – Set the fixed interval data time interval, seconds.

`LoadShape.Name()` – Get the name of the active LoadShape object.

`LoadShape.Name(arg)` – Set the name of the active LoadShape object.

`LoadShape.AllNames()` – Names of all of the load shapes

`LoadShape.PMult()` – Get a variant array of doubles for the P multiplier in the LoadShape.

`LoadShape.QMult()` – Get a variant array of doubles for the Q multiplier in the LoadShape.

`LoadShape.TimeArray()` – Get a time array in hours corresponding to P and Q multipliers when the Interval = 0.



<a id='meters'></a>
## `Meters`


<a id='OpenDSSDirect.DSS.Meters' href='#OpenDSSDirect.DSS.Meters'>#</a>**OpenDSSDirect.DSS.Meters** &mdash; *Module*.

---

**module Meters** – Functions for interfacing with the active OpenDSS energy meter.

`Meters.First()` – Set the first Energy Meter active. Returns 0 if no Monitors.

`Meters.Next()` – Set the next energy Meter Active. Returns 0 if no more.

`Meters.Reset()` – Resets the active Meter object.

`Meters.ResetAll()` – Resets all Meter object.

`Meters.Sample()` – Causes active meter to take a sample.

`Meters.Save()` – Causes active meter to save its current sample buffer to its meter stream. Then you can access the Bytestream or channel data. Most standard solution modes do this automatically.

`Meters.MeteredTerminal()` – The number of metered terminal by the active Energy Meter.

`Meters.MeteredTerminal(arg)` – Set the number of metered terminal by the active Energy Meter.

`Meters.DIFilesAreOpen()` – Returns a global flag (1=true, 0=false) to indicate if Demand Interval (DI) files have been properly opened.

`Meters.SampleAll()` – Causes all Energy Meters to take a sample of the present state. Returns 0.

`Meters.SaveAll()` – save all Energy Meter buffers to their respective file streams. Returns 0.

`Meters.OpenAllDIFiles()` – Opens Demand Interval (DI) files. Returns 0.

`Meters.CloseAllDIFiles()` – Close all Demand Interval (DI) files. Necessary at the end of a run.

`Meters.CountEndElements()` – The number of zone end elements in the active meter zone.

`Meters.Count()` – The number of Energy Meters in the Active Circuit.

`Meters.CountBranches()` – The number of branches in active Energy Meter zone (same as sequencelist size).

`Meters.SequenceList()` – The index into meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be up line from later index. Sets PDElement active.

`Meters.SequenceList(arg)` – Set the index into meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be up line from later index. Sets PDElement active.

`Meters.DoReliabilityCalc(arg)` – calculates SAIFI, etc. if the Argument is equal to 1 assume restoration, otherwise it will not.

`Meters.SeqListSize()` – The size of Sequence List.

`Meters.TotalCustomers()` – The total number of customers in this zone (down line from the Energy Meter).

`Meters.NumSections()` – The number of feeder sections in this meter's zone.

`Meters.SetActiveSection(arg)` – Set the designated section (argument) if the index is valid.

`Meters.OCPDeviceType()` – The type of OCP device: {1=fuse | 2+ recloser | 3= relay}.

`Meters.NumSectionCustomers()` – The number of customers in the active section.

`Meters.NumSectionBranches()` – The number of branches (Lines) in the active section.

`Meters.SectSeqidx()` – The Sequence Index of the branch at the head of this section.

`Meters.SectTotalCust()` – The total customers down line from this section.

`Meters.SAIFI()` – SAIFI for this meter's zone. Execute reliability calc method first.

`Meters.SAIFIkW()` – The SAIFI based on kW rather than number of customers. Get after reliability calcs.

`Meters.SAIDI()` – The SAIDI for this meter zone. Execute DoreliabilityCalc first.

`Meters.CustInterrupts()` – The total customer interruptions for this meter zone based on reliability calcs.

`Meters.AvgRepairTime()` – The average Repair Time in this Section of the meter zone.

`Meters.FaultRateXRepairHrs()` – The sum of Fault Rate time Repair Hours in this section of the meter zone.

`Meters.SumBranchFltRates()` – The sum of the branch fault rates in this section of the meter's zone.

`Meters.Name()` – The active Energy Meter's name.

`Meters.Name(arg)` – Set the active Energy Meter's name.

`Meters.MeteredElement()` – The name of the metered element (considering the active Energy Meter).

`Meters.MeteredElement(arg)` – Set the name of the metered element (considering the active Energy Meter).

`Meters.AllNames()` – All Energy Meter names.

`Meters.RegisterNames()` – Strings containing the names of the registers.

`Meters.RegisterValues(arg)` – Values contained in the Meter registers for the active Meter.

`Meters.Totals()` – The totals for all registers of all Meters.

`Meters.PeakCurrent()` – Returns an array of doubles with the Peak Current Property.

`Meters.CalcCurrent()` – The magnitude of the real part of the Calculated Current (normally determined by solution) for the meter to force some behavior on Load Allocation.

`Meters.AllocFactors()` – An array of doubles: allocation factors for the active Meter.

`Meters.AllEndElements()` – A vector of names of all zone end elements.

`Meters.AllBranchesInZone()` – A wide string list of all branches in zone of the active Energy Meter object.



<a id='monitors'></a>
## `Monitors`


<a id='OpenDSSDirect.DSS.Monitors' href='#OpenDSSDirect.DSS.Monitors'>#</a>**OpenDSSDirect.DSS.Monitors** &mdash; *Module*.

---

**module Monitors** – Functions for interfacing with the active OpenDSS Monitor.

`Monitors.First()` – Set the first monitor active. Returns 0 if no Monitors.

`Monitors.Next()` – Set the next monitor active. Returns 0 if no more.

`Monitors.Reset()` – Resets the active Monitor object.

`Monitors.ResetAll()` – Resets all Monitor object.

`Monitors.Sample()` – Causes active monitor to take a sample.

`Monitors.Save()` – Causes active monitor to save its current sample buffer to its monitor stream. Then you can access the Bytestream or channel data. Most standard solution modes do this automatically.

`Monitors.Show()` – Converts monitor file into text and displays with text editor.

`Monitors.Mode()` – The monitor mode (bitmask integer - see DSS Help).

`Monitors.Mode(arg)` – Set the monitor mode (bitmask integer - see DSS Help).

`Monitors.SampleCount()` – Returns number of samples in Monitor at present.

`Monitors.SampleAll()` – Causes all Monitors to take a sample of the present state. Returns 0.

`Monitors.SaveAll()` – Save all Monitor buffers to their respective file streams. Returns 0.

`Monitors.Count()` – The number of Monitors.

`Monitors.Process()` – Post-process monitor samples taken so far, e.g., Pst for mode = 4.

`Monitors.ProcessAll()` – Makes that all Monitors post-process the data taken so far.

`Monitors.FileVersion()` – The Monitor File version (integer).

`Monitors.RecordSize()` – The size of each record in ByteStream.

`Monitors.NumChannels()` – The number of Channels on the active Monitor.

`Monitors.Terminal()` – The terminal number of element being monitored.

`Monitors.Terminal(arg)` – Set the terminal number of element being monitored.

`Monitors.FileName()` – The name of the CSV file associated with active monitor.

`Monitors.Name()` – The active Monitor object by name.

`Monitors.Name(arg)` – Set the active Monitor object by name.

`Monitors.Element()` – The full name of element being monitored by the active Monitor.

`Monitors.Element(arg)` – Set the full name of element being monitored by the active Monitor.

`Monitors.AllNames()` – An array of all Monitor names (array of strings).

`Monitors.ByteStream()` – "A byte array containing monitor stream values. Make sure a " * @save_str(" is done first (standard solution modes do this automatically).")

`Monitors.DblHourS()` – The header string; vector of strings containing Channel Names.

`Monitors.DblHour()` – A vector of doubles containing time value in hours for the time-sampled monitor values; empty if frequency-sampled values for harmonics solution (see dblFreq).

`Monitors.DblFreqS()` – A vector of doubles containing time values for harmonics mode solutions; empty for time mode solutions (use dblHour).

`Monitors.DblFreq()` – A vector of doubles for the specified channel (usage: MyArray = DSSmonitor.Channel(i)) A save or SaveAll should be executed first. Done automatically by most standard solution modes.



<a id='parser'></a>
## `Parser`


<a id='OpenDSSDirect.DSS.Parser' href='#OpenDSSDirect.DSS.Parser'>#</a>**OpenDSSDirect.DSS.Parser** &mdash; *Module*.

---

**module Parser** – Functions for interfacing with the OpenDSS Parser.

`Parser.IntValue()` – Return next parameter as a long integer.

`Parser.ResetDelimiters()` – Reset delimiters to their default values.

`Parser.AutoIncrement()` – In the default is false (0). If true (1) Parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.

`Parser.AutoIncrement(arg)` – In the default is false (0). If true (1) Parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.

`Parser.DblValue()` – Returns next parameter as a double.

`Parser.CmdString()` – Get a string to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.

`Parser.CmdString(arg)` – Set a string to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.

`Parser.NextParam()` – Get next token and return tag name (before = sign) if any. See Autoincrement.

`Parser.StrValue()` – Return next parameter as a string.

`Parser.WhiteSpace()` – Get the characters used for White space in the command string. Default in blank and Tab.

`Parser.WhiteSpace(arg)` – Set the characters used for White space in the command string. Default in blank and Tab.

`Parser.BeginQuote()` – Get the string containing the characters for quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "([{.

`Parser.BeginQuote(arg)` – Set the string containing the characters for quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "([{.

`Parser.EndQuote()` – Get the string containing the characters, in order, that match the beginning quote characters in BeginQuote. Default is ")]}.

`Parser.EndQuote(arg)` – Set the string containing the characters, in order, that match the beginning quote characters in BeginQuote. Default is ")]}.

`Parser.Delimiters()` – Get the string defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitespace to separate tokens.

`Parser.Delimiters(arg)` – Set the string defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitespace to separate tokens.

`Parser.Vector()` – Returns token as vector of doubles. For parsing quoted array syntax.

`Parser.Matrix()` – Use this property to parse a Matrix token in OpenDSS format. Returns square matrix of order specified. Order same as default fortran order: column by column.

`Parser.SymMatrix()` – Use this property to parse a Matrix token in lower triangular form. Symmetry is forced.



<a id='pdelements'></a>
## `PDElements`


<a id='OpenDSSDirect.DSS.PDElements' href='#OpenDSSDirect.DSS.PDElements'>#</a>**OpenDSSDirect.DSS.PDElements** &mdash; *Module*.

---

**module PDElements** – Functions for interfacing with the active OpenDSS power-delivery element.

`PDElements.Count()` – Get number of PDElements in active circuit.

`PDElements.First()` – Set the first enabled PD element to be the active element. Returns 0 if none found.

`PDElements.Next()` – Set the next enabled PD element to be the active element. Returns 0 if none found.

`PDElements.IsShunt()` – returns 1 if the PD element should be treated as a shunt element rather than a series element. Applies to capacitor and reactor elements in particular.

`PDElements.NumCustomers()` – Get the number of customers in this branch.

`PDElements.TotalCustomers()` – Get the total number of customers from this branch to the end of the zone.

`PDElements.ParentPDElement()` – Set the parent PD element to be the active circuit element. Returns 0 if no more elements upline.

`PDElements.FromTerminal()` – "Get the number of the terminal of active PD element that is on the " * @from_str(" side. This is set after the meter zone is determined.")

`PDElements.SectionID()` – Get the integer ID of the feeder section that this PDElement branch is part of.

`PDElements.FaultRate()` – Get the number of failures per year. For LINE elements: Number of failures per unit length per year.

`PDElements.FaultRate(arg)` – Set the number of failures per year. For LINE elements: Number of failures per unit length per year.

`PDElements.PctPermanent()` – Get the percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.

`PDElements.PctPermanent(arg)` – Set the percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.

`PDElements.Lambda()` – Get the failure rate for this branch. Faults per year including length of line.

`PDElements.AccumulatedL()` – Get the accumulated failure rate for this branch on down line.

`PDElements.RepairTime()` – Get the average time to repair a permanent fault on this branch, hours.

`PDElements.TotalMiles()` – Get the total miles of line from this element to the end of the zone. For recloser siting algorithm.

`PDElements.Name()` – Get the name of the active PDElement, returns null string if active element id not PDElement.

`PDElements.Name(arg)` – Set the name of the active PDElement, returns null string if active element id not PDElement.



<a id='progress'></a>
## `Progress`


<a id='OpenDSSDirect.DSS.Progress' href='#OpenDSSDirect.DSS.Progress'>#</a>**OpenDSSDirect.DSS.Progress** &mdash; *Module*.

---

**module Progress** – Functions for controlling the progress form.

`Progress.PctProgress()` – Percent Progress to indicate [0..100]

`Progress.Show()` – Shows Progress form with null caption and Progress set to zero.

`Progress.Close()` – Close the Progress form.

`Progress.Caption()` – Caption to appear on the bottom of the DSS Progress form.



<a id='pvsystems'></a>
## `PVsystems`


<a id='OpenDSSDirect.DSS.PVsystems' href='#OpenDSSDirect.DSS.PVsystems'>#</a>**OpenDSSDirect.DSS.PVsystems** &mdash; *Module*.

---

**module PVsystems** – Functions for interfacing with the active OpenDSS PVsystem.

`PVsystems.Count()` – The number of PVSystem objects currently defined in the active circuit.

`PVsystems.First()` – Set the first PVSystem to be active; returns 0 if none.

`PVsystems.Next()` – Set the next PVSystem to be active; returns 0 if none.

`PVsystems.Idx()` – Get the active PVSystem by index; 1..Count.

`PVsystems.Idx(arg)` – Set the active PVSystem by index; 1..Count.

`PVsystems.Irradiance()` – Get the present value of the Irradiance property in W/sq-m.

`PVsystems.Irradiance(arg)` – Set the present value of the Irradiance property in W/sq-m.

`PVsystems.kW()` – Get the kW output.

`PVsystems.kvar()` – Get the kvar value.

`PVsystems.kvar(arg)` – Set the kvar value.

`PVsystems.pf()` – Get the power factor value.

`PVsystems.pf(arg)` – Set the power factor value.

`PVsystems.kVARated()` – Get the rated kVA.

`PVsystems.kVARated(arg)` – Set the rated kVA.



<a id='reclosers'></a>
## `Reclosers`


<a id='OpenDSSDirect.DSS.Reclosers' href='#OpenDSSDirect.DSS.Reclosers'>#</a>**OpenDSSDirect.DSS.Reclosers** &mdash; *Module*.

---

**module Reclosers** – Functions for interfacing with the active OpenDSS Recloser.

`Reclosers.Count()` – Get number of Reclosers in active circuit.

`Reclosers.First()` – Set first recloser to be active Circuit Element. Returns 0 if none.

`Reclosers.Next()` – Set next recloser to be active Circuit Element. Returns 0 if none.

`Reclosers.MonitoredTerm()` – Get the terminal number of Monitored Object for the Recloser.

`Reclosers.MonitoredTerm(arg)` – Set the terminal number of Monitored Object for the Recloser.

`Reclosers.SwitchedTerm()` – Get the terminal of the controlled device being switched by the Recloser.

`Reclosers.SwitchedTerm(arg)` – Set the terminal of the controlled device being switched by the Recloser.

`Reclosers.NumFast()` – Get the number of fast shots.

`Reclosers.NumFast(arg)` – Set the number of fast shots.

`Reclosers.Shots()` – Get the number of shots to lockout (fast + delayed).

`Reclosers.Shots(arg)` – Set the number of shots to lockout (fast + delayed).

`Reclosers.Open()` – Open recloser's controlled element and lock out the recloser.

`Reclosers.Close()` – Close the switched object controlled by the recloser. Resets recloser to first operation.

`Reclosers.Idx()` – Get the active recloser by index into the recloser list. 1..Count.

`Reclosers.Idx(arg)` – Set the active recloser by index into the recloser list. 1..Count.

`Reclosers.PhaseTrip()` – Get the phase trip curve multiplier or actual amps.

`Reclosers.PhaseTrip(arg)` – Set the phase trip curve multiplier or actual amps.

`Reclosers.PhaseInst()` – Get the phase instantaneous curve multiplier or actual amps.

`Reclosers.PhaseInst(arg)` – Set the phase instantaneous curve multiplier or actual amps.

`Reclosers.GroundTrip()` – Get the ground (3I0) trip multiplier or actual amps.

`Reclosers.GroundTrip(arg)` – Set the ground (3I0) trip multiplier or actual amps.

`Reclosers.GroundInst()` – Get the ground (3I0) instantaneous trip setting - curve multiplier or actual amps.

`Reclosers.GroundInst(arg)` – Set the ground (3I0) instantaneous trip setting - curve multiplier or actual amps.

`Reclosers.Name()` – Get the name of the active Recloser Object.

`Reclosers.Name(arg)` – Set the name of the active Recloser Object.

`Reclosers.MonitoredObj()` – Get the full name of object this Recloser is monitoring.

`Reclosers.MonitoredObj(arg)` – Set the full name of object this Recloser is monitoring.

`Reclosers.SwitchedObj()` – Get the full name of the circuit element that is being switched by this Recloser.

`Reclosers.SwitchedObj(arg)` – Set the full name of the circuit element that is being switched by this Recloser.

`Reclosers.AllNames()` – Get a vector of strings with names of all Reclosers in active circuit.

`Reclosers.RecloseIntervals()` – Get a vector of doubles: reclose intervals (s) between shots.



<a id='regcontrols'></a>
## `RegControls`


<a id='OpenDSSDirect.DSS.RegControls' href='#OpenDSSDirect.DSS.RegControls'>#</a>**OpenDSSDirect.DSS.RegControls** &mdash; *Module*.

---

**module RegControls** – Functions for interfacing with the active OpenDSS RegControl.

`RegControls.First()` – Set the first RegControl active. Returns 0 if no more.

`RegControls.Next()` – Set the next RegControl active. Returns 0 if no more

`RegControls.TapWinding()` – Get the tapped winding number.

`RegControls.TapWinding(arg)` – Set the tapped winding number.

`RegControls.Winding()` – Get the winding number for PT and CT connections.

`RegControls.Winding(arg)` – Set the winding number for PT and CT connections.

`RegControls.IsReversible()` – Get the setting in the reverse direction, usually not applicable to substation Transformers.

`RegControls.IsReversible(arg)` – Set the different settings for the reverse direction (see Manual for details), usually not applicable to substation Transformers.

`RegControls.IsInverseTime()` – Get the inverse time feature. Time delay is inversely adjusted, proportional to the amount of voltage outside the regulator band.

`RegControls.IsInverseTime(arg)` – Set the inverse time feature. Time delay is inversely adjusted, proportional to the amount of voltage outside the regulator band.

`RegControls.MaxTapChange()` – Get the maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for faster solution.

`RegControls.MaxTapChange(arg)` – Set the maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for faster solution.

`RegControls.Count()` – Get the number of RegControl objects in Active Circuit.

`RegControls.TapNumber()` – Get the tap number.

`RegControls.TapNumber(arg)` – Set the tap number.

`RegControls.CTPrimary()` – Get the CT primary ampere rating (secondary is 0.2 amperes).

`RegControls.CTPrimary(arg)` – Set the CT primary ampere rating (secondary is 0.2 amperes).

`RegControls.PTRatio()` – Get the PT ratio for voltage control settings.

`RegControls.PTRatio(arg)` – Set the PT ratio for voltage control settings.

`RegControls.ForwardR()` – Get the LDC R settings in Volts.

`RegControls.ForwardR(arg)` – Set the LDC R settings in Volts.

`RegControls.ForwardX()` – Get the LDC X settings in Volts.

`RegControls.ForwardX(arg)` – Set the LDC X settings in Volts.

`RegControls.ReverseR()` – Get the reverse LDC R settings in Volts.

`RegControls.ReverseR(arg)` – Set the reverse LDC R settings in Volts.

`RegControls.ReverseX()` – Get the reverse LDC X settings in Volts.

`RegControls.ReverseX(arg)` – Set the reverse LDC X settings in Volts.

`RegControls.Delay()` – Get the time delay [s] after arming before the first tap change. Control may reset before actually changing taps.

`RegControls.Delay(arg)` – Set the time delay [s] after arming before the first tap change. Control may reset before actually changing taps.

`RegControls.TapDelay()` – Get the time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps.

`RegControls.TapDelay(arg)` – Set the time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps.

`RegControls.VoltageLimit()` – Get the first house voltage limit on PT secondary base. Setting to 0 disables this function.

`RegControls.VoltageLimit(arg)` – Set the first house voltage limit on PT secondary base. Setting to 0 disables this function.

`RegControls.ForwardBand()` – Get the regulation bandwidth in forward direction, centered on Vreg.

`RegControls.ForwardBand(arg)` – Set the regulation bandwidth in forward direction, centered on Vreg.

`RegControls.ForwardVreg()` – Get the target voltage in the forward direction, on PT secondary base.

`RegControls.ForwardVreg(arg)` – Set the target voltage in the forward direction, on PT secondary base.

`RegControls.ReverseBand()` – Get the bandwidth in reverse direction, centered on reverse Vreg.

`RegControls.ReverseBand(arg)` – Set the bandwidth in reverse direction, centered on reverse Vreg.

`RegControls.ReverseVreg()` – Get the target voltage in the reverse direction, on PT secondary base.

`RegControls.ReverseVreg(arg)` – Set the target voltage in the reverse direction, on PT secondary base.

`RegControls.Name()` – Get the active RegControl name.

`RegControls.Name(arg)` – Set the active RegControl name.

`RegControls.MonitoredBus()` – Get the name of the remote regulated bus, in lieu of LDC settings.

`RegControls.MonitoredBus(arg)` – Set the name of the remote regulated bus, in lieu of LDC settings.

`RegControls.Transformer()` – Get the name of the transformer this regulator controls.

`RegControls.Transformer(arg)` – Set the name of the transformer this regulator controls.

`RegControls.AllNames()` – Get a vector of strings containing all RegControl names.



<a id='relays'></a>
## `Relays`


<a id='OpenDSSDirect.DSS.Relays' href='#OpenDSSDirect.DSS.Relays'>#</a>**OpenDSSDirect.DSS.Relays** &mdash; *Module*.

---

**module Relays** – Functions for interfacing with the active OpenDSS Relay.

`Relays.Count()` – Get number of Relays in active circuit.

`Relays.First()` – Set first relay active. If none, returns 0.

`Relays.Next()` – Set next relay active. If none, returns 0.

`Relays.MonitoredTerm()` – Get the number of terminal of monitored element that this relay is monitoring.

`Relays.MonitoredTerm(arg)` – Set the number of terminal of monitored element that this relay is monitoring.

`Relays.SwitchedTerm()` – Get the number of terminal of the switched object that will be opened when the relay trips.

`Relays.SwitchedTerm(arg)` – Set the number of terminal of the switched object that will be opened when the relay trips.

`Relays.Idx()` – Get the active relay by index into the Relay list. 1..Count.

`Relays.Idx(arg)` – Set the active relay by index into the Relay list. 1..Count.

`Relays.Name()` – Get the name of the active Relay.

`Relays.Name(arg)` – Set the name of the active Relay.

`Relays.MonitoredObj()` – Get the full name of the object this relay is monitoring.

`Relays.MonitoredObj(arg)` – Set the full name of the object this relay is monitoring.

`Relays.SwitchedObj()` – Get the full name of element that will switched when relay trips.

`Relays.SwitchedObj(arg)` – Set the full name of element that will switched when relay trips.

`Relays.AllNames()` – Get a vector of strings containing names of all relay elements.



<a id='sensors'></a>
## `Sensors`


<a id='OpenDSSDirect.DSS.Sensors' href='#OpenDSSDirect.DSS.Sensors'>#</a>**OpenDSSDirect.DSS.Sensors** &mdash; *Module*.

---

**module Sensors** – Functions for interfacing with the active OpenDSS Sensor.

`Sensors.Count()` – Get number of Sensors in active circuit.

`Sensors.First()` – Set the first sensor active. Returns 0 if none.

`Sensors.Next()` – Set the next sensor active. Returns 0 if none

`Sensors.IsDelta()` – Returns 1 if the sensor is connected in delta; otherwise, returns 0.

`Sensors.IsDelta(arg)` – Allows to set 1 if the sensor is connected in delta; otherwise, set 0 (argument).

`Sensors.ReverseDelta()` – Returns 1 if voltage measurements are 1-3, 3-2, 2-1; otherwise 0.

`Sensors.ReverseDelta(arg)` – Allows to set 1 if voltage measurements are 1-3, 3-2, 2-1; otherwise 0.

`Sensors.MeteredTerminal()` – Get the number of the measured terminal in the measured element.

`Sensors.MeteredTerminal(arg)` – Set the number of the measured terminal in the measured element.

`Sensors.Reset()` – Clears the active sensor.

`Sensors.ResetAll()` – Clears all Sensors in the active circuit.

`Sensors.PctError()` – Get the assumed percent error in the Sensor measurement. Default is 1.

`Sensors.PctError(arg)` – Set the assumed percent error in the Sensor measurement. Default is 1.

`Sensors.Weight()` – Get the weighting factor for this sensor measurement with respect to the other Sensors. Default is 1.

`Sensors.Weight(arg)` – Set the weighting factor for this sensor measurement with respect to the other Sensors. Default is 1.

`Sensors.kVBase()` – Get the voltage base for the sensor measurements. LL for 2 and 3 - phase Sensors, LN for 1-phase Sensors.

`Sensors.kVBase(arg)` – Set the voltage base for the sensor measurements. LL for 2 and 3 - phase Sensors, LN for 1-phase Sensors.

`Sensors.Name()` – Get the name of the active sensor object.

`Sensors.Name(arg)` – Set the name of the active sensor object.

`Sensors.MeteredElement()` – Get the full name of the measured element.

`Sensors.MeteredElement(arg)` – Set the full name of the measured element.

`Sensors.AllNames()` – Returns a vector of sensor names.

`Sensors.Currents()` – Get an array of doubles for the line current measurements; don't use with KWS and KVARS.

`Sensors.kvar()` – Get an array of doubles for Q measurements; overwrites currents with a new estimate using KWS.

`Sensors.kW()` – Get an array of doubles for P measurements; overwrites currents with a new estimate using KVARS.



<a id='settings'></a>
## `Settings`


<a id='OpenDSSDirect.DSS.Settings' href='#OpenDSSDirect.DSS.Settings'>#</a>**OpenDSSDirect.DSS.Settings** &mdash; *Module*.

---

**module Settings** – Functions for controlling global OpenDSS settings.

`Settings.AllowDuplicates()` – Get if OpenDSS allows duplicate names of objects: {1 allow, 0 not allow}.

`Settings.AllowDuplicates(arg)` – Set if OpenDSS allows duplicate names of objects: {1 allow, 0 not allow}.

`Settings.ZoneLock()` – Get the status of Lock zones on energy Meters to prevent rebuilding if a circuit change occurs: {1= true, 0= False}.

`Settings.ZoneLock(arg)` – Set the status of Lock zones on energy Meters to prevent rebuilding if a circuit change occurs: {1= true, 0= False}.

`Settings.CktModel()` – Get {dssMultiphase* | dssPositiveSeq} Indicate if the circuit model is positive sequence.

`Settings.CktModel(arg)` – Set {dssMultiphase* | dssPositiveSeq} Indicate if the circuit model is positive sequence.

`Settings.Trapezoidal()` – Get {True (1) | False (0)} value of trapezoidal integration flag in Energy Meters.

`Settings.Trapezoidal(arg)` – Set {True (1) | False (0)} value of trapezoidal integration flag in Energy Meters.

`Settings.AllocationFactors(arg)` – Set all load allocation factors for all loads defined by XFKVA property to this value.

`Settings.NormVminpu()` – Get the per unit minimum voltage for Normal conditions.

`Settings.NormVminpu(arg)` – Set the per unit minimum voltage for Normal conditions.

`Settings.NormVmaxpu()` – Get the per unit maximum voltage for Normal conditions.

`Settings.NormVmaxpu(arg)` – Set the per unit maximum voltage for Normal conditions.

`Settings.EmergVminpu()` – Get the per unit minimum voltage for Emergency conditions.

`Settings.EmergVminpu(arg)` – Set the per unit minimum voltage for Emergency conditions.

`Settings.EmergVmaxpu()` – Get the per unit maximum voltage for Emergency conditions.

`Settings.EmergVmaxpu(arg)` – Set the per unit maximum voltage for Emergency conditions.

`Settings.UEWeight()` – Get the weighting factor applied to UE register values.

`Settings.UEWeight(arg)` – Set the weighting factor applied to UE register values.

`Settings.LossWeight()` – Get the weighting factor applied to Loss register values.

`Settings.LossWeight(arg)` – Set the weighting factor applied to Loss register values.

`Settings.PriceSignal()` – Get the price signal for the circuit.

`Settings.PriceSignal(arg)` – Set the price signal for the circuit.

`Settings.AutoBusList()` – Get the list of Buses or (File=xxxxx) syntax for the AutoAdd solution mode.

`Settings.AutoBusList(arg)` – Set the list of Buses or (File=xxxxx) syntax for the AutoAdd solution mode.

`Settings.PriceCurve()` – Get the name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.

`Settings.PriceCurve(arg)` – Set the name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.

`Settings.UERegs()` – Get the array of Integers defining Energy Meter registers to use for computing UE.

`Settings.LossRegs()` – Get the array of Integers defining Energy Meter registers to use for computing Losses.

`Settings.VoltageBases()` – Get the array of doubles defining the legal voltage bases in kV L-L.



<a id='solution'></a>
## `Solution`


<a id='OpenDSSDirect.DSS.Solution' href='#OpenDSSDirect.DSS.Solution'>#</a>**OpenDSSDirect.DSS.Solution** &mdash; *Module*.

---

**module Solution** – Functions for controlling OpenDSS solutions.

`Solution.Solve()` – Executes the solution for the present solution mode. Returns 0.

`Solution.Mode()` – The present solution mode (See DSS help).

`Solution.Mode(arg)` – Modifies the present solution mode (See DSS help).

`Solution.Hour()` – The present hour (See DSS help).

`Solution.Hour(arg)` – Modifies the present hour (See DSS help).

`Solution.Year()` – The present Year (See DSS help).

`Solution.Year(arg)` – Modifies the present Year (See DSS help).

`Solution.Iterations()` – Return the number of iterations taken for the last solution.

`Solution.MaxIterations()` – The Maximum number of iterations used to solve the circuit.

`Solution.MaxIterations(arg)` – Modifies the Maximum number of iterations used to solve the circuit.

`Solution.Number()` – The number of solutions to perform for MonteCarlo and time series simulations.

`Solution.Number(arg)` – Modifies the number of solutions to perform for MonteCarlo and time series simulations.

`Solution.Random()` – "The randomization mode for random variables " * (@Gaussian_str(" o ","Uniform") * ".")

`Solution.Random(arg)` – "Modifies the randomization mode for random variables " * (@Gaussian_str(" o ","Uniform") * ".")

`Solution.LoadModel()` – The Load Model: {dssPowerFlow (default)|dssAdmittance}.

`Solution.LoadModel(arg)` – Modifies the Load Model: {dssPowerFlow (default)|dssAdmittance}.

`Solution.AddType()` – The type of device to add in AutoAdd Mode: {dssGen (default)|dssCap}.

`Solution.AddType(arg)` – Modifies the type of device to add in AutoAdd Mode: {dssGen (default)|dssCap}.

`Solution.Algorithm()` – The base solution algorithm: {dssNormalSolve | dssNewtonSolve}.

`Solution.Algorithm(arg)` – Modifies the base solution algorithm: {dssNormalSolve | dssNewtonSolve}.

`Solution.ControlMode()` – The mode for control devices: {dssStatic (default) | dssEvent | dssTime}.

`Solution.ControlMode(arg)` – Modifies the mode for control devices: {dssStatic (default) | dssEvent | dssTime}.

`Solution.ControlIterations()` – The current value of the control iteration counter.

`Solution.ControlIterations(arg)` – Modifies the current value of the control iteration counter.

`Solution.MaxControlIterations()` – The maximum allowable control iterations.

`Solution.MaxControlIterations(arg)` – Modifies the maximum allowable control iterations.

`Solution.SampleDoControlActions()` – Sample controls and then process the control queue for present control mode and dispatch control actions. Returns 0.

`Solution.CheckFaultStatus()` – Executes status check on all fault objects defined in the circuit. Returns 0.

`Solution.SolveDirect()` – Executes a direct solution from the system Y matrix, ignoring compensation currents of loads, generators (includes Yprim only).

`Solution.SolvePFlow()` – Solves using present power flow method. Iterative solution rather than direct solution.

`Solution.SolveNoControl()` – Is similar to SolveSnap except no control actions are checked or executed.

`Solution.SolvePlusControl()` – Executes a power flow solution (SolveNoControl) plus executes a CheckControlActions that executes any pending control actions.

`Solution.InitSnap()` – Initializes some variables for snap shot power flow. SolveSnap does this automatically.

`Solution.CheckControls()` – Performs the normal process for sampling and executing Control Actions and Fault Status and rebuilds Y if necessary.

`Solution.SampleControlDevices()` – Executes a sampling of all intrinsic control devices, which push control actions into the control queue.

`Solution.DoControlActions()` – Pops control actions off the control queue and dispatches to the proper control element.

`Solution.BuildYMatrix()` – Forces building of the System Y matrix according to the argument: {1= series elements only | 2= Whole Y matrix}.

`Solution.SystemYChanged()` – Indicates if elements of the System Y have been changed by recent activity. If changed returns 1; otherwise 0.

`Solution.Converged()` – Indicates whether the circuit solution converged (1 converged | 0 not converged).

`Solution.Converged(arg)` – Modifies the converged flag (1 converged | 0 not converged).

`Solution.TotalIterations()` – The total iterations including control iterations for most recent solution.

`Solution.MostIterationsDone()` – The max number of iterations required to converge at any control iteration of the most recent solution.

`Solution.ControlActionsDone()` – Indicates that the control actions are done: {1 done, 0 not done}.

`Solution.ControlActionsDone(arg)` – Modifies the flag to indicate that the control actions are done: {1 done, 0 not done}.

`Solution.FinishTimeStep()` – Call cleanup, sample Monitors, and increment time at end of time step.

`Solution.Cleanup()` – Update storage, invcontrol, etc., at end of time step.

`Solution.Frequency()` – The frequency for the next solution.

`Solution.Frequency(arg)` – Set the frequency for the next solution.

`Solution.Seconds()` – The seconds from top of the hour.

`Solution.Seconds(arg)` – Set the seconds from top of the hour.

`Solution.StepSize()` – The step size for the next solution.

`Solution.StepSize(arg)` – Set the step size for the next solution.

`Solution.LoadMult()` – The default load multiplier applied to all non-fixed loads.

`Solution.LoadMult(arg)` – Set the default load multiplier applied to all non-fixed loads.

`Solution.Convergence()` – The solution convergence tolerance.

`Solution.Convergence(arg)` – Set the solution convergence tolerance.

`Solution.PctGrowth()` – The percent default annual load growth rate.

`Solution.PctGrowth(arg)` – Set the percent default annual load growth rate.

`Solution.GenkW()` – The generator kW for AutoAdd mode.

`Solution.GenkW(arg)` – Set the generator kW for AutoAdd mode.

`Solution.GenPF()` – The pf for generators in AutoAdd mode.

`Solution.GenPF(arg)` – Set the pf for generators in AutoAdd mode.

`Solution.Capkvar()` – The capacitor kvar for adding in AutoAdd mode.

`Solution.Capkvar(arg)` – Set the capacitor kvar for adding in AutoAdd mode.

`Solution.GenMult()` – The default multiplier applied to generators (like LoadMult).

`Solution.GenMult(arg)` – Set the default multiplier applied to generators (like LoadMult).

`Solution.DblHour()` – The hour as a double, including fractional part.

`Solution.DblHour(arg)` – Set the hour as a double, including fractional part.

`Solution.StepSizeMin()` – Set the step size in minutes.

`Solution.StepSizeHr()` – Set the step size in Hours.

`Solution.ModeID()` – The ID (text) of the present solution mode.

`Solution.LDCurve()` – The Load-Duration Curve name for LD modes.

`Solution.LDCurve(arg)` – Set the Load-Duration Curve name for LD modes.

`Solution.DefaultDaily()` – "The default daily load shape (defaults to " * @Default_str(").")

`Solution.DefaultDaily(arg)` – "Set the default daily load shape (defaults to " * @Default_str(").")

`Solution.DefaultYearly()` – "The default yearly load shape (defaults to " * @Default_str(").")

`Solution.DefaultYearly(arg)` – "Set the default yearly load shape (defaults to " * @Default_str(").")

`Solution.EventLog()` – Returns an array of strings containing the Event Log.



<a id='swtcontrols'></a>
## `SwtControls`


<a id='OpenDSSDirect.DSS.SwtControls' href='#OpenDSSDirect.DSS.SwtControls'>#</a>**OpenDSSDirect.DSS.SwtControls** &mdash; *Module*.

---

**module SwtControls** – Functions for interfacing with the active OpenDSS SwtControl.

`SwtControls.First()` – Set the first SwtControl active. Returns 0 if no more.

`SwtControls.Next()` – Set the next SwtControl active. Returns 0 if no more.

`SwtControls.Action()` – Get the open (1) or close (2) action of the switch. No effect if switch is locked. However, reset removes any lock and then closes the switch (shelf state). 0 = none action.

`SwtControls.Action(arg)` – Set open (1) or close (2) the switch. No effect if switch is locked. However, reset removes any lock and then closes the switch (shelf state). 0 = none action (see manual for details).

`SwtControls.IsLocked()` – Get the lock state: {1 locked | 0 not locked}.

`SwtControls.IsLocked(arg)` – Set the lock to prevent both manual and automatic switch operation.

`SwtControls.SwitchedTerm()` – Get the terminal number where the switch is located on the SwitchedObj.

`SwtControls.SwitchedTerm(arg)` – Set the terminal number where the switch is located on the SwitchedObj.

`SwtControls.Count()` – Get the total number of SwtControls in the active circuit.

`SwtControls.Delay()` – Get the time delay [s] between arming and opening or closing the switch. Control may reset before actually operating the switch.

`SwtControls.Delay(arg)` – Set the time delay [s] between arming and opening or closing the switch. Control may reset before actually operating the switch.

`SwtControls.Name()` – Get the name of the active SwtControl.

`SwtControls.Name(arg)` – Set a SwtControl active by name.

`SwtControls.SwitchedObj()` – Get the name of the switched object by the active SwtControl.

`SwtControls.SwitchedObj(arg)` – Set the switched object by name.

`SwtControls.AllNames()` – Get a vector of strings with all SwtControl names in the active circuit.



<a id='topology'></a>
## `Topology`


<a id='OpenDSSDirect.DSS.Topology' href='#OpenDSSDirect.DSS.Topology'>#</a>**OpenDSSDirect.DSS.Topology** &mdash; *Module*.

---

**module Topology** – Functions for interfacing with the active OpenDSS Topology.

`Topology.NumLoops()` – Get the number of loops.

`Topology.NumIsolatedBranches()` – Get the number of isolated branches (PD elements and capacitors).

`Topology.NumIsolatedLoads()` – Get the number of isolated loads.

`Topology.First()` – Set the first branch active, returns 0 if none.

`Topology.Next()` – Set the next branch active, returns 0 if none.

`Topology.ActiveBranch()` – The index of the active Branch.

`Topology.ForwardBranch()` – Move forward in the tree, return index of new active branch or 0 if no more.

`Topology.BackwardBranch()` – Move back toward the source, return index of new active branch or 0 if no more.

`Topology.LoopedBranch()` – Move to looped branch, return index or 0 if none.

`Topology.ParallelBranch()` – Mode to directly parallel branch, return index or 0 if none.

`Topology.FirstLoad()` – Set as active load the first load at the active branch, return index or 0 if none.

`Topology.NextLoad()` – Set as active load the next load at the active branch, return index or 0 if none.

`Topology.ActiveLevel()` – Get the topological depth of the active branch.

`Topology.BranchName()` – Get the name of the active branch.

`Topology.BranchName(arg)` – Set the name of the active branch.

`Topology.BusName()` – Get the name of the active Bus.

`Topology.BusName(arg)` – Set the Bus active by name.

`Topology.AllLoopedPairs()` – Get a vector of all looped element names, by pairs.

`Topology.AllIsolatedBranches()` – Get a vector of all isolated branch names.

`Topology.AllIsolatedLoads()` – Get a vector of all isolated load names.



<a id='transformers'></a>
## `Transformers`


<a id='OpenDSSDirect.DSS.Transformers' href='#OpenDSSDirect.DSS.Transformers'>#</a>**OpenDSSDirect.DSS.Transformers** &mdash; *Module*.

---

**module Transformers** – Functions for interfacing with the active OpenDSS transformer.

`Transformers.NumWindings()` – Get the number of windings on this transformer. Allocates memory; set or change this property first.

`Transformers.NumWindings(arg)` – Set the number of windings on this transformer. Allocates memory; set or change this property first.

`Transformers.Wdg()` – Get the active winding number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.).

`Transformers.Wdg(arg)` – Set the active winding number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.).

`Transformers.NumTaps()` – Get the active winding number of tap steps between MinTap and MaxTap.

`Transformers.NumTaps(arg)` – Set the active winding number of tap steps between MinTap and MaxTap

`Transformers.IsDelta()` – Get the information about if the active winding is delta (1) or wye (0) connection.

`Transformers.IsDelta(arg)` – Set the information about if the active winding is delta (1) or wye (0) connection.

`Transformers.First()` – Set the first Transformer active. Return 0 if no more.

`Transformers.Next()` – Set the next Transformer active. Return 0 if no more.

`Transformers.Count()` – Get the number of Transformers within the active circuit.

`Transformers.R()` – Get the active winding resistance in %.

`Transformers.R(arg)` – Set the active winding resistance in %.

`Transformers.Tap()` – Get the active winding tap in per-unit.

`Transformers.Tap(arg)` – Set the active winding tap in per-unit.

`Transformers.MinTap()` – Get the active winding minimum tap in per-unit.

`Transformers.MinTap(arg)` – Set the active winding minimum tap in per-unit.

`Transformers.MaxTap()` – Get the active winding maximum tap in per-unit.

`Transformers.MaxTap(arg)` – Set the active winding maximum tap in per-unit.

`Transformers.kV()` – Get the active winding kV rating. Phase-phase for 2 or 3 phases, actual winding kV 1 phase transformer.

`Transformers.kV(arg)` – Set the active winding kV rating. Phase-phase for 2 or 3 phases, actual winding kV 1 phase transformer.

`Transformers.kVA()` – Get the active winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings.

`Transformers.kVA(arg)` – Set the active winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings.

`Transformers.Xneut()` – Get the active winding neutral reactance [ohms] for wye connections.

`Transformers.Xneut(arg)` – Set the active winding neutral reactance [ohms] for wye connections.

`Transformers.Rneut()` – Get the active winding neutral resistance [ohms] for wye connections. Set less than zero ungrounded wye.

`Transformers.Rneut(arg)` – Set the active winding neutral resistance [ohms] for wye connections. Set less than zero ungrounded wye.

`Transformers.Xhl()` – Get the percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2 winding or 3 winding Transformers.

`Transformers.Xhl(arg)` – Set the percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2 winding or 3 winding Transformers.

`Transformers.Xht()` – Get the percent reactance between windings 1 and 3, on winding 1 kVA base. Use for 3 winding Transformers only.

`Transformers.Xht(arg)` – Set the percent reactance between windings 1 and 3, on winding 1 kVA base. Use for 3 winding Transformers only.

`Transformers.Xlt()` – Get the percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3 winding Transformers only.

`Transformers.Xlt(arg)` – Set the percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3 winding Transformers only.

`Transformers.XfmrCode()` – Get the name of an XfrmCode that supplies electrical paraMeters for this transformer.

`Transformers.XfmrCode(arg)` – Set the name of an XfrmCode that supplies electrical paraMeters for this transformer.

`Transformers.Name()` – Get the active transformer name and 3, on winding_1_kVA base. Use for 3 winding transformer only.

`Transformers.Name(arg)` – Set the active transformer name and 3, on winding_1_kVA base. Use for 3 winding transformer only.

`Transformers.AllNames()` – Get a vector of strings with all Transformer names in the active circuit.



<a id='vsources'></a>
## `Vsources`


<a id='OpenDSSDirect.DSS.Vsources' href='#OpenDSSDirect.DSS.Vsources'>#</a>**OpenDSSDirect.DSS.Vsources** &mdash; *Module*.

---

**module Vsources** – Functions for interfacing with the active OpenDSS voltage source.

`Vsources.Count()` – The number of VSource objects currently defined in the active circuit.

`Vsources.First()` – Set the first VSource to be active; returns 0 if none.

`Vsources.Next()` – Set the next VSource to be active; returns 0 if none.

`Vsources.Phases()` – Get the number of phases of the active VSource.

`Vsources.Phases(arg)` – Set the number of phases of the active VSource.

`Vsources.BasekV()` – Get the source voltage in kV.

`Vsources.BasekV(arg)` – Set the source voltage in kV.

`Vsources.PU()` – Get the source voltage in pu.

`Vsources.PU(arg)` – Set the source voltage in pu.

`Vsources.AngleDeg()` – Get the source phase angle of first phase in degrees.

`Vsources.AngleDeg(arg)` – Set the source phase angle of first phase in degrees.

`Vsources.Frequency()` – Get the source frequency in Hz.

`Vsources.Frequency(arg)` – Set the source frequency in Hz.

`Vsources.Name()` – Get the name of the active VSource.

`Vsources.Name(arg)` – Set the name of the active VSource.

`Vsources.AllNames()` – Get the names of all Vsources



<a id='xycurves'></a>
## `XYCurves`


<a id='OpenDSSDirect.DSS.XYCurves' href='#OpenDSSDirect.DSS.XYCurves'>#</a>**OpenDSSDirect.DSS.XYCurves** &mdash; *Module*.

---

**module XYCurves** – Functions for interfacing with the active OpenDSS XYCurve.

`XYCurves.Count()` – Get number of XYCurves in active circuit.

`XYCurves.First()` – Set first XYCurves object active; returns 0 if none.

`XYCurves.Next()` – Set next XYCurves object active; returns 0 if none.

`XYCurves.Npts()` – Get the number of points in X-Y curve.

`XYCurves.Npts(arg)` – Set the number of points in X-Y curve.

`XYCurves.X()` – Get the interpolated value after setting Y.

`XYCurves.X(arg)` – Set the X value.

`XYCurves.Y()` – Get the interpolated value after setting X.

`XYCurves.Y(arg)` – Set the Y value.

`XYCurves.XShift()` – Get the amount to shift X value from original curve.

`XYCurves.XShift(arg)` – Set the amount to shift X value from original curve.

`XYCurves.YShift()` – Get the amount to shift Y value from original curve.

`XYCurves.YShift(arg)` – Set the amount to shift Y value from original curve.

`XYCurves.XScale()` – Get the factor to scale X values from original curve.

`XYCurves.XScale(arg)` – Set the factor to scale X values from original curve.

`XYCurves.YScale()` – Get the factor to scale Y values from original curve.

`XYCurves.YScale(arg)` – Set the factor to scale Y values from original curve.

`XYCurves.Name()` – Get the name of the active XYCurve Object.

`XYCurves.Name(arg)` – Set the name of the active XYCurve Object.

`XYCurves.XArray()` – Get the X values as a vector of doubles. Set Npts to max number expected if setting.

`XYCurves.YArray()` – Get the Y values as a vector of doubles. Set Npts to max number expected if setting.


