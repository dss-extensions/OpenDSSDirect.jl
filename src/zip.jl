"""
The ZIP module allows controlling the ZIP-compressed file functions from AltDSS/DSS C-API.

It allows opening a ZIP file, and loading circuits directly from it, without requiring extracting the contents to files before reading.

The implementation provides a specialization which allows more efficient access if the ZIP file is open and reused for many circuits. 
Doing so reduces the overhead of the initial opening and indexing of the file contents.

*Not available when using EPRI's OpenDSS distribution.*

(**API Extension**)
"""
module ZIP

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Opens and prepares a ZIP file to be used by the DSS text parser.
Currently, the ZIP format support is limited by what is provided in the Free Pascal distribution.
Besides that, the full filenames inside the ZIP must be shorter than 256 characters.
The limitations should be removed in a future revision.

**(API Extension)**
"""
function Open(dss::DSSContext, Value::String)
    @checked Lib.ZIP_Open(dss.ctx, Cstring(pointer(Value)))
end
Open(Value::String) = Open(DSS_DEFAULT_CTX, Value)

"""
Closes the current open ZIP file

**(API Extension)**
"""
function Close(dss::DSSContext)
    @checked Lib.ZIP_Close(dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

"""
Runs a "Redirect" command inside the current (open) ZIP file.
In the current implementation, all files required by the script must
be present inside the ZIP, using relative paths. The only exceptions are
memory-mapped files.

**(API Extension)**
"""
function Redirect(dss::DSSContext, FileInZip::String)
    @checked Lib.ZIP_Redirect(dss.ctx, Cstring(pointer(FileInZip)))
end
Redirect(FileInZip::String) = Redirect(DSS_DEFAULT_CTX, FileInZip)

"""
Extracts the contents of the file "FileName" from the current (open) ZIP file.
Returns a byte-string.

**(API Extension)**
"""
function Extract(dss::DSSContext, FileName::String)::Vector{Int8}
    return get_int8_array(Lib.ZIP_Extract, dss.ctx, Cstring(pointer(FileName)))
end
Extract(FileName::String) = Extract(DSS_DEFAULT_CTX, FileName)

"""
List of strings consisting of all names match the regular expression provided in regexp.
If no expression is provided, all names in the current open ZIP are returned.

See https://regex.sorokin.engineer/en/latest/regular_expressions.html for information on
the expression syntax and options.

**(API Extension)**
"""
function List(dss::DSSContext, regexp::String)::Vector{String}
    return get_string_array(Lib.ZIP_List, dss.ctx, Cstring(pointer(regexp)))
end
List(regexp::String) = List(DSS_DEFAULT_CTX, regexp)

function List(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.ZIP_List, dss.ctx, C_NULL)
end
List() = List(DSS_DEFAULT_CTX)

"""
Check if the given path name is present in the current ZIP file.

**(API Extension)**
"""
function Contains(dss::DSSContext, Name::String)
    return @checked(Lib.ZIP_Contains(dss.ctx, Cstring(pointer(Name)))) != 0
end
Contains(Name::String) = Contains(DSS_DEFAULT_CTX, Name)

end
