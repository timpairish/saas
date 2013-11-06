# Add a declarative step here for populating the DB with movies.

# http://ryanbigg.com/2010/06/using-cucumber-tables-to-specify-associations/
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie_row|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    new_movie = Movie.find_or_create_by_title movie_row["title"]
    new_movie.rating = movie_row["rating"]
    new_movie.release_date = movie_row["release_date"]
    new_movie.save
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  titles = all(:xpath, "/html/body/div[@id='main']/table[@id='movies']/tbody/tr/td[1]").map {|el| el.text}
  titles.index(e1).should < titles.index(e2)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/, ?/).each do |rating|
    step "I check \"ratings_#{rating}\""
  end
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  count = Movie.all.size
  page.all('table#movies tbody tr').count.should == count
end
