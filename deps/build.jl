abstract type AbstractOS end
abstract type Unix <: AbstractOS end
abstract type BSD <: Unix end

abstract type Windows <: AbstractOS end
abstract type MacOS <: BSD end
abstract type Linux <: BSD end

const OPENDSS_VERSION = "0.10.0"

function download(::Type{MacOS})

    url = "https://anaconda.org/PMeira/dss_python/$OPENDSS_VERSION/download/osx-64/dss_python-$OPENDSS_VERSION-py37_0.tar.bz2"
    @show url
    filename = joinpath(@__DIR__, "dss_python.tar.bz2") |> normpath
    Base.download(url, filename)

    directory = joinpath(@__DIR__, "dss_python") |> normpath
    mkpath(directory)
    run(`tar -xvf $filename -C $directory`)
    rm(joinpath(@__DIR__, "dss_python.tar.bz2"), force=true)

    mkpath(joinpath(@__DIR__, "apple"))
    cp(joinpath(@__DIR__, "dss_python/lib/python3.7/site-packages/dss/libdss_capi_v7.dylib") |> normpath, joinpath(@__DIR__, "apple", "libdss_capi_v7.dylib") |> normpath, force=true)
    cp(joinpath(@__DIR__, "dss_python/lib/python3.7/site-packages/dss/libklusolve.dylib") |> normpath, joinpath(@__DIR__, "apple", "libklusolve.dylib") |> normpath, force=true)
    rm(joinpath(@__DIR__, "dss_python"), force=true, recursive=true)
    println("Success")
end

function download(::Type{Linux})

    url = "https://anaconda.org/PMeira/dss_python/$OPENDSS_VERSION/download/linux-64/dss_python-$OPENDSS_VERSION-py36hf484d3e_0.tar.bz2"
    @show url
    filename = joinpath(@__DIR__, "dss_python.tar.bz2") |> normpath
    Base.download(url, filename)

    directory = joinpath(@__DIR__, "dss_python") |> normpath
    mkpath(directory)
    run(`tar -xvf $filename -C $directory`)
    rm(joinpath(@__DIR__, "dss_python.tar.bz2"), force=true)

    mkpath(joinpath(@__DIR__, "linux"))
    cp(joinpath(@__DIR__, "dss_python/lib/python3.6/site-packages/dss/libdss_capi_v7.so") |> normpath, joinpath(@__DIR__, "linux", "libdss_capi_v7.so") |> normpath)
    cp(joinpath(@__DIR__, "dss_python/lib/python3.6/site-packages/dss/libklusolve.so") |> normpath, joinpath(@__DIR__, "linux", "libklusolve.so") |> normpath)
    rm(joinpath(@__DIR__, "dss_python"), force=true, recursive=true)
    println("Success")
end

function download(::Type{Windows})

    if typeof(1) === Int64
        BIT = 64
    else
        BIT = 32
    end

    url = "https://anaconda.org/PMeira/dss_python/$OPENDSS_VERSION/download/win-$BIT/dss_python-$OPENDSS_VERSION-py37_0.tar.bz2"
    @show url
    filename = joinpath(@__DIR__, "dss_python.tar.bz2") |> normpath
    Base.download(url, filename)

    directory = joinpath(@__DIR__, "dss_python") |> normpath
    mkpath(directory)

    home = (VERSION < v"0.7-") ? JULIA_HOME : Sys.BINDIR
    success(`$home/7z x $filename -y -o$directory`)
    filename = joinpath(directory, basename(filename)[1:end-4])
    success(`$home/7z x $filename -y -ttar -o$directory`)
    rm(joinpath(@__DIR__, "dss_python.tar.bz2"), force=true)

    mkpath(joinpath(@__DIR__, "windows"))
    cp(joinpath(@__DIR__, "dss_python/Lib/site-packages/dss/dss_capi_v7.dll") |> normpath, joinpath(@__DIR__, "windows", "dss_capi_v7.dll") |> normpath, force=true)
    cp(joinpath(@__DIR__, "dss_python/Lib/site-packages/dss/libklusolve.dll") |> normpath, joinpath(@__DIR__, "windows", "libklusolve.dll") |> normpath, force=true)
    rm(joinpath(@__DIR__, "dss_python"), force=true, recursive=true)
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
