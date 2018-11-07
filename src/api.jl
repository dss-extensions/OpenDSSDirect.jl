export DSS

"Module with the main API for OpenDSSDirect"
module DSS

import ..DSSCore

export dss, Basic, ActiveClass, Bus, Capacitors, CapControls, Circuit, CktElement,
       CtrlQueue, Element, Executive, Progress, Fuses, Generators, Properties,
       Isource, Lines, Loads, LoadShape, Meters, Monitors, Parser, PDElements, 
       PVsystems, Reclosers, RegControls, Relays, Sensors, Settings, Solution,
       SwtControls, Topology, Transformers, Vsources, XYCurves

gendict(;args...) = Dict{Symbol,Int}(args)


################################################################################
##
## dss
##
################################################################################
"""
`dss(arg::AbstractString)`

Execute the OpenDSS text command `arg`.
"""
function dss(arg::AbstractString) 
    nLines = length(collect(eachmatch(r"\n", arg))) + 1
    if nLines == 1 && arg != ""
        DSSCore.DSSPut_Command(arg)
    elseif nLines > 1
        for s in split(arg, "\n")
            if s != ""
                DSSCore.DSSPut_Command(s)
            end
        end
    end
end


################################################################################
##
## Macro @def and helper functions to make it easier to define these repetitive
##   methods
##
################################################################################

replacef(x, fexp) = x
replacef(x::Symbol, fexp) = x == :_ ? fexp : x 
replacef(x::Expr, fexp) = Expr(x.head, Any[replacef(y, fexp) for y in x.args]...) 
function def_helper(nargs, mod, f, idx, newf, helpstr, fexpr = :(_))
    extraargs = Any[]
    argstr = ""
    if nargs == 1
        argstr = "arg"
        push!(extraargs, :arg)
    elseif nargs > 1
        argstr = string(["arg$i, " for i in nargs - 1]..., "arg", nargs)
        append!(extraargs, Any[Symbol(string("arg", i)) for i in 1:nargs])
    end
    helpstr = string("`", mod, ".", newf, "(", argstr, ")` -- ", helpstr)
    freplace = :(DSSCore.$f($idx))
    fexpr = replacef(fexpr, freplace)
    append!(fexpr.args, extraargs)
    newexpr = :($newf())
    append!(newexpr.args, extraargs)
    esc(quote
        @doc $helpstr -> 
        $newexpr = $fexpr
        addhelp!($mod, $helpstr)
    end)
end

macro def(args...)
    def_helper(args...)
end

cmplx(x) = reinterpret(ComplexF64, x)

function reshapemat(x)
    N = length(x)
    n = isqrt(N)
    if rem(N, n) != 0
        return x
    else
        return reshape(x, (n, n)) 
    end
end
function reshape2(x)
    N = length(x)
    if rem(N, 2) != 0
        return x
    else
        return reshape(x, (2, N ÷ 2)) 
    end
end

const collectedhelp = IdDict()

function addhelp!(mod, str)
    collectedhelp[mod] = string(get(collectedhelp, mod, ""), "\n\n", str)
end

################################################################################
##
## Custom methods with a Symbol for the first argument
##
################################################################################

module Basic
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Basic DSSI	0	NumCircuits	"Number of Circuits currently defined"	
@def	0	Basic DSSI	1	ClearAll	"Clears all circuit definitions"	
@def	0	Basic DSSI	2	ShowPanel	"Shows non‐MDI child form of the Main DSS Edit Form"	
@def	0	Basic DSSI	3	Start	"Validate the user and start OpenDSS; returns true if successful"	
@def	0	Basic DSSI	4	NumClasses	"Number of DSS intrinsic classes"	
@def	0	Basic DSSI	5	NumUserClasses	"Number of user‐defined classes"	
@def	0	Basic DSSI	6	Reset	"Resets DSS Initialization for restarts"	
@def	0	Basic DSSI	7	AllowForms	"Bool flag on the status of allowing forms"	_ == 1
@def	1	Basic DSSI	8	AllowForms	"Bool flag to disable forms (once disabled, can’t be enabled again)"	
@def	0	Basic DSSS	0	NewCircuit	"Make a new circuit"	
@def	0	Basic DSSS	1	Version	"Get version string for OpenDSS"	
@def	0	Basic DSSS	2	DataPath	"Default file path for reports, etc."	
@def	1	Basic DSSS	3	DataPath	"Set the default file path for reports, etc."	
@def	0	Basic DSSS	4	DefaultEditor	"The path name for the default text editor"	
@def	0	Basic DSSV	0	Classes	"List of the names of intrinsic classes"	
@def	0	Basic DSSV	1	UserClasses	"List of the names of user-defined classes"	
end  # module Basic
"""
**module Basic** -- Includes methods for basic OpenDSS information.

$(collectedhelp[Basic])
""" Basic

 
module ActiveClass
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	ActiveClass ActiveClassI	0	First	"Sets the first element in the active class to be the active object; if object is a CktElement, ActiveCktElement also points to this element; returns 0 if none"	
@def	0	ActiveClass ActiveClassI	1	Next	"Sets the next element in the active class to be the active object; if object is a CktElement, ActiveCktElement also points to this element; returns 0 if no more"	
@def	0	ActiveClass ActiveClassI	2	NumElements	"Number of elements in the active class"	
@def	0	ActiveClass ActiveClassI	3	Count	"Number of elements in the active class; same as NumElements"	
@def	0	ActiveClass ActiveClassS	0	Name	"Name of the active element of the active class"	
@def	1	ActiveClass ActiveClassS	1	Name	"Set the name of the active element of the active class"	
@def	0	ActiveClass ActiveClassS	2	ActiveClassName	"Name of the active class"	
@def	0	ActiveClass ActiveClassV	0	AllNames	"All element names in the active class"	
end  # module ActiveClass
"""
**module ActiveClass** -- Functions for interfacing with the active OpenDSS class.

$(collectedhelp[ActiveClass])
""" 
ActiveClass


 
module Bus
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Bus BUSI	0	NumNodes	"Number of nodes"	
@def	0	Bus BUSI	1	ZscRefresh	"Refresh Zsc and Ysc values; execute after a major change in the circuit"	
@def	0	Bus BUSI	2	Coorddefined	"Returns true if the X-Y coordinates are defined for the active bus"	_ == 1
@def	0	Bus BUSI	3	GetUniqueNodeNumber	"Returns a unique node number at the active bus to avoid node collisions and adds it to the node list for the bus"	
@def	0	Bus BUSI	4	N_Customers	"Returns the total number of customers downline from the active bus after reliability calcs"	
@def	0	Bus BUSI	5	SectionID	"Integer ID of the feeder section in which this bus is located"	
@def	0	Bus BUSF	0	kVBase	"Base voltage"	
@def	0	Bus BUSF	1	X	"X coordinate of the bus"	
@def	1	Bus BUSF	2	X	"Set the X coordinate of the bus"	
@def	0	Bus BUSF	3	Y	"Y coordinate of the bus"	
@def	1	Bus BUSF	4	Y	"Set the Y coordinate of the bus"	
@def	0	Bus BUSF	5	Distance	"Distance in km that this bus isfrom the parent EnergyMeter"	
@def	0	Bus BUSF	6	Lambda	"Total annual failure rate for active bus after reliability calcs"	
@def	0	Bus BUSF	7	N_interrupts	"Number of interruptions this bus per year"	
@def	0	Bus BUSF	8	Int_Duration	"Average interruption duration, hours"	
@def	0	Bus BUSF	9	Cust_Interrupts	"Annual number of customer-interruptions from this bus"	
@def	0	Bus BUSF	10	Cust_Duration	"Accumulated customer outage durations, hours"	
@def	0	Bus BUSF	11	TotalMiles	"Total length of line downline from this bus, miles"	
@def	0	Bus BUSS	0	Name	"Active bus name; set the active bus by name with `circuit.SetActiveBus(name)`"	
@def	0	Bus BUSV	0	Voltages	"Bus voltages, complex"	cmplx(_)
@def	0	Bus BUSV	1	SeqVoltages	"Sequence voltages in order of 0, 1, then 2"	
@def	0	Bus BUSV	2	Nodes	"Vector of node numbers defined at the bus in the same order as the voltages"	
@def	0	Bus BUSV	3	Voc	"Open-circuit voltage vector, complex"	cmplx(_)
@def	0	Bus BUSV	4	Isc	"Short-circuit current vector, complex"	cmplx(_)
@def	0	Bus BUSV	5	PuVoltage	"Per-unit voltages at the bus, complex"	cmplx(_)
@def	0	Bus BUSV	6	ZscMatrix	"Short-circuit impedance matrix, complex"	reshapemat(cmplx(_))
@def	0	Bus BUSV	7	Zsc1	"Positive-sequence short-circuit impedance looking into the bus, complex"	cmplx(_)[1]
@def	0	Bus BUSV	8	Zsc0	"Zero-sequence short-circuit impedance looking into the bus, complex"	cmplx(_)[1]
@def	0	Bus BUSV	9	YscMatrix	"Short-circuit admittance matrix, complex"	reshapemat(cmplx(_))
@def	0	Bus BUSV	10	CplxSeqVoltages	"All complex sequence voltages"	cmplx(_)
@def	0	Bus BUSV	11	VLL	"Complex vector of line-to-line voltages for 2- and 3-phase buses; returns -1. for a 1-phase bus; for more than 3 phases, only returns 3 phases"	cmplx(_)
@def	0	Bus BUSV	12	puVLL	"Complex vector of per-unit line-to-line voltages for 2- and 3-phase buses; returns -1. for a 1-phase bus; for more than 3 phases, only returns 3 phases"	cmplx(_)
@def	0	Bus BUSV	13	VMagAngle	"Bus voltage magnitudes with angles"	reshape2(_)
@def	0	Bus BUSV	14	puVmagAngle	"Bus voltage magnitudes (per unit) with angles"	reshape2(_)
end  # module Bus
"""
**module Bus** -- Functions for interfacing with the active OpenDSS bus.

$(collectedhelp[Bus])
""" Bus


module Capacitors
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Capacitors	CapacitorsI	0	NumSteps	"Number of steps"	
@def	1	Capacitors	CapacitorsI	1	NumSteps	"Set the number of steps"	
@def	0	Capacitors	CapacitorsI	2	IsDelta	"Is the connection a delta"	_ == 1
@def	1	Capacitors	CapacitorsI	3	IsDelta	"Set connection type; use `arg==true` for delta and `arg==false` for wye"	
@def	0	Capacitors	CapacitorsI	4	First	"Sets the first Capacitor active; returns 0 if none"	
@def	0	Capacitors	CapacitorsI	5	Next	"Sets the next Capacitor active; returns 0 if no more"	
@def	0	Capacitors	CapacitorsI	6	Count	"Number of capacitor objects in the active circuit"	
@def	0	Capacitors	CapacitorsI	7	AddStep	"Adds one step of the capacitor if available; if successful, returns 1"	
@def	0	Capacitors	CapacitorsI	8	SubtractStep	"Subtracts one step of the capacitor; if no more steps, returns 0"	
@def	0	Capacitors	CapacitorsI	9	AvailableSteps	"Number of steps available in the cap bank to be switched ON"	
@def	0	Capacitors	CapacitorsI	10	Open	"Open all steps, all phases of the capacitor"	
@def	0	Capacitors	CapacitorsI	11	Close	"Close all steps of all phases of the capacitor"	
@def	0	Capacitors	CapacitorsF	0	kV	"Bank kV rating; use LL for 2 or 3 phases, or actual can rating for 1 phase"	
@def	1	Capacitors	CapacitorsF	1	kV	"Set the bank kV rating; use LL for 2 or 3 phases, or actual can rating for 1 phase"	
@def	0	Capacitors	CapacitorsF	2	kvar	"Total bank kvar, distributed equally among phases and steps"	
@def	1	Capacitors	CapacitorsF	3	kvar	"Set the total bank kvar, distributed equally among phases and steps"	
@def	0	Capacitors	CapacitorsS	0	Name	"The name of the active capacitor"	
@def	1	Capacitors	CapacitorsS	1	Name	"Sets the active capacitor by name"	
@def	0	Capacitors	CapacitorsV	0	AllNames	"All capacitor names in the circuit"	
@def	0	Capacitors	CapacitorsV	1	States	"A vector of  integers [0..numsteps‐1] indicating state of each step; if value is ‐1 an error has occurred."	
end  # module Capacitors
"""
**module Capacitors** -- Functions for interfacing with the active OpenDSS capacitor.

$(collectedhelp[Capacitors])
""" Capacitors


module CapControls
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	CapControls	CapControlsI	0	First	"Sets the first CapControl active; returns 0 if none"	
@def	0	CapControls	CapControlsI	1	Next	"Sets the next CapControl active; returns 0 if no more"	
@def	0	CapControls	CapControlsI	2	Mode	"Type of automatic controller; for meaning, see CapControlModes"	
@def	1	CapControls	CapControlsI	3	Mode	"Set the type of automatic controller; for choices, see CapControlModes"	
@def	0	CapControls	CapControlsI	4	MonitoredTerm	"Terminal number on the element that PT and CT are connected to"	
@def	1	CapControls	CapControlsI	5	MonitoredTerm	"Set the terminal number on the element that PT and CT are connected to"	
@def	0	CapControls	CapControlsI	6	UseVoltOverride	"Bool flag that enables Vmin and Vmax to override the control mode"	_ == 1
@def	1	CapControls	CapControlsI	7	UseVoltOverride	"Set the Bool flag that enables Vmin and Vmax to override the control mode"	
@def	0	CapControls	CapControlsI	8	Count	"Number of CapControls in the active circuit"	
@def	0	CapControls	CapControlsF	0	CTRatio	"Transducer ratio from primary current to control current"	
@def	1	CapControls	CapControlsF	1	CTRatio	"Set the transducer ratio from primary current to control current"	
@def	0	CapControls	CapControlsF	2	PTRatio	"Transducer ratio from primary voltage to control voltage"	
@def	1	CapControls	CapControlsF	3	PTRatio	"Set the transducer ratio from primary voltage to control voltage"	
@def	0	CapControls	CapControlsF	4	ONSetting	"Threshold to arm or switch on a step; see Mode for units"	
@def	1	CapControls	CapControlsF	5	ONSetting	"Set the threshold to arm or switch on a step; see Mode for units"	
@def	0	CapControls	CapControlsF	6	OFFSetting	"Threshold to switch off a step; see the particular CapControlModes option for units"	
@def	1	CapControls	CapControlsF	7	OFFSetting	"Set the threshold to switch off a step; see the particular CapControlModes option for units"	
@def	0	CapControls	CapControlsF	8	Vmax	"With VoltOverride, switch off whenever PT voltage exceeds this level"	
@def	1	CapControls	CapControlsF	9	Vmax	"Set Vmax; with VoltOverride, switch off whenever PT voltage exceeds this level"	
@def	0	CapControls	CapControlsF	10	Vmin	"With VoltOverride, switch on whenever PT voltage drops below this level"	
@def	1	CapControls	CapControlsF	11	Vmin	"Set Vmin; with VoltOverride, switch on whenever PT voltage drops below this level"	
@def	0	CapControls	CapControlsF	12	Delay	"Time delay [s] to switch on after arming; control may reset before actuallyswitching"	
@def	1	CapControls	CapControlsF	13	Delay	"Set the time delay [s] to switch on after arming; control may reset before actuallyswitching"	
@def	0	CapControls	CapControlsF	14	DelayOff	"Time delay [s] before switching off a step; control may reset before actuallyswitching"	
@def	1	CapControls	CapControlsF	15	DelayOff	"Set the time delay [s] before switching off a step; control may reset before actually switching"	
@def	0	CapControls	CapControlsS	0	Name	"The name of the active CapControl"	
@def	1	CapControls	CapControlsS	1	Name	"Set the active CapControl by name"	
@def	0	CapControls	CapControlsS	2	Capacitor	"Name of the Capacitor that is controlled"	
@def	1	CapControls	CapControlsS	3	Capacitor	"Set the Capacitor (by name) that is controlled"	
@def	0	CapControls	CapControlsS	4	MonitoredObj	"Full name of the element that PT and CT are connected to"	
@def	1	CapControls	CapControlsS	5	MonitoredObj	"Set the element (by full name) that PT and CT are connected to"	
@def	0	CapControls	CapControlsV	0	AllNames	"Names of all CapControls in the circuit"	
end  # module CapControls
"""
**module CapControls** -- Functions for interfacing with the active OpenDSS CapControl.

$(collectedhelp[CapControls])
""" CapControls


