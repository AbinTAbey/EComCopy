using System;
using System.Net;
using System.Net.Http;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

class BrowserFlow
{
    static string ExtractHiddenField(string html, string fieldName)
    {
        var match = Regex.Match(html, ""id=\\"""" + fieldName + ""\\"" value=\\""(.*?)\\\"""");
        if (match.Success) return match.Groups[1].Value;
        return """";
    }

    public static async Task Run()
    {
        var cookieContainer = new CookieContainer();
        var handler = new HttpClientHandler() { CookieContainer = cookieContainer, AllowAutoRedirect = true };
        var client = new HttpClient(handler);
        client.BaseAddress = new Uri(""http://localhost:8080/"");

        Console.WriteLine(""1. Loading Login.aspx"");
        var res1 = await client.GetAsync(""Login.aspx"");
        string html1 = await res1.Content.ReadAsStringAsync();
        string vs1 = ExtractHiddenField(html1, ""__VIEWSTATE"");
        string ev1 = ExtractHiddenField(html1, ""__EVENTVALIDATION"");

        Console.WriteLine(""2. Posting Login.aspx"");
        var loginData = new FormUrlEncodedContent(new[]
        {
            new KeyValuePair<string, string>(""__VIEWSTATE"", vs1),
            new KeyValuePair<string, string>(""__EVENTVALIDATION"", ev1),
            new KeyValuePair<string, string>(""RadioButtonList1"", ""User""),
            new KeyValuePair<string, string>(""TextBox1"", ""Abin T Abey""),
            new KeyValuePair<string, string>(""TextBox2"", ""abin@124""),
            new KeyValuePair<string, string>(""Button1"", ""Sign in"")
        });
        var res2 = await client.PostAsync(""Login.aspx"", loginData);
        string html2 = await res2.Content.ReadAsStringAsync();

        Console.WriteLine(""3. Loading ProductDetails.aspx?pdtid=1"");
        var res3 = await client.GetAsync(""ProductDetails.aspx?pdtid=1"");
        string html3 = await res3.Content.ReadAsStringAsync();
        string vs3 = ExtractHiddenField(html3, ""__VIEWSTATE"");
        string ev3 = ExtractHiddenField(html3, ""__EVENTVALIDATION"");

        Console.WriteLine(""4. Clicking Add to Cart"");
        var cartData = new FormUrlEncodedContent(new[]
        {
            new KeyValuePair<string, string>(""__EVENTTARGET"", ""lnkAddToCart""),
            new KeyValuePair<string, string>(""__EVENTARGUMENT"", """"),
            new KeyValuePair<string, string>(""__VIEWSTATE"", vs3),
            new KeyValuePair<string, string>(""__EVENTVALIDATION"", ev3)
        });
        var res4 = await client.PostAsync(""ProductDetails.aspx?pdtid=1"", cartData);
        string html4 = await res4.Content.ReadAsStringAsync();

        Console.WriteLine(""5. Loading Checkout.aspx"");
        var res5 = await client.GetAsync(""Checkout.aspx"");
        string html5 = await res5.Content.ReadAsStringAsync();
        string vs5 = ExtractHiddenField(html5, ""__VIEWSTATE"");
        string ev5 = ExtractHiddenField(html5, ""__EVENTVALIDATION"");

        Console.WriteLine(""6. Clicking Confirm Order"");
        var checkoutData = new FormUrlEncodedContent(new[]
        {
            new KeyValuePair<string, string>(""__VIEWSTATE"", vs5),
            new KeyValuePair<string, string>(""__EVENTVALIDATION"", ev5),
            new KeyValuePair<string, string>(""btnConfirmOrder"", ""Confirm Order"")
        });
        var res6 = await client.PostAsync(""Checkout.aspx"", checkoutData);
        string html6 = await res6.Content.ReadAsStringAsync();
        
        if (html6.Contains(""Order placed successfully!"")) {
            Console.WriteLine(""SUCCESS ALERT FOUND IN HTML!"");
            var match = Regex.Match(html6, @""Order ID: (\d+)"");
            if (match.Success) Console.WriteLine(""Extracted Order ID: "" + match.Groups[1].Value);
        } else if (html6.Contains(""Order failed:"")) {
            Console.WriteLine(""FAIL ALERT FOUND!"");
        } else {
            Console.WriteLine(""NO ALERT FOUND. OUTPUT:"");
        }
    }
}
class Program { static void Main() { BrowserFlow.Run().Wait(); } }
