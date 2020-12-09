# StatisticsWithJuliaPlutoNotebooks

This (Pkg & [DrWatson](https://juliadynamics.github.io/DrWatson.jl/stable/)) project contains a reproducible Julia `project` named `StatisticsWithJuliaPlutoNotebooks`.

The code base is directly derived from an upcoming book [Statistics with Julia](https://statisticswithjulia.org/index.html) by Yoni Nazarathy and Hayden Klok. 

For a good while I have been looking for a great statistics book using Julia as an introductory text to StatisticalRethinking and I believe the first five chapters of this book are exactly that.

As [StatisticalRethinking](https://github.com/StatisticalRethinkingJulia) v3 will be based on projects (e.g. [StatisticalRethinkingStan](https://github.com/StatisticalRethinkingJulia/StatisticalRethinkingStan.jl) or [StatisticalRethinkingTuring](https://github.com/StatisticalRethinkingJulia/StatisticalRethinkingTuring.jl)) and use [Pluto](https://github.com/fonsp/Pluto.jl) notebooks, I have converted the book's `listings` in the first four chapters to Pluto Notebooks. Clearly, Julia code and statistical explanations are only available in the `Statistics With Julia` book.

From chapter 4 onwards, `Statistical Rethinking` follows the Bayesian approach while `Statistics With Julia` opts mostly for the frequentionist view (see section 5.7). The corresponding material in chapters 5 and 6 of `Statistics With Julia` is covered in the early chapters of the
StatisticalRethinkingStan and StatisticalRethinkingTuring projects.

# Usage

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

Notebooks are stored by chapter. Each notebook contains a single listing from the book and activates the project `StatisticsWithJuliaPlutoNotebooks`.

I deviated from the naming scheme used in the book as I feel it is easier to find code snippets using the listing numbering, e.g. `listing3-07.jl`.
