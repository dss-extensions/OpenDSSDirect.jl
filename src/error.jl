module Error

    using ..lib
    using ..utils

    """(read-only) Description of error for last operation"""
    function Description()
        return get_string(lib.Error_Get_Description())
    end

    """(read-only) Error Number"""
    function Number()
        return lib.Error_Get_Number()
    end

end

