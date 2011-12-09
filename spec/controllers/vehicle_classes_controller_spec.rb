require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VehicleClassesController do

  # This should return the minimal set of attributes required to create a valid
  # VehicleClass. As you add validations to VehicleClass, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all vehicle_classes as @vehicle_classes" do
      vehicle_class = VehicleClass.create! valid_attributes
      get :index
      assigns(:vehicle_classes).should eq([vehicle_class])
    end
  end

  describe "GET show" do
    it "assigns the requested vehicle_class as @vehicle_class" do
      vehicle_class = VehicleClass.create! valid_attributes
      get :show, :id => vehicle_class.id
      assigns(:vehicle_class).should eq(vehicle_class)
    end
  end

  describe "GET new" do
    it "assigns a new vehicle_class as @vehicle_class" do
      get :new
      assigns(:vehicle_class).should be_a_new(VehicleClass)
    end
  end

  describe "GET edit" do
    it "assigns the requested vehicle_class as @vehicle_class" do
      vehicle_class = VehicleClass.create! valid_attributes
      get :edit, :id => vehicle_class.id
      assigns(:vehicle_class).should eq(vehicle_class)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new VehicleClass" do
        expect {
          post :create, :vehicle_class => valid_attributes
        }.to change(VehicleClass, :count).by(1)
      end

      it "assigns a newly created vehicle_class as @vehicle_class" do
        post :create, :vehicle_class => valid_attributes
        assigns(:vehicle_class).should be_a(VehicleClass)
        assigns(:vehicle_class).should be_persisted
      end

      it "redirects to the created vehicle_class" do
        post :create, :vehicle_class => valid_attributes
        response.should redirect_to(VehicleClass.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vehicle_class as @vehicle_class" do
        # Trigger the behavior that occurs when invalid params are submitted
        VehicleClass.any_instance.stub(:save).and_return(false)
        post :create, :vehicle_class => {}
        assigns(:vehicle_class).should be_a_new(VehicleClass)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VehicleClass.any_instance.stub(:save).and_return(false)
        post :create, :vehicle_class => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vehicle_class" do
        vehicle_class = VehicleClass.create! valid_attributes
        # Assuming there are no other vehicle_classes in the database, this
        # specifies that the VehicleClass created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        VehicleClass.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => vehicle_class.id, :vehicle_class => {'these' => 'params'}
      end

      it "assigns the requested vehicle_class as @vehicle_class" do
        vehicle_class = VehicleClass.create! valid_attributes
        put :update, :id => vehicle_class.id, :vehicle_class => valid_attributes
        assigns(:vehicle_class).should eq(vehicle_class)
      end

      it "redirects to the vehicle_class" do
        vehicle_class = VehicleClass.create! valid_attributes
        put :update, :id => vehicle_class.id, :vehicle_class => valid_attributes
        response.should redirect_to(vehicle_class)
      end
    end

    describe "with invalid params" do
      it "assigns the vehicle_class as @vehicle_class" do
        vehicle_class = VehicleClass.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VehicleClass.any_instance.stub(:save).and_return(false)
        put :update, :id => vehicle_class.id, :vehicle_class => {}
        assigns(:vehicle_class).should eq(vehicle_class)
      end

      it "re-renders the 'edit' template" do
        vehicle_class = VehicleClass.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VehicleClass.any_instance.stub(:save).and_return(false)
        put :update, :id => vehicle_class.id, :vehicle_class => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vehicle_class" do
      vehicle_class = VehicleClass.create! valid_attributes
      expect {
        delete :destroy, :id => vehicle_class.id
      }.to change(VehicleClass, :count).by(-1)
    end

    it "redirects to the vehicle_classes list" do
      vehicle_class = VehicleClass.create! valid_attributes
      delete :destroy, :id => vehicle_class.id
      response.should redirect_to(vehicle_classes_url)
    end
  end

end
