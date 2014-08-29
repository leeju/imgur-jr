require 'rails_helper'

RSpec.describe VotesController, :type => :controller do

  let!(:vote){ Vote.create!(value: 0, user: User.first, votable: Photo.first) }

    context "routing" do
      it "routes / to votes#index" do
        expect(:get => "/").to route_to(controller:"votes", action:"index")
      end
    end

    # doesn't need to exist
    # context "index" do
    #   it "assigns all votes to a variable" do
    #     get :index
    #     expect(assigns(:votes)).to eq Vote.all
    #   end

    #   it "renders the index template" do
    #     get :index
    #     expect(response).to render_template("index")
    #   end
    # end

    context "show" do
      before do
        get :show, :id => vote.id
      end

      it "assigns the vote to a variable" do
        expect(assigns(:vote)).to be
      end

      it "renders the show template" do
        expect(response).to render_template(:show)
      end
    end

    context "create" do
      context "with a valid vote" do
        before do
          post :create, :vote => { value: 0, user: User.first, votable: Photo.first}
        end
        it "creates a new valid vote" do
          expect(Vote.last.value).to eq(0)
        end
        # it { should respond_with(:redirect) }
        # it { should redirect_to(assigns(:vote)) } # assigns(:vote) = @vote
      end

      context "an invalid vote" do
        before do
          post :create, :vote => { :value => "" }
        end

        it "returns an error" do
          expect(assigns(:vote).errors).not_to be_empty
        end

        it { should render_template('votes/index') }
      end
    end




end
