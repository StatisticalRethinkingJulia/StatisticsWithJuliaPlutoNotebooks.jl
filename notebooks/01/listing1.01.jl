### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 0a774706-1d0e-11eb-1d3a-6d641500d34d
using Pkg, DrWatson

# ╔═╡ 0a7776e0-1d0e-11eb-2a05-795e2470b260
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using PlutoUI
	using Plots
end

# ╔═╡ bc93b1e6-1d0d-11eb-3a1b-cf047fc8d621
md"## Listing 1.1"

# ╔═╡ 0a77d522-1d0e-11eb-1dfa-af3a546454ae
"There is more than one way to say hello:"

# ╔═╡ 0a83a6a4-1d0e-11eb-27cf-6b1ae5c75d6c
md"##### This is an array consisting of three strings."

# ╔═╡ 5cce7a9c-1d0e-11eb-0a59-43dceb80ee34
helloArray = ["Hello","G'day","Shalom"]

# ╔═╡ 0970cc02-1d35-11eb-0636-4d61aba864fe
md"##### Printing intermediate results in Pluto notebooks is a bit tedious currently, e.g.:"

# ╔═╡ ae5f130c-1d32-11eb-0322-4387a35fcae7
map(1:length(helloArray)) do i
	gr = helloArray[i]
    md" $gr world"
end

# ╔═╡ 33ffe1f2-2688-11eb-071d-ef4974b52b73
helloArray[1], "universe"

# ╔═╡ 5eee59a6-1d35-11eb-0e55-e53b9fef1b9c
md"##### Note the space in front of the first interpolation ( `$gr` )."

# ╔═╡ 5a9ab6da-1d33-11eb-27b2-a3ec1b2d8e02
map(1:3) do i
    R = i+100
    T = R^2
    md"hello $R and $T"
end

# ╔═╡ 988eab90-1d33-11eb-1278-0f39acc4dcd0
map(1:3) do i
    R = i+100
    T = R^2
    Text("hello $R and $T")
end

# ╔═╡ 0a8f6b9c-1d0e-11eb-0109-21ef005e63fe
md"##### Below we use a construct called a `comprehension' (or 'list comprehension')"

# ╔═╡ 0a8eef00-1d0e-11eb-11b7-d566161ac295
md"##### These squares are just perfect:"

# ╔═╡ 3d114318-1d10-11eb-2b93-ed04fda820ca
squares = [i^2 for i in 0:10]

# ╔═╡ 5eaa07b2-2689-11eb-23ce-55972c6a2861
md"##### Or, the above printing example:"

# ╔═╡ 8c1e52ee-2688-11eb-3fc7-ad83de5ec8c7
[("$(helloArray[i]) universe") for i in 1:length(helloArray)]

# ╔═╡ 0a9a2898-1d0e-11eb-1583-3bfdf887a967
md"##### You can loop on elements of arrays without having to use indexing. The last line of every code snippet is also evaluated as output (in addition to any figures and printing output shown previously)."

# ╔═╡ a0e7ab92-1d22-11eb-27fd-ef499034dd88
map(squares) do s
	sqrt(s)
end

# ╔═╡ 8b5571fa-1d35-11eb-1fef-1749f6da2d5e
md"##### Another important concept in Julia is `broadcasting` over an Array:"

# ╔═╡ 464824a8-1d0e-11eb-08b0-39b95ed0c30c
sqrt.(squares)

# ╔═╡ aca76098-1d35-11eb-1cf3-1b68437e17f7
md"##### Finally, the most tricky difference between the Julia REPL and other notebook formats is the reactivity of Pluto. It's cool, but also prevents multiple definitions across cells. If this happens, Pluto will suggest to bracket the assigments in a single cell with `begin` and `end`"

# ╔═╡ 01420810-1d36-11eb-1846-b579d2238fcc
begin
	x = 5
	x = x^2
end

# ╔═╡ 9e47c86e-1d38-11eb-0dae-ed14a8c961ad
md"##### Example of Pluto reactivity."

# ╔═╡ 88c09530-1d37-11eb-1b90-1991d07df0c2
@bind y Slider(3:12; default=7, show_value=true)

# ╔═╡ eaf674e0-1d37-11eb-234e-cbd28ef92cda
y^2

# ╔═╡ 569dad26-1d38-11eb-3a0b-69598098bf7c
plot(rand(y^3), lab="y^3 samples", leg=:topleft)

# ╔═╡ 02efc864-1d0e-11eb-027c-2f992de0069e
md"## End of listing 1. 1"

# ╔═╡ Cell order:
# ╟─bc93b1e6-1d0d-11eb-3a1b-cf047fc8d621
# ╠═0a774706-1d0e-11eb-1d3a-6d641500d34d
# ╠═0a7776e0-1d0e-11eb-2a05-795e2470b260
# ╠═0a77d522-1d0e-11eb-1dfa-af3a546454ae
# ╟─0a83a6a4-1d0e-11eb-27cf-6b1ae5c75d6c
# ╠═5cce7a9c-1d0e-11eb-0a59-43dceb80ee34
# ╟─0970cc02-1d35-11eb-0636-4d61aba864fe
# ╠═ae5f130c-1d32-11eb-0322-4387a35fcae7
# ╠═33ffe1f2-2688-11eb-071d-ef4974b52b73
# ╟─5eee59a6-1d35-11eb-0e55-e53b9fef1b9c
# ╠═5a9ab6da-1d33-11eb-27b2-a3ec1b2d8e02
# ╠═988eab90-1d33-11eb-1278-0f39acc4dcd0
# ╟─0a8f6b9c-1d0e-11eb-0109-21ef005e63fe
# ╟─0a8eef00-1d0e-11eb-11b7-d566161ac295
# ╠═3d114318-1d10-11eb-2b93-ed04fda820ca
# ╟─5eaa07b2-2689-11eb-23ce-55972c6a2861
# ╠═8c1e52ee-2688-11eb-3fc7-ad83de5ec8c7
# ╟─0a9a2898-1d0e-11eb-1583-3bfdf887a967
# ╠═a0e7ab92-1d22-11eb-27fd-ef499034dd88
# ╟─8b5571fa-1d35-11eb-1fef-1749f6da2d5e
# ╠═464824a8-1d0e-11eb-08b0-39b95ed0c30c
# ╟─aca76098-1d35-11eb-1cf3-1b68437e17f7
# ╠═01420810-1d36-11eb-1846-b579d2238fcc
# ╟─9e47c86e-1d38-11eb-0dae-ed14a8c961ad
# ╠═88c09530-1d37-11eb-1b90-1991d07df0c2
# ╠═eaf674e0-1d37-11eb-234e-cbd28ef92cda
# ╠═569dad26-1d38-11eb-3a0b-69598098bf7c
# ╟─02efc864-1d0e-11eb-027c-2f992de0069e
