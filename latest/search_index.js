var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#OpenDSSDirect-1",
    "page": "Home",
    "title": "OpenDSSDirect",
    "category": "section",
    "text": "OpenDSS is an open-source distribution system simulator. This Julia package implements a \"direct\" library interface to OpenDSS. See this documentation for detailed information on the direct library interface to OpenDSS. The direct library interface can be faster than the more traditional COM interface."
},

{
    "location": "index.html#Installation-1",
    "page": "Home",
    "title": "Installation",
    "category": "section",
    "text": "For now, this package is registered, so you can use the following to install:Pkg.add(\"OpenDSSDirect\")To install the latest development version, use the following from within Julia:Pkg.checkout(\"OpenDSSDirect\")This package includes OpenDSS as a library. You do not have to install OpenDSS separately. In particular, it includes the OpenDSSDirect dynamically linked library that implements the direct-access API.Note that this should work on 32- and 64-bit Windows systems and 64-bit Linux systems. The Windows dynamic-linked libraries are taken from the official libraries ccompiled by Delphi. The Linux library is based on the LazDSS branch. The Linux library was compiled on an older version of Linux (Centos 6.4). It  should run on most newer versions of Linux. If it does not, you can try compiling the library on your system. It should also be possible to extend this to support Apple Mac OS because LazDSS supports that. Including DLL binaries is not the best practices, but this works well enough for now. Installing and compiling Lazarus and LazDSS is not easy to do as part of package installation."
},

{
    "location": "index.html#Features-1",
    "page": "Home",
    "title": "Features",
    "category": "section",
    "text": "Julia is a fast, flexible numerical language with Matlab-like syntax. Like Python or Matlab, scripting OpenDSS can be used for Monte-Carlo batch runs, parameter sweeps, post processing and plotting of results, and more.Julia has several key features for advanced operations with OpenDSS:Parallel operations – Julia supports several ways to process data in parallel. This includes parallel operations on multiple CPU cores and parallel operations on processes in a cluster. See examples/8760_pmap.jl for an example of an annual simulation split among local CPU cores.\nOptimization – Julia has strong support for optimization.\nCustom solutions and custom models – Because Julia compiles to codes that run as quickly as C programs, it is possible to implement custom solutions, and these custom solutions can contain custom models implemented in Julia. The basic idea is to run a custom solution as described in OpenDSS Solution Interface.pdf. Custom control or power control elements can be implemented between each model iteration. See examples/low-level-solver.jl for an example with a custom solver, including a case with an alternate sparse matrix solver."
},

{
    "location": "index.html#Example-1",
    "page": "Home",
    "title": "Example",
    "category": "section",
    "text": "The dss function is the main function for passing commands to OpenDSS.  After that, a number of modules are available to access different data structures in OpenDSS. Here is an example summing the kW and kvar from loads using the  Loads module:using OpenDSSDirect.DSS\nfilename = Pkg.dir(\"OpenDSSDirect\", \"examples\", \"8500-Node\", \"Master.dss\")\ndss(\"\"\"\n    clear\n    compile $filename\n    solve\n\"\"\")\n\nloadnumber = Loads.First()\nkWsum = 0.0\nkvarsum = 0.0\nwhile loadnumber > 0\n    kWsum += Loads.kW()\n    kvarsum += Loads.kvar()\n    loadnumber = Loads.Next()\nend"
},

{
    "location": "index.html#Contents-1",
    "page": "Home",
    "title": "Contents",
    "category": "section",
    "text": "Pages = [\n    \"api.md\",\n    \"flags.md\",\n    \"dssmode.md\",\n    \"lowlevel.md\",\n    \"docindex.md\"\n]\nDepth = 1"
},

{
    "location": "api.html#",
    "page": "Main API",
    "title": "Main API",
    "category": "page",
    "text": "CurrentModule = OpenDSSDirect.DSS"
},

{
    "location": "api.html#Main-API-(module-DSS)-1",
    "page": "Main API",
    "title": "Main API (module DSS)",
    "category": "section",
    "text": "The dss function is the main function for passing commands to OpenDSS. You can pass multi-line commands with dss. You can also splice in Julia values with string interpolation. Here is an  example of using dss:using OpenDSSDirect\nfilename = \"C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss\"\ndss(\"\"\"\n    clear\n    compile $filename\n\"\"\")Several functions are available for setting OpenDSS variables, getting values, and initiating commands. Each of these is in one of several modules. Here is an example to set the kW of the active load element:DSS.Loads.kW(50.)Here is an example setting some loads:using OpenDSSDirect\nfilename = \"C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss\"\ndss(\"\"\"\n    clear\n    compile $filename\n\"\"\")\nloadnumber = DSS.Loads.First()\nwhile loadnumber > 0\n    DSS.Loads.kW(50.)\n    DSS.Loads.kvar(20.)\n    loadnumber = DSS.Loads.Next()\nend\nprintln(DSS.Loads.Count())To use this API, you can either use import OpenDSSDirect and prepend all of the functions with DSS., or you can import OpenDSSDirect.DSS and use the functions directly. The following two are equivalent:using OpenDSSDirect\nDSS.Circuit.TotalPower()Importing the DSS module:using OpenDSSDirect.DSS\nCircuit.TotalPower()Many of the functions that return arrays convert to complex numbers where appropriate. Here is an example session:julia> using OpenDSSDirect.DSS\n\njulia> filename = joinpath(Pkg.dir(), \"OpenDSSDirect\", \"examples\", \"8500-Node\", \"Master.dss\");\n\njulia> dss(\"\"\"\n           clear\n           compile $filename\n       \"\"\")\n\njulia> Solution.Solve();\n\njulia> Circuit.Losses()\n1.218242333223247e6 + 2.798391857088721e6im\n\njulia> Circuit.TotalPower()\n-12004.740450109337 - 1471.1749507157301im\n\njulia> Circuit.SetActiveElement(\"Capacitor.CAPBank3\")\n\"6075\"\n\njulia> CktElement.Voltages()\n6-element Array{Complex{Float64},1}:\n  5390.82-4652.32im\n -6856.89-2274.93im\n  1284.62+7285.18im\n      0.0+0.0im\n      0.0+0.0im\n      0.0+0.0imTo find the functions available in each module, use Julia's help for each module (initiated by hitting ?). See below for an example.julia> using OpenDSSDirect.DSS\n\nhelp?> Circuit\nsearch: Circuit\n\n  module Circuit – Functions for interfacing with the active OpenDSS circuit.\n\n  Circuit.NumCktElements() – Number of CktElements in the circuit\n\n  Circuit.NumBuses() – Total number of Buses in the circuit\n\n  Circuit.NumNodes() – Total number of Nodes in the circuit\n\n  Circuit.FirstPCElement() – Sets the first enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0\n\n  Circuit.NextPCElement() – Sets the next enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0\n\n  Circuit.FirstPDElement() – Sets the first enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0\n\n  Circuit.NextPDElement() – Sets the next enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0\n\n  {truncated...}Here is a list of modules supported by this API. Each module has several functions.Pages = [\"api.md\"]"
},

{
    "location": "api.html#OpenDSSDirect.DSS.dss",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.dss",
    "category": "Function",
    "text": "dss(arg::AbstractString)\n\nExecute the OpenDSS text command arg.\n\n\n\n"
},

{
    "location": "api.html#dss-1",
    "page": "Main API",
    "title": "dss",
    "category": "section",
    "text": "dss"
},

{
    "location": "api.html#OpenDSSDirect.DSS.ActiveClass",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.ActiveClass",
    "category": "Module",
    "text": "module ActiveClass – Functions for interfacing with the active OpenDSS class.\n\nActiveClass.First() – Sets the first element in the active class to be the active object; if object is a CktElement, ActiveCktElement also points to this element; returns 0 if none\n\nActiveClass.Next() – Sets the next element in the active class to be the active object; if object is a CktElement, ActiveCktElement also points to this element; returns 0 if no more\n\nActiveClass.NumElements() – Number of elements in the active class\n\nActiveClass.Count() – Number of elements in the active class; same as NumElements\n\nActiveClass.Name() – Name of the active element of the active class\n\nActiveClass.Name(arg) – Set the name of the active element of the active class\n\nActiveClass.ActiveClassName() – Name of the active class\n\nActiveClass.AllNames() – All element names in the active class\n\n\n\n"
},

{
    "location": "api.html#ActiveClass-1",
    "page": "Main API",
    "title": "ActiveClass",
    "category": "section",
    "text": "ActiveClass"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Basic",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Basic",
    "category": "Module",
    "text": "module Basic – Includes methods for basic OpenDSS information.\n\nBasic.NumCircuits() – Number of Circuits currently defined\n\nBasic.ClearAll() – Clears all circuit definitions\n\nBasic.ShowPanel() – Shows non‐MDI child form of the Main DSS Edit Form\n\nBasic.Start() – Validate the user and start OpenDSS; returns true if successful\n\nBasic.NumClasses() – Number of DSS intrinsic classes\n\nBasic.NumUserClasses() – Number of user‐defined classes\n\nBasic.Reset() – Resets DSS Initialization for restarts\n\nBasic.AllowForms() – Bool flag on the status of allowing forms\n\nBasic.AllowForms(arg) – Bool flag to disable forms (once disabled, can’t be enabled again)\n\nBasic.NewCircuit() – Make a new circuit\n\nBasic.Version() – Get version string for OpenDSS\n\nBasic.DataPath() – Default file path for reports, etc.\n\nBasic.DataPath(arg) – Set the default file path for reports, etc.\n\nBasic.DefaultEditor() – The path name for the default text editor\n\nBasic.Classes() – List of the names of intrinsic classes\n\nBasic.UserClasses() – List of the names of user-defined classes\n\n\n\n"
},

{
    "location": "api.html#Basic-1",
    "page": "Main API",
    "title": "Basic",
    "category": "section",
    "text": "Basic"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Bus",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Bus",
    "category": "Module",
    "text": "module Bus – Functions for interfacing with the active OpenDSS bus.\n\nBus.NumNodes() – Number of nodes\n\nBus.ZscRefresh() – Refresh Zsc and Ysc values; execute after a major change in the circuit\n\nBus.Coorddefined() – Returns true if the X-Y coordinates are defined for the active bus\n\nBus.GetUniqueNodeNumber() – Returns a unique node number at the active bus to avoid node collisions and adds it to the node list for the bus\n\nBus.N_Customers() – Returns the total number of customers downline from the active bus after reliability calcs\n\nBus.SectionID() – Integer ID of the feeder section in which this bus is located\n\nBus.kVBase() – Base voltage\n\nBus.X() – X coordinate of the bus\n\nBus.X(arg) – Set the X coordinate of the bus\n\nBus.Y() – Y coordinate of the bus\n\nBus.Y(arg) – Set the Y coordinate of the bus\n\nBus.Distance() – Distance in km that this bus isfrom the parent EnergyMeter\n\nBus.Lambda() – Total annual failure rate for active bus after reliability calcs\n\nBus.N_interrupts() – Number of interruptions this bus per year\n\nBus.Int_Duration() – Average interruption duration, hours\n\nBus.Cust_Interrupts() – Annual number of customer-interruptions from this bus\n\nBus.Cust_Duration() – Accumulated customer outage durations, hours\n\nBus.TotalMiles() – Total length of line downline from this bus, miles\n\nBus.Name() – Active bus name; set the active bus by name with circuit.SetActiveBus(name)\n\nBus.Voltages() – Bus voltages, complex\n\nBus.SeqVoltages() – Sequence voltages in order of 0, 1, then 2\n\nBus.Nodes() – Vector of node numbers defined at the bus in the same order as the voltages\n\nBus.Voc() – Open-circuit voltage vector, complex\n\nBus.Isc() – Short-circuit current vector, complex\n\nBus.PuVoltage() – Per-unit voltages at the bus, complex\n\nBus.ZscMatrix() – Short-circuit impedance matrix, complex\n\nBus.Zsc1() – Positive-sequence short-circuit impedance looking into the bus, complex\n\nBus.Zsc0() – Zero-sequence short-circuit impedance looking into the bus, complex\n\nBus.YscMatrix() – Short-circuit admittance matrix, complex\n\nBus.CplxSeqVoltages() – All complex sequence voltages\n\nBus.VLL() – Complex vector of line-to-line voltages for 2- and 3-phase buses; returns -1. for a 1-phase bus; for more than 3 phases, only returns 3 phases\n\nBus.puVLL() – Complex vector of per-unit line-to-line voltages for 2- and 3-phase buses; returns -1. for a 1-phase bus; for more than 3 phases, only returns 3 phases\n\nBus.VMagAngle() – Bus voltage magnitudes with angles\n\nBus.puVmagAngle() – Bus voltage magnitudes (per unit) with angles\n\n\n\n"
},

{
    "location": "api.html#Bus-1",
    "page": "Main API",
    "title": "Bus",
    "category": "section",
    "text": "Bus"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Capacitors",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Capacitors",
    "category": "Module",
    "text": "module Capacitors – Functions for interfacing with the active OpenDSS capacitor.\n\nCapacitors.NumSteps() – Number of steps\n\nCapacitors.NumSteps(arg) – Set the number of steps\n\nCapacitors.IsDelta() – Is the connection a delta\n\nCapacitors.IsDelta(arg) – Set connection type; use arg==true for delta and arg==false for wye\n\nCapacitors.First() – Sets the first Capacitor active; returns 0 if none\n\nCapacitors.Next() – Sets the next Capacitor active; returns 0 if no more\n\nCapacitors.Count() – Number of capacitor objects in the active circuit\n\nCapacitors.AddStep() – Adds one step of the capacitor if available; if successful, returns 1\n\nCapacitors.SubtractStep() – Subtracts one step of the capacitor; if no more steps, returns 0\n\nCapacitors.AvailableSteps() – Number of steps available in the cap bank to be switched ON\n\nCapacitors.Open() – Open all steps, all phases of the capacitor\n\nCapacitors.Close() – Close all steps of all phases of the capacitor\n\nCapacitors.kV() – Bank kV rating; use LL for 2 or 3 phases, or actual can rating for 1 phase\n\nCapacitors.kV(arg) – Set the bank kV rating; use LL for 2 or 3 phases, or actual can rating for 1 phase\n\nCapacitors.kvar() – Total bank kvar, distributed equally among phases and steps\n\nCapacitors.kvar(arg) – Set the total bank kvar, distributed equally among phases and steps\n\nCapacitors.Name() – The name of the active capacitor\n\nCapacitors.Name(arg) – Sets the active capacitor by name\n\nCapacitors.AllNames() – All capacitor names in the circuit\n\nCapacitors.States() – A vector of  integers [0..numsteps‐1] indicating state of each step; if value is ‐1 an error has occurred.\n\n\n\n"
},

{
    "location": "api.html#Capacitors-1",
    "page": "Main API",
    "title": "Capacitors",
    "category": "section",
    "text": "Capacitors"
},

