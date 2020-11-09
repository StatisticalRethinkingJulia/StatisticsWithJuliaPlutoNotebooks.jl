# StatisticsWithJuliaPlutoNotebooks

This Julia [DrWatson project](https://juliadynamics.github.io/DrWatson.jl/stable/)
contains a reproducible project named `StatisticsWithJuliaPlutoNotebooks`.

The code base is directly derived from a upcoming book [Statistics with Julia](https://statisticswithjulia.org/index.html) by Yoni Nazarathy and Hayden Klok. 

For a good while I have been looking for a great statistics book using Julia as an introductory text to StatisticalRethinking and I believe this book is exactly that.

As [StatisticalRethinking](https://github.com/StatisticalRethinkingJulia) v3 will use Pluto notebooks, I have (initially) converted the listings in the first 3 chapters to Pluto Notebooks as a proof of concept.

StatisticalRethinking v3 will also be based on Julia DrWatson projects (e.g. [StatisticalRethinkingStan](https://github.com/StatisticalRethinkingJulia/StatisticalRethinkingStan.jl) and [StatisticalRethinkingTuring](https://github.com/StatisticalRethinkingJulia/StatisticalRethinkingTuring.jl)).

# Usage

To (locally) reproduce this [project](https://github.com/StatisticalRethinkingJulia/StatisticsWithJuliaPlutoNotebooks.j), do the following:

To (locally) reproduce and use this project, do the following:

1. Download above project from Github, e.g.:

```
$ git clone https://github.com/StatisticalRethinkingJulia/StatisticsWithJuliaPlutoNotebooks.jl
```

2. In the Julia REPL:

```
julia> cd("path/to/cloned/project")
pkg> activate .
pkg> instantiate
```

Use ']' to activate Pkg mode in the Julia REPL and 'delete' to exit Pkg mode.

3. Start a Pluto notebook server.

```
julia> using Pluto
julia> Pluto.run()
```

By default the Pluto server uses port 1234 and will start a new page in your browser using to `http://localhost:1234/...`. 

# Layout

Notebooks are stored by chapter. Each notebook contains a single listing from the book and will activate the project `StatisticsWithJuliaPlutoNotebooks`.
