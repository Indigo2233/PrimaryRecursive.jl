using PrimaryRecursive
using Documenter

DocMeta.setdocmeta!(PrimaryRecursive, :DocTestSetup, :(using PrimaryRecursive); recursive=true)

makedocs(;
    modules=[PrimaryRecursive],
    authors="Indigo <j.c.f.gauss@sjtu.edu.cn> and contributors",
    repo="https://github.com/sjtu_suyao/PrimaryRecursive.jl/blob/{commit}{path}#{line}",
    sitename="PrimaryRecursive.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://sjtu_suyao.github.io/PrimaryRecursive.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/sjtu_suyao/PrimaryRecursive.jl",
)
