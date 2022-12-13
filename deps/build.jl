abstract type AbstractOS end
abstract type Unix <: AbstractOS end
abstract type BSD <: Unix end

abstract type Windows <: AbstractOS end
abstract type MacOS <: BSD end
abstract type Linux <: BSD end

const DSS_CAPI_TAG = "0.12.2a1"

function download(::Type{MacOS})
    if Sys.ARCH == :aarch64
        DSS_CAPI_ARCH = "arm64"
    else
        DSS_CAPI_ARCH = "x64"
    end

    url = "https://github.com/dss-extensions/dss_capi/releases/download/$(DSS_CAPI_TAG)/dss_capi_$(DSS_CAPI_TAG)_darwin_$(DSS_CAPI_ARCH).tar.gz"
    @show url
    filename = normpath(joinpath(@__DIR__, "dss_capi.tar.gz"))
    Base.download(url, filename)

    directory = normpath(@__DIR__)
    run(`tar -xvf $filename -C $directory`)
    rm(joinpath(@__DIR__, "dss_capi.tar.gz"), force=true)

    mkpath(joinpath(@__DIR__, "apple"))
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/darwin_$(DSS_CAPI_ARCH)/libdss_capi.dylib")), normpath(joinpath(@__DIR__, "apple", "libdss_capi.dylib")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/darwin_$(DSS_CAPI_ARCH)/libdss_capid.dylib")), normpath(joinpath(@__DIR__, "apple", "libdss_capid.dylib")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/darwin_$(DSS_CAPI_ARCH)/libklusolvex.dylib")), normpath(joinpath(@__DIR__, "apple", "libklusolvex.dylib")), force=true)
    rm(joinpath(@__DIR__, "dss_capi"), force=true, recursive=true)
    println("Success")
end

function download(::Type{Linux})
    if Sys.ARCH == :aarch64
        DSS_CAPI_ARCH = "arm64"
    else
        DSS_CAPI_ARCH = "x64"
    end

    url = "https://github.com/dss-extensions/dss_capi/releases/download/$(DSS_CAPI_TAG)/dss_capi_$(DSS_CAPI_TAG)_linux_$(DSS_CAPI_ARCH).tar.gz"
    @show url
    filename = normpath(joinpath(@__DIR__, "dss_capi.tar.gz"))
    Base.download(url, filename)

    directory = normpath(@__DIR__)
    run(`tar -xvf $filename -C $directory`)
    rm(joinpath(@__DIR__, "dss_capi.tar.gz"), force=true)

    mkpath(joinpath(@__DIR__, "linux"))
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/linux_$(DSS_CAPI_ARCH)/libdss_capi.so")), normpath(joinpath(@__DIR__, "linux", "libdss_capi.so")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/linux_$(DSS_CAPI_ARCH)/libdss_capid.so")), normpath(joinpath(@__DIR__, "linux", "libdss_capid.so")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/linux_$(DSS_CAPI_ARCH)/libklusolvex.so")), normpath(joinpath(@__DIR__, "linux", "libklusolvex.so")), force=true)
    rm(joinpath(@__DIR__, "dss_capi"), force=true, recursive=true)
    println("Success")
end

function download_messages(::Union{Type{Linux}, Type{MacOS}})
    url = "https://github.com/dss-extensions/dss_capi/releases/download/$(DSS_CAPI_TAG)/messages.tar.gz"
    @show url
    filename = normpath(joinpath(@__DIR__, "messages.tar.gz"))
    Base.download(url, filename)

    directory = normpath(@__DIR__)
    run(`tar -xvf $filename -C $directory`)
    rm(joinpath(@__DIR__, "messages.tar.gz"), force=true)
    println("Success")
end

function download(::Type{Windows})

    if typeof(1) === Int64
        BIT = "x64"
    else
        BIT = "x86"
    end

    url = "https://github.com/dss-extensions/dss_capi/releases/download/$(DSS_CAPI_TAG)/dss_capi_$(DSS_CAPI_TAG)_win_$(BIT).zip"
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
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/win_$(BIT)/dss_capi.dll")), normpath(joinpath(@__DIR__, "windows", "dss_capi.dll")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/win_$(BIT)/dss_capid.dll")), normpath(joinpath(@__DIR__, "windows", "dss_capid.dll")), force=true)
    cp(normpath(joinpath(@__DIR__, "dss_capi/lib/win_$(BIT)/libklusolvex.dll")), normpath(joinpath(@__DIR__, "windows", "libklusolvex.dll")), force=true)
    rm(joinpath(@__DIR__, "dss_capi"), force=true, recursive=true)
    println("Success")
end

function download_messages(::Type{Windows})
    url = "https://github.com/dss-extensions/dss_capi/releases/download/$(DSS_CAPI_TAG)/messages.zip"
    @show url
    filename = normpath(joinpath(@__DIR__, "messages.zip"))
    Base.download(url, filename)

    directory = normpath(@__DIR__)

    home = (Base.VERSION < v"0.7-") ? JULIA_HOME : Sys.BINDIR
    if Base.VERSION < v"1.3.0"
        bin7z = "$home/7z"
    else
        bin7z = "$(joinpath(home, "..", "libexec", "7z"))"
    end

    success(`$bin7z x $filename -y -o$directory`)
    rm(joinpath(@__DIR__, "messages.zip"), force=true)

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
download_messages(os)