{
    "location": "api.html#OpenDSSDirect.DSS.CapControls",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.CapControls",
    "category": "Module",
    "text": "module CapControls – Functions for interfacing with the active OpenDSS CapControl.\n\nCapControls.First() – Sets the first CapControl active; returns 0 if none\n\nCapControls.Next() – Sets the next CapControl active; returns 0 if no more\n\nCapControls.Mode() – Type of automatic controller; for meaning, see CapControlModes\n\nCapControls.Mode(arg) – Set the type of automatic controller; for choices, see CapControlModes\n\nCapControls.MonitoredTerm() – Terminal number on the element that PT and CT are connected to\n\nCapControls.MonitoredTerm(arg) – Set the terminal number on the element that PT and CT are connected to\n\nCapControls.UseVoltOverride() – Bool flag that enables Vmin and Vmax to override the control mode\n\nCapControls.UseVoltOverride(arg) – Set the Bool flag that enables Vmin and Vmax to override the control mode\n\nCapControls.Count() – Number of CapControls in the active circuit\n\nCapControls.CTRatio() – Transducer ratio from primary current to control current\n\nCapControls.CTRatio(arg) – Set the transducer ratio from primary current to control current\n\nCapControls.PTRatio() – Transducer ratio from primary voltage to control voltage\n\nCapControls.PTRatio(arg) – Set the transducer ratio from primary voltage to control voltage\n\nCapControls.ONSetting() – Threshold to arm or switch on a step; see Mode for units\n\nCapControls.ONSetting(arg) – Set the threshold to arm or switch on a step; see Mode for units\n\nCapControls.OFFSetting() – Threshold to switch off a step; see the particular CapControlModes option for units\n\nCapControls.OFFSetting(arg) – Set the threshold to switch off a step; see the particular CapControlModes option for units\n\nCapControls.Vmax() – With VoltOverride, switch off whenever PT voltage exceeds this level\n\nCapControls.Vmax(arg) – Set Vmax; with VoltOverride, switch off whenever PT voltage exceeds this level\n\nCapControls.Vmin() – With VoltOverride, switch on whenever PT voltage drops below this level\n\nCapControls.Vmin(arg) – Set Vmin; with VoltOverride, switch on whenever PT voltage drops below this level\n\nCapControls.Delay() – Time delay [s] to switch on after arming; control may reset before actuallyswitching\n\nCapControls.Delay(arg) – Set the time delay [s] to switch on after arming; control may reset before actuallyswitching\n\nCapControls.DelayOff() – Time delay [s] before switching off a step; control may reset before actuallyswitching\n\nCapControls.DelayOff(arg) – Set the time delay [s] before switching off a step; control may reset before actually switching\n\nCapControls.Name() – The name of the active CapControl\n\nCapControls.Name(arg) – Set the active CapControl by name\n\nCapControls.Capacitor() – Name of the Capacitor that is controlled\n\nCapControls.Capacitor(arg) – Set the Capacitor (by name) that is controlled\n\nCapControls.MonitoredObj() – Full name of the element that PT and CT are connected to\n\nCapControls.MonitoredObj(arg) – Set the element (by full name) that PT and CT are connected to\n\nCapControls.AllNames() – Names of all CapControls in the circuit\n\n\n\n"
},

{
    "location": "api.html#CapControls-1",
    "page": "Main API",
    "title": "CapControls",
    "category": "section",
    "text": "CapControls"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Circuit",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Circuit",
    "category": "Module",
    "text": "module Circuit – Functions for interfacing with the active OpenDSS circuit.\n\nCircuit.NumCktElements() – Number of CktElements in the circuit\n\nCircuit.NumBuses() – Total number of Buses in the circuit\n\nCircuit.NumNodes() – Total number of Nodes in the circuit\n\nCircuit.FirstPCElement() – Sets the first enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0\n\nCircuit.NextPCElement() – Sets the next enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0\n\nCircuit.FirstPDElement() – Sets the first enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0\n\nCircuit.NextPDElement() – Sets the next enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0\n\nCircuit.Sample() – Force all Meters and Monitors to take a sample\n\nCircuit.SaveSample() – Force all Meters and Monitors to save their current buffers\n\nCircuit.SetActiveBusi(arg) – Sets the active bus by integer index. The index is 0 based. That is, the first bus has an index of 0. Returns -1 if an error occurs.\n\nCircuit.FirstElement() – Sets First element of active class to be the Active element in the active circuit. Returns 0 if none.\n\nCircuit.NextElement() – Sets the next element of the active class to be the active element in the active circuit. Returns 0 if no more elements.\n\nCircuit.UpdateStorage() – Forces update to all storage classes. Typically done after a solution. Done automatically in intrinsic solution modes.\n\nCircuit.ParentPDElement() – Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable.\n\nCircuit.EndOfTimeStepUpdate() – Calls EndOfTimeStepCleanup in SolutionAlgs\n\nCircuit.Capacity(arg1, arg2) – Executes the DSS capacity function. Start is the per unit load multiplier for the current year at which to start the search. Increment is the per unit value by which the load increments for each step of the analysis. The program sets the load at the Start value the PRESENT YEAR (including growth) and increments the load until something in thecircuit reports an overload or undervoltage violation. The function returns the total load at which the violation occurs or the peak load for the present year if no violations.\n\nCircuit.Name() – Name of the active circuit\n\nCircuit.Disable(arg) – Disable a circuit element by name (full name).\n\nCircuit.Enable(arg) – Enable a circuit element by name (full name).\n\nCircuit.SetActiveElement(arg) – Activate an element of the active circuit by name. Returns a string with the index of the active element.\n\nCircuit.SetActiveBus(arg) – Sets the active bus by name. Returns a 0 based index of the bus to use for future direct indexing of bus values returned in arrays. Returns -1 if an error occurs.\n\nCircuit.SetActiveClass(arg) – Sets the active class by name.  Use FirstElement, NextElement to iterate through the class. Returns ‐1 if fails.\n\nCircuit.Losses() – Watt and var losses in the entire circuit, complex\n\nCircuit.LineLosses() – Watt and var losses in all the Line elements in the circuit, complex\n\nCircuit.SubstationLosses() – Watt and var losses in all the Transformer elements in the circuit that are designated as substations\n\nCircuit.TotalPower() – Returns the total power in kW and kvar supplied to the circuit by all Vsource and Isource objects. Does not include Generator objects. Complex.\n\nCircuit.AllBusVolts() – Returns the voltage (complex) for every node in the circuit as a complex vector. The order of the array is the same as AllNodeNames property. The array is constructed bus-by-bus and then by node at each bus. Thus, all nodes from each bus are grouped together.\n\nCircuit.AllBusVMag() – Similar to AllBusVolts except magnitude only (in actual volts). Returns the voltage (magnitude) for every node in the circuit as a complex vector.\n\nCircuit.AllElementNames() – The names of all elements\n\nCircuit.AllBusNames() – The names of all buses in the system. See :AllNodeNames.\n\nCircuit.AllElementLosses() – Returns the watt and var losses in each element of the system as a complex vector. Order is the same as AllElementNames.\n\nCircuit.AllBusMagPu() – Similar to AllBusVmag except that the magnitudes are reported in per unit for all buses with kVBase defined.\n\nCircuit.AllNodeNames() – Returns the names of all nodes (busname.nodenumber) in the same order as AllBusVolts, AllBusVmag, and AllBusVMagPu\n\nCircuit.SystemY() – Return the System Y matrix as a complex (dense) matrix\n\nCircuit.AllBusDistances() – Returns all distances from a bus to its parent EnergyMeter element, which is generally in the substation, as a variant array of doubles. Order corresponds to that of all bus properties.\n\nCircuit.AllNodeDistances() – Returns the distance from all nodes to the parent energy meter that match the designated phase number. Returns a vector of doubles. Matches the order of AllNodeNamesByPhase, AllNodeVmagByPhase, AllNodeVmagPUByPhase.\n\nCircuit.YNodeVArray() – Complex array of actual node voltages in same order as SystemY matrix.\n\nCircuit.YNodeOrder() – The names of the nodes in the same order as the Y matrix\n\nCircuit.YCurrents() – Vector of doubles containing complex injection currents for the present solution.\n\n\n\n"
},

{
    "location": "api.html#Circuit-1",
    "page": "Main API",
    "title": "Circuit",
    "category": "section",
    "text": "Circuit"
},

{
    "location": "api.html#OpenDSSDirect.DSS.CktElement",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.CktElement",
    "category": "Module",
    "text": "module CktElement – Functions for interfacing with the active OpenDSS CktElement.\n\nCktElement.NumTerminals() – Number of Terminals on this Circuit Element\n\nCktElement.NumConductors() – Number of Conductors per Terminal\n\nCktElement.NumPhases() – Number of phases\n\nCktElement.Open() – Open the specified terminal and phase, if non‐zero.  Else all conductors at terminal.\n\nCktElement.Close() – Close the specified terminal and phase, if non‐zero.  Else all conductors at terminal.\n\nCktElement.IsOpen() – Bool indicating if the specified terminal and, optionally, phase is open.\n\nCktElement.NumProperties() – Number of Properties this Circuit Element.\n\nCktElement.HasSwitchControl() – Bool indicating whether this element has a SwtControl attached.\n\nCktElement.HasVoltControl() – This element has a CapControl or RegControl attached.\n\nCktElement.NumControls() – Number of controls connected to this device. Use to determine valid range for index into Controller array.\n\nCktElement.OCPDevIndex() – Index into Controller list of OCP Device controlling this CktElement\n\nCktElement.OCPDevType() – 0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device\n\nCktElement.Enabled() – Element is enabled\n\nCktElement.Enabled(arg) – Enable the active circuit element\n\nCktElement.NormalAmps() – Normal ampere rating for PD Elements\n\nCktElement.NormalAmps(arg) – Set the normal ampere rating for PD Elements\n\nCktElement.EmergAmps() – Emergency Ampere Rating for PD elements\n\nCktElement.EmergAmps(arg) – Set the emergency Ampere Rating for PD elements\n\nCktElement.Variablei() – For PCElement, get the value of a variable by integer index.\n\nCktElement.Name() – Full Name of Active Circuit Element\n\nCktElement.DisplayName() – Display name of the object (not necessarily unique)\n\nCktElement.DisplayName(arg) – Set the display name of the object (not necessarily unique)\n\nCktElement.GUID() – Globally unique identifier for this object\n\nCktElement.EnergyMeter() – Name of the Energy Meter this element is assigned to\n\nCktElement.Controller() – Full name of the i‐th controller attached to this element. Ex: str = Controller\n\nCktElement.BusNames() – Get  Bus definitions to which each terminal is connected. 0‐based array.\n\nCktElement.Voltages() – Complex array of voltages at terminals\n\nCktElement.Currents() – Complex array of currents into each conductor of each terminal\n\nCktElement.Powers() – Complex array of powers into each conductor of each terminal\n\nCktElement.Losses() – Total losses in the element: two‐element complex array\n\nCktElement.PhaseLosses() – Complex array of losses by phase\n\nCktElement.SeqVoltages() – Double array of symmetrical component voltages at each 3‐phase terminal\n\nCktElement.SeqCurrents() – Double array of symmetrical component currents into each 3‐phase terminal\n\nCktElement.SeqPowers() – Double array of sequence powers into each 3‐phase teminal\n\nCktElement.AllPropertyNames() – All property names of the active device.\n\nCktElement.Residuals() – Residual currents for each terminal: (mag, angle)\n\nCktElement.YPrim() – YPrim matrix, column order, complex numbers\n\nCktElement.CplxSeqVoltages() – Complex double array of Sequence Voltage for all terminals of active circuit element.\n\nCktElement.CplxSeqCurrents() – Complex double array of Sequence Currents for all conductors of all terminals of active circuit element.\n\nCktElement.AllVariableNames() – Variant array of strings listing all the published variable names, if a PCElement. Otherwise, null string.\n\nCktElement.AllVariableValues() – Values of state variables of active element if PC element.\n\nCktElement.NodeOrder() – Node numbers (representing phases, for example)\n\nCktElement.CurrentsMagAng() – Currents in magnitude, angle format as a variant array of doubles.\n\nCktElement.VoltagesMagAng() – Voltages at each conductor in magnitude, angle form as variant array of doubles.\n\n\n\n"
},

{
    "location": "api.html#CktElement-1",
    "page": "Main API",
    "title": "CktElement",
    "category": "section",
    "text": "CktElement"
},

{
    "location": "api.html#OpenDSSDirect.DSS.CtrlQueue",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.CtrlQueue",
    "category": "Module",
    "text": "module CtrlQueue – Functions for interfacing with the OpenDSS CtrlQueue.\n\nCtrlQueue.ClearQueue() – Clear the control queue.\n\nCtrlQueue.Delete() – Delete a control action from the DSS control queue by referencing the handle of the action\n\nCtrlQueue.NumActions() – Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions\n\nCtrlQueue.Action(arg) – Set the active action by index\n\nCtrlQueue.ActionCode() – Code for the active action. Long integer code to tell the control device what to do.\n\nCtrlQueue.DeviceHandle() – Handle (User defined)\n\nCtrlQueue.Push() – Push a control action onto the DSS control queue by time, action code, and device handle (user defined).\n\nCtrlQueue.Show() – Show the entire control queue in CSV format\n\nCtrlQueue.ClearActions() – Clear the Action list.\n\nCtrlQueue.PopAction() – Pops next action off the action list and makes it the active action. Returns zero if none.\n\n\n\n"
},

{
    "location": "api.html#CtrlQueue-1",
    "page": "Main API",
    "title": "CtrlQueue",
    "category": "section",
    "text": "CtrlQueue"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Element",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Element",
    "category": "Module",
    "text": "module Element – Functions for interfacing with the OpenDSS Elements.\n\nElement.NumProperties() – Number of Properties for the active DSS object.\n\nElement.Name() – Full Name of Active DSS Object (general element or circuit element)\n\nElement.AllPropertyNames() – The names of all properties for the active DSS object.\n\n\n\n"
},

{
    "location": "api.html#Element-1",
    "page": "Main API",
    "title": "Element",
    "category": "section",
    "text": "Element"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Executive",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Executive",
    "category": "Module",
    "text": "module Executive – Functions for accessing DSSExecutive.\n\nExecutive.NumCommands() – Number of DSS Executive Commands\n\nExecutive.NumOptions() – Number of DSS Executive Options\n\nExecutive.Command(arg) – Get i‐th command (with i as a string)\n\nExecutive.Option(arg) – Get i‐th option (with i as a string)\n\nExecutive.CommandHelp(arg) – Get help string for i‐th command (with i as a string)\n\nExecutive.OptionHelp(arg) – Get help string for i‐th option (with i as a string)\n\nExecutive.OptionValue(arg) – Get present value of i‐th option (with i as a string)\n\n\n\n"
},

