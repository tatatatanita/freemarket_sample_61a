crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :user do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :show_exhibit_user do
  link "出品した商品 - 出品中", show_exhibit_user_path(current_user)
  parent :user
end

crumb :product do
  link "出品商品画面", product_path(current_user)
  parent :show_exhibit_user
end

crumb :buyer_show_product do |product|
  link "#{product.title}", buyer_show_product_path(current_user)
  parent :root
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