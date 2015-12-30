export DSS

module DSS  # lower-level, basic API

if Int == Int64
    const dsslib = "C:\\portableapps\\home\\.julia\\v0.4\\OpenDSSDirect\\deps\\win64\\OpenDSSDEngine.DLL"
else
    const dsslib = "C:\\portableapps\\home\\.julia\\v0.4\\OpenDSSDirect\\deps\\win32\\OpenDSSDEngine.DLL"
end

ActiveClassI(mode::Integer,  arg::Integer)         = ccall( (:ActiveClassI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ActiveClassS(mode::Integer,  arg::AbstractString)  = ccall( (:ActiveClassS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

BUSI(mode::Integer, arg::Integer)         = ccall( (:BUSI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
BUSF(mode::Integer, arg::Float64)         = ccall( (:BUSF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
BUSS(mode::Integer, arg::AbstractString)  = ccall( (:BUSS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

CapControlsI(mode::Integer, arg::Integer)         = ccall( (:CapControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CapControlsF(mode::Integer, arg::Float64)         = ccall( (:CapControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CapControlsS(mode::Integer, arg::AbstractString)  = ccall( (:CapControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

CapacitorsI(mode::Integer, arg::Integer)         = ccall( (:CapacitorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CapacitorsF(mode::Integer, arg::Float64)         = ccall( (:CapacitorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CapacitorsS(mode::Integer, arg::AbstractString)  = ccall( (:CapacitorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

CktElementI(mode::Integer, arg::Integer)         = ccall( (:CktElementI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CktElementF(mode::Integer, arg::Float64)         = ccall( (:CktElementF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CktElementS(mode::Integer, arg::AbstractString)  = ccall( (:CktElementS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

CircuitI(mode::Integer, arg::Integer)                 = ccall( (:CircuitI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CircuitF(mode::Integer, arg1::Float64, arg2::Float64) = ccall( (:CircuitF, dsslib), stdcall, Float64, (Int32,Float64,Float64), mode, arg1, arg2)
CircuitS(mode::Integer, arg::AbstractString)          = ccall( (:CircuitS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)
# function CircuitV(mode::Integer) 
#     arg = zeros(Float64, 20)
#     ccall( (:CircuitV, dsslib), stdcall, Void, (Int32,Ptr{Float64}), mode, arg)
#     return arg
# end

DSSI(mode::Integer,  arg::Integer)         = ccall( (:DSSI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSS(mode::Integer,  arg::AbstractString)  = ccall( (:DSSS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

DSSElementI(mode::Integer,  arg::Integer)         = ccall( (:DSSElementI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSElementS(mode::Integer,  arg::AbstractString)  = ccall( (:DSSElementS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

DSSExecutiveI(mode::Integer,  arg::Integer)         = ccall( (:DSSExecutiveI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSExecutiveS(mode::Integer,  arg::AbstractString)  = ccall( (:DSSExecutiveS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

DSSLoads(mode::Integer,  arg::Integer)         = ccall( (:DSSLoads,  dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSLoadsF(mode::Integer, arg::Float64)         = ccall( (:DSSLoadsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
DSSLoadsS(mode::Integer, arg::AbstractString)  = ccall( (:DSSLoadsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)
# function DSSLoadsV(mode::Integer) 
#     arg = UInt8[]
#     arg = C_NULL
#     ccall( (:DSSLoadsV, dsslib), stdcall, Void, (Int32,Ptr{Void}), mode, arg)
#     print(arg)
#     return arg
# end

DSSProgressI(mode::Integer,  arg::Integer)         = ccall( (:DSSProgressI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSProgressS(mode::Integer,  arg::AbstractString)  = ccall( (:DSSProgressS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

DSSPut_Command(cmd) = ccall( (:DSSPut_Command, dsslib), stdcall, Cstring, (Cstring,), cmd)

ErrorCode(cmd) = ccall( (:ErrorCode, dsslib), stdcall, Int32, ())
ErrorDesc(cmd) = ccall( (:ErrorDesc, dsslib), stdcall, Cstring, ())

FusesI(mode::Integer, arg::Integer)         = ccall( (:FusesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
FusesF(mode::Integer, arg::Float64)         = ccall( (:FusesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
FusesS(mode::Integer, arg::AbstractString)  = ccall( (:FusesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

GeneratorsI(mode::Integer, arg::Integer)         = ccall( (:GeneratorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
GeneratorsF(mode::Integer, arg::Float64)         = ccall( (:GeneratorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
GeneratorsS(mode::Integer, arg::AbstractString)  = ccall( (:GeneratorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

IDSSProperties(mode::Integer,  arg::AbstractString)  = ccall( (:IDSSProperties, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

IsourceI(mode::Integer, arg::Integer)         = ccall( (:IsourceI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
IsourceF(mode::Integer, arg::Float64)         = ccall( (:IsourceF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
IsourceS(mode::Integer, arg::AbstractString)  = ccall( (:IsourceS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

LinesI(mode::Integer, arg::Integer)         = ccall( (:LinesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LinesF(mode::Integer, arg::Float64)         = ccall( (:LinesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LinesS(mode::Integer, arg::AbstractString)  = ccall( (:LinesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

LoadsI(mode::Integer, arg::Integer)         = ccall( (:LoadsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LoadsF(mode::Integer, arg::Float64)         = ccall( (:LoadsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LoadsS(mode::Integer, arg::AbstractString)  = ccall( (:LoadsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

LoadShapeI(mode::Integer, arg::Integer)         = ccall( (:LoadShapeI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LoadShapeF(mode::Integer, arg::Float64)         = ccall( (:LoadShapeF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LoadShapeS(mode::Integer, arg::AbstractString)  = ccall( (:LoadShapeS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

MetersI(mode::Integer, arg::Integer)         = ccall( (:MetersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
MetersF(mode::Integer, arg::Float64)         = ccall( (:MetersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
MetersS(mode::Integer, arg::AbstractString)  = ccall( (:MetersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

MonitorsI(mode::Integer, arg::Integer)         = ccall( (:MonitorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
MonitorsS(mode::Integer, arg::AbstractString)  = ccall( (:MonitorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

ParserI(mode::Integer, arg::Integer)         = ccall( (:ParserI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ParserF(mode::Integer, arg::Float64)         = ccall( (:ParserF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
ParserS(mode::Integer, arg::AbstractString)  = ccall( (:ParserS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

PDElementsI(mode::Integer, arg::Integer)         = ccall( (:PDElementsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
PDElementsF(mode::Integer, arg::Float64)         = ccall( (:PDElementsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
PDElementsS(mode::Integer, arg::AbstractString)  = ccall( (:PDElementsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

PVsystemsI(mode::Integer, arg::Integer)         = ccall( (:PVsystemsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
PVsystemsF(mode::Integer, arg::Float64)         = ccall( (:PVsystemsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
PVsystemsS(mode::Integer, arg::AbstractString)  = ccall( (:PVsystemsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

ReclosersI(mode::Integer, arg::Integer)         = ccall( (:ReclosersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ReclosersF(mode::Integer, arg::Float64)         = ccall( (:ReclosersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
ReclosersS(mode::Integer, arg::AbstractString)  = ccall( (:ReclosersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

RegControlsI(mode::Integer, arg::Integer)         = ccall( (:RegControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
RegControlsF(mode::Integer, arg::Float64)         = ccall( (:RegControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
RegControlsS(mode::Integer, arg::AbstractString)  = ccall( (:RegControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

RelaysI(mode::Integer, arg::Integer)         = ccall( (:RelaysI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
RelaysS(mode::Integer, arg::AbstractString)  = ccall( (:RelaysS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

SensorsI(mode::Integer, arg::Integer)         = ccall( (:SensorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SensorsF(mode::Integer, arg::Float64)         = ccall( (:SensorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SensorsS(mode::Integer, arg::AbstractString)  = ccall( (:SensorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

SettingsI(mode::Integer, arg::Integer)         = ccall( (:SettingsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SettingsF(mode::Integer, arg::Float64)         = ccall( (:SettingsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SettingsS(mode::Integer, arg::AbstractString)  = ccall( (:SettingsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

SolutionI(mode::Integer, arg::Integer)         = ccall( (:SolutionI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SolutionF(mode::Integer, arg::Float64)         = ccall( (:SolutionF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SolutionS(mode::Integer, arg::AbstractString)  = ccall( (:SolutionS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

SwtControlsI(mode::Integer, arg::Integer)         = ccall( (:SwtControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SwtControlsF(mode::Integer, arg::Float64)         = ccall( (:SwtControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SwtControlsS(mode::Integer, arg::AbstractString)  = ccall( (:SwtControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

TopologyI(mode::Integer, arg::Integer)         = ccall( (:TopologyI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
TopologyS(mode::Integer, arg::AbstractString)  = ccall( (:TopologyS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

TransformersI(mode::Integer, arg::Integer)         = ccall( (:TransformersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
TransformersF(mode::Integer, arg::Float64)         = ccall( (:TransformersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
TransformersS(mode::Integer, arg::AbstractString)  = ccall( (:TransformersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

VsourcesI(mode::Integer, arg::Integer)         = ccall( (:VsourcesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
VsourcesF(mode::Integer, arg::Float64)         = ccall( (:VsourcesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
VsourcesS(mode::Integer, arg::AbstractString)  = ccall( (:VsourcesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

XYCurvesI(mode::Integer, arg::Integer)         = ccall( (:XYCurvesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
XYCurvesF(mode::Integer, arg::Float64)         = ccall( (:XYCurvesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
XYCurvesS(mode::Integer, arg::AbstractString)  = ccall( (:XYCurvesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg)

end # module