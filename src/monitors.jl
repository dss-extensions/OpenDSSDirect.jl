module Monitors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of doubles for the specified channel  (usage: MyArray = DSSMonitor.Channel(i)) A Save or SaveAll  should be executed first. Done automatically by most standard solution modes."""
function Channel(Index::Int)::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_Channel, Index)
end

function Process()
    @checked Lib.Monitors_Process()
end

function ProcessAll()
    @checked Lib.Monitors_ProcessAll()
end

function Reset()
    @checked Lib.Monitors_Reset()
end

function ResetAll()
    @checked Lib.Monitors_ResetAll()
end

function Sample()
    @checked Lib.Monitors_Sample()
end

function SampleAll()
    @checked Lib.Monitors_SampleAll()
end

function Save()
    @checked Lib.Monitors_Save()
end

function SaveAll()
    @checked Lib.Monitors_SaveAll()
end

function Show()
    @checked Lib.Monitors_Show()
end

"""(read-only) Array of all Monitor Names"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Monitors_Get_AllNames)
end

"""(read-only) Byte Array containing monitor stream values. Make sure a "save" is done first (standard solution modes do this automatically)"""
function ByteStream()::Vector{Int8}
    result = get_int8_array(Lib.Monitors_Get_ByteStream)
    if result == [0]
        return []
    end

    return result
end

"""(read-only) Number of Monitors"""
function Count()::Int
    return @checked Lib.Monitors_Get_Count()
end

"""Full object name of element being monitored."""
function Element()::String
    result = get_string(Lib.Monitors_Get_Element())
    return result
end

"""Full object name of element being monitored."""
function Element(Value::String)
    @checked Lib.Monitors_Set_Element(Cstring(pointer(Value)))
end

"""(read-only) Name of CSV file associated with active Monitor."""
function FileName()::String
    return get_string(@checked Lib.Monitors_Get_FileName())
end

"""(read-only) Monitor File Version (integer)"""
function FileVersion()::Int
    return @checked Lib.Monitors_Get_FileVersion()
end

"""(read-only) Sets the first Monitor active.  Returns 0 if no monitors."""
function First()::Int
    return @checked Lib.Monitors_Get_First()
end

"""(read-only) Header string;  Array of strings containing Channel names"""
function Header()::Vector{String}
    return get_string_array(Lib.Monitors_Get_Header)
end

"""Set Monitor mode (bitmask integer - see DSS Help)"""
function Mode()::Union{UInt32,Lib.MonitorModes}
    result = @checked Lib.Monitors_Get_Mode()
    try
        return convert(Lib.MonitorModes, result)
    catch
        return result
    end
end

"""Set Monitor mode (bitmask integer - see DSS Help)"""
function Mode(Value::Union{Int,UInt32,Lib.MonitorModes})
    # Value = convert(Lib.MonitorModes, Value)
    @checked Lib.Monitors_Set_Mode(Value)
end

"""Sets the active Monitor object by name"""
function Name()::String
    return get_string(@checked Lib.Monitors_Get_Name())
end

"""Sets the active Monitor object by name"""
function Name(Value::String)
    @checked Lib.Monitors_Set_Name(Cstring(pointer(Value)))
end

"""(read-only) Sets next monitor active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.Monitors_Get_Next()
end

"""(read-only) Number of Channels in the active Monitor"""
function NumChannels()::Int
    return @checked Lib.Monitors_Get_NumChannels()
end

"""(read-only) Size of each record in ByteStream (Integer). Same as NumChannels."""
function RecordSize()::Int
    return @checked Lib.Monitors_Get_RecordSize()
end

"""(read-only) Number of Samples in Monitor at Present"""
function SampleCount()::Int
    return @checked Lib.Monitors_Get_SampleCount()
end

"""Terminal number of element being monitored."""
function Terminal()::Int
    return @checked Lib.Monitors_Get_Terminal()
end

"""Terminal number of element being monitored."""
function Terminal(Value::Int)
    @checked Lib.Monitors_Set_Terminal(Value)
end

"""(read-only) Array of doubles containing frequency values for harmonics mode solutions; Empty for time mode solutions (use dblHour)"""
function DblFreq()::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_dblFreq)
end

"""(read-only) Array of doubles containing time value in hours for time-sampled monitor values; Empty if frequency-sampled values for harmonics solution  (see dblFreq)"""
function DblHour()::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_dblHour)
end

"""Monitor Index (Getter)"""
function Idx()::Int
    return @checked Lib.Monitors_Get_idx()
end

"""Monitor Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.Monitors_Set_idx(Value)
end

end
