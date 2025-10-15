// Defining a data model.
class Recipe {
  name string
  Ingredients string[]
  Steps string[]
}

// Create a function to extract the recipe from a string.
function ExtractRecipe(recipe: string) -> Recipe {
  // Specify a client as provider/model-name
  // You can also use custom LLM params with a custom client name from clients.baml like "client CustomGPT5" or "client CustomSonnet4"
  client "anthropic/claude-sonnet-4-20250514"
  prompt #"
    Extract from this content:
    {{ recipe }}

    {{ ctx.output_format }}
  "#
}



// Test the function with a messy, unstructured recipe. Open the VSCode playground to run this.
test mums_chicken_noodle_soup {
  functions [ExtractRecipe]
  args {
    recipe #"
      So my mum's chicken noodle soup is amazing! Here's what you need: get a whole chicken or like
      2-3 pounds of chicken pieces (I use thighs they're more flavorful), onions - maybe 2 medium ones,
      carrots... idk 4 or 5? celery stalks 3-4, garlic cloves - tons like 6, bay leaves couple of them,
      thyme (fresh is better but dried works - 1 tsp?), salt and pepper obvs, and egg noodles about 8 oz
      or just however much you want really. Oh and parsley at the end!

      OK so basically throw the chicken in a big pot with like 10 cups of water or enough to cover it.
      Add the onions (chopped), carrots (chopped kinda chunky), celery (also chopped), smashed garlic,
      bay leaves, and thyme. Bring it all to a boil then turn it down and let it simmer for like an hour?
      Maybe 90 min if you have time.

      Take the chicken out - careful it's hot!!! Let it cool a bit then shred the meat, throw away bones
      and skin. Meanwhile fish out the bay leaves from the soup. Add the noodles to the pot and cook them
      for like 8-10 minutes until tender. Put the shredded chicken back in. Taste it and add more salt
      and pepper if needed (you probably need more salt lol).

      Right before serving chop up some fresh parsley and throw it in. Makes enough for like 6-8 people
      I think? Freezes really well too! Sometimes I add a squeeze of lemon at the end which is *chef's kiss*
    "#
  }
}

test chocolate_chip_cookies {
  functions [ExtractRecipe]
  args {
    recipe #"
      okay so these are literally THE BEST cookies ever!!! You're gonna need flour - I think it's like
      2 and a quarter cups? And baking soda, just a teaspoon. Salt too, teaspoon of that. Butter is super
      important - 1 cup but it HAS to be softened (leave it out for like an hour before). Then you need
      sugars - both white and brown, 3/4 cup each. Oh and 2 eggs, vanilla extract maybe 2 teaspoons?,
      and chocolate chips... honestly I just pour until it looks right but the bag says 2 cups lol

      First thing - preheat your oven to 375 degrees! Super important. Then cream the butter and both
      sugars together until it's all fluffy, takes like 3-4 minutes with a mixer. Beat in the eggs one
      at a time, then add the vanilla.

      In a different bowl mix your dry ingredients - the flour, baking soda, and salt. Stir that up.
      Then slowly add the dry stuff to the butter mixture. Don't overmix it or the cookies will be tough!!!
      Once it's just combined, fold in the chocolate chips with a spatula or wooden spoon.

      Drop spoonfuls onto a cookie sheet - leave space between them cause they spread a lot. I usually
      do like 9 per sheet. Bake for 9-11 minutes, they should be golden on the edges but still look
      slightly underdone in the middle (trust me on this!!). Let them sit on the pan for 2 minutes then
      move to a cooling rack.

      Makes like 5 dozen cookies? Maybe more, depends how big you make them. They're so good warm with
      a glass of milk omg
    "#
  }
}

test quick_stir_fry {
  functions [ExtractRecipe]
  args {
    recipe #"
      when I'm lazy I just make this quick stir fry - literally takes 20 min tops. grab whatever veggies
      you have (I usually do bell peppers couple of them, broccoli a head or so, snap peas handful,
      carrots 2-3 sliced thin). protein - chicken breast pound and a half cut into strips or tofu if
      you're vegetarian. garlic and ginger - both fresh, like 3 cloves garlic and a thumb sized piece
      of ginger minced up.

      for the sauce just whisk together soy sauce (1/4 cup), bit of honey or brown sugar (tablespoon?),
      sesame oil (teaspoon), and cornstarch (teaspoon so it thickens).

      get your wok or big pan really really hot. add some oil - vegetable or peanut oil works, couple
      tablespoons. cook the protein first until it's done then take it out and set aside. add more oil
      if you need it then toss in the garlic and ginger, cook for like 30 seconds just til fragrant.
      throw in your veggies - harder ones first like carrots and broccoli, cook for 2-3 min, then add
      the softer ones. keep everything moving in the pan!

      add the protein back in, pour the sauce over everything and stir it all together for another
      minute or two until the sauce thickens and coats everything. serve over rice. boom done. feeds
      3-4 people depending on how hungry everyone is
    "#
  }
}
