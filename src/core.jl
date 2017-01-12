export DSSCore

"Module with the low-level API for OpenDSSDirect"
module DSSCore 

if is_windows()
    if Int == Int64
        const dsslib = "$(dirname(@__FILE__))\\..\\deps\\win64\\OpenDSSDirect.DLL"
    else
        const dsslib = "$(dirname(@__FILE__))\\..\\deps\\win32\\OpenDSSDirect.DLL"
    end
else
    const dsslib = "$(dirname(@__FILE__))/../deps/libopendssdirect.so"
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

immutable TVarArray{T}
    dimcount::UInt8
    flags::UInt8
    elementsize::UInt32
    lockcount::UInt32
    data::Ptr{T}
    length::Cuint
    lbound::Cuint
end

function mylen(x::Ptr{UInt16})
    for i in 1:1000
        if unsafe_wrap(Array, convert(Ptr{UInt16}, x + 2i), 1)[1] == 0
            return i-1
        end
    end
    return -1
end
    
function fixstring(data, i)
    len = unsafe_wrap(Array, convert(Ptr{UInt8}, data[i] - 8), 1)[1]
    # @show mylen(data[i])
    transcode(String, unsafe_wrap(Array, data[i], (len,)))
    # transcode(String, data[i])
    # unsafe_string(data[i], 5)
end
function fixstrings(data)
    String[fixstring(data, i) for i in 1:length(data)]
end

immutable VArg
    dtype::UInt16
    p::Ptr{Void}
    dum1::UInt64
    dum2::UInt64
end

# for reading data from OpenDSS
function variant{ID}(::Type{Val{ID}}, mode::Integer) 
    arg = Ref(VArg(0,C_NULL,0,0))
    ccall( (ID, dsslib), cdecl, Void, (Int32,Ref{VArg}), mode, arg)
    arg = arg[]
    if arg.dtype == 0x0001   # data not changed
        return []
    elseif arg.dtype == 0x2005    # Float64 type
        p = convert(Ptr{TVarArray{Float64}}, arg.p)
        sa = unsafe_wrap(Array, p, (1,))
        data = unsafe_wrap(Array, sa[1].data, (sa[1].length,))
        return data
    elseif arg.dtype == 0x2003    # Int32 type
        p = convert(Ptr{TVarArray{Int32}}, arg.p)
        sa = unsafe_wrap(Array, p, (1,))
        data = unsafe_wrap(Array, sa[1].data, (sa[1].length,))
        return data
    elseif arg.dtype == 0x2008    # Cstring type
        p = convert(Ptr{TVarArray{Ptr{UInt16}}}, arg.p)
        sa = unsafe_wrap(Array, p, (1,))
        data = unsafe_wrap(Array, sa[1].data, (sa[1].length,))
        if data == [C_NULL]
            return String[]
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
    ccall( (ID, OpenDSSDirect.DSSCore.dsslib), cdecl, Void, (Int32,Ptr{Void}), mode, variant)
end


################################################################################
##
## Methods
##
################################################################################

