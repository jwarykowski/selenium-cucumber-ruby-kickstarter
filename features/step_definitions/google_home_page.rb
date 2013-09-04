Given /^I have opened google$/ do
  @google_home_page = @browser.open_google
end

When /^I see the search page$/ do
  @google_home_page.verify_self
end

Given /^I have opened google search I should be able to search for "(.*?)"$/ do |search_term|
  @google_results_page = @google_home_page.enter_search(search_term)
end