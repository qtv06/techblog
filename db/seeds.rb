category_name_arr = %w{Javascript Ruby Rails Php Ios Android Swift Java Qa Ruby\ On\ Rails}
category_name_arr.each do |cate_name|
  Category.create!(category_name: cate_name)
end

tag_name_arr = %w{css rails ruby php ios jquery shell java swift qa html bootstrap}
# img_default_arr = %w{javascript-1.png javascript-2.png javascript-3.png }
tag_name_arr.each do |tag_name|
  Tag.create!(tag_name: tag_name)
end

5.times do
  username = Faker::Name.name
  email = Faker::Internet.email
  password = "123456"
  password_confirmation = "123456"
  User.create!(username: username, email: email, password: password, password_confirmation: password_confirmation)
end

categories = Category.all
tags = Tag.all
users = User.all

4.times do
  categories.each do |category|
    title = Faker::Lorem.sentence(7)
    # image = img_default_arr.sample
    content = Faker::Lorem.paragraph(6, true, 6)
    description = Faker::Lorem.paragraph(3, true, 6)
    link = "https://viblo.asia/"
    sample_tags = tags.sample(2)
    user_id = users.sample.id
    post = category.posts.create!(title: title, content: content, description: description, link: link, user_id: user_id)
    sample_tags.each do |tag|
      post.post_tags.create!(tag: tag)
    end
  end
end
