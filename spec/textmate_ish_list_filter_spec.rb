require File.dirname(__FILE__) + '/spec_helper.rb'

describe TextmateIshListFilter::FilterList do
  before(:each) do
    @list = %w[
      README.rdoc
      app/models/article.rb
      app/controllers/blog_controller.rb
      test/functionals/blog_controller_test.rb
      web/log/production.rb
      log/read.me
      ]
    @filter = TextmateIshListFilter::FilterList.new(@list)
  end

  it "should query 'article' and exact matches" do
    @results = @filter.query('article')
    @results.should == %w[
      app/models/article.rb
      ]
  end
  it "should query 'blog' and exact matches are first" do
    @results = @filter.query('blog')
    @results.should == %w[
      app/controllers/blog_controller.rb
      test/functionals/blog_controller_test.rb
      web/log/production.rb
      ]
  end
  it "should query 'blogxx' and return no results" do
    @results = @filter.query('blogxx')
    @results.should == []
  end
  it "should ignore case" do
    @results = @filter.query('read')
    @results.should == %w[
      log/read.me
      README.rdoc
      ]
  end
end