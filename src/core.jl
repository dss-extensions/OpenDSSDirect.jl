export DSSCore

module DSSCore  # lower-level, basic API

if Int == Int64
    const dsslib = "C:\\portableapps\\home\\.julia\\v0.4\\OpenDSSDirect\\deps\\win64\\OpenDSSDEngine.DLL"
else
    const dsslib = "C:\\portableapps\\home\\.julia\\v0.4\\OpenDSSDirect\\deps\\win32\\OpenDSSDEngine.DLL"
end

# Mimics the structure outlined in the following:
#   https://msdn.microsoft.com/en-us/library/windows/desktop/ms221482%28v=vs.85%29.aspx
# Another useful link:
#   http://www.quickmacros.com/help/Tables/IDP_VARIANT.html
immutable MSSafeArray{T}
    cDims::Cushort
    fFeatures::Cushort
    cbElements::Culong
    cLocks::Culong
    pvData::Ptr{T}
    grsabound1::Cuint
    grsabound2::Cuint
end

function fixstring(data, i)
    len = pointer_to_array(convert(Ptr{UInt16}, data[i]-4), (1,))[1]
    UTF16String(pointer_to_array(data[i], (len,)))
end
function fixstrings(data)
    UTF16String[fixstring(data, i) for i in 1:length(data)]
end

function variant{ID}(::Type{Val{ID}}, mode::Integer) 
    arg = UInt[1,2,3,4]
    ccall( (ID, dsslib), stdcall, Void, (Int32,Ptr{UInt}), mode, arg)
    if arg[1] == 0x2005    # Float64 type
        p = convert(Ptr{MSSafeArray{Float64}}, arg[2])
        sa = pointer_to_array(p, (1,))
        data = pointer_to_array(sa[1].pvData, (sa[1].grsabound1,))
        return data
    elseif arg[1] == 0x2008    # Cstring type
        p = convert(Ptr{MSSafeArray{Ptr{UInt8}}}, arg[2])
        sa = pointer_to_array(p, (1,))
        data = pointer_to_array(sa[1].pvData, (sa[1].grsabound1,))
        return fixstrings(data)
    end
end

