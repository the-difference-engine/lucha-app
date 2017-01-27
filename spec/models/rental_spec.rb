require 'rails_helper'
require 'spec_helper'

RSpec.describe Rental, type: :model do

  describe Rental do
    it "is valid with valid attributes" do
      rental = build(:rental)
      expect(rental).to be_valid
    end
    it "is invalid with a duplicate :client_id" do
      rental = create(:rental)
      another_rental = build(:rental, client_id: rental.client_id)
      another_rental.valid?
      expect(another_rental.errors[:client_id]).to include("has already been taken")
    end
    it "is invalid without the presence of :client" do
      rental = Rental.new(attributes_for(:rental))
      rental.valid?
      expect(rental.errors[:client]).to include("can't be blank")
    end
    context "should allow only true or false answers" do
      before(:each) do
        client = create(:client)
      end
      it "is valid with a true/false value for studio attribute" do
        rental = build(:rental, studio: true)
        expect(rental.studio).to eq(true)
        expect(rental).to be_valid
      end
      it "will cast and invalid value to false for studio attribute" do
        rental = build(:rental, studio: false)
        expect(rental.studio).to eq(false)
      end
      it "is valid with a true/false value for two_bed attribute" do
        rental = build(:rental, two_bed: true)
        expect(rental.two_bed).to eq(true)
        expect(rental).to be_valid
      end
      it "will cast and invalid value to false for two_bed attribute" do
        rental = build(:rental, two_bed: false)
        expect(rental.two_bed).to eq(false)
      end
      it "is valid with a true/false value for three_bed attribute" do
        rental = build(:rental, three_bed: true)
        expect(rental.three_bed).to eq(true)
        expect(rental).to be_valid
      end
      it "will cast and invalid value to false for three_bed attribute" do
        rental = build(:rental, three_bed: "cats")
        expect(rental.three_bed).to eq(false)
      end
      it "is valid with a true/false value for wheelchair_accessible attribute" do
        rental = build(:rental, wheelchair_accessible: true)
        expect(rental.wheelchair_accessible).to eq(true)
        expect(rental).to be_valid
      end
      it "will cast and invalid value to false for wheelchair_accessible attribute" do
        rental = build(:rental, wheelchair_accessible: "birds")
        expect(rental.wheelchair_accessible).to eq(false)
      end
      it "is valid with a true/false value for car_owner attribute" do
        rental = build(:rental, wheelchair_accessible: true)
        expect(rental.car_owner).to eq(true)
        expect(rental).to be_valid
      end
      it "will cast and invalid value to false for car_owner attribute" do
        rental = build(:rental, car_owner: 3)
        expect(rental.car_owner).to eq(false)
      end
      it "is valid with a true/false value for pet_owner attribute" do
        rental = build(:rental, pet_owner: true)
        expect(rental.pet_owner).to eq(true)
        expect(rental).to be_valid
      end
      it "will cast and invalid value to false for pet_owner attribute" do
        rental = build(:rental, pet_owner: 4)
        expect(rental.pet_owner).to eq(false)
      end
      it "is valid with a true/false value for agree_to_fee attribute" do
        rental = build(:rental, agree_to_fee: true)
        expect(rental.agree_to_fee).to eq(true)
        expect(rental).to be_valid
      end
      it "will cast and invalid value to false for pet_owner attribute" do
        rental = build(:rental, agree_to_fee: 4)
        expect(rental.agree_to_fee).to eq(false)
      end
    end
    it "is invalid without a hear_of_property attribute" do
      rental = build(:rental, hear_of_property: nil)
      rental.valid?
      expect(rental.errors[:hear_of_property]).to include("can't be blank")
    end
    it "is invalid without a reason_for_move attribute" do
      rental = build(:rental, reason_for_move: nil)
      rental.valid?
      expect(rental.errors[:reason_for_move]).to include("can't be blank")
    end
    it "is invalid without a housing_situation attribute" do
      rental = build(:rental, housing_situation: nil)
      rental.valid?
      expect(rental.errors[:housing_situation]).to include("can't be blank")
    end
    it "is invalid without an employer_name attribute" do
      rental = build(:rental, employer_name: nil)
      rental.valid?
      expect(rental.errors[:employer_name]).to include("can't be blank")
    end
    it "is invalid without an employer_address attribute" do
      rental = build(:rental, employer_address: nil)
      rental.valid?
      expect(rental.errors[:employer_address]).to include("can't be blank")
    end
    it "is invalid without an employer_city attribute" do
      rental = build(:rental, employer_city: nil)
      rental.valid?
      expect(rental.errors[:employer_city]).to include("can't be blank")
    end
    it "is invalid without formatted employer_phone attribute" do
      rental = build(:rental, employer_phone: '123-3213')
      rental.valid?
      expect(rental.errors[:employer_phone]).to include("- Phone numbers must be in xxx-xxx-xxxx format.")
    end
  end
end
