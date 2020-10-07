### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 2a0ae4c8-08a6-11eb-0aac-f56b600e5f60
using Luxor, Colors, FileIO

# ╔═╡ 3cfa6eda-08a6-11eb-148c-41129fa7ab45
begin
	Drawing(600, 400, "./img/turtles.png")
	origin()
	background("midnightblue")

	🐢 = Turtle() # you can type the turtle emoji with \:turtle:
	Pencolor(🐢, "cyan")
	Penwidth(🐢, 1.5)
	n = 5
	for i in 1:400
		global n
		Forward(🐢, n)
		Turn(🐢, 89.5)
		HueShift(🐢)
		n += 0.75
	end
	finish()
end

# ╔═╡ ecb8fa64-08a6-11eb-0fd3-49f596a65134
img = load("./img/turtles.png")

# ╔═╡ Cell order:
# ╠═2a0ae4c8-08a6-11eb-0aac-f56b600e5f60
# ╠═3cfa6eda-08a6-11eb-148c-41129fa7ab45
# ╠═ecb8fa64-08a6-11eb-0fd3-49f596a65134
