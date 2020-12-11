### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ a9cf29ca-1e0a-11eb-26bd-77978488d7e1
using Pkg, DrWatson

# ╔═╡ a9cf7986-1e0a-11eb-3780-5526346e75dd
begin
		@quickactivate "StatisticsWithJuliaPlutoNotebooks"
		using CSV, DataFrames, RCall
end

# ╔═╡ 4797782a-1e0a-11eb-29ed-0d9532aae5f7]
md"## Listing 1.18"

# ╔═╡ a9cfe2b6-1e0a-11eb-16bc-d93718b84f9e
begin
	data1 = CSV.read(datadir("machine1.csv"), DataFrame; header=false)[:, 1]
	data2 = CSV.read(datadir("machine2.csv"), DataFrame; header=false)[:, 1]
	data3 = CSV.read(datadir("machine3.csv"), DataFrame; header=false)[:, 1]
end

# ╔═╡ a9d99344-1e0a-11eb-33bb-6bda4554471c
function R_ANOVA(allData)
    data = vcat([ [x fill(i, length(x))] for (i, x) in
    			enumerate(allData) ]...)
    df = DataFrame(data, [:Diameter, :MachNo])
    @rput df

    R"""
    df$MachNo <- as.factor(df$MachNo)
    anova <- summary(aov( Diameter ~ MachNo, data=df))
    fVal <- anova[[1]]["F value"][[1]][1]
    pVal <- anova[[1]]["Pr(>F)"][[1]][1]
    """
	f = @rget fVal
	p = @rget pVal
    (f, p)
end

# ╔═╡ a9da0700-1e0a-11eb-1549-a99751de3bd8
begin
	f, p = R_ANOVA([data1, data2, data3])
	("R ANOVA f-value: ", f, "R ANOVA p-value: ", p)
end

# ╔═╡ Cell order:
# ╠═4797782a-1e0a-11eb-29ed-0d9532aae5f7
# ╠═a9cf29ca-1e0a-11eb-26bd-77978488d7e1
# ╠═a9cf7986-1e0a-11eb-3780-5526346e75dd
# ╠═a9cfe2b6-1e0a-11eb-16bc-d93718b84f9e
# ╠═a9d99344-1e0a-11eb-33bb-6bda4554471c
# ╠═a9da0700-1e0a-11eb-1549-a99751de3bd8
