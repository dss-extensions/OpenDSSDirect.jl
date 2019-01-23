module Monitors

    using ..lib
    using ..utils

    """(read-only) Array of doubles for the specified channel  (usage: MyArray = DSSMonitor.Channel(i)) A Save or SaveAll  should be executed first. Done automatically by most standard solution modes."""
    function Channel(Index)
        return get_float64_array(lib.Monitors_Get_Channel, Index)
    end

    function Process()
        lib.Monitors_Process()
    end

    function ProcessAll()
        lib.Monitors_ProcessAll()
    end

    function Reset()
        lib.Monitors_Reset()
    end

    function ResetAll()
        lib.Monitors_ResetAll()
    end

    function Sample()
        lib.Monitors_Sample()
    end

    function SampleAll()
        lib.Monitors_SampleAll()
    end

    function Save()
        lib.Monitors_Save()
    end

    function SaveAll()
        lib.Monitors_SaveAll()
    end

    function Show()
        lib.Monitors_Show()
    end

    """(read-only) Array of all Monitor Names"""
    function AllNames()
        return get_string_array(lib.Monitors_Get_AllNames)
    end

    """(read-only) Byte Array containing monitor stream values. Make sure a "save" is done first (standard solution modes do this automatically)"""
    function ByteStream()
        result = get_int8_array(lib.Monitors_Get_ByteStream)
        if result == [0]
            return []
        end

        return result
    end

    """(read-only) Number of Monitors"""
    function Count()
        return lib.Monitors_Get_Count()
    end

    """Full object name of element being monitored."""
    function Element()
        result = get_string(lib.Monitors_Get_Element())
        if result == "":
            return "0"
        end

        return result
    end

    """Full object name of element being monitored."""
    function Element(Value)
        lib.Monitors_Set_Element(Cstring(pointer(Value)))
    end

    """(read-only) Name of CSV file associated with active Monitor."""
    function FileName()
        return get_string(lib.Monitors_Get_FileName())
    end

    """(read-only) Monitor File Version (integer)"""
    function FileVersion()
        return lib.Monitors_Get_FileVersion()
    end

    """(read-only) Sets the first Monitor active.  Returns 0 if no monitors."""
    function First()
        return lib.Monitors_Get_First()
    end

    """(read-only) Header string;  Array of strings containing Channel names"""
    function Header()
        return get_string_array(lib.Monitors_Get_Header)
    end

    """Set Monitor mode (bitmask integer - see DSS Help)"""
    function Mode()
        return lib.Monitors_Get_Mode()
    end

    """Set Monitor mode (bitmask integer - see DSS Help)"""
    function Mode(Value)
        lib.Monitors_Set_Mode(Value)
    end

    """Sets the active Monitor object by name"""
    function Name()
        return get_string(lib.Monitors_Get_Name())
    end

    """Sets the active Monitor object by name"""
    function Name(Value)
        lib.Monitors_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Sets next monitor active.  Returns 0 if no more."""
    function Next()
        return lib.Monitors_Get_Next()
    end

    """(read-only) Number of Channels in the active Monitor"""
    function NumChannels()
        return lib.Monitors_Get_NumChannels()
    end

    """(read-only) Size of each record in ByteStream (Integer). Same as NumChannels."""
    function RecordSize()
        return lib.Monitors_Get_RecordSize()
    end

    """(read-only) Number of Samples in Monitor at Present"""
    function SampleCount()
        return lib.Monitors_Get_SampleCount()
    end

    """Terminal number of element being monitored."""
    function Terminal()
        return lib.Monitors_Get_Terminal()
    end

    """Terminal number of element being monitored."""
    function Terminal(Value)
        lib.Monitors_Set_Terminal(Value)
    end

    """(read-only) Array of doubles containing frequency values for harmonics mode solutions; Empty for time mode solutions (use dblHour)"""
    function dblFreq()
        return get_float64_array(lib.Monitors_Get_dblFreq)
    end

    """(read-only) Array of doubles containgin time value in hours for time-sampled monitor values; Empty if frequency-sampled values for harmonics solution  (see dblFreq)"""
    function dblHour()
        return get_float64_array(lib.Monitors_Get_dblHour)
    end

end

