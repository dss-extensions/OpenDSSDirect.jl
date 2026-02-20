function Channel end

"""
Convert the monitor data to text and displays it with the text editor.

Original COM help: https://opendss.epri.com/Show3.html
"""
function Show(obj::Obj)
    obj_generic_call(obj, obj.dss.capi.Alt_Monitor_Show)
end

"""
Array of strings containing channel names

Original COM help: https://opendss.epri.com/Header.html
"""
function Header(obj::Obj)::Vector{String}
    obj_get_strs(obj, obj.dss.capi.Alt_Monitor_Get_Header)
end

"""
Byte array containing the monitor's stream values. Make sure a "save" is done first (standard solution modes do this automatically)

Original COM help: https://opendss.epri.com/ByteStream.html
"""
function ByteStream(obj::Obj)::Vector{Int8}
    obj_get_int8s(obj, obj.dss.capi.Alt_Monitor_Get_ByteStream)
end

"""
Name of CSV file associated with this monitor.

Original COM help: https://opendss.epri.com/FileName.html
"""
function FileName(obj::Obj)::String
    obj_get_str(obj, obj.dss.capi.Alt_Monitor_Get_FileName)
end

"""
Number of samples in this monitor at present

Original COM help: https://opendss.epri.com/SampleCount.html
"""
function SampleCount(obj::Obj)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_Monitor_Get_SampleCount)
end

"""
Number of channels in this monitor

Original COM help: https://opendss.epri.com/NumChannels.html
"""
function NumChannels(obj::Obj)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_Monitor_Get_NumChannels)
end

"""
Size of each record in ByteStream. Same as `NumChannels`.

Original COM help: https://opendss.epri.com/RecordSize.html
"""
function RecordSize(obj::Obj)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_Monitor_Get_RecordSize)
end

"""
Frequency values for harmonics mode solutions.
Empty for time mode solutions (use `dblHour` instead).

Original COM help: https://opendss.epri.com/dblFreq.html
"""
function dblFreq(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_Monitor_Get_dblFreq)
end

"""
Time value in hours for time-sampled monitor values. 
Empty if frequency-sampled values for harmonics solution (use `dblFreq` instead).

Original COM help: https://opendss.epri.com/dblHour.html
"""
function dblHour(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_Monitor_Get_dblHour)
end

"""
Array of float32 for the specified channel.
A Save or SaveAll should be executed first, and that is done automatically by most standard solution modes.
Channels start at index 1.
"""
function Channel(obj::Obj, index::Int)::Vector{Float32}
    num_channels = NumChannels(obj)
    if (index < 1) || (index > num_channels)
        mname = name(obj)
        throw(
            OpenDSSDirectException(
                "[ERROR] Monitor Channel: Invalid channel index ($index), monitor \"$mname\" has $num_channels channels."
            )
        )
    end

    buffer = obj_get_int8s(obj, obj.dss.capi.Alt_Monitor_Get_ByteStream)

    if len(buffer) <= 1
        return []
    end
    # record_size = buffer.view(dtype=np.int32)[2] + 2
    # data = buffer[272:].view(dtype=np.float32)
    # return data[(index + 1)::record_size].copy()
end

"""
Returns a copy of the matrix of this monitor, containing the hour vector, seconds vector, and all channels
(index 2 = channel 1). If you need multiple channels, prefer using this function as it processes the monitor 
byte-stream once.

For harmonic solutions, the first two columns are the frequency and the harmonic, respectively.
"""
function AsMatrix(obj::Obj)::Vector{Float64}
    # buffer = obj_get_int8s(obj, obj.dss.capi.Alt_Monitor_Get_ByteStream)
    # if len(buffer) <= 1
    #     return []
    # end
    # record_size = buffer.view(dtype=np.int32)[2] + 2
    # data = buffer[272:].view(dtype=np.float32)
    # data = data.reshape((len(data) // record_size, record_size)).copy()
    # return data
end

#TODO
# """
# Returns this monitor's data as a Pandas DataFrame

# Requires pandas
# """
# function ToDataFrame(obj::Obj):
#     try:
#         import pandas as pd
#     catch ImportError:
#         raise RuntimeError("Pandas is required to use this function")
#     end

#     if @checked dss_call(obj.dss.capi.Solution_Get_Mode, ) in (SolveModes.Harmonic, SolveModes.HarmonicT):
#         columns = ['frequency', 'harmonic']
#     else
#         columns = ['hour', 'second']
#     end
#     columns.extend(col.strip() for col in obj.Header())
#     data = obj.AsMatrix()

#     return pd.DataFrame(data, columns=columns)
# end
