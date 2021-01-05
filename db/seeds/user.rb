@user = User.find(1)
binding.pry
@user.image.attach(io: File.open('db/images/pico.jpeg'), filename: 'pico.jpeg', content_type: 'application/jpeg')
@user.save