puts "Cleaning seed trip..."

Trip.where(user_id: nil).destroy_all

puts "Creating seed trips..."

Trip.create!(
  city: "Rio de Janeiro",
  content: <<~TEXT,
  ## Attractions
  - Christ the Redeemer
  - Sugarloaf Mountain
  - Copacabana Beach
  - Santa Teresa neighborhood

  ## Food
  - Feijoada
  - Pão de queijo
  - Fresh seafood
  - Caipirinha

  ## Neighborhoods
  - Copacabana
  - Ipanema
  - Santa Teresa
  - Lapa

  ## Tips
  - Best time to visit: May–October
  - Watch sunsets at Arpoador
  - Use Uber at night
  TEXT
  user: nil
)

Trip.create!(
  city: "São Paulo",
  content: "São Paulo is Brazil's largest city, known for gastronomy, Avenida Paulista, MASP museum, nightlife, and cultural diversity.",
  user: nil
)

Trip.create!(
  city: "Minas Gerais",
  content: "Minas Gerais is known for historic colonial towns like Ouro Preto, mountains, waterfalls, traditional food like pão de queijo and feijão tropeiro.",
  user:
)

puts "Seeds created!"
