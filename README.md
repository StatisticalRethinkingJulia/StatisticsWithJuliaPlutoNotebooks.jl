# StatisticsWithJuliaPlutoNotebooks

This code base is a Julia [DrWatson project](https://juliadynamics.github.io/DrWatson.jl/stable/)
to make a reproducible scientific project named
> StatisticsWithJuliaPlutoNotebooks

The code base is directly derived from a upcoming book [Statistics with Julia](https://statisticswithjulia.org/index.html) by Yoni Nazarathy and Hayden Klok. 

For a good while I have been looking for a great introductory statistics book using Julia as aan introductory text to StatisticalRethinking and I believe this book is exactly that.

As [StatisticalRethinking](https://github.com/StatisticalRethinkingJulia) version 3 will use Pluto notebooks and is based on Julia projects (e.g. [StatisticalRethinkingStan](https://github.com/StatisticalRethinkingJulia/StatisticalRethinkingStan.jl) and [StatisticalRethinkingTuring](https://github.com/StatisticalRethinkingJulia/StatisticalRethinkingTuring.jl)), I have converted the first 3 chapters to Pluto Notebooks.

To (locally) reproduce this [project](https://github.com/StatisticalRethinkingJulia/StatisticsWithJuliaPlutoNotebooks.jl), do the following:

To (locally) reproduce and use this project, do the following:

1. Download this [project](https://github.com/StatisticalRethinkingJulia/StatisticalRethinkingStan.jl) from Github and move to the downloaded directory, e.g.:

```
git clone https://github.com/StatisticalRethinkingJulia/StatisticsWithJuliaPlutoNotebooks.jl
cd StatisticsWithJuliaPlutoNotebooks.jl
```

The next step assumes your Julia setup includes `Pkg`, `DrWatson`, `Pluto` and `PlutoUI`.

2. Start a Pluto notebook server and open a notebook in a browser.
```
$ julia

julia> using Pluto
julia> Pluto.run()
```

By default the Pluto server uses port 1234 and will start a new page in your browser using to `http://localhost:1234/...`. 

Each notebook will activate the project `StatisticsWithJuliaPlutoNotebooks`.
