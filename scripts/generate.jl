using Clang.Generators

error("This is broken for modern versions, but should be fixed when DSS C-API v1.0 is released.")

const LIBOPENDSS_INCLUDE = joinpath(@__DIR__, "../../dss_capi/include/") |> normpath

const LIBOPENDSS_HEADERS = String[]

push!(LIBOPENDSS_HEADERS, joinpath(LIBOPENDSS_INCLUDE, "dss_capi.h"))
push!(LIBOPENDSS_HEADERS, joinpath(LIBOPENDSS_INCLUDE, "dss_capi_ctx.h"))

# for header in readdir(folder)
#     if endswith(header, ".h")
#         push!(LIBOPENDSS_HEADERS, joinpath(LIBOPENDSS_INCLUDE, header))
#     end
# end

LIBOPENDSS_ARGS = get_default_args() 

LIBOPENDSS_ARGS = String[]
for path in LIBOPENDSS_INCLUDE
    push!(LIBOPENDSS_ARGS, "-I$path")
end

options = load_options(joinpath(@__DIR__, "generator.toml"))
ctx = create_context(LIBOPENDSS_HEADERS, LIBOPENDSS_ARGS, options)
build!(ctx)
