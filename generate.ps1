$html = Get-Content "C:\Users\Abin Thomas\Downloads\ECommerceproject - Copy\ECommerceproject\checkout.html" -Raw -Encoding UTF8

$aspx_header = "<%@ Page Language=`"C#`" AutoEventWireup=`"true`" CodeBehind=`"Checkout.aspx.cs`" Inherits=`"ECommerceproject.Checkout`" %>`n"
$html = $html -replace '(?s)<body([^>]*)>', "<body`$1>`n    <form id=`"form1`" runat=`"server`">"
$html = $html -replace '(?s)</body>', "    </form>`n</body>"
$html = $html.Replace('<form action="" class="p-1 pl-5 w-[95%]">', '<div class="p-1 pl-5 w-[95%]">')
$html = $html.Replace('</form>', '</div>')
$html = $html.Replace('<form action="" class="p-1 pl-5 w-full">', '<div class="p-1 pl-5 w-full">')
$html = $html -replace '<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="Pincode">', '<asp:TextBox ID="txtPincode" runat="server" CssClass="$1" placeholder="Pincode"></asp:TextBox>'
$html = $html -replace '<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="Full Name">', '<asp:TextBox ID="txtName" runat="server" CssClass="$1" placeholder="Full Name"></asp:TextBox>'
$html = $html -replace '(?s)<textarea[^>]*id="exampleFormControlTextarea1"[^>]*class="(.*?)"[^>]*placeholder="Flat/House No\. Colony/Street No\."\s*></textarea>', '<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="$1" placeholder="Flat/House No. Colony/Street No."></asp:TextBox>'
$html = $html -replace '<input type="text" class="(h-\[35px\] placeholder:text-\[14px\] w-\[60%\][^"]*)" placeholder="Eg\. Near Apollo Hospital">', '<asp:TextBox ID="txtLocality" runat="server" CssClass="$1" placeholder="Eg. Near Apollo Hospital"></asp:TextBox>'
$html = $html -replace '<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="City">', '<asp:TextBox ID="txtCity" runat="server" CssClass="$1" placeholder="City"></asp:TextBox>'
$html = $html -replace '<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="State">', '<asp:TextBox ID="txtState" runat="server" CssClass="$1" placeholder="State"></asp:TextBox>'
$html = $html -replace '<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="Mobile Number">', '<asp:TextBox ID="txtMobile" runat="server" CssClass="$1" placeholder="Mobile Number"></asp:TextBox>'

$html = $html -replace '(?s)<button\s*type="button"\s*class="checkout-btn([^"]*)"\s*>Continue Checkout</button>', '<asp:Button ID="btnContinueCheckout" runat="server" Text="Continue Checkout" CssClass="checkout-btn$1" />'
$html = $html -replace '(?s)<button type="button" class="login-change-btn([^"]*)">Change</button>', '<asp:Button ID="btnChangeLogin" runat="server" Text="Change" CssClass="login-change-btn$1" />'
$html = $html -replace '(?s)<button type="button" class="address-change-btn([^"]*)">Change</button>', '<asp:Button ID="btnChangeAddress" runat="server" Text="Change" CssClass="address-change-btn$1" />'
$html = $html -replace '(?s)<button type="button" class="cart-change-btn([^"]*)">Change</button>', '<asp:Button ID="btnChangeCart" runat="server" Text="Change" CssClass="cart-change-btn$1" />'
$html = $html -replace '(?s)<button\s*type="button"\s*class="save-address-btn([^"]*)"\s*>SAVE AND CONTINUE</button>', '<asp:Button ID="btnSaveAddress" runat="server" Text="SAVE AND CONTINUE" CssClass="save-address-btn$1" />'
$html = $html -replace '(?s)<button\s*type="button"\s*class="save-cart-btn([^"]*)"\s*>CONTINUE</button>', '<asp:Button ID="btnContinueCart" runat="server" Text="CONTINUE" CssClass="save-cart-btn$1" />'
$html = $html -replace '(?s)<button\s*type="button"\s*class="inline-block([^"]*bg-orange-500[^"]*)"\s*>Confirm Order</button>', '<asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" CssClass="inline-block$1" />'

