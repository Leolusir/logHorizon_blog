namespace :articles do
  desc "set existing articles count to 0"
  task set_count_to_zero: :environment do
    Article.all.each do |article|
      article.update_columns(count: 0)
    end
  end
end