module Circuit
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Circuit	CircuitI	0	NumCktElements	"Number of CktElements in the circuit"	
@def	0	Circuit	CircuitI	1	NumBuses	"Total number of Buses in the circuit"	
@def	0	Circuit	CircuitI	2	NumNodes	"Total number of Nodes in the circuit"	
@def	0	Circuit	CircuitI	3	FirstPCElement	"Sets the first enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0"	
@def	0	Circuit	CircuitI	4	NextPCElement	"Sets the next enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0"	
@def	0	Circuit	CircuitI	5	FirstPDElement	"Sets the first enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0"	
@def	0	Circuit	CircuitI	6	NextPDElement	"Sets the next enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0"	
@def	0	Circuit	CircuitI	7	Sample	"Force all Meters and Monitors to take a sample"	
@def	0	Circuit	CircuitI	8	SaveSample	"Force all Meters and Monitors to save their current buffers"	
@def	1	Circuit	CircuitI	9	SetActiveBusi	"Sets the active bus by integer index. The index is 0 based. That is, the first bus has an index of 0. Returns -1 if an error occurs."	
@def	0	Circuit	CircuitI	10	FirstElement	"Sets First element of active class to be the Active element in the active circuit. Returns 0 if none."	
@def	0	Circuit	CircuitI	11	NextElement	"Sets the next element of the active class to be the active element in the active circuit. Returns 0 if no more elements."	
@def	0	Circuit	CircuitI	12	UpdateStorage	"Forces update to all storage classes. Typically done after a solution. Done automatically in intrinsic solution modes."	
@def	0	Circuit	CircuitI	13	ParentPDElement	"Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable."	
@def	0	Circuit	CircuitI	14	EndOfTimeStepUpdate	"Calls EndOfTimeStepCleanup in SolutionAlgs"	
@def	2	Circuit	CircuitF	0	Capacity	"Executes the DSS capacity function. Start is the per unit load multiplier for the current year at which to start the search. Increment is the per unit value by which the load increments for each step of the analysis. The program sets the load at the Start value the PRESENT YEAR (including growth) and increments the load until something in thecircuit reports an overload or undervoltage violation. The function returns the total load at which the violation occurs or the peak load for the present year if no violations."	
@def	0	Circuit	CircuitS	0	Name	"Name of the active circuit"	
@def	1	Circuit	CircuitS	1	Disable	"Disable a circuit element by name (full name)."	
@def	1	Circuit	CircuitS	2	Enable	"Enable a circuit element by name (full name)."	
@def	1	Circuit	CircuitS	3	SetActiveElement	"Activate an element of the active circuit by name. Returns a string with the index of the active element."	
@def	1	Circuit	CircuitS	4	SetActiveBus	"Sets the active bus by name. Returns a 0 based index of the bus to use for future direct indexing of bus values returned in arrays. Returns -1 if an error occurs."	
@def	1	Circuit	CircuitS	5	SetActiveClass	"Sets the active class by name.  Use FirstElement, NextElement to iterate through the class. Returns ‐1 if fails."	
@def	0	Circuit	CircuitV	0	Losses	"Watt and var losses in the entire circuit, complex"	cmplx(_)[1]
@def	0	Circuit	CircuitV	1	LineLosses	"Watt and var losses in all the Line elements in the circuit, complex"	cmplx(_)[1]
@def	0	Circuit	CircuitV	2	SubstationLosses	"Watt and var losses in all the Transformer elements in the circuit that are designated as substations"	cmplx(_)[1]
@def	0	Circuit	CircuitV	3	TotalPower	"Returns the total power in kW and kvar supplied to the circuit by all Vsource and Isource objects. Does not include Generator objects. Complex."	cmplx(_)[1]
@def	0	Circuit	CircuitV	4	AllBusVolts	"Returns the voltage (complex) for every node in the circuit as a complex vector. The order of the array is the same as AllNodeNames property. The array is constructed bus-by-bus and then by node at each bus. Thus, all nodes from each bus are grouped together."	cmplx(_)
@def	0	Circuit	CircuitV	5	AllBusVMag	"Similar to AllBusVolts except magnitude only (in actual volts). Returns the voltage (magnitude) for every node in the circuit as a complex vector."	
@def	0	Circuit	CircuitV	6	AllElementNames	"The names of all elements"	
@def	0	Circuit	CircuitV	7	AllBusNames	"The names of all buses in the system. See `:AllNodeNames`."	
@def	0	Circuit	CircuitV	8	AllElementLosses	"Returns the watt and var losses in each element of the system as a complex vector. Order is the same as AllElementNames."	
@def	0	Circuit	CircuitV	9	AllBusMagPu	"Similar to AllBusVmag except that the magnitudes are reported in per unit for all buses with kVBase defined."	
@def	0	Circuit	CircuitV	10	AllNodeNames	"Returns the names of all nodes (busname.nodenumber) in the same order as AllBusVolts, AllBusVmag, and AllBusVMagPu"	
@def	0	Circuit	CircuitV	11	SystemY	"Return the System Y matrix as a complex (dense) matrix"	cmplx(_)
@def	0	Circuit	CircuitV	12	AllBusDistances	"Returns all distances from a bus to its parent EnergyMeter element, which is generally in the substation, as a variant array of doubles. Order corresponds to that of all bus properties."	
@def	0	Circuit	CircuitV	13	AllNodeDistances	"Returns the distance from all nodes to the parent energy meter that match the designated phase number. Returns a vector of doubles. Matches the order of AllNodeNamesByPhase, AllNodeVmagByPhase, AllNodeVmagPUByPhase."	
# @def	0	Circuit	CircuitV	14	AllNodeVmagByPhase	"Returns variant array of doubles represent the voltage magnitudes for each node whose phase designator matches the specified Phase."	
# @def	0	Circuit	CircuitV	15	AllNodeVmagPUByPhase	"Per unit version of AllNodeVmagByPhase"	
# @def	0	Circuit	CircuitV	16	AllNodeDistancesByPhase	"Returns the distance from all nodes to the parent energy meter that match the designated phase number. Returns a vector. Matches the order of AllNodeNamesByPhase, AllNodeVmagByPhase, AllNodeVmagPUByPhase."	
# @def	0	Circuit	CircuitV	17	AllNodeNamesByPhase	"Returns a variant array of strings in order corresponding to AllNodeDistancesByPhase, AllNodeVmagByPhase, AllNodeVmagPUByPhase. Returns only those names whose phase designator matches the specified Phase."	
@def	0	Circuit	CircuitV	18	YNodeVArray	"Complex array of actual node voltages in same order as SystemY matrix."	cmplx(_)
@def	0	Circuit	CircuitV	19	YNodeOrder	"The names of the nodes in the same order as the Y matrix"	
@def	0	Circuit	CircuitV	20	YCurrents	"Vector of doubles containing complex injection currents for the present solution."	cmplx(_)
end  # module Circuit
"""
**module Circuit** -- Functions for interfacing with the active OpenDSS circuit.

$(collectedhelp[Circuit])
""" Circuit


module CktElement
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	CktElement	CktElementI	0	NumTerminals	"Number of Terminals on this Circuit Element"	
@def	0	CktElement	CktElementI	1	NumConductors	"Number of Conductors per Terminal"	
@def	0	CktElement	CktElementI	2	NumPhases	"Number of phases"	
@def	0	CktElement	CktElementI	3	Open	"Open the specified terminal and phase, if non‐zero.  Else all conductors at terminal."	
@def	0	CktElement	CktElementI	4	Close	"Close the specified terminal and phase, if non‐zero.  Else all conductors at terminal."	
@def	0	CktElement	CktElementI	5	IsOpen	"Bool indicating if the specified terminal and, optionally, phase is open."	_ == 1
@def	0	CktElement	CktElementI	6	NumProperties	"Number of Properties this Circuit Element."	
@def	0	CktElement	CktElementI	7	HasSwitchControl	"Bool indicating whether this element has a SwtControl attached."	_ == 1
@def	0	CktElement	CktElementI	8	HasVoltControl	"This element has a CapControl or RegControl attached."	_ == 1
@def	0	CktElement	CktElementI	9	NumControls	"Number of controls connected to this device. Use to determine valid range for index into Controller array."	
@def	0	CktElement	CktElementI	10	OCPDevIndex	"Index into Controller list of OCP Device controlling this CktElement"	
@def	0	CktElement	CktElementI	11	OCPDevType	"0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device"	
@def	0	CktElement	CktElementI	12	Enabled	"Element is enabled"	_ == 1
@def	1	CktElement	CktElementI	13	Enabled	"Enable the active circuit element"	
@def	0	CktElement	CktElementF	0	NormalAmps	"Normal ampere rating for PD Elements"	
@def	1	CktElement	CktElementF	1	NormalAmps	"Set the normal ampere rating for PD Elements"	
@def	0	CktElement	CktElementF	2	EmergAmps	"Emergency Ampere Rating for PD elements"	
@def	1	CktElement	CktElementF	3	EmergAmps	"Set the emergency Ampere Rating for PD elements"	
@def	1	CktElement	CktElementF	4	Variablei	"For PCElement, get the value of a variable by integer index."	
@def	0	CktElement	CktElementS	0	Name	"Full Name of Active Circuit Element"	
@def	0	CktElement	CktElementS	1	DisplayName	"Display name of the object (not necessarily unique)"	
@def	1	CktElement	CktElementS	2	DisplayName	"Set the display name of the object (not necessarily unique)"	
@def	0	CktElement	CktElementS	3	GUID	"Globally unique identifier for this object"	
@def	0	CktElement	CktElementS	4	EnergyMeter	"Name of the Energy Meter this element is assigned to"	
@def	0	CktElement	CktElementS	5	Controller	"Full name of the i‐th controller attached to this element. Ex: str = Controller"	
@def	0	CktElement	CktElementV	0	BusNames	"Get  Bus definitions to which each terminal is connected. 0‐based array."	
#@def	1	CktElement	CktElementV	1	BusNames	"Set  Bus definitions to which each terminal is connected. 0‐based array."	
@def	0	CktElement	CktElementV	2	Voltages	"Complex array of voltages at terminals"	cmplx(_)
@def	0	CktElement	CktElementV	3	Currents	"Complex array of currents into each conductor of each terminal"	cmplx(_)
@def	0	CktElement	CktElementV	4	Powers	"Complex array of powers into each conductor of each terminal"	cmplx(_)
@def	0	CktElement	CktElementV	5	Losses	"Total losses in the element: two‐element complex array"	cmplx(_)
@def	0	CktElement	CktElementV	6	PhaseLosses	"Complex array of losses by phase"	cmplx(_)
@def	0	CktElement	CktElementV	7	SeqVoltages	"Double array of symmetrical component voltages at each 3‐phase terminal"	
@def	0	CktElement	CktElementV	8	SeqCurrents	"Double array of symmetrical component currents into each 3‐phase terminal"	
@def	0	CktElement	CktElementV	9	SeqPowers	"Double array of sequence powers into each 3‐phase teminal"	cmplx(_)
@def	0	CktElement	CktElementV	10	AllPropertyNames	"All property names of the active device."	
@def	0	CktElement	CktElementV	11	Residuals	"Residual currents for each terminal: (mag, angle)"	reshape2(_)
@def	0	CktElement	CktElementV	12	YPrim	"YPrim matrix, column order, complex numbers"	reshapemat(cmplx(_))
@def	0	CktElement	CktElementV	13	CplxSeqVoltages	"Complex double array of Sequence Voltage for all terminals of active circuit element."	cmplx(_)
@def	0	CktElement	CktElementV	14	CplxSeqCurrents	"Complex double array of Sequence Currents for all conductors of all terminals of active circuit element."	cmplx(_)
@def	0	CktElement	CktElementV	15	AllVariableNames	"Variant array of strings listing all the published variable names, if a PCElement. Otherwise, null string."	
@def	0	CktElement	CktElementV	16	AllVariableValues	"Values of state variables of active element if PC element."	
@def	0	CktElement	CktElementV	17	NodeOrder	"Node numbers (representing phases, for example)"	
@def	0	CktElement	CktElementV	18	CurrentsMagAng	"Currents in magnitude, angle format as a variant array of doubles."	reshape2(_)
@def	0	CktElement	CktElementV	19	VoltagesMagAng	"Voltages at each conductor in magnitude, angle form as variant array of doubles."	reshape2(_)
end  # module CktElement
"""
**module CktElement** -- Functions for interfacing with the active OpenDSS CktElement.

$(collectedhelp[CktElement])
""" CktElement


module CtrlQueue
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	CtrlQueue	CtrlQueueI	0	ClearQueue	"Clear the control queue."	
@def	0	CtrlQueue	CtrlQueueI	1	Delete	"Delete a control action from the DSS control queue by referencing the handle of the action"	
@def	0	CtrlQueue	CtrlQueueI	2	NumActions	"Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions"	
@def	1	CtrlQueue	CtrlQueueI	3	Action	"Set the active action by index"	
@def	0	CtrlQueue	CtrlQueueI	4	ActionCode	"Code for the active action. Long integer code to tell the control device what to do."	
@def	0	CtrlQueue	CtrlQueueI	5	DeviceHandle	"Handle (User defined)"	
@def	0	CtrlQueue	CtrlQueueI	6	Push	"Push a control action onto the DSS control queue by time, action code, and device handle (user defined)."	
@def	0	CtrlQueue	CtrlQueueI	7	Show	"Show the entire control queue in CSV format"	
@def	0	CtrlQueue	CtrlQueueI	8	ClearActions	"Clear the Action list."	
@def	0	CtrlQueue	CtrlQueueI	9	PopAction	"Pops next action off the action list and makes it the active action. Returns zero if none."	
end  # module CtrlQueue
"""
**module CtrlQueue** -- Functions for interfacing with the OpenDSS CtrlQueue.

$(collectedhelp[CtrlQueue])
""" CtrlQueue