{
    "location": "api.html#Executive-1",
    "page": "Main API",
    "title": "Executive",
    "category": "section",
    "text": "Executive"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Fuses",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Fuses",
    "category": "Module",
    "text": "module Fuses – Functions for interfacing with the active OpenDSS Fuse.\n\nFuses.Count() – Number of Fuse elements in the circuit\n\nFuses.First() – Set the first Fuse to be the active fuse. Returns 0 if none.\n\nFuses.Next() – Advance the active Fuse element pointer to the next fuse. Returns 0 if no more fuses.\n\nFuses.MonitoredTerm() – Terminal number to which the fuse is connected.\n\nFuses.MonitoredTerm(arg) – Set the terminal number to which the fuse is connected.\n\nFuses.Open() – Manual opening of fuse\n\nFuses.Close() – Close the fuse back in and reset.\n\nFuses.IsBlown() – Current state of the fuses. TRUE if any fuse on any phase is blown. Else FALSE.\n\nFuses.Idx() – Get/set active fuse by index into the list of fuses. 1 based: 1..count\n\nFuses.Idx(arg) – Set Fuse active by index into the list of fuses. 1..count\n\nFuses.NumPhases() – Number of phases, this fuse.\n\nFuses.RatedCurrent() – Multiplier or actual amps for the TCCcurve object. Defaults to 1.0. Multipliy current values of TCC curve by this to get actual amps.\n\nFuses.RatedCurrent(arg) – Set the multiplier or actual amps for the TCCcurve object. Defaults to 1.0. Multipliy current values of TCC curve by this to get actual amps.\n\nFuses.Name() – Get the name of the active Fuse element\n\nFuses.Name(arg) – Set the name of the active Fuse element\n\nFuses.MonitoredObj() – Full name of the circuit element to which the fuse is connected.\n\nFuses.MonitoredObj(arg) – Set the full name of the circuit element to which the fuse is connected.\n\nFuses.SwitchedObj() – Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj.\n\nFuses.SwitchedObj(arg) – Set the full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj.\n\nFuses.TCCCurve() – Name of the TCCcurve object that determines fuse blowing.\n\nFuses.TCCCurve(arg) – Set the name of the TCCcurve object that determines fuse blowing.\n\nFuses.AllNames() –  Names of all Fuses in the circuit\n\n\n\n"
},

{
    "location": "api.html#Fuses-1",
    "page": "Main API",
    "title": "Fuses",
    "category": "section",
    "text": "Fuses"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Generators",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Generators",
    "category": "Module",
    "text": "module Generators – Functions for interfacing with the active OpenDSS Generator.\n\nGenerators.First() – Sets first Generator to be active.  Returns 0 if none.\n\nGenerators.Next() – Sets next Generator to be active.  Returns 0 if no more.\n\nGenerators.ForcedON() – Indicates whether the generator is forced ON regardles of other dispatch criteria.\n\nGenerators.ForcedON(arg) – Sets indication whether the generator is forced ON regardles of other dispatch criteria.\n\nGenerators.Phases() – Number of phases\n\nGenerators.Phases(arg) – Set the number of phases\n\nGenerators.Count() – Number of Generator Objects in Active Circuit\n\nGenerators.Idx() – Get/Set active Generator by index into generators list.  1..Count\n\nGenerators.Idx(arg) – Set active Generator by index into generators list.  1..Count\n\nGenerators.Model() – Generator model\n\nGenerators.Model(arg) – Set the Generator model\n\nGenerators.kV() – Voltage base for the active generator, kV\n\nGenerators.kV(arg) – Set the voltage base for the active generator, kV\n\nGenerators.kW() – kW output for the active generator. kvar is updated for current power factor.\n\nGenerators.kW(arg) – Set the kW output for the active generator. kvar is updated for current power factor.\n\nGenerators.kvar() – kvar output for the active generator. Updates power factor based on present kW value.\n\nGenerators.kvar(arg) – Set the kvar output for the active generator. Updates power factor based on present kW value.\n\nGenerators.PF() – Power factor (pos. = producing vars)\n\nGenerators.PF(arg) – Set the power factor (pos. = producing vars)\n\nGenerators.kVARated() – Get the KVA rating of the generator.\n\nGenerators.kVARated(arg) – Set the KVA rating of the generator.\n\nGenerators.Vmaxpu() – Get the Vmaxpu for Generator Model.\n\nGenerators.Vmaxpu(arg) – Set the Vmaxpu for Generator Model.\n\nGenerators.Vminpu() – Get the Vminpu for Generator Model.\n\nGenerators.Vminpu(arg) – Set the Vminpu for Generator Model.\n\nGenerators.Name() – Active generator name.\n\nGenerators.Name(arg) – Sets a generator active by name.\n\nGenerators.AllNames() – All generator names\n\nGenerators.RegisterNames() – Array of Names of all generator energy meter registers\n\nGenerators.RegisterValues() – Array of valus in generator energy meter registers.\n\n\n\n"
},

{
    "location": "api.html#Generators-1",
    "page": "Main API",
    "title": "Generators",
    "category": "section",
    "text": "Generators"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Isource",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Isource",
    "category": "Module",
    "text": "module Isource – Functions for interfacing with the active OpenDSS current source.\n\nIsource.Count() – Returns the number of Isource objects currently defined in the active circuit.\n\nIsource.First() – Set the first ISource to be active; returns 0 if none.\n\nIsource.Next() – Set the next ISource to be active; returns 0 if none.\n\nIsource.Amps() – Get the magnitude of the Isource in Amps.\n\nIsource.Amps(arg) – Set the magnitude of the Isource in Amps.\n\nIsource.AngleDeg() – Get the phase angle of the Isource in degrees.\n\nIsource.AngleDeg(arg) – Set the phase angle of the Isource in degrees.\n\nIsource.Frequency() – Get the frequency of the Isource in Hz.\n\nIsource.Frequency(arg) – Set the frequency of the Isource in Hz.\n\nIsource.Name() – Get the name of the active Isource object.\n\nIsource.Name(arg) – Set the name of the active Isource object.\n\nIsource.AllNames() – Names of all Isources in the circuit.\n\n\n\n"
},

{
    "location": "api.html#Isource-1",
    "page": "Main API",
    "title": "Isource",
    "category": "section",
    "text": "Isource"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Lines",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Lines",
    "category": "Module",
    "text": "module Lines – Functions for interfacing with the active OpenDSS Line.\n\nLines.First() – Set the first element active. Returns 0 if no Lines. Otherwise, index of the line element.\n\nLines.Next() – Set the next element active. Returns 0 if no Lines. Otherwise, index of the line element.\n\nLines.Phases() – Get the number of phases of the active line object.\n\nLines.Phases(arg) – Set the number of phases of the active line object.\n\nLines.NumCust() – Get the number of customers on this line section.\n\nLines.Parent() – Get the parents of the active Line to be the active Line. Return 0 if no parent or action fails.\n\nLines.Count() – Get the number of Line Objects in Active Circuit.\n\nLines.Units() – Get the units of the line (distance, check manual for details).\n\nLines.Units(arg) – Set the units of the line (distance, check manual for details).\n\nLines.Length() – Get the length of line section in units compatible with the LineCode definition.\n\nLines.Length(arg) – Set the length of line section in units compatible with the LineCode definition.\n\nLines.R1() – Get the positive sequence resistance, ohm per unit length.\n\nLines.R1(arg) – Set the positive sequence resistance, ohm per unit length.\n\nLines.X1() – Get the positive sequence reactance, ohm per unit length.\n\nLines.X1(arg) – Set the positive sequence reactance, ohm per unit length.\n\nLines.R0() – Get the zero sequence resistance, ohm per unit length.\n\nLines.R0(arg) – Set the zero sequence resistance, ohm per unit length.\n\nLines.X0() – Get the zero sequence reactance, ohm per unit length.\n\nLines.X0(arg) – Set the zero sequence reactance, ohm per unit length.\n\nLines.C1() – Get the positive sequence capacitance, nanofarads per unit length.\n\nLines.C1(arg) – Set the positive sequence capacitance, nanofarads per unit length.\n\nLines.C0() – Get the zero sequence capacitance, nanofarads per unit length.\n\nLines.C0(arg) – Set the zero sequence capacitance, nanofarads per unit length.\n\nLines.NormAmps() – Get the normal ampere rating of Line.\n\nLines.NormAmps(arg) – Set the normal ampere rating of Line.\n\nLines.EmergAmps() – Get the emergency (maximum) ampere rating of Line.\n\nLines.EmergAmps(arg) – Set the emergency (maximum) ampere rating of Line.\n\nLines.Rg() – Get the earth return value used to compute line impedances at power frequency.\n\nLines.Rg(arg) – Set the earth return value used to compute line impedances at power frequency.\n\nLines.Xg() – Get the earth return reactance value used to compute line impedances at power frequency.\n\nLines.Xg(arg) – Set the earth return reactance value used to compute line impedances at power frequency.\n\nLines.Rho() – Get the earth resistivity, m-ohms.\n\nLines.Rho(arg) – Set the earth resistivity, m-ohms.\n\nLines.Name() – Get the name of the active Line element.\n\nLines.Name(arg) – Set the name of the Line element to set it active.\n\nLines.Bus1() – Get the name of bus for terminal 1.\n\nLines.Bus1(arg) – Set the name of bus for terminal 1.\n\nLines.Bus2() – Get the name of bus for terminal 2.\n\nLines.Bus2(arg) – Set the name of bus for terminal 2.\n\nLines.LineCode() – Get the name of LineCode object that defines the impedances.\n\nLines.LineCode(arg) – Set the name of LineCode object that defines the impedances.\n\nLines.Geometry() – Get the name of the Line geometry code.\n\nLines.Geometry(arg) – Set the name of the Line geometry code.\n\nLines.Spacing() – Get the name of the Line spacing code.\n\nLines.Spacing(arg) – Set the name of the Line spacing code.\n\nLines.AllNames() – Get the name of all Line Objects.\n\nLines.RMatrix() – Get the resistance matrix (full), ohms per unit length. Variant array of doubles.\n\nLines.XMatrix() – Get the reactance matrix (full), ohms per unit length. Variant array of doubles.\n\nLines.CMatrix() – Get the capacitance matrix (full), nanofarads per unit length. Variant array of doubles.\n\nLines.Yprim() – Get the YPrimitive of the active Line.\n\n\n\n"
},

