module ZIP

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Opens and prepares a ZIP file to be used by the DSS text parser.
Currently, the ZIP format support is limited by what is provided in the Free Pascal distribution.
Besides that, the full filenames inside the ZIP must be shorter than 256 characters.
The limitations should be removed in a future revision.

(API Extension)"""
function Open(Value::String)
    @checked Lib.ZIP_Open(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Closes the current open ZIP file

(API Extension)"""
function Close()
    @checked Lib.ZIP_Close(C_NULL_CTX)
end

"""Runs a "Redirect" command inside the current (open) ZIP file.
In the current implementation, all files required by the script must
be present inside the ZIP, using relative paths. The only exceptions are
memory-mapped files.

(API Extension)"""
function Redirect(FileInZip::String)
    @checked Lib.ZIP_Redirect(C_NULL_CTX, Cstring(pointer(FileInZip)))
end

"""Extracts the contents of the file "FileName" from the current (open) ZIP file.
Returns a byte-string.

(API Extension)"""
function Extract(FileName::String)::Vector{Int8}
    return get_int8_array(Lib.ZIP_Extract, C_NULL_CTX, Cstring(pointer(FileName)))
end

"""List of strings consisting of all names match the regular expression provided in regexp.
If no expression is provided, all names in the current open ZIP are returned.

See https://regex.sorokin.engineer/en/latest/regular_expressions.html for information on
the expression syntax and options.

(API Extension)"""
function List(regexp::String)::Vector{String}
    return get_string_array(Lib.ZIP_List, C_NULL_CTX, Cstring(pointer(regexp)))
end

function List()::Vector{String}
    return get_string_array(Lib.ZIP_List, C_NULL_CTX, C_NULL)
end

"""Check if the given path name is present in the current ZIP file.

(API Extension)"""
function Contains(Name::String)
    return @checked(Lib.ZIP_Contains(C_NULL_CTX, Cstring(pointer(Name)))) != 0
end

end