module Element
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Element	DSSElementI	0	NumProperties 	"Number of Properties for the active DSS object."	
@def	0	Element	DSSElementS	0	Name	"Full Name of Active DSS Object (general element or circuit element)"	
@def	0	Element	DSSElementV	0	AllPropertyNames	"The names of all properties for the active DSS object."	
end  # module Element
"""
**module Element** -- Functions for interfacing with the OpenDSS Elements.

$(collectedhelp[Element])
""" Element


module Executive
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Executive	DSSExecutiveI	0	NumCommands	"Number of DSS Executive Commands"	
@def	0	Executive	DSSExecutiveI	1	NumOptions	"Number of DSS Executive Options"	
@def	1	Executive	DSSExecutiveS	0	Command	"Get i‐th command (with i as a string)"	
@def	1	Executive	DSSExecutiveS	1	Option	"Get i‐th option (with i as a string)"	
@def	1	Executive	DSSExecutiveS	2	CommandHelp	"Get help string for i‐th command (with i as a string)"	
@def	1	Executive	DSSExecutiveS	3	OptionHelp	"Get help string for i‐th option (with i as a string)"	
@def	1	Executive	DSSExecutiveS	4	OptionValue	"Get present value of i‐th option (with i as a string)"	
end  # module Executive
"""
**module Executive** -- Functions for accessing DSSExecutive.

$(collectedhelp[Executive])
""" Executive


module Progress
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Progress	DSSProgressI	0	PctProgress	"Percent Progress to indicate [0..100]"	
@def	0	Progress	DSSProgressI	1	Show	"Shows Progress form with null caption and Progress set to zero."	
@def	0	Progress	DSSProgressI	2	Close	"Close the Progress form."	
@def	0	Progress	DSSProgressS	0	Caption 	"Caption to appear on the bottom of the DSS Progress form."	
end  # module Progress
"""
**module Progress** -- Functions for controlling the progress form.

$(collectedhelp[Progress])
""" Progress


module Fuses
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Fuses	FusesI	0	Count	"Number of Fuse elements in the circuit"	
@def	0	Fuses	FusesI	1	First	"Set the first Fuse to be the active fuse. Returns 0 if none."	
@def	0	Fuses	FusesI	2	Next	"Advance the active Fuse element pointer to the next fuse. Returns 0 if no more fuses."	
@def	0	Fuses	FusesI	3	MonitoredTerm	"Terminal number to which the fuse is connected."	
@def	1	Fuses	FusesI	4	MonitoredTerm	"Set the terminal number to which the fuse is connected."	
@def	0	Fuses	FusesI	5	Open	"Manual opening of fuse"	
@def	0	Fuses	FusesI	6	 Close	"Close the fuse back in and reset."	
@def	0	Fuses	FusesI	7	IsBlown	"Current state of the fuses. TRUE if any fuse on any phase is blown. Else FALSE."	
@def	0	Fuses	FusesI	8	 Idx	"Get/set active fuse by index into the list of fuses. 1 based: 1..count"	
@def	1	Fuses	FusesI	9	 Idx	"Set Fuse active by index into the list of fuses. 1..count"	
@def	0	Fuses	FusesI	10	NumPhases	"Number of phases, this fuse."	
@def	0	Fuses	FusesF	0	RatedCurrent	"Multiplier or actual amps for the TCCcurve object. Defaults to 1.0. Multipliy current values of TCC curve by this to get actual amps."	
@def	1	Fuses	FusesF	1	RatedCurrent	"Set the multiplier or actual amps for the TCCcurve object. Defaults to 1.0. Multipliy current values of TCC curve by this to get actual amps."	
@def	0	Fuses	FusesS	0	Name	"Get the name of the active Fuse element"	
@def	1	Fuses	FusesS	1	Name	"Set the name of the active Fuse element"	
@def	0	Fuses	FusesS	2	MonitoredObj	"Full name of the circuit element to which the fuse is connected."	
@def	1	Fuses	FusesS	3	MonitoredObj	"Set the full name of the circuit element to which the fuse is connected."	
@def	0	Fuses	FusesS	4	SwitchedObj	"Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj."	
@def	1	Fuses	FusesS	5	SwitchedObj	"Set the full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj."	
@def	0	Fuses	FusesS	6	TCCCurve	"Name of the TCCcurve object that determines fuse blowing."	
@def	1	Fuses	FusesS	7	TCCCurve	"Set the name of the TCCcurve object that determines fuse blowing."	
@def	0	Fuses	FusesV	0	AllNames	" Names of all Fuses in the circuit"	
end  # module Fuses
"""
**module Fuses** -- Functions for interfacing with the active OpenDSS Fuse.

$(collectedhelp[Fuses])
""" Fuses


module Generators
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Generators	GeneratorsI	0	First	"Sets first Generator to be active.  Returns 0 if none."	
@def	0	Generators	GeneratorsI	1	Next	"Sets next Generator to be active.  Returns 0 if no more."	
@def	0	Generators	GeneratorsI	2	ForcedON	"Indicates whether the generator is forced ON regardles of other dispatch criteria."	
@def	1	Generators	GeneratorsI	3	ForcedON	"Sets indication whether the generator is forced ON regardles of other dispatch criteria."	
@def	0	Generators	GeneratorsI	4	Phases	"Number of phases"	
@def	1	Generators	GeneratorsI	5	Phases	"Set the number of phases"	
@def	0	Generators	GeneratorsI	6	Count	"Number of Generator Objects in Active Circuit"	
@def	0	Generators	GeneratorsI	7	Idx	"Get/Set active Generator by index into generators list.  1..Count"	
@def	1	Generators	GeneratorsI	8	Idx	"Set active Generator by index into generators list.  1..Count"	
@def	0	Generators	GeneratorsI	9	Model	"Generator model"	
@def	1	Generators	GeneratorsI	10	Model	"Set the Generator model"	
@def	0	Generators	GeneratorsF	0	kV	"Voltage base for the active generator, kV"	
@def	1	Generators	GeneratorsF	1	kV	"Set the voltage base for the active generator, kV"	
@def	0	Generators	GeneratorsF	2	kW	"kW output for the active generator. kvar is updated for current power factor."	
@def	1	Generators	GeneratorsF	3	kW	"Set the kW output for the active generator. kvar is updated for current power factor."	
@def	0	Generators	GeneratorsF	4	kvar	"kvar output for the active generator. Updates power factor based on present kW value."	
@def	1	Generators	GeneratorsF	5	kvar	"Set the kvar output for the active generator. Updates power factor based on present kW value."	
@def	0	Generators	GeneratorsF	6	PF	"Power factor (pos. = producing vars)"	
@def	1	Generators	GeneratorsF	7	PF	"Set the power factor (pos. = producing vars)"	
@def	0	Generators	GeneratorsF	8	kVARated	"Get the KVA rating of the generator."	
@def	1	Generators	GeneratorsF	9	kVARated	"Set the KVA rating of the generator."	
@def	0	Generators	GeneratorsF	10	Vmaxpu	"Get the Vmaxpu for Generator Model."	
@def	1	Generators	GeneratorsF	11	Vmaxpu	"Set the Vmaxpu for Generator Model."	
@def	0	Generators	GeneratorsF	12	Vminpu	"Get the Vminpu for Generator Model."	
@def	1	Generators	GeneratorsF	13	Vminpu	"Set the Vminpu for Generator Model."	
@def	0	Generators	GeneratorsS	0	Name	"Active generator name."	
@def	1	Generators	GeneratorsS	1	Name	"Sets a generator active by name."	
@def	0	Generators	GeneratorsV	0	AllNames	"All generator names"	
@def	0	Generators	GeneratorsV	1	RegisterNames	"Array of Names of all generator energy meter registers"	
@def	0	Generators	GeneratorsV	2	RegisterValues	"Array of valus in generator energy meter registers."	
end  # module Generators
"""
**module Generators** -- Functions for interfacing with the active OpenDSS Generator.

$(collectedhelp[Generators])
""" Generators


module Properties
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Properties	DSSProperties	0	Name	"The name of the active property."	
@def	0	Properties	DSSProperties	1	Description	"The description of the active property."	
@def	0	Properties	DSSProperties	2	Value	"The value of the active property."	
@def	1	Properties	DSSProperties	3	Value	"Set the value of the active property. The new value must be specified in `arg` as a string."	
end  # module Properties
"""
**module Properties** -- Functions for interfacing with OpenDSS properties.

$(collectedhelp[Properties])
""" Properties


module Isource
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Isource	IsourceI	0	Count	"Returns the number of Isource objects currently defined in the active circuit."	
@def	0	Isource	IsourceI	1	First	"Set the first ISource to be active; returns 0 if none."	
@def	0	Isource	IsourceI	2	Next	"Set the next ISource to be active; returns 0 if none."	
@def	0	Isource	IsourceF	0	Amps	"Get the magnitude of the Isource in Amps."	
@def	1	Isource	IsourceF	1	Amps	"Set the magnitude of the Isource in Amps."	
@def	0	Isource	IsourceF	2	AngleDeg	"Get the phase angle of the Isource in degrees."	
@def	1	Isource	IsourceF	3	AngleDeg	"Set the phase angle of the Isource in degrees."	
@def	0	Isource	IsourceF	4	Frequency	"Get the frequency of the Isource in Hz."	
@def	1	Isource	IsourceF	5	Frequency	"Set the frequency of the Isource in Hz."	
@def	0	Isource	IsourceS	0	Name	"Get the name of the active Isource object."	
@def	1	Isource	IsourceS	1	Name	"Set the name of the active Isource object."	
@def	0	Isource	IsourceV	0	AllNames	"Names of all Isources in the circuit."	
end  # module Isource
"""
**module Isource** -- Functions for interfacing with the active OpenDSS current source.

$(collectedhelp[Isource])
""" Isource


module Lines
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Lines	LinesI	0	First	"Set the first element active. Returns 0 if no Lines. Otherwise, index of the line element."	
@def	0	Lines	LinesI	1	Next	"Set the next element active. Returns 0 if no Lines. Otherwise, index of the line element."	
@def	0	Lines	LinesI	2	Phases	"Get the number of phases of the active line object."	
@def	1	Lines	LinesI	3	Phases	"Set the number of phases of the active line object."	
@def	0	Lines	LinesI	4	NumCust	"Get the number of customers on this line section."	
@def	0	Lines	LinesI	5	Parent	"Get the parents of the active Line to be the active Line. Return 0 if no parent or action fails."	
@def	0	Lines	LinesI	6	Count	"Get the number of Line Objects in Active Circuit."	
@def	0	Lines	LinesI	7	Units	"Get the units of the line (distance, check manual for details)."	
@def	1	Lines	LinesI	8	Units	"Set the units of the line (distance, check manual for details)."	
@def	0	Lines	LinesF	0	Length	"Get the length of line section in units compatible with the LineCode definition."	
@def	1	Lines	LinesF	1	Length	"Set the length of line section in units compatible with the LineCode definition."	
@def	0	Lines	LinesF	2	R1	"Get the positive sequence resistance, ohm per unit length."	
@def	1	Lines	LinesF	3	R1	"Set the positive sequence resistance, ohm per unit length."	
@def	0	Lines	LinesF	4	X1	"Get the positive sequence reactance, ohm per unit length."	
@def	1	Lines	LinesF	5	X1	"Set the positive sequence reactance, ohm per unit length."	
@def	0	Lines	LinesF	6	R0	"Get the zero sequence resistance, ohm per unit length."	
@def	1	Lines	LinesF	7	R0	"Set the zero sequence resistance, ohm per unit length."	
@def	0	Lines	LinesF	8	X0	"Get the zero sequence reactance, ohm per unit length."	
@def	1	Lines	LinesF	9	X0	"Set the zero sequence reactance, ohm per unit length."	
@def	0	Lines	LinesF	10	C1	"Get the positive sequence capacitance, nanofarads per unit length."	
@def	1	Lines	LinesF	11	C1	"Set the positive sequence capacitance, nanofarads per unit length."	
@def	0	Lines	LinesF	12	C0	"Get the zero sequence capacitance, nanofarads per unit length."	
@def	1	Lines	LinesF	13	C0	"Set the zero sequence capacitance, nanofarads per unit length."	
@def	0	Lines	LinesF	14	NormAmps	"Get the normal ampere rating of Line."	
@def	1	Lines	LinesF	15	NormAmps	"Set the normal ampere rating of Line."	
@def	0	Lines	LinesF	16	EmergAmps	"Get the emergency (maximum) ampere rating of Line."	
@def	1	Lines	LinesF	17	EmergAmps	"Set the emergency (maximum) ampere rating of Line."	
@def	0	Lines	LinesF	18	Rg	"Get the earth return value used to compute line impedances at power frequency."	
@def	1	Lines	LinesF	19	Rg	"Set the earth return value used to compute line impedances at power frequency."	
@def	0	Lines	LinesF	20	Xg	"Get the earth return reactance value used to compute line impedances at power frequency."	
@def	1	Lines	LinesF	21	Xg	"Set the earth return reactance value used to compute line impedances at power frequency."	
@def	0	Lines	LinesF	22	Rho	"Get the earth resistivity, m-ohms."	
@def	1	Lines	LinesF	23	Rho	"Set the earth resistivity, m-ohms."	
@def	0	Lines	LinesS	0	Name	"Get the name of the active Line element."	
@def	1	Lines	LinesS	1	Name	"Set the name of the Line element to set it active."	
@def	0	Lines	LinesS	2	Bus1	"Get the name of bus for terminal 1."	
@def	1	Lines	LinesS	3	Bus1	"Set the name of bus for terminal 1."	
@def	0	Lines	LinesS	4	Bus2	"Get the name of bus for terminal 2."	
@def	1	Lines	LinesS	5	Bus2	"Set the name of bus for terminal 2."	
@def	0	Lines	LinesS	6	LineCode	"Get the name of LineCode object that defines the impedances."	
@def	1	Lines	LinesS	7	LineCode	"Set the name of LineCode object that defines the impedances."	
@def	0	Lines	LinesS	8	Geometry	"Get the name of the Line geometry code."	
@def	1	Lines	LinesS	9	Geometry	"Set the name of the Line geometry code."	
@def	0	Lines	LinesS	10	Spacing	"Get the name of the Line spacing code."	
@def	1	Lines	LinesS	11	Spacing	"Set the name of the Line spacing code."	
@def	0	Lines	LinesV	0	AllNames	"Get the name of all Line Objects."	
@def	0	Lines	LinesV	1	RMatrix	"Get the resistance matrix (full), ohms per unit length. Variant array of doubles."	
#@def	1	Lines	LinesV	2	RMatrix	"Set the resistance matrix (full), ohms per unit length. Variant array of doubles."	
@def	0	Lines	LinesV	3	XMatrix	"Get the reactance matrix (full), ohms per unit length. Variant array of doubles."	
#@def	1	Lines	LinesV	4	XMatrix	"Set the reactance matrix (full), ohms per unit length. Variant array of doubles."	
@def	0	Lines	LinesV	5	CMatrix	"Get the capacitance matrix (full), nanofarads per unit length. Variant array of doubles."	
#@def	1	Lines	LinesV	6	CMatrix	"Set the capacitance matrix (full), nanofarads per unit length. Variant array of doubles."	
@def	0	Lines	LinesV	7	Yprim	"Get the YPrimitive of the active Line."	reshapemat(cmplx(_))
#@def	1	Lines	LinesV	8	Yprim	"does nothing at present."	
end  # module Lines
"""
**module Lines** -- Functions for interfacing with the active OpenDSS Line.

$(collectedhelp[Lines])
""" Lines