{
    "location": "api.html#Lines-1",
    "page": "Main API",
    "title": "Lines",
    "category": "section",
    "text": "Lines"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Loads",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Loads",
    "category": "Module",
    "text": "module Loads – Functions for interfacing with the active OpenDSS load.\n\nLoads.First() – Allows to set the active load into the first load registered in the active circuit. As a result, this property will return the number 1. The parameter argument can be filled with a 0.\n\nLoads.Next() – Set the active load into the next load registered in the active circuit. As a result, this property will set the index of the active load. The parameter argument can be filled with a 0.\n\nLoads.Idx() – The index of the active load. The parameter argument can be filled with a 0.\n\nLoads.Idx(arg) – Set the index of the active load. The parameter argument must contain the index of the desired active load. The return value will be equal to 0.\n\nLoads.Count() – Returns the number of load elements within the active circuit. The parameter argument can be filled with a 0.\n\nLoads.Class() – The code number used to separate Loads by class or group. The parameter argument can be filled with a 0.\n\nLoads.Class(arg) – The code number used to separate loads by class or group. The parameter argument can be filled with a 0.\n\nLoads.Model() – The model of the active load. The parameter argument can be filled with a 0.\n\nLoads.Model(arg) – Set the model of the active load using the parameter argument. return a 0.\n\nLoads.NumCust() – The number of customer of the active load. The parameter argument can be filled with a 0.\n\nLoads.NumCust(arg) – Set the number of customers of the active load using the parameter argument. return a 0.\n\nLoads.Status() – \n\nLoads.Status(arg) – \n\nLoads.IsDelta() – If true, loads are line to line.\n\nLoads.IsDelta(arg) – Set whether loads are delta (line to line).\n\nLoads.kW() – The kW property of the active load. The parameter argument can be filled with a 0.\n\nLoads.kW(arg) – Set the kW property of the active load. The parameter argument must contain the new value in kW for the desired active load. The return value will be equal to 0.\n\nLoads.kV() – The kV property of the active load. The parameter argument can be filled with a 0.\n\nLoads.kV(arg) – Set the kV property of the active load. The parameter argument must contain the new value in kV for the desired active load. The return value will be equal to 0.\n\nLoads.kvar() – The kvar property of the active load. The parameter argument can be filled with a 0.\n\nLoads.kvar(arg) – Set the kvar property of the active load. The parameter argument must contain the new value in kvar for the desired active load. The return value will be equal to 0.\n\nLoads.PF() – The pf property of the active load. The parameter argument can be filled with a 0.\n\nLoads.PF(arg) – Set the pf property of the active load. The parameter argument must contain the new value in pf for the desired active load. The return value will be equal to 0.\n\nLoads.PctMean() – The PctMean property of the active load. The parameter argument can be filled with a 0.\n\nLoads.PctMean(arg) – Set the PctMean property of the active load. The parameter argument must contain the new value in PctMean for the desired active load. The return value will be equal to 0.\n\nLoads.PctStdDev() – The PctStdDev property of the active load. The parameter argument can be filled with a 0.\n\nLoads.PctStdDev(arg) – Set the PctStdDev property of the active load. The parameter argument must contain the new value in PctStdDev for the desired active load. The return value will be equal to 0.\n\nLoads.AllocationFactor() – The AllocationFactor property of the active load. The parameter argument can be filled with a 0.\n\nLoads.AllocationFactor(arg) – Set the AllocationFactor property of the active load. The parameter argument must contain the new value in AllocationFactor for the desired active load. The return value will be equal to 0.\n\nLoads.CFactor() – The CFactor property of the active load. The parameter argument can be filled with a 0.\n\nLoads.CFactor(arg) – Set the CFactor property of the active load. The parameter argument must contain the new value in CFactor for the desired active load. The return value will be equal to 0.\n\nLoads.CVRwatts() – The CVRWatts property of the active load. The parameter argument can be filled with a 0.\n\nLoads.CVRwatts(arg) – Set the CVRWatts property of the active load. The parameter argument must contain the new value in CVRWatts for the desired active load. The return value will be equal to 0.\n\nLoads.CVRvars() – The CVRvars property of the active load. The parameter argument can be filled with a 0.\n\nLoads.CVRvars(arg) – Set the CVRvars property of the active load. The parameter argument must contain the new value in CVRvars for the desired active load. The return value will be equal to 0.\n\nLoads.kVABase() – The kva property of the active load. The parameter argument can be filled with a 0.\n\nLoads.kVABase(arg) – Set the kva property of the active load. The parameter argument must contain the new value in kva for the desired active load. The return value will be equal to 0.\n\nLoads.kWh() – The kWh property of the active load. The parameter argument can be filled with a 0.\n\nLoads.kWh(arg) – Set the kWh property of the active load. The parameter argument must contain the new value in kWh for the desired active load. The return value will be equal to 0.\n\nLoads.kWhDays() – The kWhdays property of the active load. The parameter argument can be filled with a 0.\n\nLoads.kWhDays(arg) – Set the kWhdays property of the active load. The parameter argument must contain the new value in kWhdays for the desired active load. The return value will be equal to 0.\n\nLoads.Rneut() – The RNeut (neutral resistance for wye connected loads) property of the active load. The parameter argument can be filled with a 0.\n\nLoads.Rneut(arg) – Set the RNeut (neutral resistance for wye connected loads) property of the active load. The parameter argument must contain the new value in RNeut for the desired active load. The return value will be equal to 0.\n\nLoads.Vmaxpu() – The VMaxpu property of the active load. The parameter argument can be filled with a 0.\n\nLoads.Vmaxpu(arg) – Set the VMaxpu property of the active load. The parameter argument must contain the new value in VMaxpu for the desired active load. The return value will be equal to 0.\n\nLoads.VminEmerg() – The VMinemerg property of the active load. The parameter argument can be filled with a 0.\n\nLoads.VminEmerg(arg) – Set the VMinemerg property of the active load. The parameter argument must contain the new value in VMinemerg for the desired active load. The return value will be equal to 0.\n\nLoads.VminNorm() – The VMinnorm property of the active load. The parameter argument can be filled with a 0.\n\nLoads.VminNorm(arg) – Set the VMinnorm property of the active load. The parameter argument must contain the new value in VMinnorm for the desired active load. The return value will be equal to 0.\n\nLoads.Vminpu() – The VMinpu property of the active load. The parameter argument can be filled with a 0.\n\nLoads.Vminpu(arg) – Set the VMinpu property of the active load. The parameter argument must contain the new value in VMinpu for the desired active load. The return value will be equal to 0.\n\nLoads.XfkVA() – The xfKVA (Rated service transformer KVA for load allocation, using Allocationfactor. Affects kW, kvar and pf.) property of the active load. The parameter argument can be filled with a 0.\n\nLoads.XfkVA(arg) – Set the xfKVA (Rated service transformer KVA for load allocation, using Allocationfactor. Affects kW, kvar and pf.) property of the active load. The parameter argument must contain the new value in xfKVA for the desired active load. The return value will be equal to 0.\n\nLoads.Xneut() – The Xneut property of the active load. The parameter argument can be filled with a 0.\n\nLoads.Xneut(arg) – Set the Xneut property of the active load. The parameter argument must contain the new value in Xneut for the desired active load. The return value will be equal to 0.\n\nLoads.puSeriesRL() – The PctSeriesRL (Percent of Load that is modeled as series R-L for harmonic studies) property of the active load. The parameter argument can be filled with a 0.\n\nLoads.puSeriesRL(arg) – Set the PctSeriesRL (Percent of Load that is modeled as series R-L for harmonic studies) property of the active load. The parameter argument must contain the new value in PctSeriesRL for the desired active load. The return value will be equal to 0.\n\nLoads.RelWeighting() – The RelWeight (relative weighting factor) property of the active load. The parameter argument can be filled with a 0.\n\nLoads.RelWeighting(arg) – Set the RelWeight (relative weighting factor) property of the active load. The parameter argument must contain the new value in RelWeight for the desired active load. The return value will be equal to 0.\n\nLoads.Name() – The Name property of the active load. The parameter argument can be filled with an empty string.\n\nLoads.Name(arg) – Set the active load by specifying the Name load. The parameter argument must contain the Name of the load to activate. The return value will be equal to empty.\n\nLoads.CVRCurve() – The CVRCUrve property of the active load. The parameter argument can be filled with an empty string.\n\nLoads.CVRCurve(arg) – Set the CVRCurve property for the active load. The parameter argument must contain the Name of the new CVRCurve to be linked to the active load. The return value will be equal to empty.\n\nLoads.Daily() – The daily property of the active load. The parameter argument can be filled with an empty string.\n\nLoads.Daily(arg) – Set the daily property for the active load. The parameter argument must contain the Name of the new daily to be linked to the active load. The return value will be equal to empty.\n\nLoads.Duty() – The duty property of the active load. The parameter argument can be filled with an empty string.\n\nLoads.Duty(arg) – Set the duty property for the active load. The parameter argument must contain the Name of the new duty to be linked to the active load. The return value will be equal to empty.\n\nLoads.Spectrum() – The Spectrum property of the active load. The parameter argument can be filled with an empty string.\n\nLoads.Spectrum(arg) – Set the Spectrum property for the active load. The parameter argument must contain the Name of the new Spectrum to be linked to the active load. The return value will be equal to empty.\n\nLoads.Yearly() – The Yearly property of the active load. The parameter argument can be filled with an empty string.\n\nLoads.Yearly(arg) – Set the Yearly property for the active load. The parameter argument must contain the Name of the new Yearly to be linked to the active load. The return value will be equal to empty.\n\nLoads.Growth() – The Growth property of the active load. The parameter argument can be filled with an empty string.\n\nLoads.Growth(arg) – Set the Growth property for the active load. The parameter argument must contain the Name of the new Growth to be linked to the active load. The return value will be equal to empty.\n\nLoads.AllNames() – The names of all the loads present in the active circuit. The result is delivered as variant, however, the content of this variant is an array of strings.\n\nLoads.ZipV() – The array of 7 elements (doubles) for ZIP property of the active Load object.\n\n\n\n"
},

{
    "location": "api.html#Loads-1",
    "page": "Main API",
    "title": "Loads",
    "category": "section",
    "text": "Loads"
},

{
    "location": "api.html#OpenDSSDirect.DSS.LoadShape",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.LoadShape",
    "category": "Module",
    "text": "module LoadShape – Functions for interfacing with the active OpenDSS LoadShape.\n\nLoadShape.Count() – The number of LoadShape objects currently defined in LoadShape collection.\n\nLoadShape.First() – Set the first LoadShape active and return integer index of the LoadShape. Returns 0 if no more.\n\nLoadShape.Next() – Set the next LoadShape active and return integer index of the LoadShape. Returns 0 if no more.\n\nLoadShape.Npts() – Get the number of points in active LoadShape.\n\nLoadShape.Npts(arg) – Set the number of points in active LoadShape.\n\nLoadShape.Normalize() – normalizes the P and Q curves based on either Pbase, Qbase or simply the peak value of the curve.\n\nLoadShape.UseActual() – Get a TRUE/FALSE (1/0) to let Loads know to use the actual value in the curve rather than use the value as a multiplier.\n\nLoadShape.UseActual(arg) – Set a TRUE/FALSE (1/0 - Argument) to let Loads know to use the actual value in the curve rather than use the value as a multiplier.\n\nLoadShape.HrInterval() – Get the fixed interval time value, hours.\n\nLoadShape.HrInterval(arg) – Set the fixed interval time value, hours.\n\nLoadShape.MinInterval() – Get the fixed interval time value, in minutes.\n\nLoadShape.MinInterval(arg) – Set the fixed interval time value, in minutes.\n\nLoadShape.PBase() – Get the base for normalizing P curve. If left at zero, the peak value is used.\n\nLoadShape.PBase(arg) – Set the base for normalizing P curve. If left at zero, the peak value is used.\n\nLoadShape.QBase() – Get the base for normalizing Q curve. If left at zero, the peak value is used.\n\nLoadShape.QBase(arg) – Set the base for normalizing Q curve. If left at zero, the peak value is used.\n\nLoadShape.SInterval() – Get the fixed interval data time interval, seconds.\n\nLoadShape.SInterval(arg) – Set the fixed interval data time interval, seconds.\n\nLoadShape.Name() – Get the name of the active LoadShape object.\n\nLoadShape.Name(arg) – Set the name of the active LoadShape object.\n\nLoadShape.AllNames() – Names of all of the load shapes\n\nLoadShape.PMult() – Get a variant array of doubles for the P multiplier in the LoadShape.\n\nLoadShape.QMult() – Get a variant array of doubles for the Q multiplier in the LoadShape.\n\nLoadShape.TimeArray() – Get a time array in hours corresponding to P and Q multipliers when the Interval = 0.\n\n\n\n"
},

{
    "location": "api.html#LoadShape-1",
    "page": "Main API",
    "title": "LoadShape",
    "category": "section",
    "text": "LoadShape"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Meters",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Meters",
    "category": "Module",
    "text": "module Meters – Functions for interfacing with the active OpenDSS energy meter.\n\nMeters.First() – Set the first Energy Meter active. Returns 0 if no Monitors.\n\nMeters.Next() – Set the next energy Meter Active. Returns 0 if no more.\n\nMeters.Reset() – Resets the active Meter object.\n\nMeters.ResetAll() – Resets all Meter object.\n\nMeters.Sample() – Causes active meter to take a sample.\n\nMeters.Save() – Causes active meter to save its current sample buffer to its meter stream. Then you can access the Bytestream or channel data. Most standard solution modes do this automatically.\n\nMeters.MeteredTerminal() – The number of metered terminal by the active Energy Meter.\n\nMeters.MeteredTerminal(arg) – Set the number of metered terminal by the active Energy Meter.\n\nMeters.DIFilesAreOpen() – Returns a global flag (1=true, 0=false) to indicate if Demand Interval (DI) files have been properly opened.\n\nMeters.SampleAll() – Causes all Energy Meters to take a sample of the present state. Returns 0.\n\nMeters.SaveAll() – save all Energy Meter buffers to their respective file streams. Returns 0.\n\nMeters.OpenAllDIFiles() – Opens Demand Interval (DI) files. Returns 0.\n\nMeters.CloseAllDIFiles() – Close all Demand Interval (DI) files. Necessary at the end of a run.\n\nMeters.CountEndElements() – The number of zone end elements in the active meter zone.\n\nMeters.Count() – The number of Energy Meters in the Active Circuit.\n\nMeters.CountBranches() – The number of branches in active Energy Meter zone (same as sequencelist size).\n\nMeters.SequenceList() – The index into meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be up line from later index. Sets PDElement active.\n\nMeters.SequenceList(arg) – Set the index into meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be up line from later index. Sets PDElement active.\n\nMeters.DoReliabilityCalc(arg) – calculates SAIFI, etc. if the Argument is equal to 1 assume restoration, otherwise it will not.\n\nMeters.SeqListSize() – The size of Sequence List.\n\nMeters.TotalCustomers() – The total number of customers in this zone (down line from the Energy Meter).\n\nMeters.NumSections() – The number of feeder sections in this meter's zone.\n\nMeters.SetActiveSection(arg) – Set the designated section (argument) if the index is valid.\n\nMeters.OCPDeviceType() – The type of OCP device: {1=fuse | 2+ recloser | 3= relay}.\n\nMeters.NumSectionCustomers() – The number of customers in the active section.\n\nMeters.NumSectionBranches() – The number of branches (Lines) in the active section.\n\nMeters.SectSeqidx() – The Sequence Index of the branch at the head of this section.\n\nMeters.SectTotalCust() – The total customers down line from this section.\n\nMeters.SAIFI() – SAIFI for this meter's zone. Execute reliability calc method first.\n\nMeters.SAIFIkW() – The SAIFI based on kW rather than number of customers. Get after reliability calcs.\n\nMeters.SAIDI() – The SAIDI for this meter zone. Execute DoreliabilityCalc first.\n\nMeters.CustInterrupts() – The total customer interruptions for this meter zone based on reliability calcs.\n\nMeters.AvgRepairTime() – The average Repair Time in this Section of the meter zone.\n\nMeters.FaultRateXRepairHrs() – The sum of Fault Rate time Repair Hours in this section of the meter zone.\n\nMeters.SumBranchFltRates() – The sum of the branch fault rates in this section of the meter's zone.\n\nMeters.Name() – The active Energy Meter's name.\n\nMeters.Name(arg) – Set the active Energy Meter's name.\n\nMeters.MeteredElement() – The name of the metered element (considering the active Energy Meter).\n\nMeters.MeteredElement(arg) – Set the name of the metered element (considering the active Energy Meter).\n\nMeters.AllNames() – All Energy Meter names.\n\nMeters.RegisterNames() – Strings containing the names of the registers.\n\nMeters.RegisterValues(arg) – Values contained in the Meter registers for the active Meter.\n\nMeters.Totals() – The totals for all registers of all Meters.\n\nMeters.PeakCurrent() – Returns an array of doubles with the Peak Current Property.\n\nMeters.CalcCurrent() – The magnitude of the real part of the Calculated Current (normally determined by solution) for the meter to force some behavior on Load Allocation.\n\nMeters.AllocFactors() – An array of doubles: allocation factors for the active Meter.\n\nMeters.AllEndElements() – A vector of names of all zone end elements.\n\nMeters.AllBranchesInZone() – A wide string list of all branches in zone of the active Energy Meter object.\n\n\n\n"
},

{
    "location": "api.html#Meters-1",
    "page": "Main API",
    "title": "Meters",
    "category": "section",
    "text": "Meters"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Monitors",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Monitors",
    "category": "Module",
    "text": "module Monitors – Functions for interfacing with the active OpenDSS Monitor.\n\nMonitors.First() – Set the first monitor active. Returns 0 if no Monitors.\n\nMonitors.Next() – Set the next monitor active. Returns 0 if no more.\n\nMonitors.Reset() – Resets the active Monitor object.\n\nMonitors.ResetAll() – Resets all Monitor object.\n\nMonitors.Sample() – Causes active monitor to take a sample.\n\nMonitors.Save() – Causes active monitor to save its current sample buffer to its monitor stream. Then you can access the Bytestream or channel data. Most standard solution modes do this automatically.\n\nMonitors.Show() – Converts monitor file into text and displays with text editor.\n\nMonitors.Mode() – The monitor mode (bitmask integer - see DSS Help).\n\nMonitors.Mode(arg) – Set the monitor mode (bitmask integer - see DSS Help).\n\nMonitors.SampleCount() – Returns number of samples in Monitor at present.\n\nMonitors.SampleAll() – Causes all Monitors to take a sample of the present state. Returns 0.\n\nMonitors.SaveAll() – Save all Monitor buffers to their respective file streams. Returns 0.\n\nMonitors.Count() – The number of Monitors.\n\nMonitors.Process() – Post-process monitor samples taken so far, e.g., Pst for mode = 4.\n\nMonitors.ProcessAll() – Makes that all Monitors post-process the data taken so far.\n\nMonitors.FileVersion() – The Monitor File version (integer).\n\nMonitors.RecordSize() – The size of each record in ByteStream.\n\nMonitors.NumChannels() – The number of Channels on the active Monitor.\n\nMonitors.Terminal() – The terminal number of element being monitored.\n\nMonitors.Terminal(arg) – Set the terminal number of element being monitored.\n\nMonitors.FileName() – The name of the CSV file associated with active monitor.\n\nMonitors.Name() – The active Monitor object by name.\n\nMonitors.Name(arg) – Set the active Monitor object by name.\n\nMonitors.Element() – The full name of element being monitored by the active Monitor.\n\nMonitors.Element(arg) – Set the full name of element being monitored by the active Monitor.\n\nMonitors.AllNames() – An array of all Monitor names (array of strings).\n\nMonitors.ByteStream() – A byte array containing monitor stream values. Make sure a 'save' is done first (standard solution modes do this automatically).\n\nMonitors.DblHourS() – The header string; vector of strings containing Channel Names.\n\nMonitors.DblHour() – A vector of doubles containing time value in hours for the time-sampled monitor values; empty if frequency-sampled values for harmonics solution (see dblFreq).\n\nMonitors.DblFreqS() – A vector of doubles containing time values for harmonics mode solutions; empty for time mode solutions (use dblHour).\n\nMonitors.DblFreq() – A vector of doubles for the specified channel (usage: MyArray = DSSmonitor.Channel(i)) A save or SaveAll should be executed first. Done automatically by most standard solution modes.\n\n\n\n"
},

