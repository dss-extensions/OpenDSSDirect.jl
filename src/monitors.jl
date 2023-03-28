module Monitors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of doubles for the specified channel  (usage: MyArray = DSSMonitor.Channel(i)) A Save or SaveAll  should be executed first. Done automatically by most standard solution modes."""
function Channel(dss::DSSContext, Index::Int)::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_Channel, dss.ctx, Index)
end
Channel(Index::Int) = Channel(DSS_DEFAULT_CTX, Index)

function Process(dss::DSSContext)
    @checked Lib.Monitors_Process(dss.ctx)
end
Process() = Process(DSS_DEFAULT_CTX)

function ProcessAll(dss::DSSContext)
    @checked Lib.Monitors_ProcessAll(dss.ctx)
end
ProcessAll() = ProcessAll(DSS_DEFAULT_CTX)

function Reset(dss::DSSContext)
    @checked Lib.Monitors_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

function ResetAll(dss::DSSContext)
    @checked Lib.Monitors_ResetAll(dss.ctx)
end
ResetAll() = ResetAll(DSS_DEFAULT_CTX)

function Sample(dss::DSSContext)
    @checked Lib.Monitors_Sample(dss.ctx)
end
Sample() = Sample(DSS_DEFAULT_CTX)

function SampleAll(dss::DSSContext)
    @checked Lib.Monitors_SampleAll(dss.ctx)
end
SampleAll() = SampleAll(DSS_DEFAULT_CTX)

function Save(dss::DSSContext)
    @checked Lib.Monitors_Save(dss.ctx)
end
Save() = Save(DSS_DEFAULT_CTX)

function SaveAll(dss::DSSContext)
    @checked Lib.Monitors_SaveAll(dss.ctx)
end
SaveAll() = SaveAll(DSS_DEFAULT_CTX)

function Show(dss::DSSContext)
    @checked Lib.Monitors_Show(dss.ctx)
end
Show() = Show(DSS_DEFAULT_CTX)

"""(read-only) Array of all Monitor Names"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Monitors_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""(read-only) Byte Array containing monitor stream values. Make sure a "save" is done first (standard solution modes do this automatically)"""
function ByteStream(dss::DSSContext)::Vector{Int8}
    result = get_int8_array(Lib.Monitors_Get_ByteStream, dss.ctx)
    if result == [0]
        return []
    end

    return result
end
ByteStream() = ByteStream(DSS_DEFAULT_CTX)

"""(read-only) Number of Monitors"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Full object name of element being monitored."""
function Element(dss::DSSContext)::String
    result = get_string(Lib.Monitors_Get_Element(dss.ctx))
    return result
end
Element() = Element(DSS_DEFAULT_CTX)

"""Full object name of element being monitored."""
function Element(dss::DSSContext, Value::String)
    @checked Lib.Monitors_Set_Element(dss.ctx, Cstring(pointer(Value)))
end
Element(Value::String) = Element(DSS_DEFAULT_CTX, Value)

"""(read-only) Name of CSV file associated with active Monitor."""
function FileName(dss::DSSContext)::String
    return get_string(@checked Lib.Monitors_Get_FileName(dss.ctx))
end
FileName() = FileName(DSS_DEFAULT_CTX)

"""(read-only) Monitor File Version (integer)"""
function FileVersion(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_FileVersion(dss.ctx)
end
FileVersion() = FileVersion(DSS_DEFAULT_CTX)

"""(read-only) Sets the first Monitor active.  Returns 0 if no monitors."""
function First(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""(read-only) Header string;  Array of strings containing Channel names"""
function Header(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Monitors_Get_Header, dss.ctx)
end
Header() = Header(DSS_DEFAULT_CTX)

"""Set Monitor mode (bitmask integer - see DSS Help)"""
function Mode(dss::DSSContext)::Union{UInt32,Lib.MonitorModes}
    result = @checked Lib.Monitors_Get_Mode(dss.ctx)
    try
        return convert(Lib.MonitorModes, result)
    catch
        return result
    end
end
Mode() = Mode(DSS_DEFAULT_CTX)

"""Set Monitor mode (bitmask integer - see DSS Help)"""
function Mode(dss::DSSContext, Value::Union{Int,UInt32,Lib.MonitorModes})
    # Value = convert(Lib.MonitorModes, Value)
    @checked Lib.Monitors_Set_Mode(dss.ctx, Value)
end
Mode(Value::Union{Int,UInt32,Lib.MonitorModes}) = Mode(DSS_DEFAULT_CTX, Value)

"""Sets the active Monitor object by name"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Monitors_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets the active Monitor object by name"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Monitors_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""(read-only) Sets next monitor active.  Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""(read-only) Number of Channels in the active Monitor"""
function NumChannels(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_NumChannels(dss.ctx)
end
NumChannels() = NumChannels(DSS_DEFAULT_CTX)

"""(read-only) Size of each record in ByteStream (Integer). Same as NumChannels."""
function RecordSize(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_RecordSize(dss.ctx)
end
RecordSize() = RecordSize(DSS_DEFAULT_CTX)

"""(read-only) Number of Samples in Monitor at Present"""
function SampleCount(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_SampleCount(dss.ctx)
end
SampleCount() = SampleCount(DSS_DEFAULT_CTX)

"""Terminal number of element being monitored."""
function Terminal(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_Terminal(dss.ctx)
end
Terminal() = Terminal(DSS_DEFAULT_CTX)

"""Terminal number of element being monitored."""
function Terminal(dss::DSSContext, Value::Int)
    @checked Lib.Monitors_Set_Terminal(dss.ctx, Value)
end
Terminal(Value::Int) = Terminal(DSS_DEFAULT_CTX, Value)

"""(read-only) Array of doubles containing frequency values for harmonics mode solutions; Empty for time mode solutions (use dblHour)"""
function DblFreq(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_dblFreq, dss.ctx)
end
DblFreq() = DblFreq(DSS_DEFAULT_CTX)

"""(read-only) Array of doubles containing time value in hours for time-sampled monitor values; Empty if frequency-sampled values for harmonics solution  (see dblFreq)"""
function DblHour(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_dblHour, dss.ctx)
end
DblHour() = DblHour(DSS_DEFAULT_CTX)

"""Monitor Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Monitor Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Monitors_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

end
