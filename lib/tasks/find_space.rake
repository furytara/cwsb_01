namespace :find_space do
  desc "TODO"
  task :create_addresses => :environment do
    address1 = Address.create! details: "Parkson Da Nang, Hung Vuong, Vinh Trung, Da Nang, Vietnam"
    address2 = Address.create! details: "Hotel Novotel Danang Premier Han River, Da Nang, Vietnam"

    venue1 = Venue.new name: Faker::Name.name,
      description: Faker::Lorem.sentence, address: address1

    image1 = Image.new image_url: "/images/spaces/space_default.jpg"
    image2 = Image.new image_url: "/images/spaces/space_default.jpg"
    image3 = Image.new image_url: "/images/spaces/space_default.jpg"
    image4 = Image.new image_url: "/images/spaces/space_default.jpg"

    space1 = Space.new space_type: 1, size: 10, capicity: 4, quantity: 2
    space1.images << image1
    venue1.spaces << space1

    space2 = Space.new space_type: 1, size: 10, capicity: 4, quantity: 2
    space2.images << image2
    venue1.spaces << space2
    venue1.save

    venue2 = Venue.new name: Faker::Name.name,
      description: Faker::Lorem.sentence, address: address2
    space3 = Space.new space_type: 1, size: 10, capicity: 4, quantity: 2
    space3.images << image3
    space3.images << image4
    venue2.spaces << space3

    venue2.save
  end
end