{
    "location": "api.html#Monitors-1",
    "page": "Main API",
    "title": "Monitors",
    "category": "section",
    "text": "Monitors"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Parser",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Parser",
    "category": "Module",
    "text": "module Parser – Functions for interfacing with the OpenDSS Parser.\n\nParser.IntValue() – Return next parameter as a long integer.\n\nParser.ResetDelimiters() – Reset delimiters to their default values.\n\nParser.AutoIncrement() – In the default is false (0). If true (1) Parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.\n\nParser.AutoIncrement(arg) – In the default is false (0). If true (1) Parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.\n\nParser.DblValue() – Returns next parameter as a double.\n\nParser.CmdString() – Get a string to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.\n\nParser.CmdString(arg) – Set a string to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.\n\nParser.NextParam() – Get next token and return tag name (before = sign) if any. See Autoincrement.\n\nParser.StrValue() – Return next parameter as a string.\n\nParser.WhiteSpace() – Get the characters used for White space in the command string. Default in blank and Tab.\n\nParser.WhiteSpace(arg) – Set the characters used for White space in the command string. Default in blank and Tab.\n\nParser.BeginQuote() – Get the string containing the characters for quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is \"([{.\n\nParser.BeginQuote(arg) – Set the string containing the characters for quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is \"([{.\n\nParser.EndQuote() – Get the string containing the characters, in order, that match the beginning quote characters in BeginQuote. Default is \")]}.\n\nParser.EndQuote(arg) – Set the string containing the characters, in order, that match the beginning quote characters in BeginQuote. Default is \")]}.\n\nParser.Delimiters() – Get the string defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitespace to separate tokens.\n\nParser.Delimiters(arg) – Set the string defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitespace to separate tokens.\n\nParser.Vector() – Returns token as vector of doubles. For parsing quoted array syntax.\n\nParser.Matrix() – Use this property to parse a Matrix token in OpenDSS format. Returns square matrix of order specified. Order same as default fortran order: column by column.\n\nParser.SymMatrix() – Use this property to parse a Matrix token in lower triangular form. Symmetry is forced.\n\n\n\n"
},

{
    "location": "api.html#Parser-1",
    "page": "Main API",
    "title": "Parser",
    "category": "section",
    "text": "Parser"
},

{
    "location": "api.html#OpenDSSDirect.DSS.PDElements",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.PDElements",
    "category": "Module",
    "text": "module PDElements – Functions for interfacing with the active OpenDSS power-delivery element.\n\nPDElements.Count() – Get number of PDElements in active circuit.\n\nPDElements.First() – Set the first enabled PD element to be the active element. Returns 0 if none found.\n\nPDElements.Next() – Set the next enabled PD element to be the active element. Returns 0 if none found.\n\nPDElements.IsShunt() – returns 1 if the PD element should be treated as a shunt element rather than a series element. Applies to capacitor and reactor elements in particular.\n\nPDElements.NumCustomers() – Get the number of customers in this branch.\n\nPDElements.TotalCustomers() – Get the total number of customers from this branch to the end of the zone.\n\nPDElements.ParentPDElement() – Set the parent PD element to be the active circuit element. Returns 0 if no more elements upline.\n\nPDElements.FromTerminal() – Get the number of the terminal of active PD element that is on the 'from' side. This is set after the meter zone is determined.\n\nPDElements.SectionID() – Get the integer ID of the feeder section that this PDElement branch is part of.\n\nPDElements.FaultRate() – Get the number of failures per year. For LINE elements: Number of failures per unit length per year.\n\nPDElements.FaultRate(arg) – Set the number of failures per year. For LINE elements: Number of failures per unit length per year.\n\nPDElements.PctPermanent() – Get the percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.\n\nPDElements.PctPermanent(arg) – Set the percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.\n\nPDElements.Lambda() – Get the failure rate for this branch. Faults per year including length of line.\n\nPDElements.AccumulatedL() – Get the accumulated failure rate for this branch on down line.\n\nPDElements.RepairTime() – Get the average time to repair a permanent fault on this branch, hours.\n\nPDElements.TotalMiles() – Get the total miles of line from this element to the end of the zone. For recloser siting algorithm.\n\nPDElements.Name() – Get the name of the active PDElement, returns null string if active element id not PDElement.\n\nPDElements.Name(arg) – Set the name of the active PDElement, returns null string if active element id not PDElement.\n\n\n\n"
},

{
    "location": "api.html#PDElements-1",
    "page": "Main API",
    "title": "PDElements",
    "category": "section",
    "text": "PDElements"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Progress",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Progress",
    "category": "Module",
    "text": "module Progress – Functions for controlling the progress form.\n\nProgress.PctProgress() – Percent Progress to indicate [0..100]\n\nProgress.Show() – Shows Progress form with null caption and Progress set to zero.\n\nProgress.Close() – Close the Progress form.\n\nProgress.Caption() – Caption to appear on the bottom of the DSS Progress form.\n\n\n\n"
},

{
    "location": "api.html#Progress-1",
    "page": "Main API",
    "title": "Progress",
    "category": "section",
    "text": "Progress"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Properties",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Properties",
    "category": "Module",
    "text": "module Properties – Functions for interfacing with OpenDSS properties.\n\nProperties.Name() – The name of the active property.\n\nProperties.Description() – The description of the active property.\n\nProperties.Value() – The value of the active property.\n\nProperties.Value(arg) – Set the value of the active property. The new value must be specified in arg as a string.\n\n\n\n"
},

{
    "location": "api.html#Properties-1",
    "page": "Main API",
    "title": "Properties",
    "category": "section",
    "text": "Properties"
},

{
    "location": "api.html#OpenDSSDirect.DSS.PVsystems",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.PVsystems",
    "category": "Module",
    "text": "module PVsystems – Functions for interfacing with the active OpenDSS PVsystem.\n\nPVsystems.Count() – The number of PVSystem objects currently defined in the active circuit.\n\nPVsystems.First() – Set the first PVSystem to be active; returns 0 if none.\n\nPVsystems.Next() – Set the next PVSystem to be active; returns 0 if none.\n\nPVsystems.Idx() – Get the active PVSystem by index; 1..Count.\n\nPVsystems.Idx(arg) – Set the active PVSystem by index; 1..Count.\n\nPVsystems.Irradiance() – Get the present value of the Irradiance property in W/sq-m.\n\nPVsystems.Irradiance(arg) – Set the present value of the Irradiance property in W/sq-m.\n\nPVsystems.kW() – Get the kW output.\n\nPVsystems.kvar() – Get the kvar value.\n\nPVsystems.kvar(arg) – Set the kvar value.\n\nPVsystems.pf() – Get the power factor value.\n\nPVsystems.pf(arg) – Set the power factor value.\n\nPVsystems.kVARated() – Get the rated kVA.\n\nPVsystems.kVARated(arg) – Set the rated kVA.\n\n\n\n"
},

{
    "location": "api.html#PVsystems-1",
    "page": "Main API",
    "title": "PVsystems",
    "category": "section",
    "text": "PVsystems"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Reclosers",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Reclosers",
    "category": "Module",
    "text": "module Reclosers – Functions for interfacing with the active OpenDSS Recloser.\n\nReclosers.Count() – Get number of Reclosers in active circuit.\n\nReclosers.First() – Set first recloser to be active Circuit Element. Returns 0 if none.\n\nReclosers.Next() – Set next recloser to be active Circuit Element. Returns 0 if none.\n\nReclosers.MonitoredTerm() – Get the terminal number of Monitored Object for the Recloser.\n\nReclosers.MonitoredTerm(arg) – Set the terminal number of Monitored Object for the Recloser.\n\nReclosers.SwitchedTerm() – Get the terminal of the controlled device being switched by the Recloser.\n\nReclosers.SwitchedTerm(arg) – Set the terminal of the controlled device being switched by the Recloser.\n\nReclosers.NumFast() – Get the number of fast shots.\n\nReclosers.NumFast(arg) – Set the number of fast shots.\n\nReclosers.Shots() – Get the number of shots to lockout (fast + delayed).\n\nReclosers.Shots(arg) – Set the number of shots to lockout (fast + delayed).\n\nReclosers.Open() – Open recloser's controlled element and lock out the recloser.\n\nReclosers.Close() – Close the switched object controlled by the recloser. Resets recloser to first operation.\n\nReclosers.Idx() – Get the active recloser by index into the recloser list. 1..Count.\n\nReclosers.Idx(arg) – Set the active recloser by index into the recloser list. 1..Count.\n\nReclosers.PhaseTrip() – Get the phase trip curve multiplier or actual amps.\n\nReclosers.PhaseTrip(arg) – Set the phase trip curve multiplier or actual amps.\n\nReclosers.PhaseInst() – Get the phase instantaneous curve multiplier or actual amps.\n\nReclosers.PhaseInst(arg) – Set the phase instantaneous curve multiplier or actual amps.\n\nReclosers.GroundTrip() – Get the ground (3I0) trip multiplier or actual amps.\n\nReclosers.GroundTrip(arg) – Set the ground (3I0) trip multiplier or actual amps.\n\nReclosers.GroundInst() – Get the ground (3I0) instantaneous trip setting - curve multiplier or actual amps.\n\nReclosers.GroundInst(arg) – Set the ground (3I0) instantaneous trip setting - curve multiplier or actual amps.\n\nReclosers.Name() – Get the name of the active Recloser Object.\n\nReclosers.Name(arg) – Set the name of the active Recloser Object.\n\nReclosers.MonitoredObj() – Get the full name of object this Recloser is monitoring.\n\nReclosers.MonitoredObj(arg) – Set the full name of object this Recloser is monitoring.\n\nReclosers.SwitchedObj() – Get the full name of the circuit element that is being switched by this Recloser.\n\nReclosers.SwitchedObj(arg) – Set the full name of the circuit element that is being switched by this Recloser.\n\nReclosers.AllNames() – Get a vector of strings with names of all Reclosers in active circuit.\n\nReclosers.RecloseIntervals() – Get a vector of doubles: reclose intervals (s) between shots.\n\n\n\n"
},

{
    "location": "api.html#Reclosers-1",
    "page": "Main API",
    "title": "Reclosers",
    "category": "section",
    "text": "Reclosers"
},

{
    "location": "api.html#OpenDSSDirect.DSS.RegControls",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.RegControls",
    "category": "Module",
    "text": "module RegControls – Functions for interfacing with the active OpenDSS RegControl.\n\nRegControls.First() – Set the first RegControl active. Returns 0 if no more.\n\nRegControls.Next() – Set the next RegControl active. Returns 0 if no more\n\nRegControls.TapWinding() – Get the tapped winding number.\n\nRegControls.TapWinding(arg) – Set the tapped winding number.\n\nRegControls.Winding() – Get the winding number for PT and CT connections.\n\nRegControls.Winding(arg) – Set the winding number for PT and CT connections.\n\nRegControls.IsReversible() – Get the setting in the reverse direction, usually not applicable to substation Transformers.\n\nRegControls.IsReversible(arg) – Set the different settings for the reverse direction (see Manual for details), usually not applicable to substation Transformers.\n\nRegControls.IsInverseTime() – Get the inverse time feature. Time delay is inversely adjusted, proportional to the amount of voltage outside the regulator band.\n\nRegControls.IsInverseTime(arg) – Set the inverse time feature. Time delay is inversely adjusted, proportional to the amount of voltage outside the regulator band.\n\nRegControls.MaxTapChange() – Get the maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for faster solution.\n\nRegControls.MaxTapChange(arg) – Set the maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for faster solution.\n\nRegControls.Count() – Get the number of RegControl objects in Active Circuit.\n\nRegControls.TapNumber() – Get the tap number.\n\nRegControls.TapNumber(arg) – Set the tap number.\n\nRegControls.CTPrimary() – Get the CT primary ampere rating (secondary is 0.2 amperes).\n\nRegControls.CTPrimary(arg) – Set the CT primary ampere rating (secondary is 0.2 amperes).\n\nRegControls.PTRatio() – Get the PT ratio for voltage control settings.\n\nRegControls.PTRatio(arg) – Set the PT ratio for voltage control settings.\n\nRegControls.ForwardR() – Get the LDC R settings in Volts.\n\nRegControls.ForwardR(arg) – Set the LDC R settings in Volts.\n\nRegControls.ForwardX() – Get the LDC X settings in Volts.\n\nRegControls.ForwardX(arg) – Set the LDC X settings in Volts.\n\nRegControls.ReverseR() – Get the reverse LDC R settings in Volts.\n\nRegControls.ReverseR(arg) – Set the reverse LDC R settings in Volts.\n\nRegControls.ReverseX() – Get the reverse LDC X settings in Volts.\n\nRegControls.ReverseX(arg) – Set the reverse LDC X settings in Volts.\n\nRegControls.Delay() – Get the time delay [s] after arming before the first tap change. Control may reset before actually changing taps.\n\nRegControls.Delay(arg) – Set the time delay [s] after arming before the first tap change. Control may reset before actually changing taps.\n\nRegControls.TapDelay() – Get the time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps.\n\nRegControls.TapDelay(arg) – Set the time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps.\n\nRegControls.VoltageLimit() – Get the first house voltage limit on PT secondary base. Setting to 0 disables this function.\n\nRegControls.VoltageLimit(arg) – Set the first house voltage limit on PT secondary base. Setting to 0 disables this function.\n\nRegControls.ForwardBand() – Get the regulation bandwidth in forward direction, centered on Vreg.\n\nRegControls.ForwardBand(arg) – Set the regulation bandwidth in forward direction, centered on Vreg.\n\nRegControls.ForwardVreg() – Get the target voltage in the forward direction, on PT secondary base.\n\nRegControls.ForwardVreg(arg) – Set the target voltage in the forward direction, on PT secondary base.\n\nRegControls.ReverseBand() – Get the bandwidth in reverse direction, centered on reverse Vreg.\n\nRegControls.ReverseBand(arg) – Set the bandwidth in reverse direction, centered on reverse Vreg.\n\nRegControls.ReverseVreg() – Get the target voltage in the reverse direction, on PT secondary base.\n\nRegControls.ReverseVreg(arg) – Set the target voltage in the reverse direction, on PT secondary base.\n\nRegControls.Name() – Get the active RegControl name.\n\nRegControls.Name(arg) – Set the active RegControl name.\n\nRegControls.MonitoredBus() – Get the name of the remote regulated bus, in lieu of LDC settings.\n\nRegControls.MonitoredBus(arg) – Set the name of the remote regulated bus, in lieu of LDC settings.\n\nRegControls.Transformer() – Get the name of the transformer this regulator controls.\n\nRegControls.Transformer(arg) – Set the name of the transformer this regulator controls.\n\nRegControls.AllNames() – Get a vector of strings containing all RegControl names.\n\n\n\n"
},

