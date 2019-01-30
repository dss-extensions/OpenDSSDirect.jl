
module Progress

    using ..lib

    function Close()
        lib.DSSProgress_Close()
    end

    function Show()
        lib.DSSProgress_Show()
    end

    """(write-only) Caption to appear on the bottom of the DSS Progress form."""
    function Caption(Value::String)
        lib.DSSProgress_Set_Caption(Value)
    end

    """(write-only) Percent progress to indicate [0..100]"""
    function PctProgress(Value::Int)
        lib.DSSProgress_Set_PctProgress(Value)
    end

end

