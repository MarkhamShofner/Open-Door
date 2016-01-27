# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


seekers = []
userSeekers = []
20.times do |i|
  @user = User.create!({email: Forgery('internet').email_address,
                :password => 'password',
                :password_confirmation => 'password'
                })
  userSeekers.push(@user)
  seekers.push(Seeker.create!({first_name: Forgery('name').first_name,
                last_name: Forgery('name').last_name,
                gender: Forgery('personal').abbreviated_gender,
                photo_url: "http://lorempixel.com/400/200/people/",
                city: Forgery('address').city,
                email: Forgery('internet').email_address,
                phone_number: Forgery('address').phone,
                bio: Forgery('lorem_ipsum').paragraph,
                user_id: @user.id,
                }))
end

providers = []
userProviders = []
20.times do |i|
  @user = User.create!({email: Forgery('internet').email_address,
                :password => 'password',
                :password_confirmation => 'password'
                })
  userProviders.push(@user)
  providers.push(Provider.create!({organization_name: Forgery('name').company_name,
                photo_url: "http://lorempixel.com/400/200/technics/",
                city: Forgery('address').city,
                POC_first_name: Forgery('name').first_name,
                POC_last_name: Forgery('name').last_name,
                email: Forgery('internet').email_address,
                phone_number: Forgery('address').phone,
                bio: Forgery('lorem_ipsum').paragraph,
                user_id: @user.id,
                }))
end

postings = []
60.times do
  @random_provider = Provider.all.sample
  postings.push(Posting.create!({title: Forgery('name').job_title,
                description: Forgery('lorem_ipsum').paragraph,
                timeframe: Forgery('date').date,
                pay: Forgery('monetary').formatted_money,
                provider_id: @random_provider.id
                }))
end


## create interests rows for join table
## adjust to create a posting - and then pick a random set of seekers
# 20.times do
#   # create new Interests
#   random_seeker = Seeker.all.sample
#   random_posting = "
#   random_posting.create_interest(seeker: random_seeker)
# end
