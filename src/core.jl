export DSSCore

module DSSCore  # lower-level, basic API

if Int == Int64
    const dsslib = "$(Pkg.dir())\\OpenDSSDirect\\deps\\win64\\OpenDSSDEngine.DLL"
else
    const dsslib = "$(Pkg.dir())\\OpenDSSDirect\\deps\\win32\\OpenDSSDEngine.DLL"
end


################################################################################
##
## Helpers for converting Variants
##
################################################################################

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
    # cElements1::Culong
    # lLbound1::Clong
    # cElements2::Culong
    # lLbound2::Clong
end

function fixstring(data, i)
    len = pointer_to_array(convert(Ptr{UInt16}, data[i]-4), (1,))[1]
    UTF16String(pointer_to_array(data[i], (len,)))
end
function fixstrings(data)
    UTF16String[fixstring(data, i) for i in 1:length(data)]
end

# for reading data from OpenDSS
function variant{ID}(::Type{Val{ID}}, mode::Integer) 
    arg = UInt[1,2,3,4]
    ccall( (ID, dsslib), stdcall, Void, (Int32,Ptr{UInt}), mode, arg)
    if arg[1] == 0x0001   # data not changed
        return []
    elseif arg[1] == 0x2005    # Float64 type
        p = convert(Ptr{MSSafeArray{Float64}}, arg[2])
        sa = pointer_to_array(p, (1,))
        data = pointer_to_array(sa[1].pvData, (sa[1].grsabound1,))
        return data
    elseif arg[1] == 0x2003    # Int32 type
        p = convert(Ptr{MSSafeArray{Int32}}, arg[2])
        sa = pointer_to_array(p, (1,))
        data = pointer_to_array(sa[1].pvData, (sa[1].grsabound1,))
        return data
    elseif arg[1] == 0x2008    # Cstring type
        p = convert(Ptr{MSSafeArray{Ptr{UInt8}}}, arg[2])
        sa = pointer_to_array(p, (1,))
        data = pointer_to_array(sa[1].pvData, (sa[1].grsabound1,))
        if data == [C_NULL]
            return UTF16String[]
        else
            return fixstrings(data)
        end
    end
end

# for writing data to OpenDSS -- BROKEN -- SEGFAULTS
immutable Variant
    typ::Cushort
    # typ::Int64
    ptr::Ptr{Void}
    ptr2::Ptr{Void}
end
function variant{ID,T <: AbstractFloat}(::Type{Val{ID}}, mode::Integer, arg::AbstractVector{T}) 
    # Make a Variant object
    sa = MSSafeArray{Float64}(1, 0x0080, 0x00000008, 0, pointer(arg), length(arg), 0)
    variant = [Variant(0x2005, pointer([sa]), C_NULL)]
    dump(sa)
    dump(variant)
    ccall( (ID, OpenDSSDirect.DSSCore.dsslib), stdcall, Void, (Int32,Ptr{Void}), mode, variant)
end


################################################################################
##
## Methods
##
################################################################################