{
    "location": "api.html#RegControls-1",
    "page": "Main API",
    "title": "RegControls",
    "category": "section",
    "text": "RegControls"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Relays",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Relays",
    "category": "Module",
    "text": "module Relays – Functions for interfacing with the active OpenDSS Relay.\n\nRelays.Count() – Get number of Relays in active circuit.\n\nRelays.First() – Set first relay active. If none, returns 0.\n\nRelays.Next() – Set next relay active. If none, returns 0.\n\nRelays.MonitoredTerm() – Get the number of terminal of monitored element that this relay is monitoring.\n\nRelays.MonitoredTerm(arg) – Set the number of terminal of monitored element that this relay is monitoring.\n\nRelays.SwitchedTerm() – Get the number of terminal of the switched object that will be opened when the relay trips.\n\nRelays.SwitchedTerm(arg) – Set the number of terminal of the switched object that will be opened when the relay trips.\n\nRelays.Idx() – Get the active relay by index into the Relay list. 1..Count.\n\nRelays.Idx(arg) – Set the active relay by index into the Relay list. 1..Count.\n\nRelays.Name() – Get the name of the active Relay.\n\nRelays.Name(arg) – Set the name of the active Relay.\n\nRelays.MonitoredObj() – Get the full name of the object this relay is monitoring.\n\nRelays.MonitoredObj(arg) – Set the full name of the object this relay is monitoring.\n\nRelays.SwitchedObj() – Get the full name of element that will switched when relay trips.\n\nRelays.SwitchedObj(arg) – Set the full name of element that will switched when relay trips.\n\nRelays.AllNames() – Get a vector of strings containing names of all relay elements.\n\n\n\n"
},

{
    "location": "api.html#Relays-1",
    "page": "Main API",
    "title": "Relays",
    "category": "section",
    "text": "Relays"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Sensors",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Sensors",
    "category": "Module",
    "text": "module Sensors – Functions for interfacing with the active OpenDSS Sensor.\n\nSensors.Count() – Get number of Sensors in active circuit.\n\nSensors.First() – Set the first sensor active. Returns 0 if none.\n\nSensors.Next() – Set the next sensor active. Returns 0 if none\n\nSensors.IsDelta() – Returns 1 if the sensor is connected in delta; otherwise, returns 0.\n\nSensors.IsDelta(arg) – Allows to set 1 if the sensor is connected in delta; otherwise, set 0 (argument).\n\nSensors.ReverseDelta() – Returns 1 if voltage measurements are 1-3, 3-2, 2-1; otherwise 0.\n\nSensors.ReverseDelta(arg) – Allows to set 1 if voltage measurements are 1-3, 3-2, 2-1; otherwise 0.\n\nSensors.MeteredTerminal() – Get the number of the measured terminal in the measured element.\n\nSensors.MeteredTerminal(arg) – Set the number of the measured terminal in the measured element.\n\nSensors.Reset() – Clears the active sensor.\n\nSensors.ResetAll() – Clears all Sensors in the active circuit.\n\nSensors.PctError() – Get the assumed percent error in the Sensor measurement. Default is 1.\n\nSensors.PctError(arg) – Set the assumed percent error in the Sensor measurement. Default is 1.\n\nSensors.Weight() – Get the weighting factor for this sensor measurement with respect to the other Sensors. Default is 1.\n\nSensors.Weight(arg) – Set the weighting factor for this sensor measurement with respect to the other Sensors. Default is 1.\n\nSensors.kVBase() – Get the voltage base for the sensor measurements. LL for 2 and 3 - phase Sensors, LN for 1-phase Sensors.\n\nSensors.kVBase(arg) – Set the voltage base for the sensor measurements. LL for 2 and 3 - phase Sensors, LN for 1-phase Sensors.\n\nSensors.Name() – Get the name of the active sensor object.\n\nSensors.Name(arg) – Set the name of the active sensor object.\n\nSensors.MeteredElement() – Get the full name of the measured element.\n\nSensors.MeteredElement(arg) – Set the full name of the measured element.\n\nSensors.AllNames() – Returns a vector of sensor names.\n\nSensors.Currents() – Get an array of doubles for the line current measurements; don't use with KWS and KVARS.\n\nSensors.kvar() – Get an array of doubles for Q measurements; overwrites currents with a new estimate using KWS.\n\nSensors.kW() – Get an array of doubles for P measurements; overwrites currents with a new estimate using KVARS.\n\n\n\n"
},

{
    "location": "api.html#Sensors-1",
    "page": "Main API",
    "title": "Sensors",
    "category": "section",
    "text": "Sensors"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Settings",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Settings",
    "category": "Module",
    "text": "module Settings – Functions for controlling global OpenDSS settings.\n\nSettings.AllowDuplicates() – Get if OpenDSS allows duplicate names of objects: {1 allow, 0 not allow}.\n\nSettings.AllowDuplicates(arg) – Set if OpenDSS allows duplicate names of objects: {1 allow, 0 not allow}.\n\nSettings.ZoneLock() – Get the status of Lock zones on energy Meters to prevent rebuilding if a circuit change occurs: {1= true, 0= False}.\n\nSettings.ZoneLock(arg) – Set the status of Lock zones on energy Meters to prevent rebuilding if a circuit change occurs: {1= true, 0= False}.\n\nSettings.CktModel() – Get {dssMultiphase* | dssPositiveSeq} Indicate if the circuit model is positive sequence.\n\nSettings.CktModel(arg) – Set {dssMultiphase* | dssPositiveSeq} Indicate if the circuit model is positive sequence.\n\nSettings.Trapezoidal() – Get {True (1) | False (0)} value of trapezoidal integration flag in Energy Meters.\n\nSettings.Trapezoidal(arg) – Set {True (1) | False (0)} value of trapezoidal integration flag in Energy Meters.\n\nSettings.AllocationFactors(arg) – Set all load allocation factors for all loads defined by XFKVA property to this value.\n\nSettings.NormVminpu() – Get the per unit minimum voltage for Normal conditions.\n\nSettings.NormVminpu(arg) – Set the per unit minimum voltage for Normal conditions.\n\nSettings.NormVmaxpu() – Get the per unit maximum voltage for Normal conditions.\n\nSettings.NormVmaxpu(arg) – Set the per unit maximum voltage for Normal conditions.\n\nSettings.EmergVminpu() – Get the per unit minimum voltage for Emergency conditions.\n\nSettings.EmergVminpu(arg) – Set the per unit minimum voltage for Emergency conditions.\n\nSettings.EmergVmaxpu() – Get the per unit maximum voltage for Emergency conditions.\n\nSettings.EmergVmaxpu(arg) – Set the per unit maximum voltage for Emergency conditions.\n\nSettings.UEWeight() – Get the weighting factor applied to UE register values.\n\nSettings.UEWeight(arg) – Set the weighting factor applied to UE register values.\n\nSettings.LossWeight() – Get the weighting factor applied to Loss register values.\n\nSettings.LossWeight(arg) – Set the weighting factor applied to Loss register values.\n\nSettings.PriceSignal() – Get the price signal for the circuit.\n\nSettings.PriceSignal(arg) – Set the price signal for the circuit.\n\nSettings.AutoBusList() – Get the list of Buses or (File=xxxxx) syntax for the AutoAdd solution mode.\n\nSettings.AutoBusList(arg) – Set the list of Buses or (File=xxxxx) syntax for the AutoAdd solution mode.\n\nSettings.PriceCurve() – Get the name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.\n\nSettings.PriceCurve(arg) – Set the name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.\n\nSettings.UERegs() – Get the array of Integers defining Energy Meter registers to use for computing UE.\n\nSettings.LossRegs() – Get the array of Integers defining Energy Meter registers to use for computing Losses.\n\nSettings.VoltageBases() – Get the array of doubles defining the legal voltage bases in kV L-L.\n\n\n\n"
},

{
    "location": "api.html#Settings-1",
    "page": "Main API",
    "title": "Settings",
    "category": "section",
    "text": "Settings"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Solution",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Solution",
    "category": "Module",
    "text": "module Solution – Functions for controlling OpenDSS solutions.\n\nSolution.Solve() – Executes the solution for the present solution mode. Returns 0.\n\nSolution.Mode() – The present solution mode (See DSS help).\n\nSolution.Mode(arg) – Modifies the present solution mode (See DSS help).\n\nSolution.Hour() – The present hour (See DSS help).\n\nSolution.Hour(arg) – Modifies the present hour (See DSS help).\n\nSolution.Year() – The present Year (See DSS help).\n\nSolution.Year(arg) – Modifies the present Year (See DSS help).\n\nSolution.Iterations() – Return the number of iterations taken for the last solution.\n\nSolution.MaxIterations() – The Maximum number of iterations used to solve the circuit.\n\nSolution.MaxIterations(arg) – Modifies the Maximum number of iterations used to solve the circuit.\n\nSolution.Number() – The number of solutions to perform for MonteCarlo and time series simulations.\n\nSolution.Number(arg) – Modifies the number of solutions to perform for MonteCarlo and time series simulations.\n\nSolution.Random() – The randomization mode for random variables 'Gaussian' or 'Uniform'.\n\nSolution.Random(arg) – Modifies the randomization mode for random variables 'Gaussian' or 'Uniform'.\n\nSolution.LoadModel() – The Load Model: {dssPowerFlow (default)|dssAdmittance}.\n\nSolution.LoadModel(arg) – Modifies the Load Model: {dssPowerFlow (default)|dssAdmittance}.\n\nSolution.AddType() – The type of device to add in AutoAdd Mode: {dssGen (default)|dssCap}.\n\nSolution.AddType(arg) – Modifies the type of device to add in AutoAdd Mode: {dssGen (default)|dssCap}.\n\nSolution.Algorithm() – The base solution algorithm: {dssNormalSolve | dssNewtonSolve}.\n\nSolution.Algorithm(arg) – Modifies the base solution algorithm: {dssNormalSolve | dssNewtonSolve}.\n\nSolution.ControlMode() – The mode for control devices: {dssStatic (default) | dssEvent | dssTime}.\n\nSolution.ControlMode(arg) – Modifies the mode for control devices: {dssStatic (default) | dssEvent | dssTime}.\n\nSolution.ControlIterations() – The current value of the control iteration counter.\n\nSolution.ControlIterations(arg) – Modifies the current value of the control iteration counter.\n\nSolution.MaxControlIterations() – The maximum allowable control iterations.\n\nSolution.MaxControlIterations(arg) – Modifies the maximum allowable control iterations.\n\nSolution.SampleDoControlActions() – Sample controls and then process the control queue for present control mode and dispatch control actions. Returns 0.\n\nSolution.CheckFaultStatus() – Executes status check on all fault objects defined in the circuit. Returns 0.\n\nSolution.SolveDirect() – Executes a direct solution from the system Y matrix, ignoring compensation currents of loads, generators (includes Yprim only).\n\nSolution.SolvePFlow() – Solves using present power flow method. Iterative solution rather than direct solution.\n\nSolution.SolveNoControl() – Is similar to SolveSnap except no control actions are checked or executed.\n\nSolution.SolvePlusControl() – Executes a power flow solution (SolveNoControl) plus executes a CheckControlActions that executes any pending control actions.\n\nSolution.InitSnap() – Initializes some variables for snap shot power flow. SolveSnap does this automatically.\n\nSolution.CheckControls() – Performs the normal process for sampling and executing Control Actions and Fault Status and rebuilds Y if necessary.\n\nSolution.SampleControlDevices() – Executes a sampling of all intrinsic control devices, which push control actions into the control queue.\n\nSolution.DoControlActions() – Pops control actions off the control queue and dispatches to the proper control element.\n\nSolution.BuildYMatrix() – Forces building of the System Y matrix according to the argument: {1= series elements only | 2= Whole Y matrix}.\n\nSolution.SystemYChanged() – Indicates if elements of the System Y have been changed by recent activity. If changed returns 1; otherwise 0.\n\nSolution.Converged() – Indicates whether the circuit solution converged (1 converged | 0 not converged).\n\nSolution.Converged(arg) – Modifies the converged flag (1 converged | 0 not converged).\n\nSolution.TotalIterations() – The total iterations including control iterations for most recent solution.\n\nSolution.MostIterationsDone() – The max number of iterations required to converge at any control iteration of the most recent solution.\n\nSolution.ControlActionsDone() – Indicates that the control actions are done: {1 done, 0 not done}.\n\nSolution.ControlActionsDone(arg) – Modifies the flag to indicate that the control actions are done: {1 done, 0 not done}.\n\nSolution.FinishTimeStep() – Call cleanup, sample Monitors, and increment time at end of time step.\n\nSolution.Cleanup() – Update storage, invcontrol, etc., at end of time step.\n\nSolution.Frequency() – The frequency for the next solution.\n\nSolution.Frequency(arg) – Set the frequency for the next solution.\n\nSolution.Seconds() – The seconds from top of the hour.\n\nSolution.Seconds(arg) – Set the seconds from top of the hour.\n\nSolution.StepSize() – The step size for the next solution.\n\nSolution.StepSize(arg) – Set the step size for the next solution.\n\nSolution.LoadMult() – The default load multiplier applied to all non-fixed loads.\n\nSolution.LoadMult(arg) – Set the default load multiplier applied to all non-fixed loads.\n\nSolution.Convergence() – The solution convergence tolerance.\n\nSolution.Convergence(arg) – Set the solution convergence tolerance.\n\nSolution.PctGrowth() – The percent default annual load growth rate.\n\nSolution.PctGrowth(arg) – Set the percent default annual load growth rate.\n\nSolution.GenkW() – The generator kW for AutoAdd mode.\n\nSolution.GenkW(arg) – Set the generator kW for AutoAdd mode.\n\nSolution.GenPF() – The pf for generators in AutoAdd mode.\n\nSolution.GenPF(arg) – Set the pf for generators in AutoAdd mode.\n\nSolution.Capkvar() – The capacitor kvar for adding in AutoAdd mode.\n\nSolution.Capkvar(arg) – Set the capacitor kvar for adding in AutoAdd mode.\n\nSolution.GenMult() – The default multiplier applied to generators (like LoadMult).\n\nSolution.GenMult(arg) – Set the default multiplier applied to generators (like LoadMult).\n\nSolution.DblHour() – The hour as a double, including fractional part.\n\nSolution.DblHour(arg) – Set the hour as a double, including fractional part.\n\nSolution.StepSizeMin() – Set the step size in minutes.\n\nSolution.StepSizeHr() – Set the step size in Hours.\n\nSolution.ProcessTime() – The time required (microseconds) to perform the latest solution time step, this time does not includes the time required for sampling meters/monitors.\n\nSolution.TotalTime() – Get the accumulated time required (microseconds) to perform the simulation.\n\nSolution.TotalTime(arg) – Set the accumulated time required (microseconds) to perform the simulation.\n\nSolution.TimeTimeStep() – The time required (microseconds) to perform the latest solution time step including the time required for sampling meters/monitors.\n\nSolution.ModeID() – The ID (text) of the present solution mode.\n\nSolution.LDCurve() – The Load-Duration Curve name for LD modes.\n\nSolution.LDCurve(arg) – Set the Load-Duration Curve name for LD modes.\n\nSolution.DefaultDaily() – The default daily load shape (defaults to 'Default').\n\nSolution.DefaultDaily(arg) – Set the default daily load shape (defaults to 'Default').\n\nSolution.DefaultYearly() – The default yearly load shape (defaults to 'Default').\n\nSolution.DefaultYearly(arg) – Set the default yearly load shape (defaults to 'Default').\n\nSolution.EventLog() – Returns an array of strings containing the Event Log.\n\n\n\n"
},

