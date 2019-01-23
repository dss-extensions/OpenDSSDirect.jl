module Executive

    using ..lib
    using ..utils

    """(read-only) Get i-th command"""
    function Command(i)
        return get_string(lib.DSS_Executive_Get_Command(i))
    end

    """(read-only) Get help string for i-th command"""
    function CommandHelp(i)
        return get_string(lib.DSS_Executive_Get_CommandHelp(i))
    end

    """(read-only) Get i-th option"""
    function Option(i)
        return get_string(lib.DSS_Executive_Get_Option(i))
    end

    """(read-only) Get help string for i-th option"""
    function OptionHelp(i)
        return get_string(lib.DSS_Executive_Get_OptionHelp(i))
    end

    """(read-only) Get present value of i-th option"""
    function OptionValue(i)
        return get_string(lib.DSS_Executive_Get_OptionValue(i))
    end

    """(read-only) Number of DSS Executive Commands"""
    function NumCommands()
        return lib.DSS_Executive_Get_NumCommands()
    end

    """(read-only) Number of DSS Executive Options"""
    function NumOptions()
        return lib.DSS_Executive_Get_NumOptions()
    end

end

