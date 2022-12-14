module SwtControls

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Reset SWT controls"""
function Reset()
    @checked Lib.SwtControls_Reset(C_NULL_CTX)
end

"""Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state). (Getter)"""
function Action()::Lib.ActionCodes
    return @checked Lib.SwtControls_Get_Action(C_NULL_CTX)
end

"""Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state). (Setter)"""
function Action(Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked Lib.SwtControls_Set_Action(C_NULL_CTX, Value)
end

"""Array of strings with all SwtControl names in the active circuit."""
function AllNames()::Vector{String}
    return get_string_array(Lib.SwtControls_Get_AllNames, C_NULL_CTX)
end

function Count()::Int
    return @checked Lib.SwtControls_Get_Count(C_NULL_CTX)
end

"""Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch. (Getter)"""
function Delay()::Float64
    return @checked Lib.SwtControls_Get_Delay(C_NULL_CTX)
end

"""Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch. (Setter)"""
function Delay(Value::Float64)
    @checked Lib.SwtControls_Set_Delay(C_NULL_CTX, Value)
end

"""Sets the first SwtControl active. Returns 0 if no more."""
function First()::Int
    return @checked Lib.SwtControls_Get_First(C_NULL_CTX)
end

"""The lock prevents both manual and automatic switch operation. (Getter)"""
function IsLocked()::Bool
    return @checked(Lib.SwtControls_Get_IsLocked(C_NULL_CTX)) != 0
end

"""The lock prevents both manual and automatic switch operation. (Setter)"""
function IsLocked(Value::Bool)
    @checked Lib.SwtControls_Set_IsLocked(C_NULL_CTX, Value ? 1 : 0)
end

"""Sets a SwtControl active by Name. (Getter)"""
function Name()::String
    return get_string(@checked Lib.SwtControls_Get_Name(C_NULL_CTX))
end

"""Sets a SwtControl active by Name. (Setter)"""
function Name(Value::String)
    @checked Lib.SwtControls_Set_Name(C_NULL_CTX, Value)
end

"""Sets the next SwtControl active. Returns 0 if no more."""
function Next()::Int
    return @checked Lib.SwtControls_Get_Next(C_NULL_CTX)
end

"""Normal state of switch (Getter)"""
function NormalState()::Lib.ActionCodes
    return @checked Lib.SwtControls_Get_NormalState(C_NULL_CTX)
end

"""Normal state of switch (Setter)"""
function NormalState(Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked Lib.SwtControls_Set_NormalState(C_NULL_CTX, Value)
end

"""State of switch (Getter)"""
function State()::Lib.ActionCodes
    return @checked Lib.SwtControls_Get_State(C_NULL_CTX)
end

"""State of switch (Setter)"""
function State(Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked Lib.SwtControls_Set_State(C_NULL_CTX, Value)
end

"""Full name of the switched element. (Getter)"""
function SwitchedObj()::String
    return get_string(@checked Lib.SwtControls_Get_SwitchedObj(C_NULL_CTX))
end

"""Full name of the switched element. (Setter)"""
function SwitchedObj(Value::String)
    @checked Lib.SwtControls_Set_SwitchedObj(C_NULL_CTX, Value)
end

"""Terminal number where the switch is located on the SwitchedObj (Getter)"""
function SwitchedTerm()::Int
    return @checked Lib.SwtControls_Get_SwitchedTerm(C_NULL_CTX)
end

"""Terminal number where the switch is located on the SwitchedObj (Setter)"""
function SwitchedTerm(Value::Int)
    @checked Lib.SwtControls_Set_SwitchedTerm(C_NULL_CTX, Value)
end

"""SwtControl Index (Getter)"""
function Idx()::Int
    return @checked Lib.SwtControls_Get_idx(C_NULL_CTX)
end

"""SwtControl Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.SwtControls_Set_idx(C_NULL_CTX, Value)
end

end
