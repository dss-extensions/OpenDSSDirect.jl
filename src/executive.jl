module Executive

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Get i-th command"""
function Command(i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_Command(C_NULL_CTX, i))
end

"""Get help string for i-th command"""
function CommandHelp(i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_CommandHelp(C_NULL_CTX, i))
end

"""Get i-th option"""
function Option(i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_Option(C_NULL_CTX, i))
end

"""Get help string for i-th option"""
function OptionHelp(i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_OptionHelp(C_NULL_CTX, i))
end

"""Get present value of i-th option"""
function OptionValue(i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_OptionValue(C_NULL_CTX, i))
end

"""Number of DSS Executive Commands"""
function NumCommands()::Int
    return @checked Lib.DSS_Executive_Get_NumCommands(C_NULL_CTX)
end

"""Number of DSS Executive Options"""
function NumOptions()::Int
    return @checked Lib.DSS_Executive_Get_NumOptions(C_NULL_CTX)
end

end
