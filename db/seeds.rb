user  = User.create!(name: "UserName00", email: "User00@example.com", password: "12345678")
admin = User.new(name: "AdminName00", email: "Admin00@example.com", password: "12345678")
admin.role = "admin"
admin.save!

type = Type.create!(name: "TypeName00")

5.times do |i|
  Ad.create!(content: "ContentAd#{i}", user_id: user.id, type_id: type.id)
end
