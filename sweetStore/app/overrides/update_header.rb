Deface::Override.new(:virtual_path => 'spree/shared/_header', 
                      :name => 'change header text',
                      :replace => 'div#spree-header',
                      :text => "

    <div class='navbar navbar-default navbar-fixed-top'>
          <div id='main-nav-bar' class='navbar'>
            <ul class='nav navbar-nav navbar-right' data-hook>
              <li>
                <%= render :partial => 'spree/shared/login_bar' %>
              </li>
              <li id='link-to-cart' data-hook>
                <noscript>
                  <%= link_to Spree.t(:cart), '/cart' %>
                </noscript>
                &nbsp;
              </li>
              <script>Spree.fetch_cart()</script>
            </ul>
          </div>    
    </div>
    <div class='clear'></div>
    <div class='.border3'></div>
    <br><br><br>
    <div class='container'>
      <header>
        <hgroup class='intro'>
          <a href='/'><h1 class='title'>八零甜塔</h1></a>
          <h3 class='tagline'>Since 1991</h3>
        </hgroup>
        <div class='reservations'><br />
          <span class='reservations-title'>致電:</span>
          <hr class='hr-solid' />
          <span class='phone-number'>+886-922-300-906</span>
          <hr class='hr-dashed' />
          <div class='email-us'> <a class='button' href='#' title='Email Us'>Or Email Us</a> </div>
        </div>
      </header>
    </div>
    <BR><BR><BR>
    "

                    )

