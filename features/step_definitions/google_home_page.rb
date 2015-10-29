Given /^I open the Google search page$/ do
    @google_home_page = @browser.open_page('https://www.google.com')
    @google_home_page.verify_page
end

Given /^I search for "(.*?)"$/ do |search_term|
  @google_results_page = @google_home_page.enter_search(search_term)
end