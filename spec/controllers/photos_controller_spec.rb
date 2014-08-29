require 'rails_helper'

describe PhotosController do

  describe PhotosController do
    let!(:photo){ Photo.create(title: "Pizza", url: "www.dominos.com")}

    context "routing" do
      it "routes / to photos#index" do
        expect(:get => "/").to route_to(controller:"photos", action:"index")
      end
    end

    context "index" do
      it "assigns all photos to a variable" do
        get :index
        expect(assigns(:photos)).to eq Photo.all
        expect(assigns(:photos)).to be_empty
      end

      it "renders the index template" do
        get :index
        p response
        p response.methods
        expect(response).to render_template("index")
      end
    end

    context "show" do
      before do
        get :show, :id=> photo.id
      end

      it "assigns the photo to a variable" do
        expect(assigns(:photo)).to be
      end

      it "renders the show template" do
        expect(response).to render_template("show")
      end
    end

    context "create" do
      context "with a valid photo" do
        before do
          post :create, :photo=> { :title=> "Pizza Special", :url=> "www.thisisapizza.com"}
        end
        it "creates a new valid photo" do
          expect(Photo.last.title).to eq("Pizza Special")
        end

        it { should respond_with(:redirect) }
        it { should redirect_to(assigns(:photo)) }
      end

      context "an invalid photo" do
        before do
          post :create, :photo=> { :title=> "", :url=> ""}
        end

        it "returns an error" do
          expect(assigns(:photo).errors).not_to be_empty
        end

        it { should render_template('photos/index') }
      end
    end

  end
end
