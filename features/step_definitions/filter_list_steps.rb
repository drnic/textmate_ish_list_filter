Given /^an array of terms from$/ do |list_as_string|
  @list = list_as_string.split(/\n/)
end

When /^I filter with query "([^\"]*)"$/ do |query|
  @filter = TextmateIshListFilter::FilterList.new(@list)
  @results = @filter.query(query)
end

Then /^I should receive$/ do |results|
  results = results.split(/\n/)
  @results.should == results
end

