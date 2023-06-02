class PlacesController < ApplicationController
    def index
        @places= Place.all
        @timings=Timing.all
       
    end
    def new
          @places = Place.all
          @place= Place.new
          if @place.save
            # Show saved successfully
          else
            # Show failed to save, handle the error
            puts @place.errors.full_messages
          end
      end
      
      def create
        @places=Place.all
        @place = Place.new(place_params)
       
        @show = Show.find(params[:show_id])
        # @show.places.create(place_params)
      
        if @place.save
          # Handle successful save
          redirect_to @place, notice: 'place was successfully created.'
        else
            puts @place.errors.full_messages
          # Handle save errors
          @places = Place.all
          render :new
        end
      end

      def show
       # @show = Show.find(params[:place][:show_id])
        @place = Place.find(params[:id])
        @places = Place.all
  
        @timings = @place.timings
      end
      def update
        @show = Show.find(params[:place][:show_id])
        place = Place.find(params[:id])
        place.update(place_params)
        redirect_to place
      end
   
      def edit
        @show_title = params[:show_title]
       # @place.show_id = params[:place][:show_id] 
       @place = Place.find(params[:id])
      end
      def destroy
        place = Place.find(params[:id])
        place.destroy
        redirect_to places_path, notice: 'Venue was successfully deleted.'
      end
    
      private
    
      def place_params
        params.require(:place).permit(
          :user_id,
          :show_id,
          :placevenue,
          :placetown,
          :placeaddress,
          :placeinfo,
          shows_attributes: [:id, :title, :genre, :description, :imageup, :performer])
      end
    end
 


