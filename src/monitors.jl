module Monitors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Monitor objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Monitors_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Monitor object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Monitors_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Monitor object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Monitors_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Monitor Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Monitor to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Monitor to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Monitor (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Monitor by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Monitors_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Array of float64 for the specified channel (usage: MyArray = DSSMonitor.Channel(i)).
A Save or SaveAll should be executed first. Done automatically by most standard solution modes.
Channels start at index 1.

Original COM help: https://opendss.epri.com/Channel.html
"""
function Channel(dss::DSSContext, Index::Int)::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_Channel, dss.ctx, Index)
end
Channel(Index::Int) = Channel(DSS_DEFAULT_CTX, Index)

"""
Post-process monitor samples taken so far, e.g., Pst for mode=4.

Original COM help: https://opendss.epri.com/Process.html
"""
function Process(dss::DSSContext)
    @checked Lib.Monitors_Process(dss.ctx)
end
Process() = Process(DSS_DEFAULT_CTX)

"""
Post-process all monitor samples taken so far, e.g., Pst for mode=4.

Original COM help: https://opendss.epri.com/ProcessAll.html
"""
function ProcessAll(dss::DSSContext)
    @checked Lib.Monitors_ProcessAll(dss.ctx)
end
ProcessAll() = ProcessAll(DSS_DEFAULT_CTX)

"""
Reset active Monitor object.

Original COM help: https://opendss.epri.com/Reset3.html
"""
function Reset(dss::DSSContext)
    @checked Lib.Monitors_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""
Reset all Monitor objects.

Original COM help: https://opendss.epri.com/ResetAll1.html
"""
function ResetAll(dss::DSSContext)
    @checked Lib.Monitors_ResetAll(dss.ctx)
end
ResetAll() = ResetAll(DSS_DEFAULT_CTX)

"""
Instruct the active Monitor to take a sample of the present state.

Original COM help: https://opendss.epri.com/Sample2.html
"""
function Sample(dss::DSSContext)
    @checked Lib.Monitors_Sample(dss.ctx)
end
Sample() = Sample(DSS_DEFAULT_CTX)

"""
Instruct all Monitor objects to take a sample of the present state.

Original COM help: https://opendss.epri.com/SampleAll1.html
"""
function SampleAll(dss::DSSContext)
    @checked Lib.Monitors_SampleAll(dss.ctx)
end
SampleAll() = SampleAll(DSS_DEFAULT_CTX)

"""
Instructs the active monitor to save its current sample buffer to its monitor stream.

After the data is on the stream, you can access the ByteStream or channel data.

**Most standard solution modes do this automatically.**

Original COM help: https://opendss.epri.com/Save1.html
"""
function Save(dss::DSSContext)
    @checked Lib.Monitors_Save(dss.ctx)
end
Save() = Save(DSS_DEFAULT_CTX)

"""
Instructs the all monitor objects to save their current sample buffers to the respective monitor streams.

**Most standard solution modes do this automatically.**

Original COM help: https://opendss.epri.com/SaveAll1.html
"""
function SaveAll(dss::DSSContext)
    @checked Lib.Monitors_SaveAll(dss.ctx)
end
SaveAll() = SaveAll(DSS_DEFAULT_CTX)

"""
Convert the monitor data to text and displays it with the text editor.

Original COM help: https://opendss.epri.com/Show3.html
"""
function Show(dss::DSSContext)
    @checked Lib.Monitors_Show(dss.ctx)
end
Show() = Show(DSS_DEFAULT_CTX)

"""
Byte Array containing monitor stream values. Make sure a "save" is done first (standard solution modes do this automatically)

Original COM help: https://opendss.epri.com/ByteStream.html
"""
function ByteStream(dss::DSSContext)::Vector{Int8}
    return get_int8_array(Lib.Monitors_Get_ByteStream, dss.ctx)
end
ByteStream() = ByteStream(DSS_DEFAULT_CTX)

"""
Full object name of element being monitored.

Original COM help: https://opendss.epri.com/Element.html

(Getter)
"""
function Element(dss::DSSContext)::String
    result = get_string(Lib.Monitors_Get_Element(dss.ctx))
    return result
end
Element() = Element(DSS_DEFAULT_CTX)

"""
Full object name of element being monitored.

Original COM help: https://opendss.epri.com/Element.html

(Setter)
"""
function Element(dss::DSSContext, Value::String)
    @checked Lib.Monitors_Set_Element(dss.ctx, Cstring(pointer(Value)))
end
Element(Value::String) = Element(DSS_DEFAULT_CTX, Value)

"""
Name of CSV file associated with active Monitor.

Original COM help: https://opendss.epri.com/FileName.html
"""
function FileName(dss::DSSContext)::String
    return get_string(@checked Lib.Monitors_Get_FileName(dss.ctx))
end
FileName() = FileName(DSS_DEFAULT_CTX)

"""
Monitor File Version (integer)

Original COM help: https://opendss.epri.com/FileVersion.html
"""
function FileVersion(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_FileVersion(dss.ctx)
end
FileVersion() = FileVersion(DSS_DEFAULT_CTX)

"""
Header string;  Array of strings containing Channel names

Original COM help: https://opendss.epri.com/Header.html
"""
function Header(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Monitors_Get_Header, dss.ctx)
end
Header() = Header(DSS_DEFAULT_CTX)

"""
Monitor mode (bitmask integer - see DSS Help)

Original COM help: https://opendss.epri.com/Mode1.html

(Getter)
"""
function Mode(dss::DSSContext)::Union{UInt32,Lib.MonitorModes}
    result = @checked Lib.Monitors_Get_Mode(dss.ctx)
    try
        return convert(Lib.MonitorModes, result)
    catch
        return result
    end
end
Mode() = Mode(DSS_DEFAULT_CTX)

"""
Set Monitor mode (bitmask integer - see DSS Help)

Original COM help: https://opendss.epri.com/Mode1.html

(Setter)
"""
function Mode(dss::DSSContext, Value::Union{Int,UInt32,Lib.MonitorModes})
    # Value = convert(Lib.MonitorModes, Value)
    @checked Lib.Monitors_Set_Mode(dss.ctx, Value)
end
Mode(Value::Union{Int,UInt32,Lib.MonitorModes}) = Mode(DSS_DEFAULT_CTX, Value)

"""
Number of Channels in the active Monitor

Original COM help: https://opendss.epri.com/NumChannels.html
"""
function NumChannels(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_NumChannels(dss.ctx)
end
NumChannels() = NumChannels(DSS_DEFAULT_CTX)

"""
Size of each record in ByteStream (Integer). Same as NumChannels.

Original COM help: https://opendss.epri.com/RecordSize.html
"""
function RecordSize(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_RecordSize(dss.ctx)
end
RecordSize() = RecordSize(DSS_DEFAULT_CTX)

"""
Number of Samples in Monitor at Present

Original COM help: https://opendss.epri.com/SampleCount.html
"""
function SampleCount(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_SampleCount(dss.ctx)
end
SampleCount() = SampleCount(DSS_DEFAULT_CTX)

"""
Terminal number of element being monitored.

Original COM help: https://opendss.epri.com/Terminal.html

(Getter)
"""
function Terminal(dss::DSSContext)::Int
    return @checked Lib.Monitors_Get_Terminal(dss.ctx)
end
Terminal() = Terminal(DSS_DEFAULT_CTX)

"""
Terminal number of element being monitored.

Original COM help: https://opendss.epri.com/Terminal.html

(Setter)
"""
function Terminal(dss::DSSContext, Value::Int)
    @checked Lib.Monitors_Set_Terminal(dss.ctx, Value)
end
Terminal(Value::Int) = Terminal(DSS_DEFAULT_CTX, Value)

"""
Array of doubles containing frequency values for harmonics mode solutions; Empty for time mode solutions (use dblHour)

Original COM help: https://opendss.epri.com/dblFreq.html
"""
function DblFreq(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_dblFreq, dss.ctx)
end
DblFreq() = DblFreq(DSS_DEFAULT_CTX)

"""
Array of doubles containing time value in hours for time-sampled monitor values; Empty if frequency-sampled values for harmonics solution (see dblFreq)

Original COM help: https://opendss.epri.com/dblHour.html
"""
function DblHour(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Monitors_Get_dblHour, dss.ctx)
end
DblHour() = DblHour(DSS_DEFAULT_CTX)

end
