using Clang

# LIBCLANG_HEADERS are those headers to be wrapped.
const LIBOPENDSS_INCLUDE = [
                           joinpath(@__DIR__, "../../dss_capi/include/v7/") |> normpath,
                          ]

const LIBOPENDSS_HEADERS = String[]

for folder in LIBOPENDSS_INCLUDE
    for header in readdir(folder)
        if endswith(header, ".h")
            push!(LIBOPENDSS_HEADERS, joinpath(folder, header))
        end
    end
end

LIBOPENDSS_ARGS = String[]
for path in LIBOPENDSS_INCLUDE
    push!(LIBOPENDSS_ARGS, "-I")
    push!(LIBOPENDSS_ARGS, path)
end


wc = init(; headers = LIBOPENDSS_HEADERS,
            output_file = joinpath(@__DIR__, "../src/lib.jl"),
            common_file = joinpath(@__DIR__, "../src/common.jl"),
            clang_includes = vcat(LIBOPENDSS_INCLUDE..., CLANG_INCLUDE),
            clang_args = LIBOPENDSS_ARGS,
            header_wrapped = (root, current)->root == current,
            header_library = x->"LIBRARY",
            clang_diagnostics = true,
            )

run(wc)