module Loads
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Loads	DSSLoads	0	First	"Allows to set the active load into the first load registered in the active circuit. As a result, this property will return the number 1. The parameter argument can be filled with a 0."	
@def	0	Loads	DSSLoads	1	Next	"Set the active load into the next load registered in the active circuit. As a result, this property will set the index of the active load. The parameter argument can be filled with a 0."	
@def	0	Loads	DSSLoads	2	Idx	"The index of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoads	3	Idx	"Set the index of the active load. The parameter argument must contain the index of the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoads	4	Count	"Returns the number of load elements within the active circuit. The parameter argument can be filled with a 0."	
@def	0	Loads	DSSLoads	5	Class	"The code number used to separate Loads by class or group. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoads	6	Class	"The code number used to separate loads by class or group. The parameter argument can be filled with a 0."	
@def	0	Loads	DSSLoads	7	Model	"The model of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoads	8	Model	"Set the model of the active load using the parameter argument. return a 0."	
@def	0	Loads	DSSLoads	9	NumCust	"The number of customer of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoads	10	NumCust	"Set the number of customers of the active load using the parameter argument. return a 0."	
@def	0	Loads	DSSLoads	11	Status	""	
@def	1	Loads	DSSLoads	12	Status	""	
@def	0	Loads	DSSLoads	13	IsDelta	"If true, loads are line to line."		_ == 1
@def	1	Loads	DSSLoads	14	IsDelta	"Set whether loads are delta (line to line)."	
@def	0	Loads	DSSLoadsF	0	kW	"The kW property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	1	kW	"Set the kW property of the active load. The parameter argument must contain the new value in kW for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	2	kV	"The kV property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	3	kV	"Set the kV property of the active load. The parameter argument must contain the new value in kV for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	4	kvar	"The kvar property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	5	kvar	"Set the kvar property of the active load. The parameter argument must contain the new value in kvar for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	6	PF	"The pf property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	7	PF	"Set the pf property of the active load. The parameter argument must contain the new value in pf for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	8	PctMean	"The PctMean property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	9	PctMean	"Set the PctMean property of the active load. The parameter argument must contain the new value in PctMean for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	10	PctStdDev	"The PctStdDev property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	11	PctStdDev	"Set the PctStdDev property of the active load. The parameter argument must contain the new value in PctStdDev for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	12	AllocationFactor	"The AllocationFactor property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	13	AllocationFactor	"Set the AllocationFactor property of the active load. The parameter argument must contain the new value in AllocationFactor for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	14	CFactor	"The CFactor property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	15	CFactor	"Set the CFactor property of the active load. The parameter argument must contain the new value in CFactor for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	16	CVRwatts	"The CVRWatts property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	17	CVRwatts	"Set the CVRWatts property of the active load. The parameter argument must contain the new value in CVRWatts for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	18	CVRvars	"The CVRvars property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	19	CVRvars	"Set the CVRvars property of the active load. The parameter argument must contain the new value in CVRvars for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	20	kVABase	"The kva property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	21	kVABase	"Set the kva property of the active load. The parameter argument must contain the new value in kva for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	22	kWh	"The kWh property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	23	kWh	"Set the kWh property of the active load. The parameter argument must contain the new value in kWh for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	24	kWhDays	"The kWhdays property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	25	kWhDays	"Set the kWhdays property of the active load. The parameter argument must contain the new value in kWhdays for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	26	Rneut	"The RNeut (neutral resistance for wye connected loads) property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	27	Rneut	"Set the RNeut (neutral resistance for wye connected loads) property of the active load. The parameter argument must contain the new value in RNeut for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	28	Vmaxpu	"The VMaxpu property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	29	Vmaxpu	"Set the VMaxpu property of the active load. The parameter argument must contain the new value in VMaxpu for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	30	VminEmerg	"The VMinemerg property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	31	VminEmerg	"Set the VMinemerg property of the active load. The parameter argument must contain the new value in VMinemerg for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	32	VminNorm	"The VMinnorm property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	33	VminNorm	"Set the VMinnorm property of the active load. The parameter argument must contain the new value in VMinnorm for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	34	Vminpu	"The VMinpu property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	35	Vminpu	"Set the VMinpu property of the active load. The parameter argument must contain the new value in VMinpu for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	36	XfkVA	"The xfKVA (Rated service transformer KVA for load allocation, using Allocationfactor. Affects kW, kvar and pf.) property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	37	XfkVA	"Set the xfKVA (Rated service transformer KVA for load allocation, using Allocationfactor. Affects kW, kvar and pf.) property of the active load. The parameter argument must contain the new value in xfKVA for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	38	Xneut	"The Xneut property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	39	Xneut	"Set the Xneut property of the active load. The parameter argument must contain the new value in Xneut for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	40	puSeriesRL	"The PctSeriesRL (Percent of Load that is modeled as series R-L for harmonic studies) property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	41	puSeriesRL	"Set the PctSeriesRL (Percent of Load that is modeled as series R-L for harmonic studies) property of the active load. The parameter argument must contain the new value in PctSeriesRL for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsF	42	RelWeighting	"The RelWeight (relative weighting factor) property of the active load. The parameter argument can be filled with a 0."	
@def	1	Loads	DSSLoadsF	43	RelWeighting	"Set the RelWeight (relative weighting factor) property of the active load. The parameter argument must contain the new value in RelWeight for the desired active load. The return value will be equal to 0."	
@def	0	Loads	DSSLoadsS	0	Name	"The Name property of the active load. The parameter argument can be filled with an empty string."	
@def	1	Loads	DSSLoadsS	1	Name	"Set the active load by specifying the Name load. The parameter argument must contain the Name of the load to activate. The return value will be equal to empty."	
@def	0	Loads	DSSLoadsS	2	CVRCurve	"The CVRCUrve property of the active load. The parameter argument can be filled with an empty string."	
@def	1	Loads	DSSLoadsS	3	CVRCurve	"Set the CVRCurve property for the active load. The parameter argument must contain the Name of the new CVRCurve to be linked to the active load. The return value will be equal to empty."	
@def	0	Loads	DSSLoadsS	4	Daily	"The daily property of the active load. The parameter argument can be filled with an empty string."	
@def	1	Loads	DSSLoadsS	5	Daily	"Set the daily property for the active load. The parameter argument must contain the Name of the new daily to be linked to the active load. The return value will be equal to empty."	
@def	0	Loads	DSSLoadsS	6	Duty	"The duty property of the active load. The parameter argument can be filled with an empty string."	
@def	1	Loads	DSSLoadsS	7	Duty	"Set the duty property for the active load. The parameter argument must contain the Name of the new duty to be linked to the active load. The return value will be equal to empty."	
@def	0	Loads	DSSLoadsS	8	Spectrum	"The Spectrum property of the active load. The parameter argument can be filled with an empty string."	
@def	1	Loads	DSSLoadsS	9	Spectrum	"Set the Spectrum property for the active load. The parameter argument must contain the Name of the new Spectrum to be linked to the active load. The return value will be equal to empty."	
@def	0	Loads	DSSLoadsS	10	Yearly	"The Yearly property of the active load. The parameter argument can be filled with an empty string."	
@def	1	Loads	DSSLoadsS	11	Yearly	"Set the Yearly property for the active load. The parameter argument must contain the Name of the new Yearly to be linked to the active load. The return value will be equal to empty."	
@def	0	Loads	DSSLoadsS	12	Growth	"The Growth property of the active load. The parameter argument can be filled with an empty string."	
@def	1	Loads	DSSLoadsS	13	Growth	"Set the Growth property for the active load. The parameter argument must contain the Name of the new Growth to be linked to the active load. The return value will be equal to empty."	
@def	0	Loads	DSSLoadsV	0	AllNames	"The names of all the loads present in the active circuit. The result is delivered as variant, however, the content of this variant is an array of strings."	
@def	0	Loads	DSSLoadsV	1	ZipV	"The array of 7 elements (doubles) for ZIP property of the active Load object."	
#@def	1	Loads	DSSLoadsV	2	ZipV	"Set the array of 7 elements (doubles) for ZIP property of the active Load object."	
end  # module Loads
"""
**module Loads** -- Functions for interfacing with the active OpenDSS load.

$(collectedhelp[Loads])
""" Loads


module LoadShape
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	LoadShape	LoadShapeI	0	Count	"The number of LoadShape objects currently defined in LoadShape collection."	
@def	0	LoadShape	LoadShapeI	1	First	"Set the first LoadShape active and return integer index of the LoadShape. Returns 0 if no more."	
@def	0	LoadShape	LoadShapeI	2	Next	"Set the next LoadShape active and return integer index of the LoadShape. Returns 0 if no more."	
@def	0	LoadShape	LoadShapeI	3	Npts	"Get the number of points in active LoadShape."	
@def	1	LoadShape	LoadShapeI	4	Npts	"Set the number of points in active LoadShape."	
@def	0	LoadShape	LoadShapeI	5	Normalize	"normalizes the P and Q curves based on either Pbase, Qbase or simply the peak value of the curve."	
@def	0	LoadShape	LoadShapeI	6	UseActual	"Get a TRUE/FALSE (1/0) to let Loads know to use the actual value in the curve rather than use the value as a multiplier."	
@def	1	LoadShape	LoadShapeI	7	UseActual	"Set a TRUE/FALSE (1/0 - Argument) to let Loads know to use the actual value in the curve rather than use the value as a multiplier."	
@def	0	LoadShape	LoadShapeF	0	HrInterval	"Get the fixed interval time value, hours."	
@def	1	LoadShape	LoadShapeF	1	HrInterval	"Set the fixed interval time value, hours."	
@def	0	LoadShape	LoadShapeF	2	MinInterval	"Get the fixed interval time value, in minutes."	
@def	1	LoadShape	LoadShapeF	3	MinInterval	"Set the fixed interval time value, in minutes."	
@def	0	LoadShape	LoadShapeF	4	PBase	"Get the base for normalizing P curve. If left at zero, the peak value is used."	
@def	1	LoadShape	LoadShapeF	5	PBase	"Set the base for normalizing P curve. If left at zero, the peak value is used."	
@def	0	LoadShape	LoadShapeF	6	QBase	"Get the base for normalizing Q curve. If left at zero, the peak value is used."	
@def	1	LoadShape	LoadShapeF	7	QBase	"Set the base for normalizing Q curve. If left at zero, the peak value is used."	
@def	0	LoadShape	LoadShapeF	8	SInterval	"Get the fixed interval data time interval, seconds."	
@def	1	LoadShape	LoadShapeF	9	SInterval	"Set the fixed interval data time interval, seconds."	
@def	0	LoadShape	LoadShapeS	0	Name	"Get the name of the active LoadShape object."	
@def	1	LoadShape	LoadShapeS	1	Name	"Set the name of the active LoadShape object."	
@def	0	LoadShape	LoadShapeV	0	AllNames	"Names of all of the load shapes"	
@def	0	LoadShape	LoadShapeV	1	PMult	"Get a variant array of doubles for the P multiplier in the LoadShape."	
#@def	1	LoadShape	LoadShapeV	2	PMult	"Set a variant array of doubles for the P multiplier in the LoadShape."	
@def	0	LoadShape	LoadShapeV	3	QMult	"Get a variant array of doubles for the Q multiplier in the LoadShape."	
#@def	1	LoadShape	LoadShapeV	4	QMult	"Set a variant array of doubles for the Q multiplier in the LoadShape."	
@def	0	LoadShape	LoadShapeV	5	TimeArray	"Get a time array in hours corresponding to P and Q multipliers when the Interval = 0."	
#@def	1	Loadshape	LoadShapeV	6	TimeArray	"Set a time array in hours corresponding to P and Q multipliers when the Interval = 0."	
end  # module LoadShape
"""
**module LoadShape** -- Functions for interfacing with the active OpenDSS LoadShape.

$(collectedhelp[LoadShape])
""" LoadShape


module Meters
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Meters	MetersI	0	First	"Set the first Energy Meter active. Returns 0 if no Monitors."	
@def	0	Meters	MetersI	1	Next	"Set the next energy Meter Active. Returns 0 if no more."	
@def	0	Meters	MetersI	2	Reset	"Resets the active Meter object."	
@def	0	Meters	MetersI	3	ResetAll	"Resets all Meter object."	
@def	0	Meters	MetersI	4	Sample	"Causes active meter to take a sample."	
@def	0	Meters	MetersI	5	Save	"Causes active meter to save its current sample buffer to its meter stream. Then you can access the Bytestream or channel data. Most standard solution modes do this automatically."	
@def	0	Meters	MetersI	6	MeteredTerminal	"The number of metered terminal by the active Energy Meter."	
@def	1	Meters	MetersI	7	MeteredTerminal	"Set the number of metered terminal by the active Energy Meter."	
@def	0	Meters	MetersI	8	DIFilesAreOpen	"Returns a global flag (1=true, 0=false) to indicate if Demand Interval (DI) files have been properly opened."	
@def	0	Meters	MetersI	9	SampleAll	"Causes all Energy Meters to take a sample of the present state. Returns 0."	
@def	0	Meters	MetersI	10	SaveAll	"save all Energy Meter buffers to their respective file streams. Returns 0."	
@def	0	Meters	MetersI	11	OpenAllDIFiles	"Opens Demand Interval (DI) files. Returns 0."	
@def	0	Meters	MetersI	12	CloseAllDIFiles	"Close all Demand Interval (DI) files. Necessary at the end of a run."	
@def	0	Meters	MetersI	13	CountEndElements	"The number of zone end elements in the active meter zone."	
@def	0	Meters	MetersI	14	Count	"The number of Energy Meters in the Active Circuit."	
@def	0	Meters	MetersI	15	CountBranches	"The number of branches in active Energy Meter zone (same as sequencelist size)."	
@def	0	Meters	MetersI	16	SequenceList	"The index into meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be up line from later index. Sets PDElement active."	
@def	1	Meters	MetersI	17	SequenceList	"Set the index into meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be up line from later index. Sets PDElement active."	
@def	1	Meters	MetersI	18	DoReliabilityCalc	"calculates SAIFI, etc. if the Argument is equal to 1 assume restoration, otherwise it will not."	
@def	0	Meters	MetersI	19	SeqListSize	"The size of Sequence List."	
@def	0	Meters	MetersI	20	TotalCustomers	"The total number of customers in this zone (down line from the Energy Meter)."	
@def	0	Meters	MetersI	21	NumSections	"The number of feeder sections in this meter's zone."	
@def	1	Meters	MetersI	22	SetActiveSection	"Set the designated section (argument) if the index is valid."	
@def	0	Meters	MetersI	23	OCPDeviceType	"The type of OCP device: {1=fuse | 2+ recloser | 3= relay}."	
@def	0	Meters	MetersI	24	NumSectionCustomers	"The number of customers in the active section."	
@def	0	Meters	MetersI	25	NumSectionBranches	"The number of branches (Lines) in the active section."	
@def	0	Meters	MetersI	26	SectSeqidx	"The Sequence Index of the branch at the head of this section."	
@def	0	Meters	MetersI	27	SectTotalCust	"The total customers down line from this section."	
@def	0	Meters	MetersF	0	SAIFI	"SAIFI for this meter's zone. Execute reliability calc method first."	
@def	0	Meters	MetersF	1	SAIFIkW	"The SAIFI based on kW rather than number of customers. Get after reliability calcs."	
@def	0	Meters	MetersF	2	SAIDI	"The SAIDI for this meter zone. Execute DoreliabilityCalc first."	
@def	0	Meters	MetersF	3	CustInterrupts	"The total customer interruptions for this meter zone based on reliability calcs."	
@def	0	Meters	MetersF	4	AvgRepairTime	"The average Repair Time in this Section of the meter zone."	
@def	0	Meters	MetersF	5	FaultRateXRepairHrs	"The sum of Fault Rate time Repair Hours in this section of the meter zone."	
@def	0	Meters	MetersF	6	SumBranchFltRates	"The sum of the branch fault rates in this section of the meter's zone."	
@def	0	Meters	MetersS	0	Name	"The active Energy Meter's name."	
@def	1	Meters	MetersS	1	Name	"Set the active Energy Meter's name."	
@def	0	Meters	MetersS	2	MeteredElement	"The name of the metered element (considering the active Energy Meter)."	
@def	1	Meters	MetersS	3	MeteredElement	"Set the name of the metered element (considering the active Energy Meter)."	
@def	0	Meters	MetersV	0	AllNames	"All Energy Meter names."	
@def	0	Meters	MetersV	1	RegisterNames	"Strings containing the names of the registers."	
@def	1	Meters	MetersV	2	RegisterValues	"Values contained in the Meter registers for the active Meter."	
@def	0	Meters	MetersV	3	Totals	"The totals for all registers of all Meters."	
@def	0	Meters	MetersV	4	PeakCurrent	"Returns an array of doubles with the Peak Current Property."	
#@def	1	Meters	MetersV	5	PeakCurrent	"An array of doubles to set values of Peak Current Property."	
@def	0	Meters	MetersV	6	CalcCurrent	"The magnitude of the real part of the Calculated Current (normally determined by solution) for the meter to force some behavior on Load Allocation."	
#@def	1	Meters	MetersV	7	CalcCurrent	"Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the meter to force some behavior on Load Allocation."	
@def	0	Meters	MetersV	8	AllocFactors	"An array of doubles: allocation factors for the active Meter."	
#@def	1	Meters	MetersV	9	AllocFactors	"An array of doubles to set the phase allocation factors for the active Meter."	
@def	0	Meters	MetersV	10	AllEndElements	"A vector of names of all zone end elements."	
@def	0	Meters	MetersV	11	AllBranchesInZone	"A wide string list of all branches in zone of the active Energy Meter object."	
end  # module Meters
"""
**module Meters** -- Functions for interfacing with the active OpenDSS energy meter.

$(collectedhelp[Meters])
""" Meters


