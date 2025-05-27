module Spectrum
using ..Enums.SetterFlags: SetterFlagsT
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Spectrum"
const _cls_idx = 8

module _PropertyIndex
const NumHarm = Int32(1)
const Harmonic = Int32(2)
const pctMag = Int32(3)
const Angle = Int32(4)
const CSVFile = Int32(5)
const Like = Int32(6)
end

struct SpectrumObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export SpectrumObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = SpectrumObj(ptr, dss)
const Obj = SpectrumObj

function Base.show(io::IO, obj::SpectrumObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of frequencies in this spectrum. (See CSVFile)

Name: `NumHarm`

(Getter)
"""
function NumHarm(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NumHarm)
end

"""
Number of frequencies in this spectrum. (See CSVFile)

Name: `NumHarm`

(Setter)
"""
function NumHarm(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NumHarm, value, flags)
end

"""
Array of harmonic values. You can also use the syntax
harmonic = (file=filename)     !for text file one value per line
harmonic = (dblfile=filename)  !for packed file of doubles
harmonic = (sngfile=filename)  !for packed file of singles 

Name: `Harmonic`

(Getter)
"""
function Harmonic(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Harmonic)
end

"""
Array of harmonic values. You can also use the syntax
harmonic = (file=filename)     !for text file one value per line
harmonic = (dblfile=filename)  !for packed file of doubles
harmonic = (sngfile=filename)  !for packed file of singles 

Name: `Harmonic`

(Setter)
"""
function Harmonic(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Harmonic, value, flags)
end

"""
Array of magnitude values, assumed to be in PERCENT. You can also use the syntax
%mag = (file=filename)     !for text file one value per line
%mag = (dblfile=filename)  !for packed file of doubles
%mag = (sngfile=filename)  !for packed file of singles 

Name: `%Mag`

(Getter)
"""
function pctMag(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.pctMag)
end

"""
Array of magnitude values, assumed to be in PERCENT. You can also use the syntax
%mag = (file=filename)     !for text file one value per line
%mag = (dblfile=filename)  !for packed file of doubles
%mag = (sngfile=filename)  !for packed file of singles 

Name: `%Mag`

(Setter)
"""
function pctMag(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.pctMag, value, flags)
end

"""
Array of phase angle values, degrees.You can also use the syntax
angle = (file=filename)     !for text file one value per line
angle = (dblfile=filename)  !for packed file of doubles
angle = (sngfile=filename)  !for packed file of singles 

Name: `Angle`

(Getter)
"""
function Angle(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Angle)
end

"""
Array of phase angle values, degrees.You can also use the syntax
angle = (file=filename)     !for text file one value per line
angle = (dblfile=filename)  !for packed file of doubles
angle = (sngfile=filename)  !for packed file of singles 

Name: `Angle`

(Setter)
"""
function Angle(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Angle, value, flags)
end

"""
File of spectrum points with (harmonic, magnitude-percent, angle-degrees) values, one set of 3 per line, in CSV format. If fewer than NUMHARM frequencies found in the file, NUMHARM is set to the smaller value.

Name: `CSVFile`

(Getter)
"""
function CSVFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CSVFile)
end

"""
File of spectrum points with (harmonic, magnitude-percent, angle-degrees) values, one set of 3 per line, in CSV format. If fewer than NUMHARM frequencies found in the file, NUMHARM is set to the smaller value.

Name: `CSVFile`

(Setter)
"""
function CSVFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CSVFile, value, flags)
end

"""
Make like another object, e.g.:

New Capacitor.C2 like=c1  ...

**Deprecated:** `Like` has been deprecated since at least 2021, see https://sourceforge.net/p/electricdss/discussion/861977/thread/8b59d21eb6/#b57c/f668

Name: `Like`
"""
function Like(obj::Obj, value::String)
    obj_set_str(obj, _PropertyIndex.Like, value)
end

end # module Spectrum
export Spectrum
