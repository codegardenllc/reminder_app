describe InformationController do
  describe "exposures" do
    describe "plans" do
      let!(:plan) { FactoryGirl.create(:plan) }
      subject { controller.plans }

      it { is_expected.to eq [plan] }
      it { is_expected.to be_an ActiveRecord::Relation }
    end
  end

  describe "actions" do
    describe "pricing" do
      before do
        get :pricing
      end

      it { is_expected.to render_template :pricing }
    end
  end
end