module Monitors
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Monitors	MonitorsI	0	First	"Set the first monitor active. Returns 0 if no Monitors."	
@def	0	Monitors	MonitorsI	1	Next	"Set the next monitor active. Returns 0 if no more."	
@def	0	Monitors	MonitorsI	2	Reset	"Resets the active Monitor object."	
@def	0	Monitors	MonitorsI	3	ResetAll	"Resets all Monitor object."	
@def	0	Monitors	MonitorsI	4	Sample	"Causes active monitor to take a sample."	
@def	0	Monitors	MonitorsI	5	Save	"Causes active monitor to save its current sample buffer to its monitor stream. Then you can access the Bytestream or channel data. Most standard solution modes do this automatically."	
@def	0	Monitors	MonitorsI	6	Show	"Converts monitor file into text and displays with text editor."	
@def	0	Monitors	MonitorsI	7	Mode	"The monitor mode (bitmask integer - see DSS Help)."	
@def	1	Monitors	MonitorsI	8	Mode	"Set the monitor mode (bitmask integer - see DSS Help)."	
@def	0	Monitors	MonitorsI	9	SampleCount	"Returns number of samples in Monitor at present."	
@def	0	Monitors	MonitorsI	10	SampleAll	"Causes all Monitors to take a sample of the present state. Returns 0."	
@def	0	Monitors	MonitorsI	11	SaveAll	"Save all Monitor buffers to their respective file streams. Returns 0."	
@def	0	Monitors	MonitorsI	12	Count	"The number of Monitors."	
@def	0	Monitors	MonitorsI	13	Process	"Post-process monitor samples taken so far, e.g., Pst for mode = 4."	
@def	0	Monitors	MonitorsI	14	ProcessAll	"Makes that all Monitors post-process the data taken so far."	
@def	0	Monitors	MonitorsI	15	FileVersion	"The Monitor File version (integer)."	
@def	0	Monitors	MonitorsI	16	RecordSize	"The size of each record in ByteStream."	
@def	0	Monitors	MonitorsI	17	NumChannels	"The number of Channels on the active Monitor."	
@def	0	Monitors	MonitorsI	18	Terminal	"The terminal number of element being monitored."	
@def	1	Monitors	MonitorsI	19	Terminal	"Set the terminal number of element being monitored."	
@def	0	Monitors	MonitorsS	0	FileName	"The name of the CSV file associated with active monitor."	
@def	0	Monitors	MonitorsS	1	Name	"The active Monitor object by name."	
@def	1	Monitors	MonitorsS	2	Name	"Set the active Monitor object by name."	
@def	0	Monitors	MonitorsS	3	Element	"The full name of element being monitored by the active Monitor."	
@def	1	Monitors	MonitorsS	4	Element	"Set the full name of element being monitored by the active Monitor."	
@def	0	Monitors	MonitorsV	0	AllNames	"An array of all Monitor names (array of strings)."	
@def	0	Monitors	MonitorsV	1	ByteStream	"A byte array containing monitor stream values. Make sure a 'save' is done first (standard solution modes do this automatically)."	
@def	0	Monitors	MonitorsV	2	DblHourS	"The header string; vector of strings containing Channel Names."	
@def	0	Monitors	MonitorsV	3	DblHour	"A vector of doubles containing time value in hours for the time-sampled monitor values; empty if frequency-sampled values for harmonics solution (see dblFreq)."	
@def	0	Monitors	MonitorsV	4	DblFreqS	"A vector of doubles containing time values for harmonics mode solutions; empty for time mode solutions (use dblHour)."	
@def	0	Monitors	MonitorsV	5	DblFreq	"A vector of doubles for the specified channel (usage: MyArray = DSSmonitor.Channel(i)) A save or SaveAll should be executed first. Done automatically by most standard solution modes."	
end  # module Monitors
"""
**module Monitors** -- Functions for interfacing with the active OpenDSS Monitor.

$(collectedhelp[Monitors])
""" Monitors


module Parser
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Parser	ParserI	0	IntValue	"Return next parameter as a long integer."	
@def	0	Parser	ParserI	1	ResetDelimiters	"Reset delimiters to their default values."	
@def	0	Parser	ParserI	2	AutoIncrement	"In the default is false (0). If true (1) Parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names."	
@def	1	Parser	ParserI	3	AutoIncrement	"In the default is false (0). If true (1) Parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names."	
@def	0	Parser	ParserF	0	DblValue 	"Returns next parameter as a double."	
@def	0	Parser	ParserS	0	CmdString	"Get a string to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence."	
@def	1	Parser	ParserS	1	CmdString	"Set a string to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence."	
@def	0	Parser	ParserS	2	NextParam	"Get next token and return tag name (before = sign) if any. See Autoincrement."	
@def	0	Parser	ParserS	3	StrValue	"Return next parameter as a string."	
@def	0	Parser	ParserS	4	WhiteSpace	"Get the characters used for White space in the command string. Default in blank and Tab."	
@def	1	Parser	ParserS	5	WhiteSpace	"Set the characters used for White space in the command string. Default in blank and Tab."	
@def	0	Parser	ParserS	6	BeginQuote	"Get the string containing the characters for quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is \"([{."	
@def	1	Parser	ParserS	7	BeginQuote	"Set the string containing the characters for quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is \"([{."	
@def	0	Parser	ParserS	8	EndQuote	"Get the string containing the characters, in order, that match the beginning quote characters in BeginQuote. Default is \")]}."	
@def	1	Parser	ParserS	9	EndQuote	"Set the string containing the characters, in order, that match the beginning quote characters in BeginQuote. Default is \")]}."	
@def	0	Parser	ParserS	10	Delimiters	"Get the string defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitespace to separate tokens."	
@def	1	Parser	ParserS	11	Delimiters	"Set the string defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitespace to separate tokens."	
@def	0	Parser	ParserV	0	Vector	"Returns token as vector of doubles. For parsing quoted array syntax."	
@def	0	Parser	ParserV	1	Matrix	"Use this property to parse a Matrix token in OpenDSS format. Returns square matrix of order specified. Order same as default fortran order: column by column."	
@def	0	Parser	ParserV	2	SymMatrix	"Use this property to parse a Matrix token in lower triangular form. Symmetry is forced."	
end  # module Parser
"""
**module Parser** -- Functions for interfacing with the OpenDSS Parser.

$(collectedhelp[Parser])
""" Parser


module PDElements
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	PDElements	PDElementsI	0	Count	"Get number of PDElements in active circuit."	
@def	0	PDElements	PDElementsI	1	First	"Set the first enabled PD element to be the active element. Returns 0 if none found."	
@def	0	PDElements	PDElementsI	2	Next	"Set the next enabled PD element to be the active element. Returns 0 if none found."	
@def	0	PDElements	PDElementsI	3	IsShunt	"returns 1 if the PD element should be treated as a shunt element rather than a series element. Applies to capacitor and reactor elements in particular."	
@def	0	PDElements	PDElementsI	4	NumCustomers	"Get the number of customers in this branch."	
@def	0	PDElements	PDElementsI	5	TotalCustomers	"Get the total number of customers from this branch to the end of the zone."	
@def	0	PDElements	PDElementsI	6	ParentPDElement	"Set the parent PD element to be the active circuit element. Returns 0 if no more elements upline."	
@def	0	PDElements	PDElementsI	7	FromTerminal	"Get the number of the terminal of active PD element that is on the 'from' side. This is set after the meter zone is determined."	
@def	0	PDElements	PDElementsI	8	SectionID	"Get the integer ID of the feeder section that this PDElement branch is part of."	
@def	0	PDElements	PDElementsF	0	FaultRate	"Get the number of failures per year. For LINE elements: Number of failures per unit length per year."	
@def	1	PDElements	PDElementsF	1	FaultRate	"Set the number of failures per year. For LINE elements: Number of failures per unit length per year."	
@def	0	PDElements	PDElementsF	2	PctPermanent	"Get the percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary."	
@def	1	PDElements	PDElementsF	3	PctPermanent	"Set the percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary."	
@def	0	PDElements	PDElementsF	4	Lambda	"Get the failure rate for this branch. Faults per year including length of line."	
@def	0	PDElements	PDElementsF	5	AccumulatedL	"Get the accumulated failure rate for this branch on down line."	
@def	0	PDElements	PDElementsF	6	RepairTime	"Get the average time to repair a permanent fault on this branch, hours."	
@def	0	PDElements	PDElementsF	7	TotalMiles	"Get the total miles of line from this element to the end of the zone. For recloser siting algorithm."	
@def	0	PDElements	PDElementsS	0	Name	"Get the name of the active PDElement, returns null string if active element id not PDElement."	
@def	1	PDElements	PDElementsS	1	Name	"Set the name of the active PDElement, returns null string if active element id not PDElement."	
end  # module PDElements
"""
**module PDElements** -- Functions for interfacing with the active OpenDSS power-delivery element.

$(collectedhelp[PDElements])
""" PDElements


module PVsystems
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	PVsystems	PVsystemsI	0	Count	"The number of PVSystem objects currently defined in the active circuit."	
@def	0	PVsystems	PVsystemsI	1	First	"Set the first PVSystem to be active; returns 0 if none."	
@def	0	PVsystems	PVsystemsI	2	Next	"Set the next PVSystem to be active; returns 0 if none."	
@def	0	PVsystems	PVsystemsI	3	Idx	"Get the active PVSystem by index; 1..Count."	
@def	1	PVsystems	PVsystemsI	4	Idx	"Set the active PVSystem by index; 1..Count."	
@def	0	PVsystems	PVsystemsF	0	Irradiance	"Get the present value of the Irradiance property in W/sq-m."	
@def	1	PVsystems	PVsystemsF	1	Irradiance	"Set the present value of the Irradiance property in W/sq-m."	
@def	0	PVsystems	PVsystemsF	2	kW	"Get the kW output."	
@def	0	PVsystems	PVsystemsF	3	kvar	"Get the kvar value."	
@def	1	PVsystems	PVsystemsF	4	kvar	"Set the kvar value."	
@def	0	PVsystems	PVsystemsF	5	pf	"Get the power factor value."	
@def	1	PVsystems	PVsystemsF	6	pf	"Set the power factor value."	
@def	0	PVsystems	PVsystemsF	7	kVARated	"Get the rated kVA."	
@def	1	PVsystems	PVsystemsF	8	kVARated	"Set the rated kVA."	
end  # module PVsystems
"""
**module PVsystems** -- Functions for interfacing with the active OpenDSS PVsystem.

$(collectedhelp[PVsystems])
""" PVsystems


module Reclosers
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Reclosers	ReclosersI	0	Count	"Get number of Reclosers in active circuit."	
@def	0	Reclosers	ReclosersI	1	First	"Set first recloser to be active Circuit Element. Returns 0 if none."	
@def	0	Reclosers	ReclosersI	2	Next	"Set next recloser to be active Circuit Element. Returns 0 if none."	
@def	0	Reclosers	ReclosersI	3	MonitoredTerm	"Get the terminal number of Monitored Object for the Recloser."	
@def	1	Reclosers	ReclosersI	4	MonitoredTerm	"Set the terminal number of Monitored Object for the Recloser."	
@def	0	Reclosers	ReclosersI	5	SwitchedTerm	"Get the terminal of the controlled device being switched by the Recloser."	
@def	1	Reclosers	ReclosersI	6	SwitchedTerm	"Set the terminal of the controlled device being switched by the Recloser."	
@def	0	Reclosers	ReclosersI	7	NumFast	"Get the number of fast shots."	
@def	1	Reclosers	ReclosersI	8	NumFast	"Set the number of fast shots."	
@def	0	Reclosers	ReclosersI	9	Shots	"Get the number of shots to lockout (fast + delayed)."	
@def	1	Reclosers	ReclosersI	10	Shots	"Set the number of shots to lockout (fast + delayed)."	
@def	0	Reclosers	ReclosersI	11	Open	"Open recloser's controlled element and lock out the recloser."	
@def	0	Reclosers	ReclosersI	12	Close	"Close the switched object controlled by the recloser. Resets recloser to first operation."	
@def	0	Reclosers	ReclosersI	13	Idx	"Get the active recloser by index into the recloser list. 1..Count."	
@def	1	Reclosers	ReclosersI	14	Idx	"Set the active recloser by index into the recloser list. 1..Count."	
@def	0	Reclosers	ReclosersF	0	PhaseTrip	"Get the phase trip curve multiplier or actual amps."	
@def	1	Reclosers	ReclosersF	1	PhaseTrip	"Set the phase trip curve multiplier or actual amps."	
@def	0	Reclosers	ReclosersF	2	PhaseInst	"Get the phase instantaneous curve multiplier or actual amps."	
@def	1	Reclosers	ReclosersF	3	PhaseInst	"Set the phase instantaneous curve multiplier or actual amps."	
@def	0	Reclosers	ReclosersF	4	GroundTrip	"Get the ground (3I0) trip multiplier or actual amps."	
@def	1	Reclosers	ReclosersF	5	GroundTrip	"Set the ground (3I0) trip multiplier or actual amps."	
@def	0	Reclosers	ReclosersF	6	GroundInst	"Get the ground (3I0) instantaneous trip setting - curve multiplier or actual amps."	
@def	1	Reclosers	ReclosersF	7	GroundInst	"Set the ground (3I0) instantaneous trip setting - curve multiplier or actual amps."	
@def	0	Reclosers	ReclosersS	0	Name	"Get the name of the active Recloser Object."	
@def	1	Reclosers	ReclosersS	1	Name	"Set the name of the active Recloser Object."	
@def	0	Reclosers	ReclosersS	2	MonitoredObj	"Get the full name of object this Recloser is monitoring."	
@def	1	Reclosers	ReclosersS	3	MonitoredObj	"Set the full name of object this Recloser is monitoring."	
@def	0	Reclosers	ReclosersS	4	SwitchedObj	"Get the full name of the circuit element that is being switched by this Recloser."	
@def	1	Reclosers	ReclosersS	5	SwitchedObj	"Set the full name of the circuit element that is being switched by this Recloser."	
@def	0	Reclosers	ReclosersV	0	AllNames	"Get a vector of strings with names of all Reclosers in active circuit."	
@def	0	Reclosers	ReclosersV	1	RecloseIntervals	"Get a vector of doubles: reclose intervals (s) between shots."	
end  # module Reclosers
"""
**module Reclosers** -- Functions for interfacing with the active OpenDSS Recloser.

$(collectedhelp[Reclosers])
""" Reclosers


