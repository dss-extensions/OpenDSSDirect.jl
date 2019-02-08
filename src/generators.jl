module Generators

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Array of names of all Generator objects."""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.Generators_Get_AllNames)
    end

    """Number of Generator Objects in Active Circuit"""
    function Count()::Int
        return Lib.Generators_Get_Count()
    end

    """Sets first Generator to be active.  Returns 0 if none."""
    function First()::Int
        return Lib.Generators_Get_First()
    end

    """Indicates whether the generator is forced ON regardles of other dispatch criteria."""
    function ForcedON()::Bool
        return Lib.Generators_Get_ForcedON() != 0
    end

    """Indicates whether the generator is forced ON regardles of other dispatch criteria."""
    function ForcedON(Value::Bool)
        Lib.Generators_Set_ForcedON(Value ? 1 : 0)
    end

    """Generator Model"""
    function Model()::Int
        return Lib.Generators_Get_Model()
    end

    """Generator Model"""
    function Model(Value::Int)
        Lib.Generators_Set_Model(Value)
    end

    """Sets a generator active by name."""
    function Name()::String
        return Utils.get_string(Lib.Generators_Get_Name())
    end

    """Sets a generator active by name."""
    function Name(Value::String)
        Lib.Generators_Set_Name(Cstring(pointer(Value)))
    end

    """Sets next Generator to be active.  Returns 0 if no more."""
    function Next()::Int
        return Lib.Generators_Get_Next()
    end

    """Power factor (pos. = producing vars). Updates kvar based on present kW value."""
    function PF()::Float64
        return Lib.Generators_Get_PF()
    end

    """Power factor (pos. = producing vars). Updates kvar based on present kW value."""
    function PF(Value::Float64)
        Lib.Generators_Set_PF(Value)
    end

    """Number of phases"""
    function Phases()::Int
        return Lib.Generators_Get_Phases()
    end

    """Number of phases"""
    function Phases(Value::Int)
        Lib.Generators_Set_Phases(Value)
    end

    """Array of Names of all generator energy meter registers"""
    function RegisterNames()::Vector{String}
        return Utils.get_string_array(Lib.Generators_Get_RegisterNames)
    end

    """Array of valus in generator energy meter registers."""
    function RegisterValues()::Vector{Float64}
        return Utils.get_float64_array(Lib.Generators_Get_RegisterValues)
    end

    """Vmaxpu for generator model"""
    function Vmaxpu()::Float64
        return Lib.Generators_Get_Vmaxpu()
    end

    """Vmaxpu for generator model"""
    function Vmaxpu(Value::Float64)
        Lib.Generators_Set_Vmaxpu(Value)
    end

    """Vminpu for Generator model"""
    function Vminpu()::Float64
        return Lib.Generators_Get_Vminpu()
    end

    """Vminpu for Generator model"""
    function Vminpu(Value::Float64)
        Lib.Generators_Set_Vminpu(Value)
    end

    """Active Generator by index into generators list.  1..Count (Getter)"""
    function Idx()::Int
        return Lib.Generators_Get_idx()
    end

    """Active Generator by index into generators list.  1..Count (Setter)"""
    function Idx(Value::Int)
        Lib.Generators_Set_idx(Value)
    end

    """Voltage base for the active generator, kV (Getter)"""
    function kV()::Float64
        return Lib.Generators_Get_kV()
    end

    """Voltage base for the active generator, kV (Setter)"""
    function kV(Value::Float64)
        Lib.Generators_Set_kV(Value)
    end

    """kVA rating of the generator (Getter)"""
    function kVARated()::Float64
        return Lib.Generators_Get_kVArated()
    end

    """kVA rating of the generator (Setter)"""
    function kVARated(Value::Float64)
        Lib.Generators_Set_kVArated(Value)
    end

    """kW output for the active generator. kvar is updated for current power factor. (Getter)"""
    function kW()::Float64
        return Lib.Generators_Get_kW()
    end

    """kW output for the active generator. kvar is updated for current power factor. (Setter)"""
    function kW(Value::Float64)
        Lib.Generators_Set_kW(Value)
    end

    """kvar output for the active generator. Updates power factor based on present kW value. (Getter)"""
    function kvar()::Float64
        return Lib.Generators_Get_kvar()
    end

    """kvar output for the active generator. Updates power factor based on present kW value. (Setter)"""
    function kvar(Value::Float64)
        Lib.Generators_Set_kvar(Value)
    end

end

