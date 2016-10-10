# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.where(email: 'admin@example.com').first_or_create!({
  password: 'password'
})

unless Rails.env.production?
  grain = Ingredient.create!({ name: "Grain", quantity: 3500.00 })
  hops = Ingredient.create!({ name: "Hops", quantity: 3750.00 })
  yeast = Ingredient.create!({ name: "Yeast", quantity: 3700.00 })

  ingredients = [grain, hops, yeast]
  product_list = [
    { name: "Pale Ale", style: 1, price: 295.00, description: "Whether American or English, the 'pale' was clipped on long ago to distinguish it from the dark color of Porters. American and English styles differ, but generally they are gold or copper colored and dry with crisp hop flavor." },
    { name: "India Pale Ale (IPA)", style: 1, price: 195.00, description: "Pale ale with intense hop flavor and aroma and slightly higher alcohol content." },
    { name: "Brown Ale", style: 1, price: 200.00, description: "These distinctively northern English style ales have a strong, malty center and can be nutty, sweet and very lightly hopped. They are medium bodied and the name matches the color of the ale." },
    { name: "Stout", style: 1, price: 205.00, description: "(Guinness and Murphy´s are dry Irish stouts) – Thick, black opaque and rich. Stouts draw their flavor and color from roasted barley.  They often taste of malt and caramel, with little to no hop aroma or flavor." },
    { name: "Porter", style: 1, price: 215.00, description: "Very similar to stout but made from, or largely from, unroasted barley. Sweet and dark brown in color with hints of chocolate and a sometimes-sharp bitterness." },
    { name: "Wheat Beer", style: 1, price: 185.00, description: "Germans take their beer very seriously, so much that it is required by law to use top-fermenting yeast in wheat beer. It must be made from at least 50% wheat malt. Wheat proteins contribute to a hazy, or cloudy appearance and are commonly unfiltered, leaving yeast sediment in the bottle. They are light colored, full flavored and the unique yeast strains produce flavors like banana, clove and vanilla." },
    { name: "Hefeweisen", style: 1, price: 195.00, description: "The most commercially successful type of wheat beer. In the US they are regularly served with a lemon wedge to cut the intense yeast flavor." },
    { name: "American Lagers", style: 2, price: 230.00, description: "This can be a sore subject for beer enthusiasts in the home of the brave. Before prohibition the US was respected in the world of brewed libations. Small breweries were all but extinct by the end of prohibition and the large ones kept their heads above water by selling cereal malts.  The 21st amendment repealed the 18th but brewers were slow to pick up production. World War II dealt another heavy blow to the industry – food shortages resulted in the increased use of adjuncts for malt." },
    { name: "Amber/Red Lager", style: 2, price: 250.00, description: "(Yuengling, Killian´s, Brooklyn Lager) – More malt and darker than their lighter lager relatives, usually amber to copper colored. Flavor profiles vary considerably between breweries. Nine times out of ten when a beer label says no more than 'Lager' it is an amber."},
    { name: "Pilsner", style: 2, price: 170.00, description: "(Beck´s, Labatt Blue, Warsteiner, Pilsner Urquell) – Conceived in Czechoslovakia, easily the world’s most popular beer style. Pilsners are pale, straw colored and crisp with medium body and more hops than traditional lager, but typically smooth and clean. "},
    { name: "Bock", style: 2, price: 180.00, description: "(Sam Adams Winter Lager) – Of German origin, brewed in the fall to be enjoyed in the winter or spring. A stronger lager with heavy malt, medium to full bodied, lightly hopped and dark amber to brown in color." },
    { name: "Doppelbock", style: 2, price: 200.00, description: "Or 'double' bock is stronger and darker than bock, sweeter with more malt and a little higher in alcohol content." },
    { name: "Oktoberfest", style: 2, price: 210.00, description: "indicates the Vienna style of 'Marzen' beer, the German word for 'March'. These are brewed in the spring and stored to serve in autumn. They have a toasted quality with a sweet tinge, robust malt flavors, and a deep amber hue." }
  ]

  product_list.each do |element|
    product = Product.create!(element)
    ingredients.each do |ingredient|
      IngredientConfiguration.create!({ product: product, ingredient: ingredient, quantity: 150.00 })
    end
  end

  ["Queens Ba", "Johnny B. Good", "Dublin", "Rock&Feller's", "Ceveza Daniel O. Pellegrini"].each_with_index do |bar, i|
    order = Order.create!({ description: bar })
    Product.all.sample(3).each do |product|
      quantity = [*1..5].sample
      ProductConfiguration.create!({ order: order, product: product, quantity: quantity })
    end
  end
end
