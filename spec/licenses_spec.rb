require 'helper'

describe SBA do
  
  describe "#by_category" do
    before do
      stub_request(:get, 'http://api.sba.gov/license_permit/by_category/doing%20business%20as.json').
        with().
        to_return(:body => fixture('doing_business_as.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.by_category('doing business as')
      a_request(:get, 'http://api.sba.gov/license_permit/by_category/doing%20business%20as.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.by_category('doing business as')
      test.should be_a Array
      test[52]["url"].should == "http://www.sec.state.vt.us/tutor/dobiz/dobizdoc.htm"
    end
  end

  describe "#by_state" do
    before do
    @path = "http://api.sba.gov/license_permit/all_by_state/CA.json?format=json"
      stub_request(:get, @path).
      with().
      to_return(:body => fixture('by_state.json'),
                :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.by_state("CA")
      a_request(:get, @path).
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.by_state("CA")
      test.should be_a Array
      test[0]["title"].should == "Obtain Disability Insurance"
    end
  end

  describe "#by_business_type" do
     before do
       stub_request(:get, 'http://api.sba.gov/license_permit/by_business_type/child%20care%20services.json').
         with().
         to_return(:body => fixture('by_business_type.json'),
                   :headers => {'Content-Type' => 'application/json'})
     end
     it "should request the correct resource" do
       SBA.by_business_type("child care services")
       a_request(:get, 'http://api.sba.gov/license_permit/by_business_type/child%20care%20services.json').
         with().
         should have_been_made
     end
     it "should return the correct results" do
       test = SBA.by_business_type("child care services")
       test.should be_an Array
       test[0]["url"].should == "http://www.hss.state.ak.us/dpa/programs/ccare/become_a_provider.htm"
       test[1]["url"].should == "http://www.azdhs.gov/als/childcare/"
     end
   end
   
   describe "#business_type_state" do
      before do
        stub_request(:get, 'http://api.sba.gov/license_permit/state_only/child%20care%20services/va.json').
          with().
          to_return(:body => fixture('business_type_state.json'),
                    :headers => {'Content-Type' => 'application/json'})
      end
      it "should request the correct resource" do
        SBA.business_type_state("child care services", "va")
        a_request(:get, 'http://api.sba.gov/license_permit/state_only/child%20care%20services/va.json').
          with().
          should have_been_made
      end
      it "should return the correct results" do
        test = SBA.business_type_state("child care services", "va")
        test.should be_an Array
        test[0]["url"].should == "http://www.dss.virginia.gov/facility/child_care/licensed/child_day_centers/index.cgi"
      end
    end
  
end
