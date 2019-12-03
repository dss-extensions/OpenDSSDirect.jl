abstract type AbstractOS end
abstract type Unix <: AbstractOS end
abstract type BSD <: Unix end

abstract type Windows <: AbstractOS end
abstract type MacOS <: BSD end
abstract type Linux <: BSD end

const OPENDSS_VERSION = "0.10.4"

function download(::Type{MacOS})

    url = "https://github.com/dss-extensions/dss_capi/releases/download/$(OPENDSS_VERSION)/dss_capi_$(OPENDSS_VERSION)_darwin_x64.tar.gz"
    @show url
    filename = normpath(joinpath(@__DIR__, "dss_capi.tar.gz"))
    Base.download(url, filename)

    directory = normpath(@__DIR__)
    run(`tar -xvf $filename -C $directory`)
    rm(joinpath(@__DIR__, "dss_capi.tar.gz"), force=true)

    mkpath(joinpath(@__DIR__, "apple"))
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/darwin_x64/libdss_capi_v7.dylib")), normpath(joinpath(@__DIR__, "apple", "libdss_capi_v7.dylib")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/darwin_x64/libklusolve.dylib")), normpath(joinpath(@__DIR__, "apple", "libklusolve.dylib")), force=true)
    rm(joinpath(@__DIR__, "dss_capi"), force=true, recursive=true)
    println("Success")
end

function download(::Type{Linux})

    url = "https://github.com/dss-extensions/dss_capi/releases/download/$(OPENDSS_VERSION)/dss_capi_$(OPENDSS_VERSION)_linux_x64.tar.gz"
    @show url
    filename = normpath(joinpath(@__DIR__, "dss_capi.tar.gz"))
    Base.download(url, filename)

    directory = normpath(@__DIR__)
    run(`tar -xvf $filename -C $directory`)
    rm(joinpath(@__DIR__, "dss_capi.tar.gz"), force=true)

    mkpath(joinpath(@__DIR__, "linux"))
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/linux_x64/libdss_capi_v7.so")), normpath(joinpath(@__DIR__, "linux", "libdss_capi_v7.so")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/linux_x64/libklusolve.so")), normpath(joinpath(@__DIR__, "linux", "libklusolve.so")), force=true)
    rm(joinpath(@__DIR__, "dss_capi"), force=true, recursive=true)
    println("Success")
end

function download(::Type{Windows})

    if typeof(1) === Int64
        BIT = "x64"
    else
        BIT = "x86"
    end

    url = "https://github.com/dss-extensions/dss_capi/releases/download/$(OPENDSS_VERSION)/dss_capi_$(OPENDSS_VERSION)_win_$(BIT).zip"
    @show url
    filename = normpath(joinpath(@__DIR__, "dss_capi.zip"))
    Base.download(url, filename)

    directory = normpath(@__DIR__)
    mkpath(directory)

    home = (Base.VERSION < v"0.7-") ? JULIA_HOME : Sys.BINDIR
    if Base.VERSION < v"1.3.0"
        bin7z = "$home/7z"
    else
        bin7z = "$(joinpath(home, "..", "libexec", "7z"))"
    end

    success(`$bin7z x $filename -y -o$directory`)
    filename = joinpath(directory, basename(filename)[1:end-4])

    mkpath(joinpath(@__DIR__, "windows"))
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/win_$(BIT)/dss_capi_v7.dll")), normpath(joinpath(@__DIR__, "windows", "dss_capi_v7.dll")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/win_$(BIT)/libklusolve.dll")), normpath(joinpath(@__DIR__, "windows", "libklusolve.dll")), force=true)
    rm(joinpath(@__DIR__, "dss_capi"), force=true, recursive=true)
    println("Success")
end


if Sys.iswindows()
    os = Windows
elseif Sys.isapple()
    os = MacOS
else
    os = Linux
end

download(os)
