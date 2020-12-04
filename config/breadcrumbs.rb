crumb :root do
  link "Home", root_path
end

crumb :new_user_session do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :new_user_registration do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :user do
  if params[:id].present?
    user = User.find(params[:id])
    link "#{user.name}さん", user_path(user.id)
    parent :root
  else
    link "#{current_user.name}さん", user_path(current_user.id)
    parent :root
  end
end

crumb :edit_user do
  link "マイページ設定", edit_user_path(current_user.id)
  parent :user
end

crumb :search_shops do
  link search_word, search_shops_path
  parent :root
end

crumb :shop do |shop|
    if params[:shop_id].present?
      shop = Shop.find(params[:shop_id])
      link shop.name, shop_path(shop.id)
      parent :root
    else 
      shop = Shop.find(params[:id])
      link shop.name, shop_path(shop.id)
      parent :root
    end
end

crumb :new_shop do
  link "新規店舗の登録", new_shop_path
  parent :root
end

crumb :edit_shop do
  shop = Shop.find(params[:id])
  link "店舗情報の編集", edit_shop_path(shop.id)
  parent :shop
end

crumb :shop_reviews do |shop|
  shop = Shop.find(params[:shop_id])
  link "口コミ一覧", shop_reviews_path(shop)
  parent :shop
end

crumb :new_shop_review do
  shop = Shop.find(params[:shop_id])
  link "口コミ投稿", new_shop_review_path(shop_id: shop.id)
  parent :shop_reviews
end

crumb :edit_shop_review do
  shop = Shop.find(params[:shop_id])
  link "口コミの編集", edit_shop_review_path(shop_id: shop.id)
  parent :shop_reviews
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).