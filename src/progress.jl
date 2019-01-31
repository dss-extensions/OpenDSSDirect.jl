
module Progress

    using ..Lib

    function Close()
        Lib.DSSProgress_Close()
    end

    function Show()
        Lib.DSSProgress_Show()
    end

    """(write-only) Caption to appear on the bottom of the DSS Progress form."""
    function Caption(Value::String)
        Lib.DSSProgress_Set_Caption(Value)
    end

    """(write-only) Percent progress to indicate [0..100]"""
    function PctProgress(Value::Int)
        Lib.DSSProgress_Set_PctProgress(Value)
    end

end

