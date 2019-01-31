module Executive

    using ..Lib
    using ..Utils

    """(read-only) Get i-th command"""
    function Command(i::Int)::String
        return get_string(Lib.DSS_Executive_Get_Command(i))
    end

    """(read-only) Get help string for i-th command"""
    function CommandHelp(i::Int)::String
        return get_string(Lib.DSS_Executive_Get_CommandHelp(i))
    end

    """(read-only) Get i-th option"""
    function Option(i::Int)::String
        return get_string(Lib.DSS_Executive_Get_Option(i))
    end

    """(read-only) Get help string for i-th option"""
    function OptionHelp(i::Int)::String
        return get_string(Lib.DSS_Executive_Get_OptionHelp(i))
    end

    """(read-only) Get present value of i-th option"""
    function OptionValue(i::Int)::String
        return get_string(Lib.DSS_Executive_Get_OptionValue(i))
    end

    """(read-only) Number of DSS Executive Commands"""
    function NumCommands()::Int
        return Lib.DSS_Executive_Get_NumCommands()
    end

    """(read-only) Number of DSS Executive Options"""
    function NumOptions()::Int
        return Lib.DSS_Executive_Get_NumOptions()
    end

end