module RegControls
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	RegControls	RegControlsI	0	First	"Set the first RegControl active. Returns 0 if no more."	
@def	0	RegControls	RegControlsI	1	Next	"Set the next RegControl active. Returns 0 if no more"	
@def	0	RegControls	RegControlsI	2	TapWinding	"Get the tapped winding number."	
@def	1	RegControls	RegControlsI	3	TapWinding	"Set the tapped winding number."	
@def	0	RegControls	RegControlsI	4	Winding	"Get the winding number for PT and CT connections."	
@def	1	RegControls	RegControlsI	5	Winding	"Set the winding number for PT and CT connections."	
@def	0	RegControls	RegControlsI	6	IsReversible	"Get the setting in the reverse direction, usually not applicable to substation Transformers."	
@def	1	RegControls	RegControlsI	7	IsReversible	"Set the different settings for the reverse direction (see Manual for details), usually not applicable to substation Transformers."	
@def	0	RegControls	RegControlsI	8	IsInverseTime	"Get the inverse time feature. Time delay is inversely adjusted, proportional to the amount of voltage outside the regulator band."	
@def	1	RegControls	RegControlsI	9	IsInverseTime	"Set the inverse time feature. Time delay is inversely adjusted, proportional to the amount of voltage outside the regulator band."	
@def	0	RegControls	RegControlsI	10	MaxTapChange	"Get the maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for faster solution."	
@def	1	RegControls	RegControlsI	11	MaxTapChange	"Set the maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for faster solution."	
@def	0	RegControls	RegControlsI	12	Count	"Get the number of RegControl objects in Active Circuit."	
@def	0	RegControls	RegControlsI	13	TapNumber	"Get the tap number."	
@def	1	RegControls	RegControlsI	14	TapNumber	"Set the tap number."	
@def	0	RegControls	RegControlsF	0	CTPrimary	"Get the CT primary ampere rating (secondary is 0.2 amperes)."	
@def	1	RegControls	RegControlsF	1	CTPrimary	"Set the CT primary ampere rating (secondary is 0.2 amperes)."	
@def	0	RegControls	RegControlsF	2	PTRatio	"Get the PT ratio for voltage control settings."	
@def	1	RegControls	RegControlsF	3	PTRatio	"Set the PT ratio for voltage control settings."	
@def	0	RegControls	RegControlsF	4	ForwardR	"Get the LDC R settings in Volts."	
@def	1	RegControls	RegControlsF	5	ForwardR	"Set the LDC R settings in Volts."	
@def	0	RegControls	RegControlsF	6	ForwardX	"Get the LDC X settings in Volts."	
@def	1	RegControls	RegControlsF	7	ForwardX	"Set the LDC X settings in Volts."	
@def	0	RegControls	RegControlsF	8	ReverseR	"Get the reverse LDC R settings in Volts."	
@def	1	RegControls	RegControlsF	9	ReverseR	"Set the reverse LDC R settings in Volts."	
@def	0	RegControls	RegControlsF	10	ReverseX	"Get the reverse LDC X settings in Volts."	
@def	1	RegControls	RegControlsF	11	ReverseX	"Set the reverse LDC X settings in Volts."	
@def	0	RegControls	RegControlsF	12	Delay	"Get the time delay [s] after arming before the first tap change. Control may reset before actually changing taps."	
@def	1	RegControls	RegControlsF	13	Delay	"Set the time delay [s] after arming before the first tap change. Control may reset before actually changing taps."	
@def	0	RegControls	RegControlsF	14	TapDelay	"Get the time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps."	
@def	1	RegControls	RegControlsF	15	TapDelay	"Set the time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps."	
@def	0	RegControls	RegControlsF	16	VoltageLimit	"Get the first house voltage limit on PT secondary base. Setting to 0 disables this function."	
@def	1	RegControls	RegControlsF	17	VoltageLimit	"Set the first house voltage limit on PT secondary base. Setting to 0 disables this function."	
@def	0	RegControls	RegControlsF	18	ForwardBand	"Get the regulation bandwidth in forward direction, centered on Vreg."	
@def	1	RegControls	RegControlsF	19	ForwardBand	"Set the regulation bandwidth in forward direction, centered on Vreg."	
@def	0	RegControls	RegControlsF	20	ForwardVreg	"Get the target voltage in the forward direction, on PT secondary base."	
@def	1	RegControls	RegControlsF	21	ForwardVreg	"Set the target voltage in the forward direction, on PT secondary base."	
@def	0	RegControls	RegControlsF	22	ReverseBand	"Get the bandwidth in reverse direction, centered on reverse Vreg."	
@def	1	RegControls	RegControlsF	23	ReverseBand	"Set the bandwidth in reverse direction, centered on reverse Vreg."	
@def	0	RegControls	RegControlsF	24	ReverseVreg	"Get the target voltage in the reverse direction, on PT secondary base."	
@def	1	RegControls	RegControlsF	25	ReverseVreg	"Set the target voltage in the reverse direction, on PT secondary base."	
@def	0	RegControls	RegControlsS	0	Name	"Get the active RegControl name."	
@def	1	RegControls	RegControlsS	1	Name	"Set the active RegControl name."	
@def	0	RegControls	RegControlsS	2	MonitoredBus	"Get the name of the remote regulated bus, in lieu of LDC settings."	
@def	1	RegControls	RegControlsS	3	MonitoredBus	"Set the name of the remote regulated bus, in lieu of LDC settings."	
@def	0	RegControls	RegControlsS	4	Transformer	"Get the name of the transformer this regulator controls."	
@def	1	RegControls	RegControlsS	5	Transformer	"Set the name of the transformer this regulator controls."	
@def	0	RegControls	RegControlsV	0	AllNames	"Get a vector of strings containing all RegControl names."	
end  # module RegControls
"""
**module RegControls** -- Functions for interfacing with the active OpenDSS RegControl.

$(collectedhelp[RegControls])
""" RegControls


module Relays
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Relays	RelaysI	0	Count	"Get number of Relays in active circuit."	
@def	0	Relays	RelaysI	1	First	"Set first relay active. If none, returns 0."	
@def	0	Relays	RelaysI	2	Next	"Set next relay active. If none, returns 0."	
@def	0	Relays	RelaysI	3	MonitoredTerm	"Get the number of terminal of monitored element that this relay is monitoring."	
@def	1	Relays	RelaysI	4	MonitoredTerm	"Set the number of terminal of monitored element that this relay is monitoring."	
@def	0	Relays	RelaysI	5	SwitchedTerm	"Get the number of terminal of the switched object that will be opened when the relay trips."	
@def	1	Relays	RelaysI	6	SwitchedTerm	"Set the number of terminal of the switched object that will be opened when the relay trips."	
@def	0	Relays	RelaysI	7	Idx	"Get the active relay by index into the Relay list. 1..Count."	
@def	1	Relays	RelaysI	8	Idx	"Set the active relay by index into the Relay list. 1..Count."	
@def	0	Relays	RelaysS	0	Name	"Get the name of the active Relay."	
@def	1	Relays	RelaysS	1	Name	"Set the name of the active Relay."	
@def	0	Relays	RelaysS	2	MonitoredObj	"Get the full name of the object this relay is monitoring."	
@def	1	Relays	RelaysS	3	MonitoredObj	"Set the full name of the object this relay is monitoring."	
@def	0	Relays	RelaysS	4	SwitchedObj	"Get the full name of element that will switched when relay trips."	
@def	1	Relays	RelaysS	5	SwitchedObj	"Set the full name of element that will switched when relay trips."	
@def	0	Relays	RelaysV	0	AllNames	"Get a vector of strings containing names of all relay elements."	
end  # module Relays
"""
**module Relays** -- Functions for interfacing with the active OpenDSS Relay.

$(collectedhelp[Relays])
""" Relays


module Sensors
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Sensors	SensorsI	0	Count	"Get number of Sensors in active circuit."	
@def	0	Sensors	SensorsI	1	First	"Set the first sensor active. Returns 0 if none."	
@def	0	Sensors	SensorsI	2	Next	"Set the next sensor active. Returns 0 if none"	
@def	0	Sensors	SensorsI	3	IsDelta	"Returns 1 if the sensor is connected in delta; otherwise, returns 0."		_ == 1
@def	1	Sensors	SensorsI	4	IsDelta	"Allows to set 1 if the sensor is connected in delta; otherwise, set 0 (argument)."	
@def	0	Sensors	SensorsI	5	ReverseDelta	"Returns 1 if voltage measurements are 1-3, 3-2, 2-1; otherwise 0."	
@def	1	Sensors	SensorsI	6	ReverseDelta	"Allows to set 1 if voltage measurements are 1-3, 3-2, 2-1; otherwise 0."	
@def	0	Sensors	SensorsI	7	MeteredTerminal	"Get the number of the measured terminal in the measured element."	
@def	1	Sensors	SensorsI	8	MeteredTerminal	"Set the number of the measured terminal in the measured element."	
@def	0	Sensors	SensorsI	9	Reset	"Clears the active sensor."	
@def	0	Sensors	SensorsI	10	ResetAll	"Clears all Sensors in the active circuit."	
@def	0	Sensors	SensorsF	0	PctError	"Get the assumed percent error in the Sensor measurement. Default is 1."	
@def	1	Sensors	SensorsF	1	PctError	"Set the assumed percent error in the Sensor measurement. Default is 1."	
@def	0	Sensors	SensorsF	2	Weight	"Get the weighting factor for this sensor measurement with respect to the other Sensors. Default is 1."	
@def	1	Sensors	SensorsF	3	Weight	"Set the weighting factor for this sensor measurement with respect to the other Sensors. Default is 1."	
@def	0	Sensors	SensorsF	4	kVBase	"Get the voltage base for the sensor measurements. LL for 2 and 3 - phase Sensors, LN for 1-phase Sensors."	
@def	1	Sensors	SensorsF	5	kVBase	"Set the voltage base for the sensor measurements. LL for 2 and 3 - phase Sensors, LN for 1-phase Sensors."	
@def	0	Sensors	SensorsS	0	Name	"Get the name of the active sensor object."	
@def	1	Sensors	SensorsS	1	Name	"Set the name of the active sensor object."	
@def	0	Sensors	SensorsS	2	MeteredElement	"Get the full name of the measured element."	
@def	1	Sensors	SensorsS	3	MeteredElement	"Set the full name of the measured element."	
@def	0	Sensors	SensorsV	0	AllNames	"Returns a vector of sensor names."	
@def	0	Sensors	SensorsV	1	Currents	"Get an array of doubles for the line current measurements; don't use with KWS and KVARS."	
#@def	1	Sensors	SensorsV	2	Currents	"Set an array of doubles for the line current measurements; don't use with KWS and KVARS."	
@def	0	Sensors	SensorsV	3	kvar	"Get an array of doubles for Q measurements; overwrites currents with a new estimate using KWS."	
#@def	1	Sensors	SensorsV	4	kvar	"Set an array of doubles for Q measurements; overwrites currents with a new estimate using KWS."	
@def	0	Sensors	SensorsV	5	kW	"Get an array of doubles for P measurements; overwrites currents with a new estimate using KVARS."	
#@def	1	Sensors	SensorsV	6	kW	"Set an array of doubles for P measurements; overwrites currents with a new estimate using KVARS."	
end  # module Sensors
"""
**module Sensors** -- Functions for interfacing with the active OpenDSS Sensor.

$(collectedhelp[Sensors])
""" Sensors


