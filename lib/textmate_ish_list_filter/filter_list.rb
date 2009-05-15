module TextmateIshListFilter
  class FilterList
    # +terms+ can be an array of Strings, or array of {:title => String} hashes
    # The FilterList can then be used multiple times to query for sublists
    def initialize(terms)
      @terms = terms
    end
    
    def query(query)
      @terms.select { |term| term.index(query) }
    end
  end
end
