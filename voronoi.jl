### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 403a168a-089a-11eb-2b07-73653bfa7c7e
using Images, FileIO, Colors, Random, Distances, TestImages

# ╔═╡ 84c3b57c-089a-11eb-3379-9f9478a95594
img = load("./img/turtles.png")

# ╔═╡ ac809eea-089a-11eb-0dc6-2f22544b3cd6
h, w = size(img)

# ╔═╡ add19c5e-089a-11eb-26d3-4d211bda7aaf
n = 200

# ╔═╡ 5190975c-089c-11eb-14f2-17a484326333
dots = [rand(1:h, n) rand(1:w, n) rand(RGB{N0f8}, n)]

# ╔═╡ b0836f06-089d-11eb-3dd9-53133c7a987b
dots[1,3]

# ╔═╡ 832f48b6-089f-11eb-036f-d5277b94ffcf
typeof(Int64.(dots[:,1:2]))

# ╔═╡ 7f6d2ea0-089c-11eb-027e-bd05e61b9519
for x in 1:h, y in 1:w
	distances = euclidean(repeat([x y], n, 1), Int64.(dots[:,1:2]))
	nn = findmin(distances)[2]
	img[x,y] = dots[nn,3]
end

# ╔═╡ ad1ce002-089a-11eb-3a9a-63ef248695b6
img

# ╔═╡ 5bb38ac8-08a1-11eb-11ad-716d59472352
begin
	function voronoi_img!(img, n_centroids)
		n,m = size(img)
		w   = minimum([n,m])
		dist = (point,vector) -> sqrt.((point[1].-vector[:,1]).^2 .+ (point[2].-vector[:,2]).^2)
		dots = [rand(1:n, n_centroids) rand(1:m, n_centroids)]
		c = []
		for i in 1:size(dots,1)
			p = dots[i,:]
			append!(c, [img[p[1],p[2]]])
		end
		dots = [dots c]

		for x in 1:n, y in 1:m
			distances = dist([x,y],dots) # distance
			nn = findmin(distances)[2]
			img[x,y]  = dots[nn,:][3]
		end
	end
	new_img = testimage("mandrill")
	voronoi_img!(new_img, 300)
	new_img
end

# ╔═╡ Cell order:
# ╠═403a168a-089a-11eb-2b07-73653bfa7c7e
# ╠═84c3b57c-089a-11eb-3379-9f9478a95594
# ╠═ac809eea-089a-11eb-0dc6-2f22544b3cd6
# ╠═add19c5e-089a-11eb-26d3-4d211bda7aaf
# ╠═5190975c-089c-11eb-14f2-17a484326333
# ╠═b0836f06-089d-11eb-3dd9-53133c7a987b
# ╠═832f48b6-089f-11eb-036f-d5277b94ffcf
# ╠═7f6d2ea0-089c-11eb-027e-bd05e61b9519
# ╠═ad1ce002-089a-11eb-3a9a-63ef248695b6
# ╠═5bb38ac8-08a1-11eb-11ad-716d59472352
