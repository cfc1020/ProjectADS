user  = User.create!(name: "UserName00", email: "User00@example.com", password: "12345678")
admin = User.new(name: "AdminName00", email: "Admin00@example.com", password: "12345678")
admin.role = "admin"
admin.save!

type = Type.create!(name: "TypeName00")

5.times do |i|
  ad = Ad.new(content: "ContentAd#{i}", type_id: type.id)
  ad.user = user
  ad.save!
end
