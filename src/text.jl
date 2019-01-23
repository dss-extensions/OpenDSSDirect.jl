module Text

    using ..lib
    using ..utils

    """Input command string for the DSS. (Getter)"""
    function Command()::String
        get_string(lib.Text_Get_Command())
    end

    """Input command string for the DSS. (Setter)"""
    function Command(Value::String)::String
        lib.Text_Set_Command(Cstring(pointer(Value)))
        return ""
        # lib.CheckForError()
    end


    """(read-only) Result string for the last command."""
    function Result()
        get_string(lib.Text_Get_Result())
    end

end

