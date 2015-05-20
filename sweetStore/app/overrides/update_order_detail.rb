Deface::Override.new(:virtual_path => "spree/shared/_order_details", 
                      :name => "change order_details payment-info text",
                      :replace_contents => ".payment-info",
                      :text => '  
                              <% order.payments.valid.each do |payment| %>
                                <%if payment.payment_method.name == "自行轉帳"%>
                                  轉帳資訊：<br/>
                                  銀行代碼：台北富邦(012)<br/>
                                  戶名：屁孩章嘉<br/>
                                  帳戶：5801-6802-1234<br/>
                                <%else%>
                                  <%=render payment %><br/>
                                <%end%>
                              <% end %>
'
                    )

