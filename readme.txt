Strange bug.

Building .exp manually and reexporting delayload on ARM64EC, crashes.
Because thunk is missing and ImageBase is passed instead.
Specifying .def works.

User error or it is supposed to work?

https://developercommunity.visualstudio.com/t/arm64ec-incorrect-exit-thunk-ImageBase/10752255