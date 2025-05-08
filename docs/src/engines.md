# OpenDSS Engines

In short, in 2025, OpenDSSDirect.jl can now use:

- AltDSS, the official OpenDSS engine from DSS-Extensions. Windows, Linux and macOS are supported since 2018. "Apple Silicon" (ARM processors) support was introduced in 2023.
- EPRI's OpenDSS in the form of the original/reference Delphi implementation. As of 2025, only Microsoft Windows is supported.
- EPRI's OpenDSS-C, the new C++ implementation from EPRI. As of 2025, Windows and Linux are supported (macOS may work though).

Since 2019, OpenDSSDirect.jl has been using AltDSS/DSS C-API as its engine. 

DSS C-API started as an alternative API for EPRI's OpenDSS. As time progressed,
the team on DSS-Extensions started refactoring and improving various aspects of 
the engine/internal codebase of OpenDSS, resulting in what is called the AltDSS
engine. It is still very compatible and cross-validated with EPRI's OpenDSS results.

In September 2023, EPRI adopted some aspects of DSS C-API, notably the API
was updated to use plain pointers instead of COM VARIANT types. Since then,
DSS-Extensions started a very thin compatibility layer called Oddie (originally
ODDIE, "OpenDSS Interface Extender"). In basic terms, Oddie exposes EPRI's binaries
as DSS C-API, allowing the language binding projects on DSS-Extensions to easily
consume EPRI's binaries without requiring source code changes. Oddie also handles
a lot of boilerplate operations related to error handling and implements some
extra functions for easily switching between libraries.

In 2024, OpenDSS-C was released to the public. Dr. Paulo Meira, one of maintainers 
of OpenDSSDirect.jl and other DSS-Extensions, was one of the developers who worked 
on various fixes, as can be seen through the public 
[SVN repository at SourceForge](https://sourceforge.net/p/electricdss/code/HEAD/tree/)
or through [our mirror on GitHub](https://github.com/dss-extensions/opendss-svn-mirror/tree/svn).
We are proud to mention that OpenDSSDirect.jl and other DSS-Extensions projects were used 
during part of the development, including tests on Windows and Linux.

Both OpenDSS-C and the main/Delphi implementation of OpenDSS can be loaded through Oddie.

## Why use different OpenDSS implementations?

Each implementation has its pros and cons. For example, although the Delphi implementation could be
considered the reference in various aspects, it's only supported on Windows. On Linux, one could
use either AltDSS or OpenDSS-C. Besides the extra features, AltDSS is more stable and contains 
a lot more error handling and checks, so it could be useful even if the user is required to use
OpenDSS-C in production, that is, a user could switch engines to investigate issues, fix them,
and switch back if required.

## Using different engines

### Default engine

The current default engine is AltDSS, as it has been since 2019. If you do not want to load a 
separate library, maybe EPRI's OpenDSS distribution or a custom build of either OpenDSS or AltDSS,
you just need to install OpenDSSDirect.jl as usual.

### Custom AltDSS binaries

Assuming compatible binaries, `OpenDSSDirect.LoadAltDSSLib` can be used. Check the API docs for more details.

### EPRI's OpenDSS binaries

Assuming compatible binaries, `OpenDSSDirect.LoadOpenDSSLib` can be used. Check the API docs for more details.

*TODO: include examples of how to use different engines*

*TODO: if we include OpenDSS-C and OpenDSS binaries, list that here*