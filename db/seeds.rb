# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



users = User.all

SEED_USERS = [
  {
    first_name: 'Cookie',
    last_name: 'Monster',

    encrypted_password: "COOKIIIIIEEEES",
    token: "1234567890",
    facebook_id: "1234567890",
    photo: 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/c4.0.160.160/p160x160/25671_347247221586_2758896_n.jpg?oh=d1c69aff5f8fd349e15cbd3415aaff18&oe=55E9F0CB&__gda__=1441407609_76599d002652f867df430532318d9c15'
  },
  {
    first_name: 'Oscar',
    last_name: 'Grouch',

    encrypted_password: "COOOOKKKIEEESS",
    token: "1234567890",
    facebook_id: "1234567890",
    photo: 'http://ecx.images-amazon.com/images/I/41SAXtmuRAL._AA160_.jpg&imgrefurl=http://www.amazon.com/s?rh%3Dn%253A166210011%252Cp_lbr_characters_browse-bin%253AOscar%2Bthe%2BGrouch&h=160&w=160&tbnid=SeTjUPhwcagibM:&zoom=1&docid=-JgGcn8v1PNUNM&ei=ait0Vd-CBPK0sATvvIHIBQ&tbm=isch&ved=0CB4QMygCMAI'
  },
  {
    first_name: 'Slothy',
    last_name: 'Sloth',

    encrypted_password: "COOOOKKKIEEESS",
    token: "1234567890",
    facebook_id: "1234567890",
    photo: 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xaf1/v/t1.0-1/c110.32.404.404/s160x160/482757_634950153198021_742707828_n.jpg?oh=67d78b327c8ca5ee28f92056dbaeae6b&oe=55EBA23E&__gda__=1441599486_265e6eea11dec13fde48c781f100ec29'
  },
  {
    first_name: 'Mankey',
    last_name: '-',

    encrypted_password: "COOOOKKKIEEESS",
    token: "1234567890",
    facebook_id: "1234567890",
    photo: 'http://cdn.bulbagarden.net/media/upload/thumb/4/41/056Mankey.png/160px-056Mankey.png'
  }
]

RECCS = {
  address: ['40 Broad Street', '322 Franklin Street', '171 Milk Street', '105 Water Street', '177 Milk Street'],
  details: ['This place is awesome', 'Best ever', "The cookies are great"],
  title: ["Go here definitely", "You gotta try this", "This is f%($ing awesome"]
}

SEED_USERS.each do |seed|
  frnd = User.find_or_create_by(seed)
  frnd.email = "#{seed[:first_name]}#{seed[:last_name]}@awesome.com"
  frnd.password = "12345678"
  frnd.save
  users.each do |user|
    Friend.find_or_create_by(friend1: user.id, friend2: frnd.id)
    rec = Recommendation.create(
      user_id: frnd.id,
      details: RECCS[:details].sample,
      title: RECCS[:title].sample,
      address: RECCS[:address].sample,
      city: "Boston",
      state: "MA",
      zip_code: '02109'
    )
    Accept.create(
      user_id: user.id,
      recommendation_id: rec.id
    )
  end
end