ActiveClassI(mode::Integer,  arg::Integer = 0)          = ccall( (:ActiveClassI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
ActiveClassS(mode::Integer,  arg::AbstractString = "")  = unsafe_string(ccall( (:ActiveClassS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
ActiveClassV(mode::Integer)  = variant(Val{:ActiveClassV}, mode)

BUSI(mode::Integer, arg::Integer = 0)           = ccall( (:BUSI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
BUSF(mode::Integer, arg::Float64 = 0.0)         = ccall( (:BUSF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
BUSS(mode::Integer, arg::AbstractString = "")  = unsafe_string(ccall( (:BUSS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
BUSV(mode::Integer)  = variant(Val{:BUSV}, mode)

CapControlsI(mode::Integer, arg::Integer = 0)         = ccall( (:CapControlsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
CapControlsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:CapControlsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
CapControlsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:CapControlsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
CapControlsV(mode::Integer)  = variant(Val{:CapControlsV}, mode)

CapacitorsI(mode::Integer, arg::Integer = 0)         = ccall( (:CapacitorsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
CapacitorsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:CapacitorsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
CapacitorsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:CapacitorsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
CapacitorsV(mode::Integer)  = variant(Val{:CapacitorsV}, mode)

CktElementI(mode::Integer, arg::Integer = 0)           = ccall( (:CktElementI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
CktElementF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:CktElementF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
CktElementS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:CktElementS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
CktElementV(mode::Integer)  = variant(Val{:CktElementV}, mode)

CircuitI(mode::Integer, arg::Integer = 0)                   = ccall( (:CircuitI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
CircuitF(mode::Integer, arg1::Float64, arg2::Float64) = ccall( (:CircuitF, dsslib), cdecl, Float64, (Int32,Float64,Float64), mode, arg1, arg2)
CircuitS(mode::Integer, arg::AbstractString = "")            = unsafe_string(ccall( (:CircuitS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
CircuitV(mode::Integer)  = variant(Val{:CircuitV}, mode)

CtrlQueueI(mode::Integer, arg::Integer = 0)    = ccall( (:CtrlQueueI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)

DSSI(mode::Integer, arg::Integer = 0)           = ccall( (:DSSI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
DSSS(mode::Integer,  arg::AbstractString = "")  = unsafe_string(ccall( (:DSSS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
DSSV(mode::Integer)  = variant(Val{:DSSV}, mode)

DSSElementI(mode::Integer, arg::Integer = 0)           = ccall( (:DSSElementI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
DSSElementS(mode::Integer,  arg::AbstractString = "")  = unsafe_string(ccall( (:DSSElementS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
DSSElementV(mode::Integer)  = variant(Val{:DSSElementV}, mode)

DSSExecutiveI(mode::Integer, arg::Integer = 0)           = ccall( (:DSSExecutiveI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
DSSExecutiveS(mode::Integer,  arg::AbstractString = "")  = unsafe_string(ccall( (:DSSExecutiveS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))

DSSLoads(mode::Integer, arg::Integer = 0)           = ccall( (:DSSLoads,  dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
DSSLoadsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:DSSLoadsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
DSSLoadsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:DSSLoadsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
DSSLoadsV(mode::Integer)  = variant(Val{:DSSLoadsV}, mode)

DSSProgressI(mode::Integer, arg::Integer = 0)           = ccall( (:DSSProgressI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
DSSProgressS(mode::Integer,  arg::AbstractString = "")  = unsafe_string(ccall( (:DSSProgressS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))

DSSPut_Command(cmd) = unsafe_string(ccall( (:DSSPut_Command, dsslib), cdecl, Cstring, (Cstring,), cmd))

ErrorCode(cmd) = ccall( (:ErrorCode, dsslib), cdecl, Int32, ())
ErrorDesc(cmd) = unsafe_string(ccall( (:ErrorDesc, dsslib), cdecl, Cstring, ()))

FusesI(mode::Integer, arg::Integer = 0)           = ccall( (:FusesI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
FusesF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:FusesF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
FusesS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:FusesS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
FusesV(mode::Integer)  = variant(Val{:FusesV}, mode)

GeneratorsI(mode::Integer, arg::Integer = 0)           = ccall( (:GeneratorsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
GeneratorsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:GeneratorsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
GeneratorsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:GeneratorsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
GeneratorsV(mode::Integer)  = variant(Val{:GeneratorsV}, mode)

DSSProperties(mode::Integer,  arg::AbstractString = "")  = unsafe_string(ccall( (:DSSProperties, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))

IsourceI(mode::Integer, arg::Integer = 0)           = ccall( (:IsourceI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
IsourceF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:IsourceF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
IsourceS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:IsourceS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
IsourceV(mode::Integer)  = variant(Val{:IsourceV}, mode)

LinesI(mode::Integer, arg::Integer = 0)           = ccall( (:LinesI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
LinesF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:LinesF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
LinesS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:LinesS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
LinesV(mode::Integer)  = variant(Val{:LinesV}, mode)

LoadsI(mode::Integer, arg::Integer = 0)           = ccall( (:LoadsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
LoadsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:LoadsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
LoadsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:LoadsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
LoadsV(mode::Integer)  = variant(Val{:LoadsV}, mode)

LoadShapeI(mode::Integer, arg::Integer = 0)           = ccall( (:LoadShapeI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
LoadShapeF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:LoadShapeF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
LoadShapeS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:LoadShapeS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
LoadShapeV(mode::Integer)  = variant(Val{:LoadShapeV}, mode)
# LoadShapeV(mode::Integer, arg)  = variant(Val{:LoadShapeV}, mode, arg)

MetersI(mode::Integer, arg::Integer = 0)           = ccall( (:MetersI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
MetersF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:MetersF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
MetersS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:MetersS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
MetersV(mode::Integer)  = variant(Val{:MetersV}, mode)

MonitorsI(mode::Integer, arg::Integer = 0)           = ccall( (:MonitorsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
MonitorsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:MonitorsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
MonitorsV(mode::Integer)  = variant(Val{:MonitorsV}, mode)

ParserI(mode::Integer, arg::Integer = 0)           = ccall( (:ParserI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
ParserF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:ParserF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
ParserS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:ParserS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
ParserV(mode::Integer)  = variant(Val{:ParserV}, mode)

PDElementsI(mode::Integer, arg::Integer = 0)           = ccall( (:PDElementsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
PDElementsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:PDElementsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
PDElementsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:PDElementsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))

PVsystemsI(mode::Integer, arg::Integer = 0)           = ccall( (:PVsystemsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
PVsystemsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:PVsystemsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
PVsystemsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:PVsystemsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
PVsystemsV(mode::Integer)  = variant(Val{:PVsystemsV}, mode)

ReclosersI(mode::Integer, arg::Integer = 0)           = ccall( (:ReclosersI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
ReclosersF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:ReclosersF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
ReclosersS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:ReclosersS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
ReclosersV(mode::Integer)  = variant(Val{:ReclosersV}, mode)

RegControlsI(mode::Integer, arg::Integer = 0)           = ccall( (:RegControlsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
RegControlsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:RegControlsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
RegControlsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:RegControlsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
RegControlsV(mode::Integer)  = variant(Val{:RegControlsV}, mode)

RelaysI(mode::Integer, arg::Integer = 0)           = ccall( (:RelaysI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
RelaysS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:RelaysS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
RelaysV(mode::Integer)  = variant(Val{:RelaysV}, mode)

SensorsI(mode::Integer, arg::Integer = 0)           = ccall( (:SensorsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
SensorsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:SensorsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
SensorsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:SensorsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
SensorsV(mode::Integer)  = variant(Val{:SensorsV}, mode)

SettingsI(mode::Integer, arg::Integer = 0)           = ccall( (:SettingsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
SettingsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:SettingsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
SettingsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:SettingsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
SettingsV(mode::Integer)  = variant(Val{:SettingsV}, mode)
# SettingsV(mode::Integer, arg)  = variant(Val{:SettingsV}, mode, arg)

SolutionI(mode::Integer, arg::Integer = 0)           = ccall( (:SolutionI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
SolutionF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:SolutionF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
SolutionS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:SolutionS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
SolutionV(mode::Integer)  = variant(Val{:SolutionV}, mode)

SwtControlsI(mode::Integer, arg::Integer = 0)           = ccall( (:SwtControlsI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
SwtControlsF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:SwtControlsF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
SwtControlsS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:SwtControlsS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
SwtControlsV(mode::Integer)  = variant(Val{:SwtControlsV}, mode)

TopologyI(mode::Integer, arg::Integer = 0)           = ccall( (:TopologyI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
TopologyS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:TopologyS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
TopologyV(mode::Integer)  = variant(Val{:TopologyV}, mode)

TransformersI(mode::Integer, arg::Integer = 0)           = ccall( (:TransformersI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
TransformersF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:TransformersF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
TransformersS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:TransformersS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
TransformersV(mode::Integer)  = variant(Val{:TransformersV}, mode)

VsourcesI(mode::Integer, arg::Integer = 0)           = ccall( (:VsourcesI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
VsourcesF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:VsourcesF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
VsourcesS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:VsourcesS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
VsourcesV(mode::Integer)  = variant(Val{:VsourcesV}, mode)

XYCurvesI(mode::Integer, arg::Integer = 0)           = ccall( (:XYCurvesI, dsslib), cdecl, Int32,   (Int32,Int32),   mode, arg)
XYCurvesF(mode::Integer, arg::Float64 = 0.0)           = ccall( (:XYCurvesF, dsslib), cdecl, Float64, (Int32,Float64), mode, arg)
XYCurvesS(mode::Integer, arg::AbstractString = "")    = unsafe_string(ccall( (:XYCurvesS, dsslib), cdecl, Cstring, (Int32,Cstring), mode, arg))
XYCurvesV(mode::Integer)  = variant(Val{:XYCurvesV}, mode)

"""
`getYsparse()` -- Return the system sparse Y matrix.
"""
function getYsparse()
    hY   = Ref{UInt32}(0)
    nBus = Ref{UInt32}(0)
    nNZ  = Ref{UInt32}(0)
    res = ccall( (:InitAndGetYparams, dsslib), cdecl, UInt32, (Ref{UInt32}, Ref{UInt32}, Ref{UInt32}), hY, nBus, nNZ)
    # Set up pointer references--these are all allocated on the OpenDSS side
    colptr = Ref{Ptr{UInt32}}(0) 
    rowidxptr = Ref{Ptr{UInt32}}(0) 
    cvalsptr = Ref{Ptr{Complex128}}(0) 
    jnk = ccall((:GetCompressedYMatrix, dsslib), cdecl, Void, 
          (UInt32, UInt32, UInt32, Ref{Ptr{UInt32}}, Ref{Ptr{UInt32}}, Ref{Ptr{Complex128}}), 
          hY[], nBus[], nNZ[], colptr, rowidxptr, cvalsptr)
    colidx = unsafe_wrap(Array, colptr[], nBus[] + 1)
    rowidx = unsafe_wrap(Array, rowidxptr[], nNZ[])
    cvals = unsafe_wrap(Array, cvalsptr[], nNZ[])
    Y = SparseMatrixCSC(nBus[], nBus[], [Int(x+1) for x in colidx], [Int(x+1) for x in rowidx], cvals)
end

"""
`getI()` -- Return the complex vector of current injections. 

The size of the vector is one more than the number of nodes in the system. This
is the same current injection array used in OpenDSS internally, so the current
injections can be updated for custom solutions. This could be used to implement
a custom power control component.
"""
function getI()
    Iref   = Ref{Ptr{Complex128}}(0)
    ccall( (:getIpointer, dsslib), cdecl, Void, (Ref{Ptr{Complex128}}, ), Iref)
    numnodes = CircuitI(2) + 1
    unsafe_wrap(Array, Iref[], numnodes)
end

"""
`getV()` -- Return the complex vector of node voltages. 

The size of the vector is one more than the number of nodes in the system. The
first element is ground (zero volts). This is the same voltage array
used in OpenDSS internally, so the voltages can be updated for custom solutions. 
"""
function getV()
    Vref   = Ref{Ptr{Complex128}}(0)
    ccall( (:getVpointer, dsslib), cdecl, Void, (Ref{Ptr{Complex128}}, ), Vref)
    numnodes = CircuitI(2) + 1
    unsafe_wrap(Array, Vref[], numnodes)
end

"`ZeroInjCurr()` -- Zero out the current injections vector."
ZeroInjCurr()          = ccall( (:ZeroInjCurr, dsslib), cdecl, Void, ())

"`GetSourceInjCurrents()` -- Update the current injections vector with source injections."
GetSourceInjCurrents() = ccall( (:GetSourceInjCurrents, dsslib), cdecl, Void, ())

"`GetPCInjCurr()` -- Update the current injections vector with injections from power control elements like loads."
GetPCInjCurr()         = ccall( (:GetPCInjCurr, dsslib), cdecl, Void, ())

"`SystemYChanged()` -- Bool indicating whether the system Y matrix has changed."
SystemYChanged()       = ccall( (:SystemYChanged, dsslib), cdecl, Int32, (Int32, Int32), 0, 0) == 1

"`SystemYChanged(arg)` -- Set the status of whether the system Y matrix has changed."
SystemYChanged(arg)    = ccall( (:SystemYChanged, dsslib), cdecl, Int32, (Int32, Int32), 1, arg)

"""
`BuildYMatrixD(buildops::Integer, doallocate)` -- Rebuild the system Y matrix. 

* `buildops::Integer` indicates the type of build. `0 == WHOLEMATRIX` and `1 == SERIESONLY`.
* `doallocate::Bool` is used to determine whether to allocate the Y matrix.

"""
BuildYMatrixD(BuildOps, AllocateVI) = ccall( (:BuildYMatrixD, dsslib), cdecl, Void, (Int32, Int32), BuildOps, AllocateVI)

"`UseAuxCurrents()` -- Bool indicating whether to use auxiliary currents."
UseAuxCurrents()       = ccall( (:UseAuxCurrents, dsslib), cdecl, Int32, (Int32, Int32), 0, 0) == 1

"`UseAuxCurrents(arg)` -- Set the status of whether to use auxiliary currents."
UseAuxCurrents(arg)    = ccall( (:UseAuxCurrents, dsslib), cdecl, Int32, (Int32, Int32), 1, arg)

"`UseAuxCurrents(arg)` -- ??"
AddInAuxCurrents(arg)  = ccall( (:AddInAuxCurrents, dsslib), cdecl, Void, (Int32, ), arg)

"`SolveSystem()` -- Update the system node voltages based on the vector of current injections."
SolveSystem(arg)       = ccall( (:SolveSystem, dsslib), cdecl, Int32, (Array{Complex128}, ), arg)

end # module
