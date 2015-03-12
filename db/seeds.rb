# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Firm.delete_all
Case.delete_all
Giver.delete_all
Sponsor.delete_all
User.delete_all

# Create the firms
puts "Creating firms..."
mckinsey = Firm.create(name: "McKinsey")
bcg = Firm.create(name: "BCG")
bain = Firm.create(name: "Bain")
deloitte = Firm.create(name: "Deloitte")
kellogg = Firm.create(name: "Kellogg")

# Create the cases
puts "Creating cases..."
orrington = Case.create(firm_id: kellogg.id, name: "Orrington Office Supplies", image: "Orrington.jpg", summary: "Determine how to optmize profitability for an office supplies company in preparation for an acquisition by a PE firm.", difficulty: "Medium", topic: "Profitability")
oil = Case.create(firm_id: mckinsey.id, name: "Big Oil", image: "Oil.jpg", summary: "Take a journey to understand why the number of gas stations is declining for our client, Big Oil.", difficulty: "Hard", topic: "Profitability")
jt = Case.create(firm_id: bain.id, name: "JT's Energy Drinks", image: "Energy.jpg", summary: "Provide our client with suggestions for how to optimize its marketing mix of products.", difficulty: "Hard", topic: "Marketing")

# Create the givers
puts "Creating givers..."
bugayong = Giver.create(name: "Elizabeth Bugayong")
jelinek = Giver.create(name: "Ashley Jelinek")
mann = Giver.create(name: "Ryan Mann")

puts "Creating sponsors..."

# Create the sponsors for Orrington Office Supplies
Sponsor.create(case_id: orrington.id, giver_id: bugayong.id)

# Create the sponsors for Big Oil
Sponsor.create(case_id: oil.id, giver_id: mann.id)

# Create the sponsors for JT's Energy Drinks
Sponsor.create(case_id: jt.id, giver_id: jelinek.id)

# Create users
User.create(name: "Brian", email: "b-eng@kellogg.northwestern.edu", password: "secret")

puts "There are now #{Firm.count} firms, #{Case.count} cases, #{Giver.count} case givers, #{Sponsor.count} sponsors, and #{User.count} users in the database."
