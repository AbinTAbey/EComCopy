$content = Get-Content ECommerceproject\Checkout.aspx -Raw -Encoding UTF8
$pattern = '(?s)<div class="address-section">.*?<div class="bg-white shadow rounded mb-3 mt-3">'
$replacement = @"
                                   <div class="address-section">
                                        <div class="px-5 py-3 bg-blue-600 text-white uppercase rounded-t-sm">
                                             <p><span class="bg-white text-blue-500 py-1 px-2 font-medium rounded-[2px] text-[10px] mr-3">2</span><span class="inline-block text-[14px]">Delivery Address</span></p>
                                        </div>
                                        
                                        <asp:Panel ID="pnlDeliverySaved" runat="server" CssClass="flex justify-between px-5 py-3">
                                             <div class="flex flex-col">
                                                  <div class="flex">
                                                       <asp:Label ID="lblAddressNameSaved" runat="server" CssClass="text-[#212121] font-medium text-[14px] mt-2"></asp:Label>
                                                       <span class="text-[#212121] text-[14px] ml-4 mt-2"><asp:Label ID="lblAddressPhoneSaved" runat="server"></asp:Label></span>
                                                       <span class=" text-green-700 ml-2 mt-2"><svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" /></svg></span>
                                                  </div>
                                                  <div class="mt-2">
                                                       <asp:Label ID="lblAddressEmailSaved" runat="server" CssClass="text-gray-600 text-[14px] block"></asp:Label>
                                                       <asp:Label ID="lblAddressFullSaved" runat="server" CssClass="text-[#212121] text-[14px] block mt-1"></asp:Label>
                                                  </div>
                                             </div>
                                             <div>
                                                  <div class="flex space-x-2 justify-center">
                                                       <asp:Button ID="btnChangeAddress" runat="server" Text="Change" OnClick="btnChangeAddress_Click" CssClass="inline-block px-6 py-2.5 border text-red-700 font-medium text-xs leading-tight uppercase focus:outline-none focus:ring-0 active:shadow-lg transition duration-150 ease-in-out" />
                                                     </div>
                                             </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlDeliveryOptions" runat="server" Visible="false" CssClass="px-5 py-4 border-b border-gray-200">
                                             <div class="flex space-x-4">
                                                  <asp:Button ID="btnAddAddressOption" runat="server" Text="Add New Address" OnClick="btnAddAddressOption_Click" CssClass="inline-block px-6 py-2.5 bg-blue-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:shadow-lg focus:outline-none focus:ring-0 active:shadow-lg transition duration-150 ease-in-out" />
                                                  <asp:Button ID="btnEditDetailsOption" runat="server" Text="Edit Details" OnClick="btnEditDetailsOption_Click" CssClass="inline-block px-6 py-2.5 bg-gray-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:shadow-lg focus:outline-none focus:ring-0 active:shadow-lg transition duration-150 ease-in-out" />
                                             </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlAddNewAddress" runat="server" Visible="false" CssClass="px-5 py-3">
                                            <div class="flex justify-between w-[100%] sm:w-[100%] md:w-[100%] lg:w-[60%] mb-2">
                                                 <label for="" class="pt-2 text-[#878787] w-[40%] text-[14px]">Address</label>
                                                 <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="placeholder:text-[14px] w-[60%] form-control block px-3 py-1.5 resize-none text-base rounded transition ease-in-out m-0 focus:border-[#878787] focus:ring-0 focus:outline-none" placeholder="Flat/House No. Colony/Street No."></asp:TextBox>
                                            </div>
                                            <div class="flex space-x-2 mt-3 justify-end w-[100%] sm:w-[100%] md:w-[100%] lg:w-[60%]">
                                                 <asp:Button ID="btnSaveTempAddress" runat="server" Text="SAVE AND CONTINUE" OnClick="btnSaveTempAddress_Click" CssClass="w-[60%] inline-block px-8 py-3 bg-orange-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:shadow-lg focus:shadow-lg focus:outline-none focus:ring-0 active:shadow-lg transition duration-150 ease-in-out" />
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlEditDetails" runat="server" Visible="false" CssClass="px-5 py-3">
                                            <div class="flex justify-between w-[100%] sm:w-[100%] md:w-[100%] lg:w-[60%] mb-2">
                                                 <label for="" class="pt-2 text-[#878787] w-[40%] text-[14px]">Name</label>
                                                 <asp:TextBox ID="txtName" runat="server" CssClass="h-[35px] w-[60%] placeholder:text-[14px] focus:border-[#878787] focus:ring-0 border px-4 rounded" placeholder="Full Name"></asp:TextBox>
                                            </div>
                                            <div class="flex justify-between w-[100%] sm:w-[100%] md:w-[100%] lg:w-[60%] mb-2">
                                                 <label for="" class="pt-2 text-[#878787] w-[40%] text-[14px]">Mobile Number</label>
                                                 <asp:TextBox ID="txtMobile" runat="server" CssClass="h-[35px] w-[60%] placeholder:text-[14px] focus:border-[#878787] focus:ring-0 border px-4 rounded" placeholder="Mobile Number"></asp:TextBox>
                                            </div>
                                            <div class="flex justify-between w-[100%] sm:w-[100%] md:w-[100%] lg:w-[60%] mb-2">
                                                 <label for="" class="pt-2 text-[#878787] w-[40%] text-[14px]">Email</label>
                                                 <asp:TextBox ID="txtEmail" runat="server" CssClass="h-[35px] w-[60%] placeholder:text-[14px] focus:border-[#878787] focus:ring-0 border px-4 rounded" placeholder="Email"></asp:TextBox>
                                            </div>
                                            <div class="flex space-x-2 mt-3 justify-end w-[100%] sm:w-[100%] md:w-[100%] lg:w-[60%]">
                                                 <asp:Button ID="btnSaveDetails" runat="server" Text="SAVE AND CONTINUE" OnClick="btnSaveDetails_Click" CssClass="w-[60%] inline-block px-8 py-3 bg-orange-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:shadow-lg focus:shadow-lg focus:outline-none focus:ring-0 active:shadow-lg transition duration-150 ease-in-out" />
                                            </div>
                                        </asp:Panel>
                                  </div>

                                <div class="bg-white shadow rounded mb-3 mt-3">
"@
$newContent = $content -replace $pattern, $replacement
Set-Content -Path ECommerceproject\Checkout.aspx -Value $newContent -Encoding UTF8
