Rails.application.routes.draw do
 resources :reporte_filtros do
    collection do
      get "new/:reporte_id", :action => 'new', as: "reporte_new"
    end
  end

  resources :reporte_campos do
    collection do
      get "new/:reporte_id", :action => 'new', as: "reporte_new"
    end
  end

  resources :reportes do
  	 member do
  	 	 get :print              
  	 end
  end

  resources :empleados
  root to: 'visitors#index'
end
