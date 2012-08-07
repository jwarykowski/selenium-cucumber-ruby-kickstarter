Given /^I have opened google$/ do
  @googleHomePage = @browser.openGoogle
end

When /^I see the search page$/ do
  @googleHomePage.verifySelf
end

Given /^I have opened google search I should be able to search for "(.*?)"$/ do |searchTerm|
  @googleResultsPage = @googleHomePage.enterSearch(searchTerm)
end