ActiveClassI(mode::Integer,  arg::Integer = 0)          = ccall( (:ActiveClassI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ActiveClassS(mode::Integer,  arg::AbstractString = "")  = bytestring(ccall( (:ActiveClassS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
ActiveClassV(mode::Integer)  = variant(Val{:ActiveClassV}, mode)

BUSI(mode::Integer, arg::Integer = 0)           = ccall( (:BUSI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
BUSF(mode::Integer, arg::Float64 = 0.0)         = ccall( (:BUSF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
BUSS(mode::Integer, arg::AbstractString = "")  = bytestring(ccall( (:BUSS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
BUSV(mode::Integer)  = variant(Val{:BUSV}, mode)

CapControlsI(mode::Integer, arg::Integer = 0)         = ccall( (:CapControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CapControlsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:CapControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CapControlsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:CapControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
CapControlsV(mode::Integer)  = variant(Val{:CapControlsV}, mode)

CapacitorsI(mode::Integer, arg::Integer = 0)         = ccall( (:CapacitorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CapacitorsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:CapacitorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CapacitorsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:CapacitorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
CapacitorsV(mode::Integer)  = variant(Val{:CapacitorsV}, mode)

CktElementI(mode::Integer, arg::Integer = 0)           = ccall( (:CktElementI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CktElementF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:CktElementF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
CktElementS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:CktElementS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
CktElementV(mode::Integer)  = variant(Val{:CktElementV}, mode)

CircuitI(mode::Integer, arg::Integer = 0)                   = ccall( (:CircuitI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
CircuitF(mode::Integer, arg1::Float64, arg2::Float64) = ccall( (:CircuitF, dsslib), stdcall, Float64, (Int32,Float64,Float64), mode, arg1, arg2)
CircuitS(mode::Integer, arg::AbstractString = "")            = bytestring(ccall( (:CircuitS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
CircuitV(mode::Integer)  = variant(Val{:CircuitV}, mode)

CtrlQueueI(mode::Integer, arg::Integer = 0)    = ccall( (:CtrlQueueI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)

DSSI(mode::Integer, arg::Integer = 0)           = ccall( (:DSSI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSS(mode::Integer,  arg::AbstractString = "")  = bytestring(ccall( (:DSSS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
DSSV(mode::Integer)  = variant(Val{:DSSV}, mode)

DSSElementI(mode::Integer, arg::Integer = 0)           = ccall( (:DSSElementI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSElementS(mode::Integer,  arg::AbstractString = "")  = bytestring(ccall( (:DSSElementS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
DSSElementV(mode::Integer)  = variant(Val{:DSSElementV}, mode)

DSSExecutiveI(mode::Integer, arg::Integer = 0)           = ccall( (:DSSExecutiveI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSExecutiveS(mode::Integer,  arg::AbstractString = "")  = bytestring(ccall( (:DSSExecutiveS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))

DSSLoads(mode::Integer, arg::Integer = 0)           = ccall( (:DSSLoads,  dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSLoadsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:DSSLoadsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
DSSLoadsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:DSSLoadsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
DSSLoadsV(mode::Integer)  = variant(Val{:DSSLoadsV}, mode)

DSSProgressI(mode::Integer, arg::Integer = 0)           = ccall( (:DSSProgressI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
DSSProgressS(mode::Integer,  arg::AbstractString)  = bytestring(ccall( (:DSSProgressS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))

DSSPut_Command(cmd) = bytestring(ccall( (:DSSPut_Command, dsslib), stdcall, Cstring, (Cstring,), cmd))

ErrorCode(cmd) = ccall( (:ErrorCode, dsslib), stdcall, Int32, ())
ErrorDesc(cmd) = bytestring(ccall( (:ErrorDesc, dsslib), stdcall, Cstring, ()))

FusesI(mode::Integer, arg::Integer = 0)           = ccall( (:FusesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
FusesF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:FusesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
FusesS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:FusesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
FusesV(mode::Integer)  = variant(Val{:FusesV}, mode)

GeneratorsI(mode::Integer, arg::Integer = 0)           = ccall( (:GeneratorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
GeneratorsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:GeneratorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
GeneratorsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:GeneratorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
GeneratorsV(mode::Integer)  = variant(Val{:GeneratorsV}, mode)

IDSSProperties(mode::Integer,  arg::AbstractString)  = bytestring(ccall( (:IDSSProperties, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))

IsourceI(mode::Integer, arg::Integer = 0)           = ccall( (:IsourceI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
IsourceF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:IsourceF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
IsourceS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:IsourceS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
IsourceV(mode::Integer)  = variant(Val{:IsourceV}, mode)

LinesI(mode::Integer, arg::Integer = 0)           = ccall( (:LinesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LinesF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:LinesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LinesS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:LinesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
LinesV(mode::Integer)  = variant(Val{:LinesV}, mode)

LoadsI(mode::Integer, arg::Integer = 0)           = ccall( (:LoadsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LoadsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:LoadsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LoadsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:LoadsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
LoadsV(mode::Integer)  = variant(Val{:LoadsV}, mode)

LoadShapeI(mode::Integer, arg::Integer = 0)           = ccall( (:LoadShapeI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
LoadShapeF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:LoadShapeF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
LoadShapeS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:LoadShapeS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
LoadShapeV(mode::Integer)  = variant(Val{:LoadShapeV}, mode)
# LoadShapeV(mode::Integer, arg)  = variant(Val{:LoadShapeV}, mode, arg)

MetersI(mode::Integer, arg::Integer = 0)           = ccall( (:MetersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
MetersF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:MetersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
MetersS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:MetersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
MetersV(mode::Integer)  = variant(Val{:MetersV}, mode)

MonitorsI(mode::Integer, arg::Integer = 0)           = ccall( (:MonitorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
MonitorsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:MonitorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
MonitorsV(mode::Integer)  = variant(Val{:MonitorsV}, mode)

ParserI(mode::Integer, arg::Integer = 0)           = ccall( (:ParserI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ParserF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:ParserF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
ParserS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:ParserS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
ParserV(mode::Integer)  = variant(Val{:ParserV}, mode)

PDElementsI(mode::Integer, arg::Integer = 0)           = ccall( (:PDElementsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
PDElementsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:PDElementsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
PDElementsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:PDElementsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))

PVsystemsI(mode::Integer, arg::Integer = 0)           = ccall( (:PVsystemsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
PVsystemsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:PVsystemsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
PVsystemsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:PVsystemsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
PVsystemsV(mode::Integer)  = variant(Val{:PVsystemsV}, mode)

ReclosersI(mode::Integer, arg::Integer = 0)           = ccall( (:ReclosersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
ReclosersF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:ReclosersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
ReclosersS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:ReclosersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
ReclosersV(mode::Integer)  = variant(Val{:ReclosersV}, mode)

RegControlsI(mode::Integer, arg::Integer = 0)           = ccall( (:RegControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
RegControlsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:RegControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
RegControlsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:RegControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
RegControlsV(mode::Integer)  = variant(Val{:RegControlsV}, mode)

RelaysI(mode::Integer, arg::Integer = 0)           = ccall( (:RelaysI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
RelaysS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:RelaysS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
RelaysV(mode::Integer)  = variant(Val{:RelaysV}, mode)

SensorsI(mode::Integer, arg::Integer = 0)           = ccall( (:SensorsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SensorsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:SensorsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SensorsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:SensorsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
SensorsV(mode::Integer)  = variant(Val{:SensorsV}, mode)

SettingsI(mode::Integer, arg::Integer = 0)           = ccall( (:SettingsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SettingsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:SettingsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SettingsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:SettingsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
SettingsV(mode::Integer)  = variant(Val{:SettingsV}, mode)
# SettingsV(mode::Integer, arg)  = variant(Val{:SettingsV}, mode, arg)

SolutionI(mode::Integer, arg::Integer = 0)           = ccall( (:SolutionI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SolutionF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:SolutionF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SolutionS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:SolutionS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
SolutionV(mode::Integer)  = variant(Val{:SolutionV}, mode)

SwtControlsI(mode::Integer, arg::Integer = 0)           = ccall( (:SwtControlsI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
SwtControlsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:SwtControlsF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
SwtControlsS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:SwtControlsS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
SwtControlsV(mode::Integer)  = variant(Val{:SwtControlsV}, mode)

TopologyI(mode::Integer, arg::Integer = 0)           = ccall( (:TopologyI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
TopologyS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:TopologyS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
TopologyV(mode::Integer)  = variant(Val{:TopologyV}, mode)

TransformersI(mode::Integer, arg::Integer = 0)           = ccall( (:TransformersI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
TransformersF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:TransformersF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
TransformersS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:TransformersS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
TransformersV(mode::Integer)  = variant(Val{:TransformersV}, mode)

VsourcesI(mode::Integer, arg::Integer = 0)           = ccall( (:VsourcesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
VsourcesF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:VsourcesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
VsourcesS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:VsourcesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
VsourcesV(mode::Integer)  = variant(Val{:VsourcesV}, mode)

XYCurvesI(mode::Integer, arg::Integer = 0)           = ccall( (:XYCurvesI, dsslib), stdcall, Int32,   (Int32,Int32),   mode, arg)
XYCurvesF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:XYCurvesF, dsslib), stdcall, Float64, (Int32,Float64), mode, arg)
XYCurvesS(mode::Integer, arg::AbstractString = "")    = bytestring(ccall( (:XYCurvesS, dsslib), stdcall, Cstring, (Int32,Cstring), mode, arg))
XYCurvesV(mode::Integer)  = variant(Val{:XYCurvesV}, mode)

end # module
