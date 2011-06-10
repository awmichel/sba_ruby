# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Sites
    include SBA::Client::Connection

      # Returns all recommended sites for all keywords and phrases.
      #
      # @format :xml
      # @return {Hash}
      # @see http://www.sba.gov/about-sba-services/7630#all
      # @example Returns recommended sites for keywords and phrases
      #   SBA.all_sites
      def all_sites(options={})
        response = get("rec_sites/all_sites/keywords.json", options)
        #simplify_response(response)
      end
    
      # Returns all recommended sites for a specific keyword.
      #
      # @param keyword [String] A search word or phrase
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/about-sba-services/7630#keyword
      # @example
      #   SBA.sites_by_keyword("managing a business")     
      def sites_by_keyword(keyword, options={})
        response = get("rec_sites/keywords/#{keyword}.json", options)
      end
    
      def sites_by_category(category, options={})
        response = get("rec_sites/category/#{category}.json", options)
      end
    
      def sites_by_master_term(term, options={})
        response = get("rec_sites/keywords/master_term/#{term}.json", options)
      end
    
      def sites_by_domain(domain, options={})
        response = get("rec_sites/keywords/domain/#{domain}.json", options)
      end

    end
  end
end
