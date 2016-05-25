class PagesController < ApplicationController
    def home
        render :layout => 'landing'
    end
    
    def mapa
        render "mapa"
    end

end