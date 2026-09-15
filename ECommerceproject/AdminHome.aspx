<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="ECommerceproject.Admin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./assets/css/output.css" rel="stylesheet">
    <link href="./assets/css/custom.css" rel="stylesheet" />
    <link href="./assets/css/owlcarousel/owl.carousel.min.css" rel="stylesheet">
    <link href="./assets/css/owlcarousel/owl.theme.default.min.css" rel="stylesheet">
    <title>Login Page</title>
    <style type="text/css">
        .auto-style1 {
            width: 42px;
        }
        .auto-style3 {
            width: 735px;
        }
        .auto-style4 {
            width: 8px;
        }
        .auto-style5 {
            width: 100%;
            height: 239px;
        }
        .auto-style6 {
            height: 228px;
        }
        .auto-style7 {
            width: 42px;
            height: 228px;
        }
        .auto-style8 {
            width: 8px;
            height: 228px;
        }
        .dashboard-wrapper {
    max-width: 1300px;
    margin: 0 auto;
    padding: 0 20px;
}
.dashboard-title {
    font-size: 26px;
    font-weight: 700;
    color: #0c5273;
    margin-bottom: 6px;
}
.dashboard-subtitle {
    color: #6b7280;
    font-size: 14px;
    margin-bottom: 30px;
}
.action-cards {
    display: flex;
    gap: 18px;
    flex-wrap: wrap;
    margin-bottom: 40px;
}
.action-card {
    flex: 1;
    min-width: 200px;
    background: #ffffff;
    border-radius: 12px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    padding: 22px;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 14px;
    transition: transform 0.15s ease, box-shadow 0.15s ease;
}
.action-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 16px rgba(0,0,0,0.12);
}
.action-icon {
    width: 44px;
    height: 44px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    flex-shrink: 0;
    color: #ffffff;
}
.icon-category { background: linear-gradient(135deg, #008ECC, #0c5273); }
.icon-product { background: linear-gradient(135deg, #16a34a, #15803d); }
.icon-logout { background: linear-gradient(135deg, #dc2626, #b91c1c); }
.action-text-title {
    font-weight: 700;
    color: #1f2937;
    font-size: 15px;
    margin-bottom: 2px;
}
.action-text-sub {
    font-size: 12px;
    color: #9ca3af;
}
.section-heading {
    font-size: 18px;
    font-weight: 700;
    color: #1f2937;
    margin-bottom: 14px;
    display: flex;
    align-items: center;
    gap: 8px;
}
.product-grid-wrapper {
    max-width: 100%;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 14px rgba(0,0,0,0.08);
    overflow: hidden;
    border: 1px solid #e5e7eb;
    margin-bottom: 60px;
}
.product-grid {
    width: 100%;
    border-collapse: collapse;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
}
.product-grid th {
    background: linear-gradient(135deg, #0c5273 0%, #008ECC 100%);
    color: #ffffff;
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 0.5px;
    padding: 14px 16px;
    text-align: left;
}
.product-grid td {
    padding: 12px 16px;
    border-bottom: 1px solid #f0f0f0;
    vertical-align: middle;
    color: #333333;
}
.product-grid tr.alt-row {
    background-color: #f8fafc;
}
.product-grid tr:hover td {
    background-color: #eef7fc;
    transition: background-color 0.2s ease-in-out;
}
.product-thumb {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 8px;
    border: 1px solid #ddd;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
.btn-edit, .btn-delete {
    display: inline-block;
    padding: 6px 14px;
    font-size: 12px;
    font-weight: bold;
    border-radius: 20px;
    text-decoration: none;
    border: none;
    cursor: pointer;
    margin-right: 6px;
}
.btn-edit {
    background-color: #dbeafe;
    color: #1d4ed8;
}
.btn-edit:hover {
    background-color: #bfdbfe;
}
.btn-delete {
    background-color: #fee2e2;
    color: #b91c1c;
}
.btn-delete:hover {
    background-color: #fecaca;
}
    </style>
</head>
<body class="bg-[#F3F3F3]">
    <form id="form1" runat="server">

        <!-- Header Section -->
        <header class="w-full bg-[#008ECC] flex justify-center h-23 sm:h-23 md:h-23 lg:h-16 fixed top-0 z-50">
            <div class="w-screen  max-w-[1120px]">
                <div class="flex mt-2 sm:mt-2 md:mt-2 lg:mt-4">
                    <div class="menu-bar float-left cursor-pointer text-white ml-3 m-0 mr-4 h-8 w-8 openNav">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="currentColor" class="h-8 w-8">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                        </svg>
                    </div>
                    <!-- Logo  -->
                    <div class="logo flex justify-center mr-10">
                        <a href="index.html" class="max-w-full text-white font-bold text-[22px]">
                            FlipShop
                        </a>
                    </div>
                    <!-- Search -->
                    <div class="search-container w-[55%] h-9 mr-10 rounded bg-white hidden md:hidden sm:hidden lg:block">
                        <div class="search-box h-10 flex">
                            <input type="text"
                                   class="w-full p-0 border-none border-transparent focus:border-transparent focus:ring-0"
                                   placeholder="Search essentials, groceries, and more …">
                            <div class="search-list w-6 h-6 mt-1.5"></div>
                        </div>
                    </div>
                    <!-- Login -->
                    <div class="login mt-1 mr-2 sm:mr-3 md:mr-3 lg:mr-8">
                        <a href="Login.aspx" class="text-sm text-white flex">
                            <span><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 20 20"
                                       fill="currentColor">
                                <path fill-rule="evenodd"
                                      d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                      clip-rule="evenodd" />
                            </svg></span>
                            <span class="hidden md:hidden sm:hidden lg:block  ml-2 mt-[2px]">Sign in / Sign up</span>
                        </a>
                    </div>
                    <!-- Cart -->
                    <div class="cart mt-[5px]">
                        <a href="cart.aspx" class="text-sm pl-2 text-white flex">
                            <span class="mr-3 sm:mr-3 md:mr-5 lg:mr-3">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 20 20"
                                     fill="currentColor">
                                    <path
                                        d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z" />
                                </svg>
                            </span>
                            <span class="hidden md:hidden sm:hidden lg:block  mt-[1px]">Cart</span>
                        </a>
                    </div>
                </div>
                <!-- Mobile Search Section -->
                <div class="mobile-search-container w-[95%] m-auto h-8 mt-1 rounded bg-white block md:block sm:block lg:hidden">
                    <div class="search-box h-10 flex">
                        <input type="text"
                               class="w-full border-transparent focus:border-transparent focus:ring-0 border-none p-0"
                               placeholder="Search essentials, groceries, and more …">
                        <div class="search-list mr-2 w-6 h-6 mt-1.5"></div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Menu Section -->
        <div class="w-full bg-[#0c5273ef] fixed top-[64px] z-10 hidden sm:hidden md:hidden lg:block">
            <nav class="max-w-[1100px] m-auto">
                <ul class="flex">
                    <li class="relative parent-menu">
                        <a href="Filter.aspx" class="text-white font-semibold text-[14px] pr-4 py-2 block">Groceries</a>
                        <div class="child-menu">
                            <div class="absolute top-[37px]">
                                <ul class="max-w-[250px] min-w-[250px] bg-[#fff] p-[8px] shadow rounded-b-[6px]">
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Fruits</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Dairy</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Bakery</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Personal Care</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="relative parent-menu">
                        <a href="Filter.aspx" class="text-white font-semibold text-[14px] px-4 py-2 block">Home & Kitchen</a>
                        <div class="child-menu">
                            <div class="absolute top-[37px]">
                                <ul class="max-w-[250px] min-w-[250px] bg-[#fff] p-[8px] shadow rounded-b-[6px]">
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Kitchenware</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Furniture</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Tableware</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Home Decor</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="relative parent-menu">
                        <a href="Filter.aspx?categoryid=2" class="text-white font-semibold text-[14px] px-4 py-2 block">Fashion</a>
                        <div class="child-menu">
                            <div class="absolute top-[37px]">
                                <ul class="max-w-[250px] min-w-[250px] bg-[#fff] p-[8px] shadow rounded-b-[6px]">
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Men</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Women</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Boy</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Girl</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="relative parent-menu">
                        <a href="Filter.aspx" class="text-white font-semibold text-[14px] px-4 py-2 block">Electronics</a>
                        <div class="child-menu">
                            <div class="absolute top-[37px]">
                                <ul class="max-w-[250px] min-w-[250px] bg-[#fff] p-[8px] shadow rounded-b-[6px]">
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Mobiles</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Tablets</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Laptop</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Desktop</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="relative parent-menu">
                        <a href="Filter.aspx" class="text-white font-semibold text-[14px] px-4 py-2 block">Beauty</a>
                        <div class="child-menu">
                            <div class="absolute top-[37px]">
                                <ul class="max-w-[250px] min-w-[250px] bg-[#fff] p-[8px] shadow rounded-b-[6px]">
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Make-Up</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Hair</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Skin Care</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Fragrances</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="relative parent-menu">
                        <a href="#" class="text-white font-semibold text-[14px] px-4 py-2 block">Pages</a>
                        <div class="child-menu">
                            <div class="absolute top-[37px]">
                                <ul class="max-w-[250px] min-w-[250px] bg-[#fff] p-[8px] shadow rounded-b-[6px]">
                                    <li><a href="Login.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Login/Signup Page</a></li>
                                    <li><a href="verify.html" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">OTP Verify Page</a></li>
                                    <li><a href="Filter.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Shop Page</a></li>
                                    <li><a href="ProductDetails.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Shop Single Page</a></li>
                                    <li><a href="cart.aspx" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Cart Page</a></li>
                                    <li><a href="checkout.html" class="py-2 px-1 block rounded hover:bg-gray-100 hover:text-black">Checkout Page</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>

        <!-- Login Section -->
       <%-- <div style="padding-top: 150px; padding-bottom: 50px;">

            <table class="auto-style5">
                <tr>
                    <td>

                        <table class="w-full">

                            <!-- Title -->
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td class="auto-style3">
                                    ADMIN HOME PAGE
                                </td>

                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <!-- Space -->
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td class="auto-style3">
                                    &nbsp;
                                </td>

                                <td>&nbsp;</td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>

                            <!-- Login Form -->
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp; </td>

                                <td>&nbsp;</td>
                                <td>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Category.aspx">ADD CATEGORY</asp:HyperLink>
                                </td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Product.aspx">ADD PRODUCT</asp:HyperLink>
                                </td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Login.aspx">Logout</asp:HyperLink>
                                </td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    DataKeyNames="product id" OnRowDeleting="GridView1_RowDeleting" Height="683px" Width="1147px">
    <Columns>
        <asp:BoundField DataField="product id" HeaderText="ID" />
        <asp:BoundField DataField="category name" HeaderText="CATEGORY NAME" />
        <asp:TemplateField HeaderText="IMAGE">
            <ItemTemplate>
               <img src='<%# ResolveUrl(Eval("image").ToString()) %>'
    width="60" height="60" alt="product" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ACTION">
            <ItemTemplate>
                <asp:HyperLink ID="lnkEdit" runat="server"
                    NavigateUrl='<%# "~/Product.aspx?id=" + Eval("product id") %>'>Edit</asp:HyperLink>
                &nbsp;
                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete"
                    CausesValidation="false"
                    OnClientClick="return confirm('Delete this product?');">Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
                                </td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td class="auto-style6"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style7"></td>
                                <td class="auto-style8"></td>
                                <td class="auto-style7"></td>

                                <td class="auto-style6"></td>
                                <td class="auto-style6">
                                    </td>
                                <td class="auto-style6"></td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style1">&nbsp;</td>

                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                        </table>

                    </td>
                </tr>
            </table>

        </div>--%>
        <!-- Admin Dashboard Section -->
<div style="padding-top: 150px; padding-bottom: 50px;">
    <div class="dashboard-wrapper">

        <div class="dashboard-title">Admin Dashboard</div>
        <div class="dashboard-subtitle">Manage your categories, products, and store data.</div>

        <div class="action-cards">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Category.aspx" CssClass="action-card">
                <span class="action-icon icon-category">&#128193;</span>
                <span>
                    <div class="action-text-title">Add Category</div>
                    <div class="action-text-sub">Create a new product category</div>
                </span>
            </asp:HyperLink>

            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Product.aspx" CssClass="action-card">
                <span class="action-icon icon-product">&#128230;</span>
                <span>
                    <div class="action-text-title">Add Product</div>
                    <div class="action-text-sub">List a new product for sale</div>
                </span>
            </asp:HyperLink>

            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Login.aspx" CssClass="action-card">
                <span class="action-icon icon-logout">&#128274;</span>
                <span>
                    <div class="action-text-title">Logout</div>
                    <div class="action-text-sub">End your admin session</div>
                </span>
            </asp:HyperLink>
        </div>

        <div class="section-heading">&#128717; All Products</div>

        <div class="product-grid-wrapper">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="product id" OnRowDeleting="GridView1_RowDeleting"
                CssClass="product-grid" GridLines="None"
                ShowHeaderWhenEmpty="True" EmptyDataText="No products found."
                AlternatingRowStyle-CssClass="alt-row">
                <Columns>
                    <asp:BoundField DataField="product id" HeaderText="ID" />
                    <asp:BoundField DataField="category name" HeaderText="Category Name" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("image").ToString()) %>'
                                class="product-thumb" alt="product" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkEdit" runat="server"
                                NavigateUrl='<%# "~/Product.aspx?id=" + Eval("product id") %>'
                                CssClass="btn-edit">
                                Edit
                            </asp:HyperLink>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete"
                                CausesValidation="false"
                                OnClientClick="return confirm('Delete this product?');"
                                CssClass="btn-delete">
                                Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </div>
</div>
        <!-- Footer -->
        <footer class="bg-gray-200 mt-28">
            <div class="footer max-w-[1120px] m-auto p-8">
                <div class="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-4">
                    <div>
                       <p class="text-black font-bold text-[15px]">All Categories</p>
                        <ul class="mt-3 text-xs text-gray-600">
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Grocery</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Electronics</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Fashion</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Beauty</a></li>
                        </ul>
                    </div>
                    <div>
                        <p class="text-black font-bold text-[15px]">Popular Categories</p>
                        <ul class="mt-3 text-xs text-gray-600">
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Staples</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Beverages</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Dairy & Bakery</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Snacks & Branded Foods</a></li>
                        </ul>
                    </div>
                    <div>
                        <p class="text-black font-bold text-[15px] mt-3 sm:mt-3 md:mt-3 lg:mt-0">Customer Account</p>
                        <ul class="mt-3 text-xs text-gray-600">
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">My Account</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">My Orders</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Wishlist</a></li>
                            <li><a href="#" class="py-2 text-[14px] block hover:bg-gray-300 hover:pl-1">Payment Methods</a></li>
                        </ul>
                    </div>
                    <div>
                        <p class="text-black font-bold text-[15px] mt-3 sm:mt-3 md:mt-3 lg:mt-0">Contact Us</p>
                        <div class="footer_contact mt-3">
                            <div class="flex text-[14px] text-gray-600">
                                <span class="icn">
                                    <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M12 21C15.5 17.4 19 14.1764 19 10.2C19 6.22355 15.866 3 12 3C8.13401 3 5 6.22355 5 10.2C5 14.1764 8.5 17.4 12 21Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M12 12C13.1046 12 14 11.1046 14 10C14 8.89543 13.1046 8 12 8C10.8954 8 10 8.89543 10 10C10 11.1046 10.8954 12 12 12Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                </span>
                                <div class="ml-2">
                                    <p>Widgetify Inc. <br>Gadget Avenue Techtown <br>United States of America</p>
                                </div>
                            </div>
                            <div class="flex text-[14px] text-gray-600 py-2">
                                <span class="icn">
                                    <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M17.3545 22.2323C15.3344 21.7262 11.1989 20.2993 7.44976 16.5502C3.70065 12.8011 2.2738 8.66559 1.76767 6.6455C1.47681 5.48459 2.00058 4.36434 2.88869 3.72997L5.21694 2.06693C6.57922 1.09388 8.47432 1.42407 9.42724 2.80051L10.893 4.91776C11.5152 5.8165 11.3006 7.0483 10.4111 7.68365L9.24234 8.51849C9.41923 9.1951 9.96939 10.5846 11.6924 12.3076C13.4154 14.0306 14.8049 14.5807 15.4815 14.7576L16.3163 13.5888C16.9517 12.6994 18.1835 12.4847 19.0822 13.1069L21.1995 14.5727C22.5759 15.5257 22.9061 17.4207 21.933 18.783L20.27 21.1113C19.6356 21.9994 18.5154 22.5232 17.3545 22.2323ZM8.86397 15.136C12.2734 18.5454 16.0358 19.8401 17.8405 20.2923C18.1043 20.3583 18.4232 20.2558 18.6425 19.9488L20.3056 17.6205C20.6299 17.1665 20.5199 16.5348 20.061 16.2171L17.9438 14.7513L17.0479 16.0056C16.6818 16.5182 16.0047 16.9202 15.2163 16.7501C14.2323 16.5378 12.4133 15.8569 10.2782 13.7218C8.1431 11.5867 7.46219 9.7677 7.24987 8.7837C7.07977 7.9953 7.48181 7.31821 7.99439 6.95208L9.24864 6.05618L7.78285 3.93893C7.46521 3.48011 6.83351 3.37005 6.37942 3.6944L4.05117 5.35744C3.74413 5.57675 3.64162 5.89565 3.70771 6.15943C4.15989 7.96418 5.45459 11.7266 8.86397 15.136Z" fill="#0F0F0F"/>
                                    </svg>
                                </span>
                                <div class="ml-2">
                                    <p>(987) 654-3210, (555) 123-4567</p>
                                </div>
                            </div>
                            <div class="flex text-[14px] text-gray-600 py-2">
                                <span class="icn">
                                    <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M4 7.00005L10.2 11.65C11.2667 12.45 12.7333 12.45 13.8 11.65L20 7" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        <rect x="3" y="5" width="18" height="14" rx="2" stroke="#000000" stroke-width="2" stroke-linecap="round"/>
                                    </svg>
                                </span>
                                <div class="ml-2">
                                    <p>info@example.com</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copy-right text-center pb-3 pt-3 border-t border-gray-300">
                <p class="text-[13px]">© 2022 All rights reserved.</p>
            </div>
        </footer>

    </form>

    <script src="./assets/js/jquery-3.6.0.min.js"></script>
    <script src="./assets/js/main.js"></script>
</body>
</html>
