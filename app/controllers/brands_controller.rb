class BrandsController < ApplicationController
    def new
    end

    def edit
    end
    
    def destroy
    end

    def update
    end
    
    def brand_params
        params.require(:brand).permit(:id, :name, :text)
    end
end