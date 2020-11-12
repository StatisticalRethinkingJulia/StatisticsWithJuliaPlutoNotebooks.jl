### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.31"

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
end

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
function directorySearch(directory, searchString)
    outfile  = open(datadir("fileList.txt"),"w")
    fileList = filter(x->occursin(searchString, x), readdir(directory))

    for file in fileList
        println(outfile, file)
    end
    close(outfile)
end

# ╔═╡ 0b9bebfe-2525-11eb-3a90-fd98a5bcdace
directorySearch(pwd(),".jl")

# ╔═╡ 8f0d911c-2526-11eb-3c68-d38a7ede16cb
readlines(datadir("fileList.txt"), keep=true)

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.31"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═0b9bebfe-2525-11eb-3a90-fd98a5bcdace
# ╠═8f0d911c-2526-11eb-3c68-d38a7ede16cb
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
