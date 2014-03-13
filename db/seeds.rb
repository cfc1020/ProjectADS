5.times do |i|
  User.create(name: "UserName#{i}", email: "User#{i}@example.com", password: "12345678")
end

5.times do |i|
  Type.create(name: "TypeName#{i}")
end

5.times do |i|
  Ad.create(content: "ContentAd#{i}", user_id: "4", type_id: "#{i}")
end
