# OpenDSSDirect

[OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) is an open-source
distribution system simulation. This Julia package implements a "direct" library
interface to OpenDSS. See [this
documentation](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf)
for detailed information on the direct library interface to OpenDSS. The direct
library interface can be faster than the more traditional COM interface.

**This package is only available for Windows.** OpenDSS is only available for
Windows.

**This package is still in development.**

# Installation

For now, this package is not registered. To install, use the following from
within Julia:

```julia 
Pkg.clone(https://github.com/tshort/OpenDSSDirect.jl.git)
```

This package includes OpenDSS as a library. You do not have to install OpenDSS
separately. In particular, it includes the OpenDSSDEngine.DLL that implements
the direct-access API.

# Features

[Julia](http://julialang.org/) is a fast, flexible numerical language with
Matlab-like syntax. Like Python or Matlab, scripting OpenDSS can be used for 
Monte-Carlo batch runs, parameter sweeps, post processing and plotting of 
results, and more. 

Julia has several key features for advanced operations with OpenDSS:

* **Parallel operations** -- Julia supports several ways to process data in 
  parallel. This includes parallel operations on multiple CPU cores and 
  parallel operations on processes in a cluster. See 
  [??8760_parallel.jl](https://github.com/tshort/OpenDSSDirect.jl/blob/master/examples/8760_parallel.jl) 
  for an example of an annual simulation split among local CPU cores.

* **Optimization** -- Julia has strong support for optimization.

* **Custom solutions and custom models** -- Because Julia compiles to codes 
  that run as quickly as C programs, it is possible to implement custom
  solutions, and these custom solutions can contain custom models implemented
  in Julia. The basic idea is to run a custom solution as described in 
  [OpenDSS Solution Interface.pdf](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS%20Solution%20Interface.pdf).
  Custom control or power control elements can be implemented between each
  model iteration.

# Main API

The `dss` function is the main function for passing commands to OpenDSS. You can
pass multi-line commands with `dss`, but continuation lines are not allowed. 
You can also splice in Julia values with string interpolation. Here is an 
example of using `dss`:

```julia
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
```

Several functions are available for setting OpenDSS variables, getting values,
and initiating commands. The first argument is a symbol followed by zero or more
arguments. Here is an example to set the `kW` of the active load element:

```julia 
loads(:kW_set,50.)
``` 

For tight loops, the methods can be called with the symbol wrapped in `Val{}` 
(`loads(Val{:kW_set}, 50.)` for the previous example). This makes the Julia
code faster by making types stable.

Here is an example setting some loads:

```julia
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
loadnumber = loads(:First)
while loadnumber > 0
    loads(:kW_set,50.)
    loads(:kvar_set,20.)
    loadnumber = loads(:Next)
end
println(loads(:Count)) 
```
 
Here is a list of methods and symbols supported:

Function name | Supported first arguments
------------- | -------------
activeclass | `:ActiveClassName`
activeclass | `:Count`
activeclass | `:First`
activeclass | `:Name_get`
activeclass | `:Name_set`
activeclass | `:Next`
activeclass | `:NumElements`
bus | `:Coorddefined`
bus | `:Cust_duration`
bus | `:Cust_interrupts`
bus | `:Distance`
bus | `:GetUniqueNodeNumber`
bus | `:int_duration`
bus | `:kVBase`
bus | `:Lambda`
bus | `:N_Customers`
bus | `:N_interrupts`
bus | `:Name`
bus | `:NumNodes`
bus | `:SectionID`
bus | `:Totalmiles`
bus | `:X_get`
bus | `:X_set`
bus | `:Y_get`
bus | `:Y_set`
bus | `:ZscRefresh`
capacitors | `:AddStep`
capacitors | `:AvailableSteps`
capacitors | `:Close`
capacitors | `:Count`
capacitors | `:First`
capacitors | `:IsDelta_get`
capacitors | `:IsDelta_set`
capacitors | `:kV_get`
capacitors | `:kV_set`
capacitors | `:kvar_get`
capacitors | `:kvar_set`
capacitors | `:Name_get`
capacitors | `:Name_set`
capacitors | `:Next`
capacitors | `:NumSteps_get`
capacitors | `:NumSteps_set`
capacitors | `:Open`
capacitors | `:SubtractStep`
capcontrols | `:Capacitor_get`
capcontrols | `:Capacitor_set`
capcontrols | `:Count`
capcontrols | `:CTRatio_get`
capcontrols | `:CTRatio_set`
capcontrols | `:Delay_get`
capcontrols | `:Delay_set`
capcontrols | `:DelayOff_get`
capcontrols | `:DelayOff_set`
capcontrols | `:First`
capcontrols | `:Mode_get`
capcontrols | `:Mode_set`
capcontrols | `:MonitoredObj_get`
capcontrols | `:MonitoredObj_set`
capcontrols | `:MonitoredTerm_get`
capcontrols | `:MonitoredTerm_set`
capcontrols | `:Name_get`
capcontrols | `:Name_set`
capcontrols | `:Next`
capcontrols | `:OFFSetting_get`
capcontrols | `:OFFSetting_set`
capcontrols | `:ONSetting_get`
capcontrols | `:ONSetting_set`
capcontrols | `:PTRatio_get`
capcontrols | `:PTRatio_set`
capcontrols | `:UseVoltOverride_get`
capcontrols | `:UseVoltOverride_set`
capcontrols | `:Vmax_get`
capcontrols | `:Vmax_set`
capcontrols | `:Vmin_get`
capcontrols | `:Vmin_set`
circuit | `:Capacity`
circuit | `:Disable`
circuit | `:Enable`
circuit | `:EndOfTimeStepUpdate`
circuit | `:FirstElement`
circuit | `:FirstPCElement`
circuit | `:FirstPDElement`
circuit | `:Name`
circuit | `:NextElement`
circuit | `:NextPCElement`
circuit | `:NextPDElement`
circuit | `:NumBuses`
circuit | `:NumDevices`
circuit | `:NumNodes`
circuit | `:ParentPDElement`
circuit | `:Sample`
circuit | `:SaveSample`
circuit | `:SetActiveBus`
circuit | `:SetActiveBusi`
circuit | `:SetActiveClass`
circuit | `:SetActiveElement`
circuit | `:UpdateStorage`
cktelement | `:Close`
cktelement | `:Controller`
cktelement | `:Display_get`
cktelement | `:Display_set`
cktelement | `:EmergAmps_get`
cktelement | `:EmergAmps_set`
cktelement | `:Enabled_get`
cktelement | `:Enabled_set`
cktelement | `:EnergyMeter`
cktelement | `:GUID`
cktelement | `:HasSwitchControl`
cktelement | `:HasVoltControl`
cktelement | `:IsOpen`
cktelement | `:Name`
cktelement | `:NormalAmps_get`
cktelement | `:NormalAmps_set`
cktelement | `:NumConductors`
cktelement | `:NumControls`
cktelement | `:NumPhases`
cktelement | `:NumProperties`
cktelement | `:NumTerminals`
cktelement | `:OCPDevIndex`
cktelement | `:OCPDevType`
cktelement | `:Open`
cktelement | `:Variablei`
ctrlqueue | `:Action`
ctrlqueue | `:ActionCode`
ctrlqueue | `:ClearActions`
ctrlqueue | `:ClearQueue`
ctrlqueue | `:Delete`
ctrlqueue | `:DeviceHandle`
ctrlqueue | `:NumActions`
ctrlqueue | `:PopAction`
ctrlqueue | `:Push`
ctrlqueue | `:Show`
dss | `:Allowforms_get`
dss | `:Allowforms_set`
dss | `:ClearAll`
dss | `:DataPath_get`
dss | `:DataPath_set`
dss | `:DefaultEditor`
dss | `:NewCircuit`
dss | `:NumCircuits`
dss | `:NumClasses`
dss | `:NumUserClasses`
dss | `:Reset`
dss | `:ShowPanel`
dss | `:Start`
dss | `:Version`
element | `:Name`
element | `:NumProperties`
executive | `:Command`
executive | `:CommandHelp`
executive | `:NumExecCommands`
executive | `:NumExecOptions`
executive | `:Option`
executive | `:OptionHelp`
executive | `:OptionValue`
fuses | `:Close`
fuses | `:Count`
fuses | `:First`
fuses | `:Idx_get`
fuses | `:Idx_set`
fuses | `:IsBlown`
fuses | `:MonitoredObj_get`
fuses | `:MonitoredObj_set`
fuses | `:MonitoredTerm_get`
fuses | `:MonitoredTerm_set`
fuses | `:Name_get`
fuses | `:Name_set`
fuses | `:Next`
fuses | `:NumPhases`
fuses | `:Open`
fuses | `:RatedCurrent_get`
fuses | `:RatedCurrent_set`
fuses | `:SwitchedObj_get`
fuses | `:SwitchedObj_set`
fuses | `:TCCCurve_get`
fuses | `:TCCCurve_set`
generators | `:Count`
generators | `:First`
generators | `:ForcedON_get`
generators | `:ForcedON_set`
generators | `:Idx_get`
generators | `:Idx_set`
generators | `:kV_get`
generators | `:kV_set`
generators | `:kvar_get`
generators | `:kvar_set`
generators | `:kVARated_get`
generators | `:kVARated_set`
generators | `:kW_get`
generators | `:kW_set`
generators | `:Model_get`
generators | `:Model_set`
generators | `:Name_get`
generators | `:Name_set`
generators | `:Next`
generators | `:PF_get`
generators | `:PF_set`
generators | `:Phases_get`
generators | `:Phases_set`
generators | `:Vmaxpu_get`
generators | `:Vmaxpu_set`
generators | `:Vminpu_get`
generators | `:Vminpu_set`
isource | `:Amps_get`
isource | `:Amps_set`
isource | `:AngleDeg_get`
isource | `:AngleDeg_set`
isource | `:Count`
isource | `:First`
isource | `:Frequency_get`
isource | `:Frequency_set`
isource | `:Name_get`
isource | `:Name_set`
isource | `:Next`
lines | `:Bus1_get`
lines | `:Bus1_set`
lines | `:Bus2_get`
lines | `:Bus2_set`
lines | `:C0_get`
lines | `:C0_set`
lines | `:C1_get`
lines | `:C1_set`
lines | `:Count`
lines | `:EmergAmps_get`
lines | `:EmergAmps_set`
lines | `:First`
lines | `:Geometry_get`
lines | `:Geometry_set`
lines | `:Length_get`
lines | `:Length_set`
lines | `:LineCode_get`
lines | `:LineCode_set`
lines | `:Name_get`
lines | `:Name_set`
lines | `:Next`
lines | `:NormAmps_get`
lines | `:NormAmps_set`
lines | `:NumCust`
lines | `:Parent`
lines | `:Phases_get`
lines | `:Phases_set`
lines | `:R0_get`
lines | `:R0_set`
lines | `:R1_get`
lines | `:R1_set`
lines | `:Rg_get`
lines | `:Rg_set`
lines | `:Rho_get`
lines | `:Rho_set`
lines | `:Spacing_get`
lines | `:Spacing_set`
lines | `:Units_get`
lines | `:Units_set`
lines | `:X0_get`
lines | `:X0_set`
lines | `:X1_get`
lines | `:X1_set`
lines | `:Xg_get`
lines | `:Xg_set`
loads | `:AllocationFactor_get`
loads | `:AllocationFactor_set`
loads | `:CFactor_get`
loads | `:CFactor_set`
loads | `:Class_get`
loads | `:Class_set`
loads | `:Count`
loads | `:CVRCurve_get`
loads | `:CVRCurve_set`
loads | `:CVRvars_get`
loads | `:CVRvars_set`
loads | `:CVRwatts_get`
loads | `:CVRwatts_set`
loads | `:Daily_get`
loads | `:Daily_set`
loads | `:Duty_get`
loads | `:Duty_set`
loads | `:First`
loads | `:Growth_get`
loads | `:Growth_set`
loads | `:Idx_get`
loads | `:Idx_set`
loads | `:IsDelta_get`
loads | `:IsDelta_set`
loads | `:kV_get`
loads | `:kV_set`
loads | `:kVABase_get`
loads | `:kVABase_set`
loads | `:kvar_get`
loads | `:kvar_set`
loads | `:kW_get`
loads | `:kW_set`
loads | `:kWh_get`
loads | `:kWh_set`
loads | `:kWhDays_get`
loads | `:kWhDays_set`
loads | `:Model_get`
loads | `:Model_set`
loads | `:Name_get`
loads | `:Name_set`
loads | `:Next`
loads | `:NumCust_get`
loads | `:NumCust_set`
loads | `:PctMean_get`
loads | `:PctMean_set`
loads | `:PctStdDev_get`
loads | `:PctStdDev_set`
loads | `:PF_get`
loads | `:PF_set`
loads | `:puSeriesRL_get`
loads | `:puSeriesRL_set`
loads | `:RelWeighting_get`
loads | `:RelWeighting_set`
loads | `:Rneut_get`
loads | `:Rneut_set`
loads | `:Spectrum_get`
loads | `:Spectrum_set`
loads | `:Status_get`
loads | `:Status_set`
loads | `:Vmaxpu_get`
loads | `:Vmaxpu_set`
loads | `:VminEmerg_get`
loads | `:VminEmerg_set`
loads | `:VminNorm_get`
loads | `:VminNorm_set`
loads | `:Vminpu_get`
loads | `:Vminpu_set`
loads | `:XfkVA_get`
loads | `:XfkVA_set`
loads | `:Xneut_get`
loads | `:Xneut_set`
loads | `:Yearly_get`
loads | `:Yearly_set`
loadshape | `:Count`
loadshape | `:First`
loadshape | `:HrInterval_get`
loadshape | `:HrInterval_set`
loadshape | `:MinInterval_get`
loadshape | `:MinInterval_set`
loadshape | `:Name_get`
loadshape | `:Name_set`
loadshape | `:Next`
loadshape | `:Normalize`
loadshape | `:Npts_get`
loadshape | `:Npts_set`
loadshape | `:PBase_get`
loadshape | `:PBase_set`
loadshape | `:QBase_get`
loadshape | `:QBase_set`
loadshape | `:SInterval_get`
loadshape | `:SInterval_set`
loadshape | `:UseActual_get`
loadshape | `:UseActual_set`
meters | `:AvgRepairTime`
meters | `:CloseAllDIFiles`
meters | `:Count`
meters | `:CountBranches`
meters | `:CountEndElements`
meters | `:CustInterrupts`
meters | `:DIFilesAreOpen`
meters | `:DoReliabilityCalc`
meters | `:FaultRateXRepairHrs`
meters | `:First`
meters | `:MeteredElement_get`
meters | `:MeteredElement_set`
meters | `:MeteredTerminal_get`
meters | `:MeteredTerminal_set`
meters | `:Name_get`
meters | `:Name_set`
meters | `:Next`
meters | `:NumSectionBranches`
meters | `:NumSectionCustomers`
meters | `:NumSections`
meters | `:OCPDeviceType`
meters | `:OpenAllDIFiles`
meters | `:Reset`
meters | `:ResetAll`
meters | `:SAIDI`
meters | `:SAIFI`
meters | `:SAIFIkW`
meters | `:Sample`
meters | `:SampleAll`
meters | `:Save`
meters | `:SaveAll`
meters | `:SectSeqidx`
meters | `:SectTotalCust`
meters | `:SeqListSize`
meters | `:SequenceList_get`
meters | `:SequenceList_set`
meters | `:SetActiveSection`
meters | `:SumBranchFltRates`
meters | `:TotalCustomers`
monitors | `:Count`
monitors | `:Element_get`
monitors | `:Element_set`
monitors | `:FileName`
monitors | `:FileVersion`
monitors | `:First`
monitors | `:Mode_get`
monitors | `:Mode_set`
monitors | `:Name_get`
monitors | `:Name_set`
monitors | `:Next`
monitors | `:NumChannels`
monitors | `:Process`
monitors | `:ProcessAll`
monitors | `:Reset`
monitors | `:ResetAll`
monitors | `:Sample`
monitors | `:SampleAll`
monitors | `:SampleCount`
monitors | `:Save`
monitors | `:SaveAll`
monitors | `:Show`
monitors | `:Terminal_get`
monitors | `:Terminal_set`
parser | `:AutoIncrement_get`
parser | `:AutoIncrement_set`
parser | `:BeginQuote_get`
parser | `:BeginQuote_set`
parser | `:CmdString_get`
parser | `:CmdString_set`
parser | `:DblValue`
parser | `:Delimiters_get`
parser | `:Delimiters_set`
parser | `:EndQuote_get`
parser | `:EndQuote_set`
parser | `:IntValue`
parser | `:NextParam`
parser | `:ResetDelimiters`
parser | `:StrValue`
parser | `:WhiteSpace_get`
parser | `:WhiteSpace_set`
pdelements | `:AccumulatedL`
pdelements | `:Count`
pdelements | `:FaultRate_get`
pdelements | `:First`
pdelements | `:FromTerminal`
pdelements | `:IsShunt`
pdelements | `:Lambda`
pdelements | `:Name_get`
pdelements | `:Name_set`
pdelements | `:Next`
pdelements | `:NumCustomers`
pdelements | `:ParentPDElement`
pdelements | `:PctPermanent_get`
pdelements | `:PctPermanent_set`
pdelements | `:RepairTime`
pdelements | `:SectionID`
pdelements | `:TotalCustomers`
pdelements | `:TotalMiles`
progress | `:Caption`
progress | `:Close`
progress | `:PctProgress`
progress | `:Show`
properties | `:Description`
properties | `:Name`
properties | `:Value_get`
properties | `:Value_set`
pvsystems | `:Count`
pvsystems | `:First`
pvsystems | `:Idx_get`
pvsystems | `:Idx_set`
pvsystems | `:Irradiance_get`
pvsystems | `:kvar_get`
pvsystems | `:kvar_set`
pvsystems | `:kW`
pvsystems | `:Name_get`
pvsystems | `:Name_set`
pvsystems | `:Next`
pvsystems | `:pf_get`
pvsystems | `:pf_set`
reclosers | `:Close`
reclosers | `:Count`
reclosers | `:First`
reclosers | `:GroundInst_get`
reclosers | `:GroundInst_set`
reclosers | `:GroundTrip_get`
reclosers | `:GroundTrip_set`
reclosers | `:Idx_get`
reclosers | `:Idx_set`
reclosers | `:MonitoredObj_get`
reclosers | `:MonitoredObj_set`
reclosers | `:MonitoredTerm_get`
reclosers | `:MonitoredTerm_set`
reclosers | `:Name_get`
reclosers | `:Name_set`
reclosers | `:Next`
reclosers | `:NumFast_get`
reclosers | `:NumFast_set`
reclosers | `:Open`
reclosers | `:PhaseInst_get`
reclosers | `:PhaseInst_set`
reclosers | `:PhaseTrip_get`
reclosers | `:Shots_get`
reclosers | `:Shots_set`
reclosers | `:SwitchedObj_get`
reclosers | `:SwitchedObj_set`
reclosers | `:SwitchedTerm_get`
reclosers | `:SwitchedTerm_set`
regcontrols | `:Count`
regcontrols | `:CTPrimary_get`
regcontrols | `:Delay_get`
regcontrols | `:Delay_set`
regcontrols | `:First`
regcontrols | `:ForwardBand_get`
regcontrols | `:ForwardBand_set`
regcontrols | `:ForwardR_get`
regcontrols | `:ForwardR_set`
regcontrols | `:ForwardVreg_get`
regcontrols | `:ForwardVreg_set`
regcontrols | `:ForwardX_get`
regcontrols | `:ForwardX_set`
regcontrols | `:IsInverseTime_get`
regcontrols | `:IsInverseTime_set`
regcontrols | `:IsReversible_get`
regcontrols | `:IsReversible_set`
regcontrols | `:MaxTapChange_get`
regcontrols | `:MaxTapChange_set`
regcontrols | `:MonitoredBus_get`
regcontrols | `:MonitoredBus_set`
regcontrols | `:Name_get`
regcontrols | `:Name_set`
regcontrols | `:Next`
regcontrols | `:PTRatio_get`
regcontrols | `:PTRatio_set`
regcontrols | `:ReverseBand_get`
regcontrols | `:ReverseBand_set`
regcontrols | `:ReverseR_get`
regcontrols | `:ReverseR_set`
regcontrols | `:ReverseVreg_get`
regcontrols | `:ReverseVreg_set`
regcontrols | `:ReverseX_get`
regcontrols | `:ReverseX_set`
regcontrols | `:TapDelay_get`
regcontrols | `:TapDelay_set`
regcontrols | `:TapWinding_get`
regcontrols | `:TapWinding_set`
regcontrols | `:Transformer_get`
regcontrols | `:Transformer_set`
regcontrols | `:VoltageLimit_get`
regcontrols | `:VoltageLimit_set`
regcontrols | `:Winding_get`
regcontrols | `:Winding_set`
relays | `:Count`
relays | `:First`
relays | `:Idx_get`
relays | `:Idx_set`
relays | `:MonitoredObj_get`
relays | `:MonitoredObj_set`
relays | `:MonitoredTerm_get`
relays | `:MonitoredTerm_set`
relays | `:Name_get`
relays | `:Name_set`
relays | `:Next`
relays | `:SwitchedObj_get`
relays | `:SwitchedObj_set`
relays | `:SwitchedTerm_get`
relays | `:SwitchedTerm_set`
sensors | `:Count`
sensors | `:First`
sensors | `:IsDelta_get`
sensors | `:IsDelta_set`
sensors | `:kVBase_get`
sensors | `:kVBase_set`
sensors | `:MeteredElement_get`
sensors | `:MeteredElement_set`
sensors | `:MeteredTerminal_get`
sensors | `:MeteredTerminal_set`
sensors | `:Name_get`
sensors | `:Name_set`
sensors | `:Next`
sensors | `:PctError_get`
sensors | `:Reset`
sensors | `:ResetAll`
sensors | `:ReverseDelta_get`
sensors | `:ReverseDelta_set`
sensors | `:Weight_get`
sensors | `:Weight_set`
settings | `:AllocationFactors`
settings | `:AllowDuplicates_get`
settings | `:AllowDuplicates_set`
settings | `:AutoBusList_get`
settings | `:AutoBusList_set`
settings | `:CktModel_get`
settings | `:CktModel_set`
settings | `:EmergVmaxpu_get`
settings | `:EmergVmaxpu_set`
settings | `:EmergVminpu_get`
settings | `:EmergVminpu_set`
settings | `:LossWeight_get`
settings | `:LossWeight_set`
settings | `:NormVmaxpu_get`
settings | `:NormVmaxpu_set`
settings | `:NormVminpu_get`
settings | `:NormVminpu_set`
settings | `:PriceCurve_get`
settings | `:PriceCurve_set`
settings | `:PriceSignal_get`
settings | `:PriceSignal_set`
settings | `:Trapezoidal_get`
settings | `:Trapezoidal_set`
settings | `:UEWeight_get`
settings | `:UEWeight_set`
settings | `:ZoneLock_get`
settings | `:ZoneLock_set`
solution | `:AddType_get`
solution | `:AddType_set`
solution | `:Algorithm_get`
solution | `:Algorithm_set`
solution | `:BuildYMatrix`
solution | `:Capkvar_get`
solution | `:Capkvar_set`
solution | `:CheckControls`
solution | `:CheckFaultStatus`
solution | `:Cleanup`
solution | `:ControlActionsDone_get`
solution | `:ControlActionsDone_set`
solution | `:ControlIterations_get`
solution | `:ControlIterations_set`
solution | `:ControlMode_get`
solution | `:ControlMode_set`
solution | `:Converged_get`
solution | `:Converged_set`
solution | `:Convergence_get`
solution | `:Convergence_set`
solution | `:DblHour_get`
solution | `:DblHour_set`
solution | `:DefaultDaily_get`
solution | `:DefaultDaily_set`
solution | `:DefaultYearly_get`
solution | `:DefaultYearly_set`
solution | `:DoControlActions`
solution | `:FinishTimeStep`
solution | `:Frequency_get`
solution | `:GenkW_get`
solution | `:GenkW_set`
solution | `:GenMult_get`
solution | `:GenMult_set`
solution | `:GenPF_get`
solution | `:GenPF_set`
solution | `:Hour_get`
solution | `:Hour_set`
solution | `:InitSnap`
solution | `:Iterations`
solution | `:LDCurve_get`
solution | `:LDCurve_set`
solution | `:LoadModel_get`
solution | `:LoadModel_set`
solution | `:LoadMult_get`
solution | `:LoadMult_set`
solution | `:MaxControlIterations_get`
solution | `:MaxControlIterations_set`
solution | `:MaxIterations_get`
solution | `:MaxIterations_set`
solution | `:Mode_get`
solution | `:Mode_set`
solution | `:ModeID`
solution | `:MostIterationsDone`
solution | `:Number_get`
solution | `:Number_set`
solution | `:PctGrowth_get`
solution | `:PctGrowth_set`
solution | `:Random_get`
solution | `:Random_set`
solution | `:SampleControlDevices`
solution | `:SampleDoControlActions`
solution | `:Seconds_get`
solution | `:Seconds_set`
solution | `:Solve`
solution | `:SolveDirect`
solution | `:SolveNoControl`
solution | `:SolvePFlow`
solution | `:SolvePlusControl`
solution | `:StepSize_get`
solution | `:StepSize_set`
solution | `:StepSizeHr`
solution | `:StepSizeMin`
solution | `:SystemYChanged`
solution | `:TotalIterations`
solution | `:Year_get`
solution | `:Year_set`
swtcontrols | `:Action_get`
swtcontrols | `:Action_set`
swtcontrols | `:Count`
swtcontrols | `:Delay_get`
swtcontrols | `:First`
swtcontrols | `:IsLocked_get`
swtcontrols | `:IsLocked_set`
swtcontrols | `:Name_get`
swtcontrols | `:Name_set`
swtcontrols | `:Next`
swtcontrols | `:SwitchedObj_get`
swtcontrols | `:SwitchedObj_set`
swtcontrols | `:SwitchedTerm_get`
swtcontrols | `:SwitchedTerm_set`
topology | `:ActiveBranch`
topology | `:ActiveLevel`
topology | `:BackwardBranch`
topology | `:BranchName_get`
topology | `:BranchName_set`
topology | `:BusName_get`
topology | `:BusName_set`
topology | `:Delay_get`
topology | `:First`
topology | `:FirstLoad`
topology | `:ForwardBranch`
topology | `:LoopedBranch`
topology | `:Next`
topology | `:NextLoad`
topology | `:NumIsolatedBranches`
topology | `:NumIsolatedLoads`
topology | `:NumLoops`
topology | `:ParallelBranch`
transformers | `:Count`
transformers | `:First`
transformers | `:IsDelta_get`
transformers | `:IsDelta_set`
transformers | `:kV_get`
transformers | `:kV_set`
transformers | `:kVA_get`
transformers | `:kVA_set`
transformers | `:MaxTap_get`
transformers | `:MaxTap_set`
transformers | `:MinTap_get`
transformers | `:MinTap_set`
transformers | `:Name_get`
transformers | `:Name_set`
transformers | `:Next`
transformers | `:NumTaps_get`
transformers | `:NumTaps_set`
transformers | `:NumWindings_get`
transformers | `:R_get`
transformers | `:Rneut_get`
transformers | `:Rneut_set`
transformers | `:Tap_get`
transformers | `:Tap_set`
transformers | `:Wdg_get`
transformers | `:Wdg_set`
transformers | `:XfmrCode_get`
transformers | `:XfmrCode_set`
transformers | `:Xhl_get`
transformers | `:Xhl_set`
transformers | `:Xht_get`
transformers | `:Xht_set`
transformers | `:Xlt_get`
transformers | `:Xlt_set`
transformers | `:Xneut_get`
transformers | `:Xneut_set`
vsources | `:AngleDeg_get`
vsources | `:AngleDeg_set`
vsources | `:BasekV_get`
vsources | `:Count`
vsources | `:First`
vsources | `:Frequency_get`
vsources | `:Frequency_set`
vsources | `:Name_get`
vsources | `:Name_set`
vsources | `:Next`
vsources | `:Phases_get`
vsources | `:Phases_set`
vsources | `:PU_get`
vsources | `:PU_set`
xycurves | `:Count`
xycurves | `:First`
xycurves | `:Name_get`
xycurves | `:Name_set`
xycurves | `:Next`
xycurves | `:Npts_get`
xycurves | `:Npts_set`
xycurves | `:X_get`
xycurves | `:XScale_get`
xycurves | `:XScale_set`
xycurves | `:XShift_get`
xycurves | `:XShift_set`
xycurves | `:Y_get`
xycurves | `:Y_set`
xycurves | `:YScale_get`
xycurves | `:YScale_set`
xycurves | `:YShift_get`
xycurves | `:YShift_set`

# Low-level API

The main API is built on the low-level API documented 
[here](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf).
Here is an example using the low-level API:

```julia
DSS.DSSPut_Command("clear")
DSS.DSSPut_Command("compile (C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss)")
loadnumber = DSS.DSSLoads(0,0)
while loadnumber > 0
    DSS.DSSLoadsF(1,50.)
    DSS.DSSLoadsF(5,20.)
    loadnumber = DSS.DSSLoads(1,0)
end
println(DSS.DSSLoads(4,0)) 
```

Integer (I), floating-point (F), and string (S) functions are supported. The
variant (V) functions are not available at this time. The low-level API
functions are not exported. These functions are available in the `DSS` module.


