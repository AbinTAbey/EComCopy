import re

html_path = 'C:/Users/Abin Thomas/Downloads/ECommerceproject - Copy/ECommerceproject/checkout.html'
with open(html_path, 'r', encoding='utf-8') as f:
    html = f.read()

# 1. Add ASP.NET Page Directive
aspx_header = '<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ECommerceproject.Checkout" %>\n'

# 2. Add runat="server" to form or wrap body in form
# checkout.html does not have a global form, it has a couple of inline forms (like search).
# I need to wrap the body content in a <form id="form1" runat="server">
html = re.sub(r'<body([^>]*)>', r'<body\1>\n    <form id="form1" runat="server">', html, count=1)
html = re.sub(r'</body>', r'    </form>\n</body>', html)

# 3. Handle <form> tags inside for search (ASP.NET Web Forms doesn't allow nested <form runat="server">, but nested <form action=""> is technically invalid HTML if the outer is runat="server". Often people change inner forms to div or Panel.
html = html.replace('<form action="" class="p-1 pl-5 w-[95%]">', '<div class="p-1 pl-5 w-[95%]">')
html = html.replace('</form>', '</div>')
# Wait, this might replace </form> too many times. Let's do it carefully.
html = html.replace('<form action="" class="p-1 pl-5 w-full">', '<div class="p-1 pl-5 w-full">')

# 4. Buttons to asp:Button
btn_pattern = r'<button\s+([^>]*)class="([^"]*)"([^>]*)>(.*?)</button>'
# I will manually map the specific buttons to IDs.
replacements = [
    ('Continue Checkout', 'btnContinueCheckout'),
    ('Change', 'btnChangeLogin'), # wait, there are multiple Change buttons
    ('SAVE AND CONTINUE', 'btnSaveAddress'),
    ('CONTINUE', 'btnContinueToPayment'),
    ('Confirm Order', 'btnConfirmOrder'),
]

# Manual replacements for inputs:
# Pincode
html = re.sub(
    r'<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="Pincode">',
    r'<asp:TextBox ID="txtPincode" runat="server" CssClass="\1" placeholder="Pincode"></asp:TextBox>',
    html
)
# Full Name
html = re.sub(
    r'<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="Full Name">',
    r'<asp:TextBox ID="txtName" runat="server" CssClass="\1" placeholder="Full Name"></asp:TextBox>',
    html
)
# Address (Textarea)
html = re.sub(
    r'<textarea[^>]*id="exampleFormControlTextarea1"[^>]*class="(.*?)"[^>]*placeholder="Flat/House No\. Colony/Street No\."\s*></textarea>',
    r'<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="\1" placeholder="Flat/House No. Colony/Street No."></asp:TextBox>',
    html, flags=re.DOTALL
)
# Locality
html = re.sub(
    r'<input type="text" class="(h-\[35px\] placeholder:text-\[14px\] w-\[60%\][^"]*)" placeholder="Eg\. Near Apollo Hospital">',
    r'<asp:TextBox ID="txtLocality" runat="server" CssClass="\1" placeholder="Eg. Near Apollo Hospital"></asp:TextBox>',
    html
)
# City
html = re.sub(
    r'<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="City">',
    r'<asp:TextBox ID="txtCity" runat="server" CssClass="\1" placeholder="City"></asp:TextBox>',
    html
)
# State
html = re.sub(
    r'<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="State">',
    r'<asp:TextBox ID="txtState" runat="server" CssClass="\1" placeholder="State"></asp:TextBox>',
    html
)
# Mobile Number
html = re.sub(
    r'<input type="text" class="(h-\[35px\] w-\[60%\][^"]*)" placeholder="Mobile Number">',
    r'<asp:TextBox ID="txtMobile" runat="server" CssClass="\1" placeholder="Mobile Number"></asp:TextBox>',
    html
)

# Replace buttons manually by matching their text content precisely
html = html.replace(
    '<button\\n                                                type="button"\\n                                                class="checkout-btn inline-block px-8 py-3 bg-orange-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md  hover:shadow-lg  focus:shadow-lg focus:outline-none focus:ring-0  active:shadow-lg transition duration-150 ease-in-out"\\n                                              >Continue Checkout</button>',
    '<asp:Button ID="btnContinueCheckout" runat="server" Text="Continue Checkout" CssClass="checkout-btn inline-block px-8 py-3 bg-orange-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:shadow-lg focus:shadow-lg focus:outline-none focus:ring-0 active:shadow-lg transition duration-150 ease-in-out" />'
)
# Let's use regex for buttons because of whitespace variations
def button_replacer(match):
    attrs1 = match.group(1)
    cls = match.group(2)
    attrs2 = match.group(3)
    text = match.group(4)
    
    if text == "Continue Checkout":
        return f'<asp:Button ID="btnContinueCheckout" runat="server" Text="Continue Checkout" CssClass="{cls}" />'
    elif text == "Change":
        if "login-change-btn" in cls:
            return f'<asp:Button ID="btnChangeLogin" runat="server" Text="Change" CssClass="{cls}" />'
        elif "address-change-btn" in cls:
            return f'<asp:Button ID="btnChangeAddress" runat="server" Text="Change" CssClass="{cls}" />'
        elif "cart-change-btn" in cls:
            return f'<asp:Button ID="btnChangeCart" runat="server" Text="Change" CssClass="{cls}" />'
        return match.group(0)
    elif text == "SAVE AND CONTINUE":
        return f'<asp:Button ID="btnSaveAddress" runat="server" Text="SAVE AND CONTINUE" CssClass="{cls}" />'
    elif text == "CONTINUE":
        return f'<asp:Button ID="btnContinueCart" runat="server" Text="CONTINUE" CssClass="{cls}" />'
    elif text == "Confirm Order":
        return f'<asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" CssClass="{cls}" />'
    return match.group(0)

html = re.sub(r'<button\s+[^>]*class="([^"]*)"[^>]*>(.*?)</button>', button_replacer, html, flags=re.DOTALL)

# Handle Paths
html = html.replace('href="./assets/', 'href="~/assets/')
html = html.replace('src="./assets/', 'src="~/assets/')

# For CSS links, add runat="server"
html = re.sub(r'<link\s+href="~\/assets/([^"]+)"\s+rel="stylesheet"\s*/?>', r'<link href="~/assets/\1" rel="stylesheet" runat="server" />', html)

# The javascript tags won't resolve ~/ natively unless they have runat="server". It's better to just use relative paths 'assets/...'
html = html.replace('href="~/assets/', 'href="assets/')
html = html.replace('src="~/assets/', 'src="assets/')
html = html.replace('runat="server" />', '/>') # Revert the link runat server since relative works fine

out_path = 'C:/Users/Abin Thomas/Downloads/ECommerceproject - Copy/ECommerceproject/Checkout.aspx'
with open(out_path, 'w', encoding='utf-8') as f:
    f.write(aspx_header + html)

print("Done generating Checkout.aspx")
