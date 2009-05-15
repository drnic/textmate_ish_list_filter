module TextmateIshListFilter
  class FilterList
    # +terms+ can be an array of Strings, or array of {:title => String} hashes
    # The FilterList can then be used multiple times to query for sublists
    def initialize(terms)
      @terms = terms
    end
    
    def query(query)
      exact_match = @terms.select { |term| term.index(query) }
      
      somewhere_match = @terms.select { |term| term =~ somewhere_regexp(query) }
      [exact_match, somewhere_match].flatten.uniq
    end
    
    def somewhere_regexp(query)
      split_query = query.split("").join('.*')
      %r{#{split_query}}
    end
  end
end