{
    "location": "api.html#Solution-1",
    "page": "Main API",
    "title": "Solution",
    "category": "section",
    "text": "Solution"
},

{
    "location": "api.html#OpenDSSDirect.DSS.SwtControls",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.SwtControls",
    "category": "Module",
    "text": "module SwtControls – Functions for interfacing with the active OpenDSS SwtControl.\n\nSwtControls.First() – Set the first SwtControl active. Returns 0 if no more.\n\nSwtControls.Next() – Set the next SwtControl active. Returns 0 if no more.\n\nSwtControls.Action() – Get the open (1) or close (2) action of the switch. No effect if switch is locked. However, reset removes any lock and then closes the switch (shelf state). 0 = none action.\n\nSwtControls.Action(arg) – Set open (1) or close (2) the switch. No effect if switch is locked. However, reset removes any lock and then closes the switch (shelf state). 0 = none action (see manual for details).\n\nSwtControls.IsLocked() – Get the lock state: {1 locked | 0 not locked}.\n\nSwtControls.IsLocked(arg) – Set the lock to prevent both manual and automatic switch operation.\n\nSwtControls.SwitchedTerm() – Get the terminal number where the switch is located on the SwitchedObj.\n\nSwtControls.SwitchedTerm(arg) – Set the terminal number where the switch is located on the SwitchedObj.\n\nSwtControls.Count() – Get the total number of SwtControls in the active circuit.\n\nSwtControls.Delay() – Get the time delay [s] between arming and opening or closing the switch. Control may reset before actually operating the switch.\n\nSwtControls.Delay(arg) – Set the time delay [s] between arming and opening or closing the switch. Control may reset before actually operating the switch.\n\nSwtControls.Name() – Get the name of the active SwtControl.\n\nSwtControls.Name(arg) – Set a SwtControl active by name.\n\nSwtControls.SwitchedObj() – Get the name of the switched object by the active SwtControl.\n\nSwtControls.SwitchedObj(arg) – Set the switched object by name.\n\nSwtControls.AllNames() – Get a vector of strings with all SwtControl names in the active circuit.\n\n\n\n"
},

{
    "location": "api.html#SwtControls-1",
    "page": "Main API",
    "title": "SwtControls",
    "category": "section",
    "text": "SwtControls"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Topology",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Topology",
    "category": "Module",
    "text": "module Topology – Functions for interfacing with the active OpenDSS Topology.\n\nTopology.NumLoops() – Get the number of loops.\n\nTopology.NumIsolatedBranches() – Get the number of isolated branches (PD elements and capacitors).\n\nTopology.NumIsolatedLoads() – Get the number of isolated loads.\n\nTopology.First() – Set the first branch active, returns 0 if none.\n\nTopology.Next() – Set the next branch active, returns 0 if none.\n\nTopology.ActiveBranch() – The index of the active Branch.\n\nTopology.ForwardBranch() – Move forward in the tree, return index of new active branch or 0 if no more.\n\nTopology.BackwardBranch() – Move back toward the source, return index of new active branch or 0 if no more.\n\nTopology.LoopedBranch() – Move to looped branch, return index or 0 if none.\n\nTopology.ParallelBranch() – Mode to directly parallel branch, return index or 0 if none.\n\nTopology.FirstLoad() – Set as active load the first load at the active branch, return index or 0 if none.\n\nTopology.NextLoad() – Set as active load the next load at the active branch, return index or 0 if none.\n\nTopology.ActiveLevel() – Get the topological depth of the active branch.\n\nTopology.BranchName() – Get the name of the active branch.\n\nTopology.BranchName(arg) – Set the name of the active branch.\n\nTopology.BusName() – Get the name of the active Bus.\n\nTopology.BusName(arg) – Set the Bus active by name.\n\nTopology.AllLoopedPairs() – Get a vector of all looped element names, by pairs.\n\nTopology.AllIsolatedBranches() – Get a vector of all isolated branch names.\n\nTopology.AllIsolatedLoads() – Get a vector of all isolated load names.\n\n\n\n"
},

{
    "location": "api.html#Topology-1",
    "page": "Main API",
    "title": "Topology",
    "category": "section",
    "text": "Topology"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Transformers",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Transformers",
    "category": "Module",
    "text": "module Transformers – Functions for interfacing with the active OpenDSS transformer.\n\nTransformers.NumWindings() – Get the number of windings on this transformer. Allocates memory; set or change this property first.\n\nTransformers.NumWindings(arg) – Set the number of windings on this transformer. Allocates memory; set or change this property first.\n\nTransformers.Wdg() – Get the active winding number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.).\n\nTransformers.Wdg(arg) – Set the active winding number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.).\n\nTransformers.NumTaps() – Get the active winding number of tap steps between MinTap and MaxTap.\n\nTransformers.NumTaps(arg) – Set the active winding number of tap steps between MinTap and MaxTap\n\nTransformers.IsDelta() – Get the information about if the active winding is delta (1) or wye (0) connection.\n\nTransformers.IsDelta(arg) – Set the information about if the active winding is delta (1) or wye (0) connection.\n\nTransformers.First() – Set the first Transformer active. Return 0 if no more.\n\nTransformers.Next() – Set the next Transformer active. Return 0 if no more.\n\nTransformers.Count() – Get the number of Transformers within the active circuit.\n\nTransformers.R() – Get the active winding resistance in %.\n\nTransformers.R(arg) – Set the active winding resistance in %.\n\nTransformers.Tap() – Get the active winding tap in per-unit.\n\nTransformers.Tap(arg) – Set the active winding tap in per-unit.\n\nTransformers.MinTap() – Get the active winding minimum tap in per-unit.\n\nTransformers.MinTap(arg) – Set the active winding minimum tap in per-unit.\n\nTransformers.MaxTap() – Get the active winding maximum tap in per-unit.\n\nTransformers.MaxTap(arg) – Set the active winding maximum tap in per-unit.\n\nTransformers.kV() – Get the active winding kV rating. Phase-phase for 2 or 3 phases, actual winding kV 1 phase transformer.\n\nTransformers.kV(arg) – Set the active winding kV rating. Phase-phase for 2 or 3 phases, actual winding kV 1 phase transformer.\n\nTransformers.kVA() – Get the active winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings.\n\nTransformers.kVA(arg) – Set the active winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings.\n\nTransformers.Xneut() – Get the active winding neutral reactance [ohms] for wye connections.\n\nTransformers.Xneut(arg) – Set the active winding neutral reactance [ohms] for wye connections.\n\nTransformers.Rneut() – Get the active winding neutral resistance [ohms] for wye connections. Set less than zero ungrounded wye.\n\nTransformers.Rneut(arg) – Set the active winding neutral resistance [ohms] for wye connections. Set less than zero ungrounded wye.\n\nTransformers.Xhl() – Get the percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2 winding or 3 winding Transformers.\n\nTransformers.Xhl(arg) – Set the percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2 winding or 3 winding Transformers.\n\nTransformers.Xht() – Get the percent reactance between windings 1 and 3, on winding 1 kVA base. Use for 3 winding Transformers only.\n\nTransformers.Xht(arg) – Set the percent reactance between windings 1 and 3, on winding 1 kVA base. Use for 3 winding Transformers only.\n\nTransformers.Xlt() – Get the percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3 winding Transformers only.\n\nTransformers.Xlt(arg) – Set the percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3 winding Transformers only.\n\nTransformers.XfmrCode() – Get the name of an XfrmCode that supplies electrical paraMeters for this transformer.\n\nTransformers.XfmrCode(arg) – Set the name of an XfrmCode that supplies electrical paraMeters for this transformer.\n\nTransformers.Name() – Get the active transformer name and 3, on winding_1_kVA base. Use for 3 winding transformer only.\n\nTransformers.Name(arg) – Set the active transformer name and 3, on winding_1_kVA base. Use for 3 winding transformer only.\n\nTransformers.AllNames() – Get a vector of strings with all Transformer names in the active circuit.\n\n\n\n"
},

{
    "location": "api.html#Transformers-1",
    "page": "Main API",
    "title": "Transformers",
    "category": "section",
    "text": "Transformers"
},

{
    "location": "api.html#OpenDSSDirect.DSS.Vsources",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.Vsources",
    "category": "Module",
    "text": "module Vsources – Functions for interfacing with the active OpenDSS voltage source.\n\nVsources.Count() – The number of VSource objects currently defined in the active circuit.\n\nVsources.First() – Set the first VSource to be active; returns 0 if none.\n\nVsources.Next() – Set the next VSource to be active; returns 0 if none.\n\nVsources.Phases() – Get the number of phases of the active VSource.\n\nVsources.Phases(arg) – Set the number of phases of the active VSource.\n\nVsources.BasekV() – Get the source voltage in kV.\n\nVsources.BasekV(arg) – Set the source voltage in kV.\n\nVsources.PU() – Get the source voltage in pu.\n\nVsources.PU(arg) – Set the source voltage in pu.\n\nVsources.AngleDeg() – Get the source phase angle of first phase in degrees.\n\nVsources.AngleDeg(arg) – Set the source phase angle of first phase in degrees.\n\nVsources.Frequency() – Get the source frequency in Hz.\n\nVsources.Frequency(arg) – Set the source frequency in Hz.\n\nVsources.Name() – Get the name of the active VSource.\n\nVsources.Name(arg) – Set the name of the active VSource.\n\nVsources.AllNames() – Get the names of all Vsources\n\n\n\n"
},

{
    "location": "api.html#Vsources-1",
    "page": "Main API",
    "title": "Vsources",
    "category": "section",
    "text": "Vsources"
},

{
    "location": "api.html#OpenDSSDirect.DSS.XYCurves",
    "page": "Main API",
    "title": "OpenDSSDirect.DSS.XYCurves",
    "category": "Module",
    "text": "module XYCurves – Functions for interfacing with the active OpenDSS XYCurve.\n\nXYCurves.Count() – Get number of XYCurves in active circuit.\n\nXYCurves.First() – Set first XYCurves object active; returns 0 if none.\n\nXYCurves.Next() – Set next XYCurves object active; returns 0 if none.\n\nXYCurves.Npts() – Get the number of points in X-Y curve.\n\nXYCurves.Npts(arg) – Set the number of points in X-Y curve.\n\nXYCurves.X() – Get the interpolated value after setting Y.\n\nXYCurves.X(arg) – Set the X value.\n\nXYCurves.Y() – Get the interpolated value after setting X.\n\nXYCurves.Y(arg) – Set the Y value.\n\nXYCurves.XShift() – Get the amount to shift X value from original curve.\n\nXYCurves.XShift(arg) – Set the amount to shift X value from original curve.\n\nXYCurves.YShift() – Get the amount to shift Y value from original curve.\n\nXYCurves.YShift(arg) – Set the amount to shift Y value from original curve.\n\nXYCurves.XScale() – Get the factor to scale X values from original curve.\n\nXYCurves.XScale(arg) – Set the factor to scale X values from original curve.\n\nXYCurves.YScale() – Get the factor to scale Y values from original curve.\n\nXYCurves.YScale(arg) – Set the factor to scale Y values from original curve.\n\nXYCurves.Name() – Get the name of the active XYCurve Object.\n\nXYCurves.Name(arg) – Set the name of the active XYCurve Object.\n\nXYCurves.XArray() – Get the X values as a vector of doubles. Set Npts to max number expected if setting.\n\nXYCurves.YArray() – Get the Y values as a vector of doubles. Set Npts to max number expected if setting.\n\n\n\n"
},

{
    "location": "api.html#XYCurves-1",
    "page": "Main API",
    "title": "XYCurves",
    "category": "section",
    "text": "XYCurves"
},

{
    "location": "flags.html#",
    "page": "Flag objects",
    "title": "Flag objects",
    "category": "page",
    "text": "CurrentModule = OpenDSSDirect.DSS"
},

{
    "location": "flags.html#OpenDSSDirect.DSS.ActionCodes",
    "page": "Flag objects",
    "title": "OpenDSSDirect.DSS.ActionCodes",
    "category": "Module",
    "text": "ActionCodes flags - options include:\n\nNone :  No action\nOpen :  Open a switch\nClose :  Close a switch\nReset :  Reset to the shelf state (unlocked, closed for a switch\nLock :  Lock a switch, prventing both manual and automatic operation\nUnlock :  Unlock a switch, permitting both manual and automatic operation\nTapUp :  Move a regulator tap up\nTapDown : Move a regulator tap down\n\n\n\n"
},

{
    "location": "flags.html#OpenDSSDirect.DSS.CapControlModes",
    "page": "Flag objects",
    "title": "OpenDSSDirect.DSS.CapControlModes",
    "category": "Module",
    "text": "CapControlModes flags - options include:\n\nCurrent : Current control, ON and OFF settings on CT secondary\nVoltage : Voltage control, ON and OFF settings on the PT secondary base\nKVAR : kvar control, ON and OFF settings on PT / CT base\nTime : Time control ON and OFF settings are seconds from midnight\nPF : ON and OFF settings are power factor, negative for leading\n\nExample: \n\ncapcontrols.Mode(CapControlModes.KVAR)\n\n\n\n"
},

