class PagesController < ApplicationController
    def home
        render :layout => 'landing'
    end
    
    def mapa
        render "mapa"
    end
    
    def unauthorized
        render "not_found"
    end

end