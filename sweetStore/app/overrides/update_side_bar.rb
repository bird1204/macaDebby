Deface::Override.new(:virtual_path => "spree/shared/_taxonomies", 
                      :name => "change side text",
                      :insert_before => "nav#taxonomies",
                      :text => '  
                                <ul>              
                                  <li id="search-bar" data-hook>
                                    <%= form_tag spree.products_path, :method => :get, class: "navbar-form" do %>
                                    <div class="form-group">
                                      <%= search_field_tag :keywords, params[:keywords], :placeholder => Spree.t(:search), class: "form-control" %>
                                    </div>
                                    <%= submit_tag Spree.t(:search), :name => nil, class: "btn btn-success btn-sm" %>
                                  <% end %>
                                  </li>
                                </ul>
'
                    )

