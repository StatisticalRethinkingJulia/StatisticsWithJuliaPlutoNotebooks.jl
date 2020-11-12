### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.30"

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
end

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
function lineSearch(inputFilename, outputFilename, keyword)
    infile  = open(inputFilename, "r")
    outfile = open(outputFilename,"w")

    for (index, line) in enumerate(split(read(infile, String), "\n"))
        if occursin(keyword, line)
            println(outfile, "$index: $line")
        end
    end
    close(infile)
    close(outfile)
end

# ╔═╡ c2ee4a9c-2523-11eb-103a-4d6d78fc30f7
Text(lineSearch(datadir("earth.txt"), datadir("waterLines.txt"), "water"));

# ╔═╡ 6610af58-2524-11eb-1a92-bdb8078a8813
readlines(datadir("waterLines.txt"), keep=true)

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.30"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═c2ee4a9c-2523-11eb-103a-4d6d78fc30f7
# ╠═6610af58-2524-11eb-1a92-bdb8078a8813
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
