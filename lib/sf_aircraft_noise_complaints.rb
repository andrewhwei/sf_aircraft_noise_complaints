require "sf_aircraft_noise_complaints/version"
require 'unirest'

module SfAircraftNoiseComplaints
  class Complaint

    attr_reader :community, :year, :no_of_callers, :no_of_complaints

    def initialize(hash)
      @community = hash["community"]
      @year = hash["year"]
      @no_of_complaints = hash["total_complaints"]
      @no_of_callers = hash["total_number_of_callers"]
    end

    def self.all
      complaints_array = Unirest.get("https://data.sfgov.org/resource/bw78-hmt5.json").body
      complaints = []
      complaints_array.each do |complaint_hash|
        complaints.push(Complaint.new(complaint_hash))
      end
      return complaints
    end

    
  end
end