module Settings
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Settings	SettingsI	0	AllowDuplicates	"Get if OpenDSS allows duplicate names of objects: {1 allow, 0 not allow}."	
@def	1	Settings	SettingsI	1	AllowDuplicates	"Set if OpenDSS allows duplicate names of objects: {1 allow, 0 not allow}."	
@def	0	Settings	SettingsI	2	ZoneLock	"Get the status of Lock zones on energy Meters to prevent rebuilding if a circuit change occurs: {1= true, 0= False}."	
@def	1	Settings	SettingsI	3	ZoneLock	"Set the status of Lock zones on energy Meters to prevent rebuilding if a circuit change occurs: {1= true, 0= False}."	
@def	0	Settings	SettingsI	4	CktModel	"Get {dssMultiphase* | dssPositiveSeq} Indicate if the circuit model is positive sequence."	
@def	1	Settings	SettingsI	5	CktModel	"Set {dssMultiphase* | dssPositiveSeq} Indicate if the circuit model is positive sequence."	
@def	0	Settings	SettingsI	6	Trapezoidal	"Get {True (1) | False (0)} value of trapezoidal integration flag in Energy Meters."	
@def	1	Settings	SettingsI	7	Trapezoidal	"Set {True (1) | False (0)} value of trapezoidal integration flag in Energy Meters."	
@def	1	Settings	SettingsF	0	AllocationFactors	"Set all load allocation factors for all loads defined by XFKVA property to this value."	
@def	0	Settings	SettingsF	1	NormVminpu	"Get the per unit minimum voltage for Normal conditions."	
@def	1	Settings	SettingsF	2	NormVminpu	"Set the per unit minimum voltage for Normal conditions."	
@def	0	Settings	SettingsF	3	NormVmaxpu	"Get the per unit maximum voltage for Normal conditions."	
@def	1	Settings	SettingsF	4	NormVmaxpu	"Set the per unit maximum voltage for Normal conditions."	
@def	0	Settings	SettingsF	5	EmergVminpu	"Get the per unit minimum voltage for Emergency conditions."	
@def	1	Settings	SettingsF	6	EmergVminpu	"Set the per unit minimum voltage for Emergency conditions."	
@def	0	Settings	SettingsF	7	EmergVmaxpu	"Get the per unit maximum voltage for Emergency conditions."	
@def	1	Settings	SettingsF	8	EmergVmaxpu	"Set the per unit maximum voltage for Emergency conditions."	
@def	0	Settings	SettingsF	9	UEWeight	"Get the weighting factor applied to UE register values."	
@def	1	Settings	SettingsF	10	UEWeight	"Set the weighting factor applied to UE register values."	
@def	0	Settings	SettingsF	11	LossWeight	"Get the weighting factor applied to Loss register values."	
@def	1	Settings	SettingsF	12	LossWeight	"Set the weighting factor applied to Loss register values."	
@def	0	Settings	SettingsF	13	PriceSignal	"Get the price signal for the circuit."	
@def	1	Settings	SettingsF	14	PriceSignal	"Set the price signal for the circuit."	
@def	0	Settings	SettingsS	0	AutoBusList	"Get the list of Buses or (File=xxxxx) syntax for the AutoAdd solution mode."	
@def	1	Settings	SettingsS	1	AutoBusList	"Set the list of Buses or (File=xxxxx) syntax for the AutoAdd solution mode."	
@def	0	Settings	SettingsS	2	PriceCurve	"Get the name of LoadShape object that serves as the source of price signal data for yearly simulations, etc."	
@def	1	Settings	SettingsS	3	PriceCurve	"Set the name of LoadShape object that serves as the source of price signal data for yearly simulations, etc."	
@def	0	Settings	SettingsV	0	UERegs	"Get the array of Integers defining Energy Meter registers to use for computing UE."	
#@def	1	Settings	SettingsV	1	UERegs	"Set the array of Integers defining Energy Meter registers to use for computing UE."	
@def	0	Settings	SettingsV	2	LossRegs	"Get the array of Integers defining Energy Meter registers to use for computing Losses."	
#@def	1	Settings	SettingsV	3	LossRegs	"Set the array of Integers defining Energy Meter registers to use for computing Losses."	
@def	0	Settings	SettingsV	4	VoltageBases	"Get the array of doubles defining the legal voltage bases in kV L-L."	
#@def	1	Settings	SettingsV	5	VoltageBases	"Set the array of doubles defining the legal voltage bases in kV L-L."	
end  # module Settings
"""
**module Settings** -- Functions for controlling global OpenDSS settings.

$(collectedhelp[Settings])
""" Settings


module Solution
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Solution	SolutionI	0	Solve	"Executes the solution for the present solution mode. Returns 0."	
@def	0	Solution	SolutionI	1	Mode	"The present solution mode (See DSS help)."	
@def	1	Solution	SolutionI	2	Mode	"Modifies the present solution mode (See DSS help)."	
@def	0	Solution	SolutionI	3	Hour	"The present hour (See DSS help)."	
@def	1	Solution	SolutionI	4	Hour	"Modifies the present hour (See DSS help)."	
@def	0	Solution	SolutionI	5	Year	"The present Year (See DSS help)."	
@def	1	Solution	SolutionI	6	Year	"Modifies the present Year (See DSS help)."	
@def	0	Solution	SolutionI	7	Iterations	"Return the number of iterations taken for the last solution."	
@def	0	Solution	SolutionI	8	MaxIterations	"The Maximum number of iterations used to solve the circuit."	
@def	1	Solution	SolutionI	9	MaxIterations	"Modifies the Maximum number of iterations used to solve the circuit."	
@def	0	Solution	SolutionI	10	Number	"The number of solutions to perform for MonteCarlo and time series simulations."	
@def	1	Solution	SolutionI	11	Number	"Modifies the number of solutions to perform for MonteCarlo and time series simulations."	
@def	0	Solution	SolutionI	12	Random	"The randomization mode for random variables 'Gaussian' or 'Uniform'."	
@def	1	Solution	SolutionI	13	Random	"Modifies the randomization mode for random variables 'Gaussian' or 'Uniform'."	
@def	0	Solution	SolutionI	14	LoadModel	"The Load Model: {dssPowerFlow (default)|dssAdmittance}."	
@def	1	Solution	SolutionI	15	LoadModel	"Modifies the Load Model: {dssPowerFlow (default)|dssAdmittance}."	
@def	0	Solution	SolutionI	16	AddType	"The type of device to add in AutoAdd Mode: {dssGen (default)|dssCap}."	
@def	1	Solution	SolutionI	17	AddType	"Modifies the type of device to add in AutoAdd Mode: {dssGen (default)|dssCap}."	
@def	0	Solution	SolutionI	18	Algorithm	"The base solution algorithm: {dssNormalSolve | dssNewtonSolve}."	
@def	1	Solution	SolutionI	19	Algorithm	"Modifies the base solution algorithm: {dssNormalSolve | dssNewtonSolve}."	
@def	0	Solution	SolutionI	20	ControlMode	"The mode for control devices: {dssStatic (default) | dssEvent | dssTime}."	
@def	1	Solution	SolutionI	21	ControlMode	"Modifies the mode for control devices: {dssStatic (default) | dssEvent | dssTime}."	
@def	0	Solution	SolutionI	22	ControlIterations	"The current value of the control iteration counter."	
@def	1	Solution	SolutionI	23	ControlIterations	"Modifies the current value of the control iteration counter."	
@def	0	Solution	SolutionI	24	MaxControlIterations	"The maximum allowable control iterations."	
@def	1	Solution	SolutionI	25	MaxControlIterations	"Modifies the maximum allowable control iterations."	
@def	0	Solution	SolutionI	26	SampleDoControlActions	"Sample controls and then process the control queue for present control mode and dispatch control actions. Returns 0."	
@def	0	Solution	SolutionI	27	CheckFaultStatus	"Executes status check on all fault objects defined in the circuit. Returns 0."	
@def	0	Solution	SolutionI	28	SolveDirect	"Executes a direct solution from the system Y matrix, ignoring compensation currents of loads, generators (includes Yprim only)."	
@def	0	Solution	SolutionI	29	SolvePFlow	"Solves using present power flow method. Iterative solution rather than direct solution."	
@def	0	Solution	SolutionI	30	SolveNoControl	"Is similar to SolveSnap except no control actions are checked or executed."	
@def	0	Solution	SolutionI	31	SolvePlusControl	"Executes a power flow solution (SolveNoControl) plus executes a CheckControlActions that executes any pending control actions."	
@def	0	Solution	SolutionI	32	InitSnap	"Initializes some variables for snap shot power flow. SolveSnap does this automatically."	
@def	0	Solution	SolutionI	33	CheckControls	"Performs the normal process for sampling and executing Control Actions and Fault Status and rebuilds Y if necessary."	
@def	0	Solution	SolutionI	34	SampleControlDevices	"Executes a sampling of all intrinsic control devices, which push control actions into the control queue."	
@def	0	Solution	SolutionI	35	DoControlActions	"Pops control actions off the control queue and dispatches to the proper control element."	
@def	0	Solution	SolutionI	36	BuildYMatrix	"Forces building of the System Y matrix according to the argument: {1= series elements only | 2= Whole Y matrix}."	
@def	0	Solution	SolutionI	37	SystemYChanged	"Indicates if elements of the System Y have been changed by recent activity. If changed returns 1; otherwise 0."	
@def	0	Solution	SolutionI	38	Converged	"Indicates whether the circuit solution converged (1 converged | 0 not converged)."	
@def	1	Solution	SolutionI	39	Converged	"Modifies the converged flag (1 converged | 0 not converged)."	
@def	0	Solution	SolutionI	40	TotalIterations	"The total iterations including control iterations for most recent solution."	
@def	0	Solution	SolutionI	41	MostIterationsDone	"The max number of iterations required to converge at any control iteration of the most recent solution."	
@def	0	Solution	SolutionI	42	ControlActionsDone	"Indicates that the control actions are done: {1 done, 0 not done}."	
@def	1	Solution	SolutionI	43	ControlActionsDone	"Modifies the flag to indicate that the control actions are done: {1 done, 0 not done}."	
@def	0	Solution	SolutionI	44	FinishTimeStep	"Call cleanup, sample Monitors, and increment time at end of time step."	
@def	0	Solution	SolutionI	45	Cleanup	"Update storage, invcontrol, etc., at end of time step."	
@def	0	Solution	SolutionF	0	Frequency	"The frequency for the next solution."	
@def	1	Solution	SolutionF	1	Frequency	"Set the frequency for the next solution."	
@def	0	Solution	SolutionF	2	Seconds	"The seconds from top of the hour."	
@def	1	Solution	SolutionF	3	Seconds	"Set the seconds from top of the hour."	
@def	0	Solution	SolutionF	4	StepSize	"The step size for the next solution."	
@def	1	Solution	SolutionF	5	StepSize	"Set the step size for the next solution."	
@def	0	Solution	SolutionF	6	LoadMult	"The default load multiplier applied to all non-fixed loads."	
@def	1	Solution	SolutionF	7	LoadMult	"Set the default load multiplier applied to all non-fixed loads."	
@def	0	Solution	SolutionF	8	Convergence	"The solution convergence tolerance."	
@def	1	Solution	SolutionF	9	Convergence	"Set the solution convergence tolerance."	
@def	0	Solution	SolutionF	10	PctGrowth	"The percent default annual load growth rate."	
@def	1	Solution	SolutionF	11	PctGrowth	"Set the percent default annual load growth rate."	
@def	0	Solution	SolutionF	12	GenkW	"The generator kW for AutoAdd mode."	
@def	1	Solution	SolutionF	13	GenkW	"Set the generator kW for AutoAdd mode."	
@def	0	Solution	SolutionF	14	GenPF	"The pf for generators in AutoAdd mode."	
@def	1	Solution	SolutionF	15	GenPF	"Set the pf for generators in AutoAdd mode."	
@def	0	Solution	SolutionF	16	Capkvar	"The capacitor kvar for adding in AutoAdd mode."	
@def	1	Solution	SolutionF	17	Capkvar	"Set the capacitor kvar for adding in AutoAdd mode."	
@def	0	Solution	SolutionF	18	GenMult	"The default multiplier applied to generators (like LoadMult)."	
@def	1	Solution	SolutionF	19	GenMult	"Set the default multiplier applied to generators (like LoadMult)."	
@def	0	Solution	SolutionF	20	DblHour	"The hour as a double, including fractional part."	
@def	1	Solution	SolutionF	21	DblHour	"Set the hour as a double, including fractional part."	
@def	0	Solution	SolutionF	22	StepSizeMin	"Set the step size in minutes."	
@def	0	Solution	SolutionF	23	StepSizeHr	"Set the step size in Hours."	
@def	0	Solution	SolutionF	24	ProcessTime "The time required (microseconds) to perform the latest solution time step, this time does not includes the time required for sampling meters/monitors."	
@def	0	Solution	SolutionF	25	TotalTime "Get the accumulated time required (microseconds) to perform the simulation."	
@def	1	Solution	SolutionF	26	TotalTime "Set the accumulated time required (microseconds) to perform the simulation."	
@def	0	Solution	SolutionF	27	TimeTimeStep "The time required (microseconds) to perform the latest solution time step including the time required for sampling meters/monitors."	
@def	0	Solution	SolutionS	0	ModeID	"The ID (text) of the present solution mode."	
@def	0	Solution	SolutionS	1	LDCurve	"The Load-Duration Curve name for LD modes."	
@def	1	Solution	SolutionS	2	LDCurve	"Set the Load-Duration Curve name for LD modes."	
@def	0	Solution	SolutionS	3	DefaultDaily	"The default daily load shape (defaults to 'Default')."	
@def	1	Solution	SolutionS	4	DefaultDaily	"Set the default daily load shape (defaults to 'Default')."	
@def	0	Solution	SolutionS	5	DefaultYearly	"The default yearly load shape (defaults to 'Default')."	
@def	1	Solution	SolutionS	6	DefaultYearly	"Set the default yearly load shape (defaults to 'Default')."	
@def	0	Solution	SolutionV	0	EventLog	"Returns an array of strings containing the Event Log."	
end  # module Solution
"""
**module Solution** -- Functions for controlling OpenDSS solutions.

$(collectedhelp[Solution])
""" Solution


module SwtControls
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	SwtControls	SwtControlsI	0	First	"Set the first SwtControl active. Returns 0 if no more."	
@def	0	SwtControls	SwtControlsI	1	Next	"Set the next SwtControl active. Returns 0 if no more."	
@def	0	SwtControls	SwtControlsI	2	Action	"Get the open (1) or close (2) action of the switch. No effect if switch is locked. However, reset removes any lock and then closes the switch (shelf state). 0 = none action."	
@def	1	SwtControls	SwtControlsI	3	Action	"Set open (1) or close (2) the switch. No effect if switch is locked. However, reset removes any lock and then closes the switch (shelf state). 0 = none action (see manual for details)."	
@def	0	SwtControls	SwtControlsI	4	IsLocked	"Get the lock state: {1 locked | 0 not locked}."	
@def	1	SwtControls	SwtControlsI	5	IsLocked	"Set the lock to prevent both manual and automatic switch operation."	
@def	0	SwtControls	SwtControlsI	6	SwitchedTerm	"Get the terminal number where the switch is located on the SwitchedObj."	
@def	1	SwtControls	SwtControlsI	7	SwitchedTerm	"Set the terminal number where the switch is located on the SwitchedObj."	
@def	0	SwtControls	SwtControlsI	8	Count	"Get the total number of SwtControls in the active circuit."	
@def	0	SwtControls	SwtControlsF	0	Delay	"Get the time delay [s] between arming and opening or closing the switch. Control may reset before actually operating the switch."	
@def	1	SwtControls	SwtControlsF	1	Delay	"Set the time delay [s] between arming and opening or closing the switch. Control may reset before actually operating the switch."	
@def	0	SwtControls	SwtControlsS	0	Name	"Get the name of the active SwtControl."	
@def	1	SwtControls	SwtControlsS	1	Name	"Set a SwtControl active by name."	
@def	0	SwtControls	SwtControlsS	2	SwitchedObj	"Get the name of the switched object by the active SwtControl."	
@def	1	SwtControls	SwtControlsS	3	SwitchedObj	"Set the switched object by name."	
@def	0	SwtControls	SwtControlsV	0	AllNames	"Get a vector of strings with all SwtControl names in the active circuit."	
end  # module SwtControls
"""
**module SwtControls** -- Functions for interfacing with the active OpenDSS SwtControl.

$(collectedhelp[SwtControls])
""" SwtControls