# Add Labels
$html = $html.Replace('<span class="text-[#212121] text-[14px]">Safikul Islam</span>', '<asp:Label ID="lblLoginName" runat="server" CssClass="text-[#212121] text-[14px]" Text="Not signed in"></asp:Label>')
$html = $html.Replace('<span class="text-[#212121] text-[14px]">9647088307</span>', '<asp:Label ID="lblLoginPhone" runat="server" CssClass="text-[#212121] text-[14px]"></asp:Label>')

$html = $html.Replace('<span class="text-[#212121] font-medium text-[14px] mt-2">Safikul Islam</span>', '<asp:Label ID="lblLoginNameSaved" runat="server" CssClass="text-[#212121] font-medium text-[14px] mt-2"></asp:Label>')
$html = $html.Replace('<span class="text-[#212121] text-[14px] ml-2 mt-2">9647088307</span>', '<asp:Label ID="lblLoginPhoneSaved" runat="server" CssClass="text-[#212121] text-[14px] ml-2 mt-2"></asp:Label>')

# Only replace the first occurrence of Address Name string left, or just use regex
$html = $html -replace '<span class="text-\[#212121\] font-medium text-\[14px\] mt-2">Safikul Islam</span>', '<asp:Label ID="lblAddressNameSaved" runat="server" CssClass="text-[#212121] font-medium text-[14px] mt-2"></asp:Label>'

$html = $html.Replace('<span class="text-[#212121] font-medium text-[14px] mt-2">2 items</span>', '<asp:Label ID="lblReviewItemCount" runat="server" CssClass="text-[#212121] font-medium text-[14px] mt-2"></asp:Label>')

$html = $html.Replace('<span class="text-[#212121] text-[16px]">Price (1 item)</span>', '<span class="text-[#212121] text-[16px]">Price (<asp:Label ID="lblItemCount" runat="server">0</asp:Label> item(s))</span>')
$html = $html.Replace('<span class="text-[#878787] text-[16px]">&#8377;222</span>', '<span class="text-[#878787] text-[16px]">&#8377;<asp:Label ID="lblSubTotal" runat="server">0.00</asp:Label></span>')
$html = $html.Replace('<span class=" font-semibold text-[#212121] text-[18px]">&#8377;222</span>', '<span class=" font-semibold text-[#212121] text-[18px]">&#8377;<asp:Label ID="lblGrandTotal" runat="server">0.00</asp:Label></span>')

# Replace the static zip-front jacket product block with a repeater
$staticProductBlock = '(?s)<div class="cart-item border-b p-5 flex">.*?<div class="remove-cart-item ml-5 cursor-pointer" title="Remove Item">.*?</div>.*?</div>.*?</div>'
$repeaterBlock = '<asp:Repeater ID="rptReviewCart" runat="server">
    <ItemTemplate>
        <div class="cart-item border-b p-5 flex">
            <div>
                 <img src="<%# Eval(`"Image`") %>" alt="<%# Eval(`"ProductName`") %>" class="max-w-[104px] w-auto">
            </div>
            <div class="pl-3">
                   <div>
                       <p class="font-medium text-black text-[16px]"><%# Eval(`"ProductName`") %></p>
                   </div>
                 <div class="flex mt-3">
                    <p class="text-black font-medium p-0 text[16px] pr-2">
                         &#8377;<%# Eval(`"Price`", `"{0:0.00}`") %>
                    </p>
                 </div>
                 <div class="flex mt-4">
                      <div class="text-[13px] font-medium mt-2 text-[#878787]">Qty: <%# Eval(`"Quantity`") %></div>
                  </div>
            </div>
      </div>
   </ItemTemplate>
</asp:Repeater>
<asp:Panel ID="pnlEmptyCart" runat="server" Visible="false" CssClass="p-5">
    <p class="text-[#878787] text-[14px]">Your cart is empty.</p>
</asp:Panel>'

$html = $html -replace $staticProductBlock, $repeaterBlock

$html = $html.Replace('href="./assets/', 'href="assets/')
$html = $html.Replace('src="./assets/', 'src="assets/')
$finalHtml = $aspx_header + $html
Set-Content -Path "C:\Users\Abin Thomas\Downloads\ECommerceproject - Copy\ECommerceproject\Checkout.aspx" -Value $finalHtml -Encoding UTF8
