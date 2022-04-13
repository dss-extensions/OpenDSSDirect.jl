
module Vsources

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Names of all Vsource objects in the circuit"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Vsources_Get_AllNames)
end

"""Phase angle of first phase in degrees (Getter)"""
function AngleDeg()::Float64
    return @checked Lib.Vsources_Get_AngleDeg()
end

"""Phase angle of first phase in degrees (Setter)"""
function AngleDeg(Value::Float64)
    @checked Lib.Vsources_Set_AngleDeg(Value)
end

"""Source voltage in kV (Getter)"""
function BasekV()::Float64
    return @checked Lib.Vsources_Get_BasekV()
end

"""Source voltage in kV (Setter)"""
function BasekV(Value::Float64)
    @checked Lib.Vsources_Set_BasekV(Value)
end

"""Number of Vsource Object"""
function Count()::Int
    return @checked Lib.Vsources_Get_Count()
end

"""Sets the first VSOURCE to be active; Returns 0 if none"""
function First()::Int
    return @checked Lib.Vsources_Get_First()
end

"""Source frequency in Hz (Getter)"""
function Frequency()::Float64
    return @checked Lib.Vsources_Get_Frequency()
end

"""Source frequency in Hz (Setter)"""
function Frequency(Value::Float64)
    @checked Lib.Vsources_Set_Frequency(Value)
end

"""Active VSOURCE name (Getter)"""
function Name()::String
    return get_string(@checked Lib.Vsources_Get_Name())
end

"""Active VSOURCE name (Setter)"""
function Name(Value::String)
    @checked Lib.Vsources_Set_Name(Value)
end

"""Sets the next VSOURCE object to be active; returns zero if no more"""
function Next()::Int
    return @checked Lib.Vsources_Get_Next()
end

"""Number of phases (Getter)"""
function Phases()::Int
    return @checked Lib.Vsources_Get_Phases()
end

"""Number of phases (Setter)"""
function Phases(Value::Int)
    @checked Lib.Vsources_Set_Phases(Value)
end

"""Source pu voltage. (Getter)"""
function PU()::Float64
    return @checked Lib.Vsources_Get_pu()
end

"""Source pu voltage. (Setter)"""
function PU(Value::Float64)
    @checked Lib.Vsources_Set_pu(Value)
end

"""VSOURCE Index (Getter)"""
function Idx()::Int
    return @checked Lib.Vsources_Get_idx()
end

"""VSOURCE Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.Vsources_Set_idx(Value)
end

end
