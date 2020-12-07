### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ a80cb638-1dde-11eb-08dd-593b9630a62e
using Pkg, DrWatson

# ╔═╡ a80cedd8-1dde-11eb-2ac5-ff913973a868
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Plots, Images
end

# ╔═╡ 3bc81896-1dde-11eb-22ff-3372c06964a9
md"## Listing 1.13"

# ╔═╡ 924b85f8-1ddf-11eb-025f-6f6f1ba174c0
Pkg.add("ImageIO")

# ╔═╡ a80d6ee8-1dde-11eb-3a36-c1d068d268f0
begin
	img = load(datadir("stars.png"))
	gImg = red.(img)*0.299 + green.(img)*0.587 + blue.(img)*0.114
	rows, cols = size(img)
end

# ╔═╡ a8187068-1dde-11eb-290c-919a177c2f04
"Highest intensity pixel: ", findmax(gImg)

# ╔═╡ a818e0ca-1dde-11eb-2d10-6be0b50f7358
function boxBlur(image,x,y,d)
    if x<=d || y<=d || x>=cols-d || y>=rows-d
        return image[x,y]
    else
        total = 0.0
        for xi = x-d:x+d
            for yi = y-d:y+d
                total += image[xi,yi]
            end
        end
        return total/((2d+1)^2)
    end
end

# ╔═╡ a821fab6-1dde-11eb-36fd-db97e9de0689
begin
	blurImg = [boxBlur(gImg,x,y,5) for x in 1:cols, y in 1:rows]

	yOriginal, xOriginal = argmax(gImg).I
	yBoxBlur, xBoxBlur   = argmax(blurImg).I

	heatmap(gImg, c=:Greys, yflip=true)
end

# ╔═╡ a8223dee-1dde-11eb-3345-630187ae9ff6
p1 = scatter!((xOriginal, yOriginal), ms=60, ma=0, msw=4, msc=:red)

# ╔═╡ a82b3c52-1dde-11eb-1e09-f3ad27bbd9ee
heatmap(blurImg, c=:Greys, yflip=true)

# ╔═╡ a82bc988-1dde-11eb-17a5-67a907d95a5e
p2 = scatter!((xBoxBlur, yBoxBlur), ms=60, ma=0, msw=4, msc=:red)

# ╔═╡ a831c28e-1dde-11eb-2f74-53e1521437e3
plot(p1, p2, size=(800, 400), ratio=:equal, xlims=(0,cols), ylims=(0,rows), 
	colorbar_entry=false, border=:none, legend=:none)

# ╔═╡ 0349ba5c-1de2-11eb-359e-cfe15670884f
md"## End of listing 1.13"

# ╔═╡ Cell order:
# ╟─3bc81896-1dde-11eb-22ff-3372c06964a9
# ╠═a80cb638-1dde-11eb-08dd-593b9630a62e
# ╠═a80cedd8-1dde-11eb-2ac5-ff913973a868
# ╠═924b85f8-1ddf-11eb-025f-6f6f1ba174c0
# ╠═a80d6ee8-1dde-11eb-3a36-c1d068d268f0
# ╠═a8187068-1dde-11eb-290c-919a177c2f04
# ╠═a818e0ca-1dde-11eb-2d10-6be0b50f7358
# ╠═a821fab6-1dde-11eb-36fd-db97e9de0689
# ╠═a8223dee-1dde-11eb-3345-630187ae9ff6
# ╠═a82b3c52-1dde-11eb-1e09-f3ad27bbd9ee
# ╠═a82bc988-1dde-11eb-17a5-67a907d95a5e
# ╠═a831c28e-1dde-11eb-2f74-53e1521437e3
# ╟─0349ba5c-1de2-11eb-359e-cfe15670884f
