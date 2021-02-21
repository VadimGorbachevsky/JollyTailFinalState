class UncountordersController < ApplicationController
    
    def index
    end
    
    def show
    end
    
    def kvitok
    end
    
    def delete
    end
    
    def create
        @uncountorder = Uncountorder.create(product_id: Product.find(params[:pr_id]).name, count: params[:count], contact: params[:contact])
        @uncountorder.save
        UnorderUsMailer.unorder_us_mailer.deliver_now
        flash[:notice] = "Мыполучили вашу заявку. В ближайшее время с вами свяжется менеджер, чтобы уточнить сроки доставки."
        redirect_to root_url
    end
    
    def update
    end
    
    def edit
    end
    
    def uncountorder_params
        params.require(:uncountorder).permit(:id, :product_id, :count, :contact)
    end
    
    def product_params
        params.require(:product).permit(:id, :name)
    end
    
end