module Topology
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Topology	TopologyI	0	NumLoops	"Get the number of loops."	
@def	0	Topology	TopologyI	1	NumIsolatedBranches	"Get the number of isolated branches (PD elements and capacitors)."	
@def	0	Topology	TopologyI	2	NumIsolatedLoads	"Get the number of isolated loads."	
@def	0	Topology	TopologyI	3	First	"Set the first branch active, returns 0 if none."	
@def	0	Topology	TopologyI	4	Next	"Set the next branch active, returns 0 if none."	
@def	0	Topology	TopologyI	5	ActiveBranch	"The index of the active Branch."	
@def	0	Topology	TopologyI	6	ForwardBranch	"Move forward in the tree, return index of new active branch or 0 if no more."	
@def	0	Topology	TopologyI	7	BackwardBranch	"Move back toward the source, return index of new active branch or 0 if no more."	
@def	0	Topology	TopologyI	8	LoopedBranch	"Move to looped branch, return index or 0 if none."	
@def	0	Topology	TopologyI	9	ParallelBranch	"Mode to directly parallel branch, return index or 0 if none."	
@def	0	Topology	TopologyI	10	FirstLoad	"Set as active load the first load at the active branch, return index or 0 if none."	
@def	0	Topology	TopologyI	11	NextLoad	"Set as active load the next load at the active branch, return index or 0 if none."	
@def	0	Topology	TopologyI	12	ActiveLevel	"Get the topological depth of the active branch."	
@def	0	Topology	TopologyS	0	BranchName	"Get the name of the active branch."	
@def	1	Topology	TopologyS	1	BranchName	"Set the name of the active branch."	
@def	0	Topology	TopologyS	2	BusName	"Get the name of the active Bus."	
@def	1	Topology	TopologyS	3	BusName	"Set the Bus active by name."	
@def	0	Topology	TopologyV	0	AllLoopedPairs	"Get a vector of all looped element names, by pairs."	
@def	0	Topology	TopologyV	1	AllIsolatedBranches	"Get a vector of all isolated branch names."	
@def	0	Topology	TopologyV	2	AllIsolatedLoads	"Get a vector of all isolated load names."	
end  # module Topology
"""
**module Topology** -- Functions for interfacing with the active OpenDSS Topology.

$(collectedhelp[Topology])
""" Topology


module Transformers
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Transformers	TransformersI	0	NumWindings	"Get the number of windings on this transformer. Allocates memory; set or change this property first."	
@def	1	Transformers	TransformersI	1	NumWindings	"Set the number of windings on this transformer. Allocates memory; set or change this property first."	
@def	0	Transformers	TransformersI	2	Wdg	"Get the active winding number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)."	
@def	1	Transformers	TransformersI	3	Wdg	"Set the active winding number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)."	
@def	0	Transformers	TransformersI	4	NumTaps	"Get the active winding number of tap steps between MinTap and MaxTap."	
@def	1	Transformers	TransformersI	5	NumTaps	"Set the active winding number of tap steps between MinTap and MaxTap"	
@def	0	Transformers	TransformersI	6	IsDelta	"Get the information about if the active winding is delta (1) or wye (0) connection."		_ == 1
@def	1	Transformers	TransformersI	7	IsDelta	"Set the information about if the active winding is delta (1) or wye (0) connection."	
@def	0	Transformers	TransformersI	8	First	"Set the first Transformer active. Return 0 if no more."	
@def	0	Transformers	TransformersI	9	Next	"Set the next Transformer active. Return 0 if no more."	
@def	0	Transformers	TransformersI	10	Count	"Get the number of Transformers within the active circuit."	
@def	0	Transformers	TransformersF	0	R	"Get the active winding resistance in %."	
@def	1	Transformers	TransformersF	1	R	"Set the active winding resistance in %."	
@def	0	Transformers	TransformersF	2	Tap	"Get the active winding tap in per-unit."	
@def	1	Transformers	TransformersF	3	Tap	"Set the active winding tap in per-unit."	
@def	0	Transformers	TransformersF	4	MinTap	"Get the active winding minimum tap in per-unit."	
@def	1	Transformers	TransformersF	5	MinTap	"Set the active winding minimum tap in per-unit."	
@def	0	Transformers	TransformersF	6	MaxTap	"Get the active winding maximum tap in per-unit."	
@def	1	Transformers	TransformersF	7	MaxTap	"Set the active winding maximum tap in per-unit."	
@def	0	Transformers	TransformersF	8	kV	"Get the active winding kV rating. Phase-phase for 2 or 3 phases, actual winding kV 1 phase transformer."	
@def	1	Transformers	TransformersF	9	kV	"Set the active winding kV rating. Phase-phase for 2 or 3 phases, actual winding kV 1 phase transformer."	
@def	0	Transformers	TransformersF	10	kVA	"Get the active winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings."	
@def	1	Transformers	TransformersF	11	kVA	"Set the active winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings."	
@def	0	Transformers	TransformersF	12	Xneut	"Get the active winding neutral reactance [ohms] for wye connections."	
@def	1	Transformers	TransformersF	13	Xneut	"Set the active winding neutral reactance [ohms] for wye connections."	
@def	0	Transformers	TransformersF	14	Rneut	"Get the active winding neutral resistance [ohms] for wye connections. Set less than zero ungrounded wye."	
@def	1	Transformers	TransformersF	15	Rneut	"Set the active winding neutral resistance [ohms] for wye connections. Set less than zero ungrounded wye."	
@def	0	Transformers	TransformersF	16	Xhl	"Get the percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2 winding or 3 winding Transformers."	
@def	1	Transformers	TransformersF	17	Xhl	"Set the percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2 winding or 3 winding Transformers."	
@def	0	Transformers	TransformersF	18	Xht	"Get the percent reactance between windings 1 and 3, on winding 1 kVA base. Use for 3 winding Transformers only."	
@def	1	Transformers	TransformersF	19	Xht	"Set the percent reactance between windings 1 and 3, on winding 1 kVA base. Use for 3 winding Transformers only."	
@def	0	Transformers	TransformersF	20	Xlt	"Get the percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3 winding Transformers only."	
@def	1	Transformers	TransformersF	21	Xlt	"Set the percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3 winding Transformers only."	
@def	0	Transformers	TransformersS	0	XfmrCode	"Get the name of an XfrmCode that supplies electrical paraMeters for this transformer."	
@def	1	Transformers	TransformersS	1	XfmrCode	"Set the name of an XfrmCode that supplies electrical paraMeters for this transformer."	
@def	0	Transformers	TransformersS	2	Name	"Get the active transformer name and 3, on winding_1_kVA base. Use for 3 winding transformer only."	
@def	1	Transformers	TransformersS	3	Name	"Set the active transformer name and 3, on winding_1_kVA base. Use for 3 winding transformer only."	
@def	0	Transformers	TransformersV	0	AllNames	"Get a vector of strings with all Transformer names in the active circuit."	
end  # module Transformers
"""
**module Transformers** -- Functions for interfacing with the active OpenDSS transformer.

$(collectedhelp[Transformers])
""" Transformers


module Vsources
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	Vsources	VsourcesI	0	Count	"The number of VSource objects currently defined in the active circuit."	
@def	0	Vsources	VsourcesI	1	First	"Set the first VSource to be active; returns 0 if none."	
@def	0	Vsources	VsourcesI	2	Next	"Set the next VSource to be active; returns 0 if none."	
@def	0	Vsources	VsourcesI	3	Phases	"Get the number of phases of the active VSource."	
@def	1	Vsources	VsourcesI	4	Phases	"Set the number of phases of the active VSource."	
@def	0	Vsources	VsourcesF	0	BasekV	"Get the source voltage in kV."	
@def	1	Vsources	VsourcesF	1	BasekV	"Set the source voltage in kV."	
@def	0	Vsources	VsourcesF	2	PU	"Get the source voltage in pu."	
@def	1	Vsources	VsourcesF	3	PU	"Set the source voltage in pu."	
@def	0	Vsources	VsourcesF	4	AngleDeg	"Get the source phase angle of first phase in degrees."	
@def	1	Vsources	VsourcesF	5	AngleDeg	"Set the source phase angle of first phase in degrees."	
@def	0	Vsources	VsourcesF	6	Frequency	"Get the source frequency in Hz."	
@def	1	Vsources	VsourcesF	7	Frequency	"Set the source frequency in Hz."	
@def	0	Vsources	VsourcesS	0	Name	"Get the name of the active VSource."	
@def	1	Vsources	VsourcesS	1	Name	"Set the name of the active VSource."	
@def	0	Vsources	VsourcesV	0	AllNames	"Get the names of all Vsources"	
end  # module Vsources
"""
**module Vsources** -- Functions for interfacing with the active OpenDSS voltage source.

$(collectedhelp[Vsources])
""" Vsources


module XYCurves
import ..@def, ..DSSCore, ..cmplx, ..reshapemat, ..reshape2, ..addhelp!, ..collectedhelp
@def	0	XYCurves	XYCurvesI	0	Count	"Get number of XYCurves in active circuit."	
@def	0	XYCurves	XYCurvesI	1	First	"Set first XYCurves object active; returns 0 if none."	
@def	0	XYCurves	XYCurvesI	2	Next	"Set next XYCurves object active; returns 0 if none."	
@def	0	XYCurves	XYCurvesI	3	Npts	"Get the number of points in X-Y curve."	
@def	1	XYCurves	XYCurvesI	4	Npts	"Set the number of points in X-Y curve."	
@def	0	XYCurves	XYCurvesF	0	X	"Get the interpolated value after setting Y."	
@def	1	XYCurves	XYCurvesF	1	X	"Set the X value."	
@def	0	XYCurves	XYCurvesF	2	Y	"Get the interpolated value after setting X."	
@def	1	XYCurves	XYCurvesF	3	Y	"Set the Y value."	
@def	0	XYCurves	XYCurvesF	4	XShift	"Get the amount to shift X value from original curve."	
@def	1	XYCurves	XYCurvesF	5	XShift	"Set the amount to shift X value from original curve."	
@def	0	XYCurves	XYCurvesF	6	YShift	"Get the amount to shift Y value from original curve."	
@def	1	XYCurves	XYCurvesF	7	YShift	"Set the amount to shift Y value from original curve."	
@def	0	XYCurves	XYCurvesF	8	XScale	"Get the factor to scale X values from original curve."	
@def	1	XYCurves	XYCurvesF	9	XScale	"Set the factor to scale X values from original curve."	
@def	0	XYCurves	XYCurvesF	10	YScale	"Get the factor to scale Y values from original curve."	
@def	1	XYCurves	XYCurvesF	11	YScale	"Set the factor to scale Y values from original curve."	
@def	0	XYCurves	XYCurvesS	0	Name	"Get the name of the active XYCurve Object."	
@def	1	XYCurves	XYCurvesS	1	Name	"Set the name of the active XYCurve Object."	
@def	0	XYCurves	XYCurvesV	0	XArray	"Get the X values as a vector of doubles. Set Npts to max number expected if setting."	
#@def	1	XYCURves	XYCurvesV	1	XArray	"Set the X values as a vector of doubles. Set Npts to max number expected if setting"	
@def	0	XYCurves	XYCurvesV	2	YArray	"Get the Y values as a vector of doubles. Set Npts to max number expected if setting."	
#@def	1	XYCURves	XYCurvesV	3	YArray	"Set the Y values as a vector of doubles. Set Npts to max number expected if setting"	
end  # module XYCurves
"""
**module XYCurves** -- Functions for interfacing with the active OpenDSS XYCurve.

$(collectedhelp[XYCurves])
""" XYCurves


################################################################################
##
## Enums and flag variables (implemented as modules)
##
################################################################################

export MonitorModes, SolveModes, Options, CapControlModes, ActionCodes, 
       LoadStatus, LoadModels, LineUnits

"""
CapControlModes flags - options include:

* `Current` : Current control, ON and OFF settings on CT secondary
* `Voltage` : Voltage control, ON and OFF settings on the PT secondary base
* `KVAR` : kvar control, ON and OFF settings on PT / CT base
* `Time` : Time control ON and OFF settings are seconds from midnight
* `PF` : ON and OFF settings are power factor, negative for leading

Example: 

    capcontrols.Mode(CapControlModes.KVAR)
"""
baremodule CapControlModes
    const Current = 0
    const Voltage = 1
    const KVAR = 2
    const Time = 3
    const PF = 4
end # baremodule

"""
MonitorModes flags - options include:

* `VI` : Monitor records Voltage and Current at the terminal (Default)
* `Power` : Monitor records kW, kvar or kVA, angle values, etc. at the terminal to which it is connected
* `Taps` : For monitoring Regulator and Transformer taps
* `States` : For monitoring State Variables (for PC Elements only)
* `Sequence` : Reports the monitored quantities as sequence quantities
* `Magnitude` : Reports the monitored quantities in Magnitude Only
* `PosOnly` : Reports the Positive Seq only or avg of all phases

`Sequence`, `Magnitude`, and `PosOnly` are bit-level flags that can be combined
with other flags. It's best to use `&` to test for one of these flags. Use `|` to 
combine flags.

Examples: 

    Monitors.Mode() & MonitorModes.Power
    Monitors.Mode(MonitorModes.Magnitude | MonitorModes.Power)
"""
baremodule MonitorModes
    const VI = 0
    const Power = 1
    const Taps = 2
    const States = 3
    const Sequence = 16
    const Magnitude = 32
    const PosOnly = 64
end # baremodule

"""
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

"""
baremodule SolveModes
    const SnapShot = 0
    const Daily = 1
    const Yearly = 2
    const Monte1 = 3
    const LD1 = 4
    const PeakDay = 5
    const DutyCycle = 6
    const Direct = 7
    const MonteFault = 8
    const FaultStudy = 9
    const Monte2 = 10
    const Monte3 = 11
    const LD2 = 12
    const AutoAdd = 13
    const Dynamic = 14
    const Harmonic = 15
end # baremodule

"""
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

"""
baremodule Options
    const PowerFlow = 1
    const Admittance = 2
    const NormalSolve = 0
    const NewtonSolve = 1
    const Static = 0
    const Event = 1
    const Time = 2
    const Multiphase = 0
    const PositiveSeq = 1
    const Gaussian = 1
    const Uniform = 2
    const LogNormal = 3
    const AddGen = 1
    const AddCap = 2
    const ControlOFF = -1
end # baremodule


"""
ActionCodes flags - options include:

* `None` :  No action
* `Open` :  Open a switch
* `Close` :  Close a switch
* `Reset` :  Reset to the shelf state (unlocked, closed for a switch
* `Lock` :  Lock a switch, prventing both manual and automatic operation
* `Unlock` :  Unlock a switch, permitting both manual and automatic operation
* `TapUp` :  Move a regulator tap up
* `TapDown` : Move a regulator tap down

"""
baremodule ActionCodes
    None = 0
    Open = 1
    Close = 2
    Reset = 3
    Lock = 4
    Unlock = 5
    TapUp = 6
    TapDown = 7
end # baremodule

"""
LoadStatus flags - options include:

* `Variable`
* `Fixed`
* `Exempt`

"""
baremodule LoadStatus
    const Variable = 0
    const Fixed = 1
    const Exempt = 2
end # baremodule

"""
LoadModels flags - options include:

* `ConstPQ`
* `ConstZ`
* `Motor`
* `CVR`
* `ConstI`
* `ConstPFixedQ`
* `ConstPFixedX`
* `ZIPV`

"""
baremodule LoadModels
    const ConstPQ = 1
    const ConstZ = 2
    const Motor = 3
    const CVR = 4
    const ConstI = 5
    const ConstPFixedQ = 6
    const ConstPFixedX = 7
    const ZIPV = 8
end # baremodule

"""
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

"""
baremodule LineUnits
    const None = 0
    const Miles = 1
    const kFt = 2
    const km = 3
    const meter = 4
    const ft = 5
    const inch = 6
    const cm = 7
    const mm = 8
    const Maxnum = 9
end # baremodule

end # module