ActiveClassI(mode::Integer,  arg::Integer)         = ccall( (:ActiveClassI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ActiveClassS(mode::Integer,  arg::AbstractString)  = bytestring(ccall( (:ActiveClassS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
ActiveClassV(mode::Integer)  = variant(Val{:ActiveClassV}, mode)

BUSI(mode::Integer, arg::Integer)         = ccall( (:BUSI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
BUSF(mode::Integer, arg::Float64)         = ccall( (:BUSF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
BUSS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:BUSS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
BUSV(mode::Integer)  = variant(Val{:BUSV}, mode)

CapControlsI(mode::Integer, arg::Integer)         = ccall( (:CapControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CapControlsF(mode::Integer, arg::Float64)         = ccall( (:CapControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CapControlsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:CapControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
CapControlsV(mode::Integer)  = variant(Val{:CapControlsV}, mode)

CapacitorsI(mode::Integer, arg::Integer)         = ccall( (:CapacitorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CapacitorsF(mode::Integer, arg::Float64)         = ccall( (:CapacitorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CapacitorsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:CapacitorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
CapacitorsV(mode::Integer)  = variant(Val{:CapacitorsV}, mode)

CktElementI(mode::Integer, arg::Integer)         = ccall( (:CktElementI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CktElementF(mode::Integer, arg::Float64)         = ccall( (:CktElementF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CktElementS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:CktElementS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
CktElementV(mode::Integer)  = variant(Val{:CktElementV}, mode)

CircuitI(mode::Integer, arg::Integer)                 = ccall( (:CircuitI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CircuitF(mode::Integer, arg1::Float64, arg2::Float64) = ccall( (:CircuitF, dsslib), stdcall, Float64, (Int32,Float64,Float64), mode, arg1, arg2)
CircuitS(mode::Integer, arg::AbstractString)          = bytestring(ccall( (:CircuitS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
CircuitV(mode::Integer)  = variant(Val{:CircuitV}, mode)

CtrlQueueI(mode::Integer, arg::Integer)  = ccall( (:CtrlQueueI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)

DSSI(mode::Integer,  arg::Integer)         = ccall( (:DSSI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSS(mode::Integer,  arg::AbstractString)  = bytestring(ccall( (:DSSS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
DSSV(mode::Integer)  = variant(Val{:DSSV}, mode)

DSSElementI(mode::Integer,  arg::Integer)         = ccall( (:DSSElementI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSElementS(mode::Integer,  arg::AbstractString)  = bytestring(ccall( (:DSSElementS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
DSSElementV(mode::Integer)  = variant(Val{:DSSElementV}, mode)

DSSExecutiveI(mode::Integer,  arg::Integer)         = ccall( (:DSSExecutiveI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSExecutiveS(mode::Integer,  arg::AbstractString)  = bytestring(ccall( (:DSSExecutiveS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))

DSSLoads(mode::Integer,  arg::Integer)         = ccall( (:DSSLoads,  dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSLoadsF(mode::Integer, arg::Float64)         = ccall( (:DSSLoadsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
DSSLoadsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:DSSLoadsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
DSSLoadsV(mode::Integer)  = variant(Val{:DSSLoadsV}, mode)

DSSProgressI(mode::Integer,  arg::Integer)         = ccall( (:DSSProgressI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSProgressS(mode::Integer,  arg::AbstractString)  = bytestring(ccall( (:DSSProgressS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))

DSSPut_Command(cmd) = bytestring(ccall( (:DSSPut_Command, dsslib), stdcall, Cstring, (Cstring,), cmd))

ErrorCode(cmd) = ccall( (:ErrorCode, dsslib), stdcall, Int32, ())
ErrorDesc(cmd) = bytestring(ccall( (:ErrorDesc, dsslib), stdcall, Cstring, ()))

FusesI(mode::Integer, arg::Integer)         = ccall( (:FusesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
FusesF(mode::Integer, arg::Float64)         = ccall( (:FusesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
FusesS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:FusesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
FusesV(mode::Integer)  = variant(Val{:FusesV}, mode)

GeneratorsI(mode::Integer, arg::Integer)         = ccall( (:GeneratorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
GeneratorsF(mode::Integer, arg::Float64)         = ccall( (:GeneratorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
GeneratorsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:GeneratorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
GeneratorsV(mode::Integer)  = variant(Val{:GeneratorsV}, mode)

IDSSProperties(mode::Integer,  arg::AbstractString)  = bytestring(ccall( (:IDSSProperties, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))

IsourceI(mode::Integer, arg::Integer)         = ccall( (:IsourceI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
IsourceF(mode::Integer, arg::Float64)         = ccall( (:IsourceF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
IsourceS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:IsourceS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
IsourceV(mode::Integer)  = variant(Val{:IsourceV}, mode)

LinesI(mode::Integer, arg::Integer)         = ccall( (:LinesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LinesF(mode::Integer, arg::Float64)         = ccall( (:LinesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LinesS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:LinesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
LinesV(mode::Integer)  = variant(Val{:LinesV}, mode)

LoadsI(mode::Integer, arg::Integer)         = ccall( (:LoadsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LoadsF(mode::Integer, arg::Float64)         = ccall( (:LoadsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LoadsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:LoadsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
LoadsV(mode::Integer)  = variant(Val{:LoadsV}, mode)

LoadShapeI(mode::Integer, arg::Integer)         = ccall( (:LoadShapeI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LoadShapeF(mode::Integer, arg::Float64)         = ccall( (:LoadShapeF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LoadShapeS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:LoadShapeS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
LoadShapeV(mode::Integer)  = variant(Val{:LoadShapeV}, mode)

MetersI(mode::Integer, arg::Integer)         = ccall( (:MetersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
MetersF(mode::Integer, arg::Float64)         = ccall( (:MetersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
MetersS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:MetersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
MetersV(mode::Integer)  = variant(Val{:MetersV}, mode)

MonitorsI(mode::Integer, arg::Integer)         = ccall( (:MonitorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
MonitorsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:MonitorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
MonitorsV(mode::Integer)  = variant(Val{:MonitorsV}, mode)

ParserI(mode::Integer, arg::Integer)         = ccall( (:ParserI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ParserF(mode::Integer, arg::Float64)         = ccall( (:ParserF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
ParserS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:ParserS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
ParserV(mode::Integer)  = variant(Val{:ParserV}, mode)

PDElementsI(mode::Integer, arg::Integer)         = ccall( (:PDElementsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
PDElementsF(mode::Integer, arg::Float64)         = ccall( (:PDElementsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
PDElementsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:PDElementsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))

PVsystemsI(mode::Integer, arg::Integer)         = ccall( (:PVsystemsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
PVsystemsF(mode::Integer, arg::Float64)         = ccall( (:PVsystemsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
PVsystemsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:PVsystemsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
PVsystemsV(mode::Integer)  = variant(Val{:PVsystemsV}, mode)

ReclosersI(mode::Integer, arg::Integer)         = ccall( (:ReclosersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ReclosersF(mode::Integer, arg::Float64)         = ccall( (:ReclosersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
ReclosersS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:ReclosersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
ReclosersV(mode::Integer)  = variant(Val{:ReclosersV}, mode)

RegControlsI(mode::Integer, arg::Integer)         = ccall( (:RegControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
RegControlsF(mode::Integer, arg::Float64)         = ccall( (:RegControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
RegControlsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:RegControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
RegControlsV(mode::Integer)  = variant(Val{:RegControlsV}, mode)

RelaysI(mode::Integer, arg::Integer)         = ccall( (:RelaysI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
RelaysS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:RelaysS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
RelaysV(mode::Integer)  = variant(Val{:RelaysV}, mode)

SensorsI(mode::Integer, arg::Integer)         = ccall( (:SensorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SensorsF(mode::Integer, arg::Float64)         = ccall( (:SensorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SensorsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:SensorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
SensorsV(mode::Integer)  = variant(Val{:SensorsV}, mode)

SettingsI(mode::Integer, arg::Integer)         = ccall( (:SettingsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SettingsF(mode::Integer, arg::Float64)         = ccall( (:SettingsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SettingsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:SettingsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
SettingsV(mode::Integer)  = variant(Val{:SettingsV}, mode)

SolutionI(mode::Integer, arg::Integer)         = ccall( (:SolutionI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SolutionF(mode::Integer, arg::Float64)         = ccall( (:SolutionF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SolutionS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:SolutionS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
SolutionV(mode::Integer)  = variant(Val{:SolutionV}, mode)

SwtControlsI(mode::Integer, arg::Integer)         = ccall( (:SwtControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SwtControlsF(mode::Integer, arg::Float64)         = ccall( (:SwtControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SwtControlsS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:SwtControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
SwtControlsV(mode::Integer)  = variant(Val{:SwtControlsV}, mode)

TopologyI(mode::Integer, arg::Integer)         = ccall( (:TopologyI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
TopologyS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:TopologyS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
TopologyV(mode::Integer)  = variant(Val{:TopologyV}, mode)

TransformersI(mode::Integer, arg::Integer)         = ccall( (:TransformersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
TransformersF(mode::Integer, arg::Float64)         = ccall( (:TransformersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
TransformersS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:TransformersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
TransformersV(mode::Integer)  = variant(Val{:TransformersV}, mode)

VsourcesI(mode::Integer, arg::Integer)         = ccall( (:VsourcesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
VsourcesF(mode::Integer, arg::Float64)         = ccall( (:VsourcesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
VsourcesS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:VsourcesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
VsourcesV(mode::Integer)  = variant(Val{:VsourcesV}, mode)

XYCurvesI(mode::Integer, arg::Integer)         = ccall( (:XYCurvesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
XYCurvesF(mode::Integer, arg::Float64)         = ccall( (:XYCurvesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
XYCurvesS(mode::Integer, arg::AbstractString)  = bytestring(ccall( (:XYCurvesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
XYCurvesV(mode::Integer)  = variant(Val{:XYCurvesV}, mode)

end # module