{
    "location": "flags.html#OpenDSSDirect.DSS.LineUnits",
    "page": "Flag objects",
    "title": "OpenDSSDirect.DSS.LineUnits",
    "category": "Module",
    "text": "LineUnits flags - options include:\n\nNone :  No line length unit.\nMiles :  Line length units in miles.\nkFt :  Line length units are in thousand feet.\nkm :  Line length units are km.\nmeter :  Line length units are Meters.\nft :  Line units in feet.\ninch :  Line length units are inches.\ncm :  Line units are cm.\nmm :  Line length units are mm.\nMaxnum : Maximum number of line units constants.\n\n\n\n"
},

{
    "location": "flags.html#OpenDSSDirect.DSS.LoadModels",
    "page": "Flag objects",
    "title": "OpenDSSDirect.DSS.LoadModels",
    "category": "Module",
    "text": "LoadModels flags - options include:\n\nConstPQ\nConstZ\nMotor\nCVR\nConstI\nConstPFixedQ\nConstPFixedX\nZIPV\n\n\n\n"
},

{
    "location": "flags.html#OpenDSSDirect.DSS.LoadStatus",
    "page": "Flag objects",
    "title": "OpenDSSDirect.DSS.LoadStatus",
    "category": "Module",
    "text": "LoadStatus flags - options include:\n\nVariable\nFixed\nExempt\n\n\n\n"
},

{
    "location": "flags.html#OpenDSSDirect.DSS.Options",
    "page": "Flag objects",
    "title": "OpenDSSDirect.DSS.Options",
    "category": "Module",
    "text": "Options flags - options include:\n\nPowerFlow :  Power Flow load model option\nAdmittance :  Admittance load model option\nNormalSolve :  Solution algorithm option ‐ Normal solution mode\nNewtonSolve :  Solution algorithm option ‐ Newton solution\nStatic :  Control Mode option ‐ Static\nEvent :  Control Mode Option ‐ Event driven solution mode\nTime :  Control mode option ‐ Time driven mode\nMultiphase :  Circuit model is multiphase (default)\nPositiveSeq :  Circuit model is positive sequence model only\nGaussian :  Random mode = Gaussian\nUniform :  Random mode = Uniform\nLogNormal :  Random Mode = Log normal\nAddGen :  Add generators in AutoAdd mode\nAddCap :  Add capacitors in AutoAdd mode\nControlOFF :  Control Mode OFF = ‐1\n\n\n\n"
},

{
    "location": "flags.html#OpenDSSDirect.DSS.MonitorModes",
    "page": "Flag objects",
    "title": "OpenDSSDirect.DSS.MonitorModes",
    "category": "Module",
    "text": "MonitorModes flags - options include:\n\nVI : Monitor records Voltage and Current at the terminal (Default)\nPower : Monitor records kW, kvar or kVA, angle values, etc. at the terminal to which it is connected\nTaps : For monitoring Regulator and Transformer taps\nStates : For monitoring State Variables (for PC Elements only)\nSequence : Reports the monitored quantities as sequence quantities\nMagnitude : Reports the monitored quantities in Magnitude Only\nPosOnly : Reports the Positive Seq only or avg of all phases\n\nSequence, Magnitude, and PosOnly are bit-level flags that can be combined with other flags. It's best to use & to test for one of these flags. Use | to  combine flags.\n\nExamples: \n\nMonitors.Mode() & MonitorModes.Power\nMonitors.Mode(MonitorModes.Magnitude | MonitorModes.Power)\n\n\n\n"
},

{
    "location": "flags.html#OpenDSSDirect.DSS.SolveModes",
    "page": "Flag objects",
    "title": "OpenDSSDirect.DSS.SolveModes",
    "category": "Module",
    "text": "SolveModes flags - options include:\n\nSnapShot : Solve a single snapshot power flow\nDutyCycle : Solve following Duty Cycle load shapes\nDirect : Solve direct (forced admittance model\nDaily : Solve following Daily load shapes\nMonte1 : Monte Carlo Mode 1\nMonte2 :  Monte Carlo Mode 2\nMonte3 :  Monte Carlo Mode 3\nFaultStudy : Fault study at all buses\nYearly : Solve following Yearly load shapes\nMonteFault : Monte carlo Fault Study\nPeakDay : Solves for Peak Day using Daily load curve\nLD1 : Load‐duration Mode 1\nLD2 :  Load‐Duration Mode 2\nAutoAdd :  Auto add generators or capacitors\nHarmonic :   (no Help string available)\nDynamic\n\n\n\n"
},

{
    "location": "flags.html#Flag-objects-1",
    "page": "Flag objects",
    "title": "Flag objects",
    "category": "section",
    "text": "Several flag variables are also defined, each with multiple entries defined.Here is an example of use of CapControlModes.KVAR:CapControls.Mode(CapControlModes.KVAR)Pages = [\"flags.md\"]ActionCodes\nCapControlModes\nLineUnits\nLoadModels\nLoadStatus\nOptions\nMonitorModes\nSolveModes"
},

{
    "location": "dssmode.html#",
    "page": "DSS REPL Mode",
    "title": "DSS REPL Mode",
    "category": "page",
    "text": ""
},

{
    "location": "dssmode.html#DSS-REPL-Mode-1",
    "page": "DSS REPL Mode",
    "title": "DSS REPL Mode",
    "category": "section",
    "text": "OpenDSSDirect also includes a custom REPL mode for entering OpenDSS commands directly. This is similar to the Help (?) and Shell (;) modes. Use the right square bracket (]) to enter DSS mode. Hit backspace on a blank line to exit. Here is an example:julia> using OpenDSSDirect\n\nDSS> compile C:\\\\portableapps\\\\home\\\\.julia\\\\v0.4\\\\OpenDSSDirect\\\\examples\\\\8500-Node\\\\Master.dss\n\nDSS> solve\n\nDSS> summary\nStatus = NOT Solved\nSolution Mode = Snap\nNumber = 100\nLoad Mult = 1.000\nDevices = 6103\nBuses = 4876\nNodes = 8541\nControl Mode =STATIC\nTotal Iterations = 23\nControl Iterations = 2\nMax Sol Iter = 15\n\n - Circuit Summary -\n\nYear = 0\nHour = 0\nMax pu. voltage = 1.0991\nMin pu. voltage = 0.91736\nTotal Active Power:   12.0047 MW\nTotal Reactive Power: 1.47117 Mvar\nTotal Active Losses:   1.21824 MW, (10.15 %)\nTotal Reactive Losses: 2.79839 Mvar\nFrequency = 60 Hz\nMode = Snap\nControl Mode = STATIC\nLoad Model = PowerFlowThe DSS mode also has help. Hit ? at the DSS> prompt, and enter options or commands you want help on. DSS> clear\n\nDSS help?> clear\nClear all circuits currently in memory.\n\nDSS help?> solve\nPerform the solution of the present solution mode. You can set any option that you can set with the Set command (see Set). The Solve command is virtually synonymous with the Set command except that a solution is performed after the options are processed."
},

{
    "location": "lowlevel.html#",
    "page": "Low-level API",
    "title": "Low-level API",
    "category": "page",
    "text": "CurrentModule = OpenDSSDirect.DSSCore"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.getI",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.getI",
    "category": "Function",
    "text": "getI() – Return the complex vector of current injections. \n\nThe size of the vector is one more than the number of nodes in the system. This is the same current injection array used in OpenDSS internally, so the current injections can be updated for custom solutions. This could be used to implement a custom power control component.\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.getV",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.getV",
    "category": "Function",
    "text": "getV() – Return the complex vector of node voltages. \n\nThe size of the vector is one more than the number of nodes in the system. The first element is ground (zero volts). This is the same voltage array used in OpenDSS internally, so the voltages can be updated for custom solutions. \n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.getYsparse",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.getYsparse",
    "category": "Function",
    "text": "getYsparse() – Return the system sparse Y matrix.\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.ZeroInjCurr",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.ZeroInjCurr",
    "category": "Function",
    "text": "ZeroInjCurr() – Zero out the current injections vector.\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.GetSourceInjCurrents",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.GetSourceInjCurrents",
    "category": "Function",
    "text": "GetSourceInjCurrents() – Update the current injections vector with source injections.\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.GetPCInjCurr",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.GetPCInjCurr",
    "category": "Function",
    "text": "GetPCInjCurr() – Update the current injections vector with injections from power control elements like loads.\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.SystemYChanged",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.SystemYChanged",
    "category": "Function",
    "text": "SystemYChanged() – Bool indicating whether the system Y matrix has changed.\n\n\n\nSystemYChanged(arg) – Set the status of whether the system Y matrix has changed.\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.BuildYMatrixD",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.BuildYMatrixD",
    "category": "Function",
    "text": "BuildYMatrixD(buildops::Integer, doallocate) – Rebuild the system Y matrix. \n\nbuildops::Integer indicates the type of build. 0 == WHOLEMATRIX and 1 == SERIESONLY.\ndoallocate::Bool is used to determine whether to allocate the Y matrix.\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.UseAuxCurrents",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.UseAuxCurrents",
    "category": "Function",
    "text": "UseAuxCurrents() – Bool indicating whether to use auxiliary currents.\n\n\n\nUseAuxCurrents(arg) – Set the status of whether to use auxiliary currents.\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.AddInAuxCurrents",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.AddInAuxCurrents",
    "category": "Function",
    "text": "UseAuxCurrents(arg) – ??\n\n\n\n"
},

{
    "location": "lowlevel.html#OpenDSSDirect.DSSCore.SolveSystem",
    "page": "Low-level API",
    "title": "OpenDSSDirect.DSSCore.SolveSystem",
    "category": "Function",
    "text": "SolveSystem() – Update the system node voltages based on the vector of current injections.\n\n\n\n"
},

{
    "location": "lowlevel.html#Low-level-API-(module-DSSCore)-1",
    "page": "Low-level API",
    "title": "Low-level API (module DSSCore)",
    "category": "section",
    "text": "The main API is built on the low-level API documented here. The low-level API is implemented in the DSSCore module. Here is an example using the low-level API:DSSCore.DSSPut_Command(\"clear\")\nDSSCore.DSSPut_Command(\"compile (C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss)\")\nloadnumber = DSSCore.DSSLoads(0, 0)\nwhile loadnumber > 0\n    DSSCore.DSSLoadsF(1, 50.)\n    DSSCore.DSSLoadsF(5, 20.)\n    loadnumber = DSSCore.DSSLoads(1, 0)\nend\nprintln(DSSCore.DSSLoads(4, 0))Integer (I), floating-point (F), string (S), and variant (V) functions are supported. The low-level API functions are not exported.This low-level API also includes several functions for directly accessing and controlling an OpenDSS solution. These functions include:Pages = [\"lowlevel.md\"]getI\ngetV\ngetYsparse\nZeroInjCurr\nGetSourceInjCurrents\nGetPCInjCurr\nSystemYChanged\nBuildYMatrixD\nUseAuxCurrents\nAddInAuxCurrents\nSolveSystem"
},

{
    "location": "lowlevel.html#Limitations-1",
    "page": "Low-level API",
    "title": "Limitations",
    "category": "section",
    "text": "The functions with input parameters that are Variants are not implemented. An example is DSSCore.SettingsV(5, arg) where arg is an Array. These variants are normally array inputs. There are not many of these in the direct API, and most can be handled with the text interface or other functions. Functions that retrieve Variants are supported."
},

{
    "location": "docindex.html#",
    "page": "Index",
    "title": "Index",
    "category": "page",
    "text": ""
},

{
    "location": "docindex.html#Index-1",
    "page": "Index",
    "title": "Index",
    "category": "section",
    "text": "Pages = [\"api.md\", \"flags.md\", \"lowlevel.md\"]"
},

{
    "location": "NEWS.html#",
    "page": "Release notes",
    "title": "Release notes",
    "category": "page",
    "text": ""
},

{
    "location": "NEWS.html#OpenDSSDirect-v0.3.2-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.3.2 Release Notes",
    "category": "section",
    "text": "Support Linux that's compiled by Lazarus/FPC"
},

{
    "location": "NEWS.html#OpenDSSDirect-v0.3.1-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.3.1 Release Notes",
    "category": "section",
    "text": "Update to OpenDSS version 7.6.5_18"
},

{
    "location": "NEWS.html#OpenDSSDirect-v0.3.0-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.3.0 Release Notes",
    "category": "section",
    "text": "Update to Julia v0.5"
},

{
    "location": "NEWS.html#OpenDSSDirect-v0.2.0-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.2.0 Release Notes",
    "category": "section",
    "text": "Add Documentation\nUpdate DLL's"
},

{
    "location": "NEWS.html#OpenDSSDirect-v0.1.1-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.1.1 Release Notes",
    "category": "section",
    "text": "Initial release"
},

{
    "location": "LICENSE.html#",
    "page": "License",
    "title": "License",
    "category": "page",
    "text": "The OpenDSSDirect.jl package is licensed under the MIT \"Expat\" License:Copyright (c) 2015-2017: Electric Power Research Institute.Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.This package also includes dynamic libraries for OpenDSS. OpenDSS is Copyright (c) 2008-2015, Electric Power Research Institute, Inc. It is published under a three-clause BSD license. See here:http://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/License.txt\nhttp://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/This package also includes dynamic libraries for KLUSolve.   KLUSolve 1.0 is Copyright (c) 2008, EnerNex Corporation.  It is published under the LGPL, version 2.1 or later. For  code and license information, see the following:http://sourceforge.net/p/klusolve/code/HEAD/tree/\nhttp://sourceforge.net/p/klusolve/code/HEAD/tree/License.txtKLUSolve contains open-source copyrighted code as follows. These are also released under the LGPL, version 2.1 or later.KLU Version 1.0, May 31, 2007, by Timothy A. Davis and Ekanathan Palamadai. Copyright (C) 2004-2007, University of Florida.http://sourceforge.net/p/klusolve/code/HEAD/tree/KLU/CSparse: a Concise Sparse Matrix package. Version 2.2.0, Copyright (c) 2006-2007, Timothy A. Davis, Mar 31, 2007.http://sourceforge.net/p/klusolve/code/HEAD/tree/CSparse/\nhttp://sourceforge.net/p/klusolve/code/HEAD/tree/CSparse/Doc/License.txtAMD Version 2.2, Copyright (c) 2007 by Timothy A. Davis, Patrick R. Amestoy, and Iain S. Duff.http://sourceforge.net/p/klusolve/code/HEAD/tree/AMD/BTF Version 1.0, May 31, 2007, by Timothy A. Davis Copyright (C) 2004-2007, University of Floridahttp://sourceforge.net/p/klusolve/code/HEAD/tree/BTF/CZSparse, Copyright (c) 2008, EnerNex Corporation.http://sourceforge.net/p/klusolve/code/HEAD/tree/CZSparse/"
},

]}
